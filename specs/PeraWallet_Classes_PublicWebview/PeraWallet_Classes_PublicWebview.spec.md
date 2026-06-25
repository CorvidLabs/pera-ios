---
module: PeraWallet_Classes_PublicWebview
version: 1
status: active
files:
  - PeraWallet/Classes/PublicWebview/PublicWebviewInAppBrowserScreen.swift
  - PeraWallet/Classes/PublicWebview/PublicWebviewScreen.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_PublicWebview

## Purpose

App-target UI module (`PeraWallet/Classes/PublicWebview`) that renders trusted Pera-hosted
public web content inside an embedded `WKWebView`. It is a thin subclass layer on top of the
shared `InAppBrowserScreen` infrastructure (`PeraWallet/Classes/InAppBrowser`), specialized for
"public" pages that do **not** require an authenticated wallet session (no account addresses,
no signing).

The module ships two types:

- `PublicWebviewInAppBrowserScreen` — base in-app browser for public pages. Loads a URL, injects
  a Pera-versioned user agent (`pera_ios_<appVersion>`), keeps the web content's theme in sync
  with the device's light/dark interface style, and exposes a constrained JavaScript bridge via
  the `handleRequest` script message and the `PublicWebviewInAppBrowserScreenMethod` method set.
- `PublicWebviewScreen` — concrete screen used by the router (`Screen.publicWebview(url:)`). Adds
  tab-bar visibility (kept visible), disables web-view scroll bounce, and adopts
  `DiscoverHomeScreenTheme`.

Flows: the screen is opened via `Router.open(.publicWebview(url:), by: .push)`. Once loaded, the
embedded page communicates back through the JS bridge to push further public pages
(`pushWebView`), open links in the system browser (`openSystemBrowser`), request non-sensitive
client settings (`getPublicSettings` → theme/network/language/currency), log analytics events
(`logAnalyticsEvent`), or dismiss/pop the browser (`closeWebView`, `onBackPressed`).

Ownership boundary: this module owns only the public-webview subclasses and their script-message
enum. The actual web-view lifecycle, secure script-message handling, pull-to-refresh, and the
bridge method implementations live in the shared `InAppBrowser` module
(`InAppBrowserScreen` and `InAppBrowserHelpers.handlePublicWebview(_:_:)`).

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. The web view advertises a Pera-specific user agent: the platform user agent compounded with
   `pera_ios_<CFBundleShortVersionString>`, so backend/web content can detect the Pera iOS client.
3. Only the `handleRequest` script message is registered (`handledMessages` returns
   `PublicWebviewInAppBrowserScreenMessage.allCases`); inbound JS calls are constrained to the
   `PublicWebviewInAppBrowserScreenMethod` set. This is the "public" surface — it never exposes
   account addresses, signing, or `getSettings` (device-id/app-package) data, only `getPublicSettings`.
4. Web content theme tracks the device interface style: the screen evaluates
   `updateTheme('<light|dark>')` on appear (after a ~1s delay), when the app becomes active, and
   whenever `preferredUserInterfaceStyleDidChange` fires.
5. Pull-to-refresh is disabled (`allowsPullToRefresh = false`); content is (re)loaded by calling
   `load(url:)` from `viewDidLoad`. A `nil` URL is a no-op (the base `load(url:)` guards against it).
6. `closeWebView` / `onBackPressed` resolve navigation deterministically: dismiss the modal if it
   can be dismissed, otherwise pop the navigation stack if it can go back.

## Behavioral Examples

### Scenario: Opening a public web page
- **Given** the router is asked to `open(.publicWebview(url:), by: .push)` with a valid URL
- **When** `PublicWebviewScreen` is constructed and `viewDidLoad` runs
- **Then** it builds a `URLRequest` (30s timeout) and loads it into the `WKWebView`, hides the
  navigation bar, keeps the tab bar visible, and syncs the page theme to the device style.

### Scenario: Web page pushes another public page via the JS bridge
- **Given** a loaded public page posts a `handleRequest` message with method `pushWebView` and a
  `url` parameter
- **When** `handlePublicWebview(.handleRequest, message)` decodes the request
- **Then** it parses the URL and calls `open(.publicWebview(url:), by: .push)`, stacking a new
  public-webview screen.

### Scenario: Web page requests public client settings
- **Given** a loaded page posts `handleRequest` with method `getPublicSettings` and a numeric `id`
- **When** the bridge calls `handleSettings(.getPublicSettings, id:)`
- **Then** the app replies via `Scripts.message(id:result:)` with only the public params —
  `theme`, `network`, `language`, `currency` — and never device-id, app-package, or address data.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `url` is `nil` at load time | `load(url:)` guards on `nil` and returns; no request is made, web view stays blank. |
| `pushWebView` payload missing or has an unparseable `url` | `guard` fails and the message is ignored; no navigation occurs. |
| `getPublicSettings` message has no numeric `id` | `guard let id` fails; no reply is posted to the page. |
| Required public settings unavailable (no network/locale/currency) | `handleSettings` guards and returns; page receives no settings reply. |
| Inbound JS message name is not `handleRequest` | Ignored — only `PublicWebviewInAppBrowserScreenMessage.handleRequest` is mapped. |
| Inbound `method` string is not a known `PublicWebviewInAppBrowserScreenMethod` | The `if let inAppMethod` cast fails; that entry in the messages array is skipped. |
| `closeWebView` / `onBackPressed` when neither dismissable nor poppable | No-op; the screen remains. |
| Page load times out | `URLRequest.timeoutInterval` is 30s; the web view surfaces the standard WebKit failure (no custom retry UI, since pull-to-refresh is disabled). |

## Dependencies

| Module | Usage |
|--------|-------|
| `PeraWallet/Classes/InAppBrowser` (`InAppBrowserScreen`) | Base class: `WKWebView` creation/config, secure script-message registration, `load(url:)`, user-agent injection, pull-to-refresh, theme hooks. |
| `PeraWallet/Classes/InAppBrowser` (`InAppBrowserHelpers`) | Implements `handlePublicWebview(_:_:)` and `handleSettings`, decoding bridge requests and routing methods (push/openSystemBrowser/getPublicSettings/log/close). |
| `PeraWallet/Classes/Routing` (`Router`, `Screen.publicWebview`) | Instantiates `PublicWebviewScreen(url:configuration:)` and performs `open(...)` navigation for bridge-driven pushes. |
| `pera_wallet_core` | Core framework imported by both screens (shared utilities/config types). |
| `WebKit` | `WKWebView`, `WKScriptMessage`, `WKUserContentController`, JS evaluation. |
| `MacaroonUIKit` / `MacaroonUtils` | UI theming (`DiscoverHomeScreenTheme`) and app-lifecycle notification observation. |
| Analytics service | `analytics.track(name:payload:)` for `logAnalyticsEvent` bridge calls. |
| `SharedDataController` / `configuration.api` | Public settings values (currency, network) returned by `getPublicSettings`. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
| Enriched with source-grounded documentation | 2026-06-24 | 1 |
