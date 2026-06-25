---
module: PeraWallet_Classes_Fund
version: 1
status: active
files:
  - PeraWallet/Classes/Fund/FundInAppBrowserScreen.swift
  - PeraWallet/Classes/Fund/Utils/FundURLGenerator.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Fund

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Fund`) that backs the **Fund** tab.
It hosts Pera's web-based fund/buy/swap experience inside an in-app `WKWebView`
rather than rendering native screens. `FundInAppBrowserScreen` subclasses the shared
`InAppBrowserScreen`, loads a URL built by `FundURLGenerator` (pointing at
`AppEnvironment.current.fundBaseUrl`), and brokers a JavaScript ↔ native bridge so the
web page can request wallet data and trigger native behaviors.

Flows covered:
- **Open Fund tab** — on first appearance, the screen generates the Pera fund URL and
  loads it; pull-to-refresh reloads the same URL.
- **Deep link / address routing** — `launchFund(with:)` and `launchFundFromDeeplink`
  (on `TabBarController`) select the Fund tab and inject a `selectedAddress` and/or a
  deep-link `path`, causing the web page to reload at the requested route/account.
- **JS bridge requests** — the web page posts `handleRequest` messages; the native side
  (`handleFund` in `InAppBrowserHelpers`) dispatches `FundInAppBrowserScriptMethod` cases
  such as `getAddresses`, `getSettings`, `pushWebView`, `openSystemBrowser`,
  `openNativeURI`, `notifyUser`, `logAnalyticsEvent`, and `closeWebView`/`onBackPressed`.
- **Theme & currency sync** — interface-style and preferred-currency changes are pushed
  into the page via `updateTheme(...)` / `updateCurrency(...)` JavaScript calls.

Ownership boundary: this module owns the Fund-tab container and its URL/bridge wiring.
The generic web-view shell, the bridge message-handling implementations
(`handleFund`/`handleAddresses`/`handleSettings`), routing, and the analytics/banner
services live in sibling app modules and are consumed here.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. The Fund URL is always built via `FundURLGenerator.generateURL`, rooted at
   `AppEnvironment.current.fundBaseUrl`, and carries `version`, `theme`, `platform=ios`,
   `currency`, `language`, and `region` query items (plus `address` when supplied).
3. Only `FundInAppBrowserScriptMessage.handleRequest` messages are handled, and each
   embedded method must map to a known `FundInAppBrowserScriptMethod` case; unknown
   method names are ignored (no crash, no action).
4. `selectedAddress` is consumed once — it is read in `viewDidAppear` to reload the page
   with that account, then reset to `nil` so it does not re-apply on later appearances.
5. The navigation bar is hidden while the Fund screen is visible and restored on
   disappear; the tab bar stays visible (`tabBarHidden = false`).
6. `getAddresses` only exposes the authenticated user's non-joint accounts to the page.

## Behavioral Examples

### Scenario: Open the Fund tab
- **Given** the user taps the Fund tab and the web view has no loaded URL
- **When** `viewDidLoad` runs
- **Then** `FundURLGenerator.generateURL` builds the Pera fund URL with the current theme,
  currency, language, and region, and the web view loads it.

### Scenario: Fund a specific account via deep link
- **Given** a deep link targets the Fund tab with a `path` and an `address`
- **When** `launchFundFromDeeplink` posts `.didReceiveDeepLink` and the screen handles it
- **Then** the page is reloaded at `baseURL/<path>` with an `address` query item for that account.

### Scenario: Web page requests wallet addresses
- **Given** the loaded Fund page posts a `handleRequest` message with method `getAddresses`
- **When** `handleFund` processes it
- **Then** the native side serializes the authenticated user's non-joint accounts
  (name, address, auth type) and returns them to the page via an injected JS callback.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `fundBaseUrl` not a valid `URLComponents` string | `generateURL` returns `nil`; `load(url:)` is called with `nil` (no page loads). |
| `handleRequest` payload cannot be decoded | `decodeRequest()` returns `nil`; the message is ignored. |
| Unknown method name in a request | No matching `FundInAppBrowserScriptMethod`; that entry is skipped silently. |
| `pushWebView` / `canOpenURI` / `openNativeURI` with an unparseable URL/URI | Guard fails; the method is a no-op. |
| `getAddresses` with no authenticated user | Address list is empty; an empty array is returned to the page. |
| `PeraUserDefaults.enableTestXOSwapPage` is `true` | URL is suffixed with `/test`, overriding any deep-link `path`. |
| `closeWebView` / `onBackPressed` from JS | Dismisses if presented modally, else pops the navigation stack. |

## Dependencies

| Module | Usage |
|--------|-------|
| `pera_wallet_core` | `Session`, `Account`, `AppEnvironment.fundBaseUrl`, `PeraUserDefaults`, currency/locale helpers. |
| `InAppBrowserScreen` (app, InAppBrowser/) | Base web-view screen; `FundInAppBrowserScreen` subclasses it and overrides user agent, handled messages, theme/lifecycle hooks. |
| `InAppBrowserHelpers` (app) | `handleFund` plus `handleAddresses` / `handleSettings` bridge implementations. |
| `Router` (app, Routing/) | `open(.publicWebview...)`, system-browser opening, and Fund-URL detection. |
| `TabBarController` / `RootViewController` (app) | Host the Fund screen in the Fund tab; entry points `launchFund` / `launchFundFromDeeplink`. |
| `WebKit` (`WKWebView`, `WKScriptMessage`) | Web rendering and the JS message channel. |
| Analytics & banner controllers (app) | `logAnalyticsEvent` tracking and `notifyUser` banners/toasts. |
| `CurrencySelectionViewController` | `didChangePreferredCurrency` notification drives `updateCurrency`. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
