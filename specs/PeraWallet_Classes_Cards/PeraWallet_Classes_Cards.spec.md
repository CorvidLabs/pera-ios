---
module: PeraWallet_Classes_Cards
version: 1
status: active
files:
  - PeraWallet/Classes/Cards/CardsInAppBrowserScreen.swift
  - PeraWallet/Classes/Cards/CardsScreen.swift
  - PeraWallet/Classes/Cards/Models/CardsAccounts.swift
  - PeraWallet/Classes/Cards/Utils/CardsFlowCoordinator.swift
  - PeraWallet/Classes/Cards/Utils/CardsURLGenerator.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Cards

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Cards`) that hosts the Pera
Cards experience. The screen is a thin native shell around a `WKWebView` that
loads Pera's hosted cards web app; the native side supplies context (theme,
currency, language/region, network, wallet version) via URL query parameters
and brokers a small JavaScript bridge so the web app can request wallet data
and trigger native flows.

Screens and flow:
- `CardsFlowCoordinator` launches Cards by routing to `.cards(path:)`,
  presented full-screen without a navigation controller.
- `CardsScreen` is the concrete tab-aware screen (keeps the tab bar visible,
  pins scroll to the top, disables bounce/pull-to-refresh).
- `CardsInAppBrowserScreen` (its superclass) owns the in-app-browser behavior:
  building the cards URL via `CardsURLGenerator`, loading it, pushing the
  current light/dark theme into the page (`updateTheme(...)`), and handling
  bridge messages defined by `CardsInAppBrowserScriptMessage`.
- `CardsURLGenerator` builds the destination URL from
  `AppEnvironment.current.cardsBaseUrl(network:)` plus in-house query items
  (`version`, `theme`, `platform=ios`, `currency`, `language`, `region`), for
  either the `.welcome` home destination or an `.other(path:)` deep path.
- `CardsAccounts` is the JSON payload (`action`/`payload`) returned to the web
  app in response to the authorized-addresses request.

Ownership boundary: this module owns the Cards screen shell, its URL
generation, and its `CardsDestination`/script-message enums. The actual bridge
message handlers (`handleCards`) and the underlying `InAppBrowserScreen` base
class live in the shared `InAppBrowser` module, which this module subclasses
and dispatches into.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. The cards URL is always rebuilt and reloaded when `destination` changes
   (`didSet` on `CardsInAppBrowserScreen.destination` calls `loadCardsURL()`),
   and is reloaded on pull-to-refresh and `viewDidLoad`.
3. Every generated URL targets `AppEnvironment.current.cardsBaseUrl(network:)`
   for the current `ALGAPI.Network` (mainnet when no API network is available)
   and carries the in-house query items (version, theme, platform, currency,
   language, region). The `.other(path:)` destination returns `nil` when its
   path is `nil`, so no URL is loaded.
4. Page theme stays in sync with the system appearance: the web app's
   `updateTheme('<light|dark>')` is invoked on `viewWillAppear` (deferred ~1s),
   on `preferredUserInterfaceStyleDidChange`, and when the app becomes active.
5. Only the messages enumerated in `CardsInAppBrowserScriptMessage` are handled;
   any other `WKScriptMessage` name is ignored. The authorized-addresses bridge
   returns authorized accounts only (`isAuthorizedAccountsOnly: true`).

## Behavioral Examples

### Scenario: Opening the Cards home from the menu/coordinator
- **Given** the user triggers the Cards entry point
- **When** `CardsFlowCoordinator.launch()` runs
- **Then** it opens `.cards(path: nil)` full-screen without a navigation
  controller, and `CardsScreen` loads the `.welcome` cards home URL with the
  current theme, currency, language, region, and network query parameters.

### Scenario: Web app requests the user's authorized addresses
- **Given** the cards web app is loaded in the `WKWebView`
- **When** it posts the `getAuthorizedAddresses` script message
- **Then** `handleCards` calls `handleRequestAuthorizedAddresses(_:isAuthorizedAccountsOnly: true)`,
  which encodes the authorized accounts into a `CardsAccounts`
  (`action: "getAuthorizedAddresses"`) JSON payload and returns it to the page.

### Scenario: Switching the system appearance while Cards is open
- **Given** Cards is presented in light mode
- **When** the user switches the device to dark mode
- **Then** `preferredUserInterfaceStyleDidChange` runs
  `updateTheme('dark')` against the web view so the page matches the app.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `.other(path:)` destination with a `nil` path | `CardsURLGenerator.generateURL` returns `nil`; `load(url:)` is called with `nil` and no page is loaded |
| `cardsBaseUrl` / path is not a valid URL | `URLComponents(string:)` yields `nil` and the generated URL is `nil`; no navigation occurs |
| No active API network | URL generation falls back to `.mainnet` |
| Unrecognized `WKScriptMessage` name | `CardsInAppBrowserScriptMessage(rawValue:)` is `nil`; the message is ignored |
| `closePeraCards` message received | `dismissScreen()` is invoked, dismissing the Cards screen |

## Dependencies

| Module | Usage |
|--------|-------|
| InAppBrowser (`PeraWallet/Classes/InAppBrowser`) | `InAppBrowserScreen` base class, `InAppBrowserScript` user scripts, and the `handleCards` bridge handlers in `InAppBrowserHelpers` |
| pera_wallet_core | `ALGAPI.Network`, `Session`, `ViewControllerConfiguration`, and `AppEnvironment.cardsBaseUrl(network:)` |
| Routing (`Router` / `Screen`) | `.cards(path:)` route used by `CardsFlowCoordinator.launch()` and URL deep links |
| Discover | `DiscoverHomeScreenTheme` reused for `CardsScreen` styling |
| MacaroonUIKit / MacaroonUtils | UI theming and `JSONModel` (`CardsAccounts`) encoding |
| WebKit | `WKWebView`, `WKScriptMessage`, JavaScript evaluation for the bridge |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
