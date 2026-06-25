# PeraWallet_Classes_PublicWebview — Context

## Overview

`PeraWallet/Classes/PublicWebview` is a thin specialization layer over the shared in-app browser
infrastructure (`PeraWallet/Classes/InAppBrowser`). It renders **trusted, Pera-hosted public web
content** in an embedded `WKWebView` — pages that do not require an authenticated wallet session
(no addresses, no signing). It is reached via `Router` → `Screen.publicWebview(url:)`.

## Key files

- `PublicWebviewInAppBrowserScreen.swift` — base in-app browser for public pages. Owns: the
  Pera-versioned user agent (`pera_ios_<appVersion>`), the registered script message set
  (`handleRequest`), URL loading, theme syncing, and dispatch into `handlePublicWebview`.
- `PublicWebviewScreen.swift` — concrete routed screen. Subclasses the above; keeps the tab bar
  visible, disables scroll bounce, adopts `DiscoverHomeScreenTheme`.
- Bridge enums (in `PublicWebviewInAppBrowserScreen.swift`):
  `PublicWebviewInAppBrowserScreenMessage` (`handleRequest`) and
  `PublicWebviewInAppBrowserScreenMethod` (`openSystemBrowser`, `closeWebView`, `pushWebView`,
  `getPublicSettings`, `onBackPressed`, `logAnalyticsEvent`).

## Collaborators (outside this module)

- `PeraWallet/Classes/InAppBrowser/InAppBrowserScreen.swift` — base web-view lifecycle/config.
- `PeraWallet/Classes/InAppBrowser/InAppBrowserHelpers.swift` — `handlePublicWebview(_:_:)` and
  `handleSettings(_:id:)` implement the JS bridge behavior.
- `PeraWallet/Classes/Routing/Router.swift` (line ~2468) and `Screen.swift`
  (`case publicWebview(url:)`) — instantiation and navigation.

## Architectural decisions

- **Inheritance over composition** for browser specialization: public-webview behavior is layered
  by overriding `userAgent`, `handledMessages`, and `userContentController(_:didReceive:)`.
- **Public vs. authenticated bridge surface**: this module deliberately only handles
  `getPublicSettings` (theme/network/language/currency) and never the richer `getSettings`
  (device id, app package) or address/signing methods used by the Fund/Discover browsers.
- **Theme bridging via JS**: device light/dark style is pushed into the page through
  `updateTheme('<theme>')` rather than CSS media queries, keeping web and native in lockstep.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI. Two source files; the bulk of
behavior is inherited from the `InAppBrowser` module.
