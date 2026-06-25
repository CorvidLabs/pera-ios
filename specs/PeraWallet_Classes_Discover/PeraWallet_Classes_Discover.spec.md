---
module: PeraWallet_Classes_Discover
version: 1
status: active
files:
  - PeraWallet/Classes/Discover/AssetDetail/DiscoverAssetDetailScreen.swift
  - PeraWallet/Classes/Discover/DappDetailNavigationViewTheme.swift
  - PeraWallet/Classes/Discover/DiscoverInAppBrowser/BrowserAuthorizedAddressEventHandler.swift
  - PeraWallet/Classes/Discover/DiscoverInAppBrowser/DiscoverInAppBrowserScreen.swift
  - PeraWallet/Classes/Discover/ExternalInAppBrowser/DiscoverDappDetailScreen.swift
  - PeraWallet/Classes/Discover/ExternalInAppBrowser/DiscoverExternalInAppBrowserScreen.swift
  - PeraWallet/Classes/Discover/ExternalInAppBrowser/Views/NavigationView/DiscoverExternalInAppBrowserNavigationView.swift
  - PeraWallet/Classes/Discover/ExternalInAppBrowser/Views/NavigationView/DiscoverExternalInAppBrowserNavigationViewModel.swift
  - PeraWallet/Classes/Discover/ExternalInAppBrowser/Views/NavigationView/DiscoverExternalInAppBrowserNavigationViewTheme.swift
  - PeraWallet/Classes/Discover/Generic/DiscoverGenericScreen.swift
  - PeraWallet/Classes/Discover/Home/DiscoverHomeScreen.swift
  - PeraWallet/Classes/Discover/Home/DiscoverHomeScreenTheme.swift
  - PeraWallet/Classes/Discover/Search/Data/DiscoverSearchAPIDataController.swift
  - PeraWallet/Classes/Discover/Search/Data/DiscoverSearchDataController.swift
  - PeraWallet/Classes/Discover/Search/DiscoverSearchDataSource.swift
  - PeraWallet/Classes/Discover/Search/DiscoverSearchScreen.swift
  - PeraWallet/Classes/Discover/Search/DiscoverSearchScreenLayout.swift
  - PeraWallet/Classes/Discover/Search/DiscoverSearchScreenTheme.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchAssetCell/DiscoverSearchAssetCell.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchAssetCell/DiscoverSearchAssetListItemViewModel.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchAssetCell/DiscoverSearchAssetNameListItemViewModel.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListErrorCell/DiscoverSearchListErrorViewModel.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListLoadingCell/DiscoverSearchListLoadingCell.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListLoadingCell/DiscoverSearchListLoadingView.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListLoadingCell/DiscoverSearchListLoadingViewTheme.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListLoadingCell/Views/DiscoverSearchAssetLoadingView/DiscoverSearchAssetLoadingViewTheme.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListNotFoundCell/DiscoverSearchListNotFoundCell.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListNotFoundCell/DiscoverSearchListNotFoundView.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListNotFoundCell/DiscoverSearchListNotFoundViewModel.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListNotFoundCell/DiscoverSearchListNotFoundViewTheme.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchNextListErrorCell/DiscoverSearchNextListErrorCell.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchNextListErrorCell/DiscoverSearchNextListErrorView.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchNextListErrorCell/DiscoverSearchNextListErrorViewModel.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchNextListErrorCell/DiscoverSearchNextListErrorViewTheme.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchNextListLoadingCell/DiscoverSearchNextListLoadingCell.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchNextListLoadingCell/DiscoverSearchNextListLoadingViewTheme.swift
  - PeraWallet/Classes/Discover/Utils/DiscoverURLGenerator.swift
  - PeraWallet/Classes/Discover/Utils/SocialMediaDeeplinkRouter/DiscordDeeplink.swift
  - PeraWallet/Classes/Discover/Utils/SocialMediaDeeplinkRouter/DiscoverSocialMediaRouter.swift
  - PeraWallet/Classes/Discover/Utils/SocialMediaDeeplinkRouter/SocialMediaDeeplink.swift
  - PeraWallet/Classes/Discover/Utils/SocialMediaDeeplinkRouter/TelegramDeeplink.swift
  - PeraWallet/Classes/Discover/Utils/SocialMediaDeeplinkRouter/TwitterDeeplink.swift
  - PeraWallet/Classes/Discover/Views/DiscoverErrorCell/DiscoverErrorCell.swift
  - PeraWallet/Classes/Discover/Views/DiscoverErrorCell/DiscoverErrorView.swift
  - PeraWallet/Classes/Discover/Views/DiscoverErrorCell/DiscoverErrorViewModel.swift
  - PeraWallet/Classes/Discover/Views/DiscoverErrorCell/DiscoverErrorViewTheme.swift
  - PeraWallet/Classes/Discover/Views/NavigationBar/DiscoverNavigationBarView.swift
  - PeraWallet/Classes/Discover/Views/NavigationBar/DiscoverNavigationBarViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Discover

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Discover`) that implements the wallet's **Discover** tab: an in-app web experience that surfaces Pera's web-hosted Discover/Markets content, token detail pages, dApps, and asset search inside native `WKWebView`-backed screens.

Screens and flows:
- **Discover Home** (`DiscoverHomeScreen`) — the tab's landing page. A `DiscoverInAppBrowserScreen` subclass that loads the Pera Discover web app, drives a large-title navigation bar (`DiscoverNavigationBarView`) that fades with web scroll, and exposes a search affordance.
- **In-app browser base** (`DiscoverInAppBrowserScreen`) — abstract base for Pera-owned web pages. Builds the Pera URL via `DiscoverURLGenerator`, injects a `pera_ios_<version>` user agent, pushes theme/currency changes into the web view via JavaScript, and bridges `WKScriptMessage` calls (PeraConnect, auth addresses, device id, navigation).
- **Asset / Token detail** (`DiscoverAssetDetailScreen`) — pushed web page for a single asset (`/token-detail/<assetID>/`), with token-detail action-button message handling.
- **Generic** (`DiscoverGenericScreen`) — loads an arbitrary Pera-supplied URL with in-house query params appended.
- **External in-app browser** (`DiscoverExternalInAppBrowserScreen`) and **dApp detail** (`DiscoverDappDetailScreen`) — chrome for third-party / non-Pera sites: title view, back/forward/home toolbar, reload, and (for dApps) add/remove-favorite toolbar action.
- **Asset search** (`DiscoverSearchScreen`) — a presented, keyboard-driven search of Discover assets backed by `DiscoverSearchAPIDataController` (trending assets on empty query, throttled keyword search, cursor-based pagination) rendered through a diffable-data-source collection view with loading / not-found / error / next-page cells.
- **Social media deeplink routing** (`DiscoverSocialMediaRouter` + `*Deeplink`) — converts web URLs (Twitter/X, Discord, Telegram) into native app deeplinks.

Ownership boundary: native screen chrome, navigation, web-view bridging, search data, and URL construction live here; the actual Discover/Markets/token-detail UI is web content served from Pera's backend (`AppEnvironment.discoverBaseUrl`). This is app-target code (internal by default) — the only cross-module-public type is `BrowserAuthorizedAddressEventHandler`.

## Public API

| Export | Description |
|--------|-------------|
| `BrowserAuthorizedAddressEventHandler` | Encodes the user's (optionally authorized-only, non-joint) accounts as base64 and injects them into an in-app browser web view via `handleMessage` JavaScript. |

## Invariants

1. Every Pera-owned Discover URL is built through `DiscoverURLGenerator`, which appends the in-house query items (`version=5`, `theme`, `platform=ios`, `currency`, `language`, `region`) and a `pera_ios_<CFBundleShortVersionString>` user-agent suffix, so the web content always renders in the user's theme/currency/locale.
2. Web-view theme and currency stay in sync with the app: `DiscoverInAppBrowserScreen` observes `applicationDidBecomeActive` and `CurrencySelectionViewController.didChangePreferredCurrency`, and on each change evaluates `updateTheme(...)` / `updateCurrency(...)` JavaScript in the web view rather than reloading.
3. Account data exposed to web content is filtered for safety: `BrowserAuthorizedAddressEventHandler` never injects joint accounts, and in authorized-only mode excludes ledger and non-authorized accounts before base64-encoding them; if encoding fails nothing is injected.
4. Discover Home owns the large-title nav bar lifecycle: the search bar button is shown only while the large title is visible, the nav bar is hidden on appear and restored on disappear, and the `NavigationBarLargeTitleController` is deactivated in `deinit`.
5. Search list state is a single-section-at-a-time snapshot: loading, not-found, error, results+`nextLoading`, and `nextError` are mutually exclusive list states; keyword requests are throttled (0.4s) and only one in-flight assets request exists at a time, with the previous one cancelled before a new load.

## Behavioral Examples

### Scenario: Searching Discover and opening an asset
- **Given** the user taps the search button on Discover Home and `DiscoverSearchScreen` is presented full-screen
- **When** the user types a keyword, the throttled `DiscoverSearchAPIDataController` queries `searchAssetsForDiscover`, and the user taps a returned asset cell
- **Then** an analytics `searchDiscover` event is tracked, the search screen dismisses, and `DiscoverAssetDetailScreen` is pushed loading `/token-detail/<assetID>/`

### Scenario: Empty search query shows trending assets
- **Given** `DiscoverSearchScreen` has just appeared with an empty search field
- **When** initial data loads
- **Then** `getTrendingAssets` is requested (cached after first success) and its results populate the list section instead of a keyword search

### Scenario: Favoriting a dApp in the external browser
- **Given** `DiscoverDappDetailScreen` is open on a dApp that supplied a `favorites` list
- **When** the user taps the favorite toolbar button
- **Then** the host URL is favorited and an `addToFavorites` event is emitted — unless the 100-favorite limit is reached, in which case an error banner (`discover-error-favorites-max-limit`) is shown and nothing is added

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Search/trending request fails with no internet | List shows a full-screen error cell with `discover-error-connection-title` / `discover-error-connection-body`; retry reloads the request |
| Search/trending request fails (other API error) | List shows a generic error cell (`title-generic-api-error` + asset-not-found/retry-later body); retry reloads |
| Next-page (pagination) request fails | Only the `.nextList` section is replaced with a `nextError` cell; existing results remain; retry reloads the next page |
| Keyword search returns zero assets | List shows the not-found cell (`DiscoverSearchListNotFoundView`) instead of results |
| `BrowserAuthorizedAddressEventHandler` JSON encoding / `CardsAccounts` encoding fails, or message is not acceptable | No script is injected; the web view receives no account data |
| Adding a favorite when already at 100 favorites | Error banner shown; favorite not added and no event emitted |
| Generated Pera URL is nil (bad components) | `load(url:)` is called with nil and the web view simply does not load that destination |
| Social-media URL has an unrecognized scheme/host | `DiscoverSocialMediaRouter.route` returns nil; no native deeplink is opened |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core (PeraWalletCore) | `InAppBrowserScreen`/`InAppBrowserScript`/`InAppBrowserScriptMessage` base browser, `SharedDataController`, `Session`, `ALGAPI` (asset/trending search), `AssetDecoration`/`AssetHandle`/`AccountHandle`, `CardsAccounts`, `AppEnvironment`, `CurrencyFormatter`, `DiscoverAssetParameters`/`DiscoverDappParamaters`/`DiscoverGenericParameters`/`DiscoverFavouriteDappDetails` |
| MacaroonUIKit / MacaroonForm / MacaroonUtils | View theming (`LayoutSheet`/`StyleSheet`), large-title nav controller, keyboard controller, `Throttler`, base views |
| MagpieCore / MagpieHipo | Networking endpoints and `HIPNetworkError` for the search data controller |
| WebKit | `WKWebView`, `WKScriptMessage`, `WKUserContentController`, back/forward list navigation |
| Analytics (app) | `searchDiscover` and `discoverDappDetail` event tracking |
| Routing (`Screen` / `open(by:)`) | Presenting search, pushing asset detail, and opening social-media deeplinks |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
