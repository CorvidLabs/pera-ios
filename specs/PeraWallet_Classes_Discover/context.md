# PeraWallet_Classes_Discover — Context

## Overview

Architectural context for the `PeraWallet_Classes_Discover` module — the wallet's **Discover** tab. The authoritative contract is `PeraWallet_Classes_Discover.spec.md`; the source files it covers are listed in that spec's `files:` frontmatter.

The module is a thin native shell around Pera's web-hosted Discover experience. Most UI is web content; this module owns the `WKWebView` chrome, navigation, JS bridging, asset search, and URL construction.

## Key files

- `DiscoverInAppBrowser/DiscoverInAppBrowserScreen.swift` — abstract base for Pera-owned web pages (theme/currency JS sync, user agent, script-message dispatch). All Pera in-app browser screens subclass this.
- `Home/DiscoverHomeScreen.swift` (+ `DiscoverHomeScreenTheme`) — the Discover tab landing screen and large-title nav bar behavior.
- `AssetDetail/DiscoverAssetDetailScreen.swift` — token-detail web page.
- `Generic/DiscoverGenericScreen.swift` — arbitrary Pera URL loader.
- `ExternalInAppBrowser/DiscoverExternalInAppBrowserScreen.swift` + `DiscoverDappDetailScreen.swift` — third-party / dApp browser chrome (toolbar, favorites).
- `Search/` — `DiscoverSearchScreen`, `DiscoverSearchDataController`/`DiscoverSearchAPIDataController`, `DiscoverSearchDataSource`, layout/theme, and the cell + view-model family (asset, loading, not-found, error, next-loading, next-error).
- `DiscoverInAppBrowser/BrowserAuthorizedAddressEventHandler.swift` — the only `public` type; encodes filtered accounts into the web view.
- `Utils/DiscoverURLGenerator.swift` — builds every Pera Discover URL and defines `DiscoverDestination` / `DiscoverExternalDestination`.
- `Utils/SocialMediaDeeplinkRouter/` — `DiscoverSocialMediaRouter` + `SocialMediaDeeplink` builders (Twitter/X, Discord, Telegram).
- `Views/` — shared cells/views: `DiscoverErrorCell`, `DiscoverNavigationBarView`.

## Architectural decisions

- **MVVM + data-controller**, not coordinators. Screens are `UIViewController` subclasses (`BaseViewController` / core `InAppBrowserScreen`). The search screen delegates data to a `DiscoverSearchDataController` protocol (impl: `DiscoverSearchAPIDataController`) that publishes diffable-snapshot events; cells bind dedicated `*ViewModel` types.
- **Web/native split**: native owns chrome, routing, and the JS bridge; the backend serves the visual Discover/Markets/token-detail content. Communication is one-way config push (theme/currency) plus typed `WKScriptMessage` handlers (PeraConnect, auth addresses, device id, push-screen, open-system-browser).
- **Throttled, cursor-paginated search**: 0.4s `Throttler` on keyword input, single in-flight endpoint, `nextCursor`-driven pagination, trending assets cached after first fetch.
- **Inter-screen navigation** uses the app `Screen` enum + `open(by:)` router (e.g. `.discoverSearch`, `.discoverAssetDetail`) with event-handler closures, not segues.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
