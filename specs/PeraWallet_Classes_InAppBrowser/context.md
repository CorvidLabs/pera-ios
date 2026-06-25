# PeraWallet_Classes_InAppBrowser — Context

## Overview

`PeraWallet/Classes/InAppBrowser` is the shared, abstract `WKWebView` host for every
embedded web experience in Pera Wallet. The authoritative contract is
`PeraWallet_Classes_InAppBrowser.spec.md`; the covered source files are listed in that
spec's `files:` frontmatter.

## Key files

- `InAppBrowserScreen.swift` — abstract `BaseViewController` subclass. Owns the
  `WKWebView`, user content controller, no-content state machine, navigation
  interception (`decidePolicyFor`), pull-to-refresh, and the `WKUIDelegate` /
  `WKNavigationDelegate` / `WKScriptMessageHandler` plumbing. Guards against being
  instantiated directly (`fatalError`).
- `InAppBrowserHelpers.swift` — the JS→native bridge. One `handle*` method per surface
  (`handleDiscoverInApp`, `handleDiscoverHome`, `handleDiscoverAssetDetail`,
  `handleStaking`, `handleCards`, `handleBidali`, `handleFund`, `handlePublicWebview`)
  plus private actions (authorized addresses, device ID, settings, open system browser,
  swap/buy, dApp detail, Bidali payment → `SendTransactionPreviewScreen`).
- `InAppBrowserScripts.swift` — `InAppBrowserScript` enum and `Scripts` string builders:
  text-selection CSS, history-navigation hooks, Pera Connect modal observer, Bidali
  payment provider, and the `message(id:result:)` JSON-RPC response helper.
- `InAppBrowserMessageParams.swift` — `Decodable` param structs (`URLParams`,
  `URIParams`, `PushWVParams`, `LogEventParams`, `NotifyParams`/`NotifyType`).
- `InAppBrowserScreenTheme.swift` — `LayoutSheet`/`StyleSheet` aggregating background,
  no-content, loading, and error themes.
- `Views/NoContentView/` — `InAppBrowserNoContentView` (loading/error/none state
  machine with cross-dissolve), `InAppBrowserErrorViewModel` (maps `ConnectionError` /
  `UnexpectedError` to copy + icon), `InAppBrowserLoadingView` + `LogoLoadingView`.

## Architecture

- MVVM-lite + delegate-driven: the screen is the controller and `WKWebView` delegate;
  view state is expressed through `InAppBrowserNoContentView.State`; error copy comes
  from `InAppBrowserErrorViewModel`. Theming via Macaroon `LayoutSheet`/`StyleSheet`.
- Template-method pattern: the base is abstract; concrete screens override
  `extraUserScripts`, `handledMessages`, `account`, `useSafeAreaBottom`,
  `allowsPullToRefresh`, and implement `userContentController(_:didReceive:)` to dispatch
  into the matching `InAppBrowserHelpers` handler.
- Known subclasses (outside this module): `DiscoverInAppBrowserScreen`,
  `DiscoverHomeScreen`, `DiscoverAssetDetailScreen`, `DiscoverGenericScreen`,
  `DiscoverDappDetailScreen`, `DiscoverExternalInAppBrowserScreen`,
  `CardsInAppBrowserScreen`, `StakeInAppBrowserScreen`, `BidaliDappDetailScreen`,
  `FundInAppBrowserScreen`, `PublicWebviewInAppBrowserScreen`.

## Architectural decisions

- Single abstract host shared across surfaces keeps web-view config, error/loading UX,
  navigation interception, and the secure script-message registration consistent.
- Inbound messages are registered with `add(secureScriptMessageHandler:forName:)` and
  many handlers re-check `message.isAcceptable`, keeping the native attack surface narrow.
- Out-of-context URLs (mail / social / WalletConnect) are intercepted and dispatched to
  native flows rather than rendered in the web view.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
