# PeraWallet_Classes_InAppBrowser — Design

## Layout & components

`InAppBrowserScreen` lays out two full-bleed views in the same frame and shows exactly
one at a time:

- `webView` (`WKWebView`) — pinned to safe-area top, edges to 0 (bottom optionally
  safe-area when `useSafeAreaBottom`). Transparent (`isOpaque = false`, clear
  background), scroll indicators hidden, link preview disabled, optional pull-to-refresh
  (`UIRefreshControl`).
- `InAppBrowserNoContentView` — pinned to all edges, hosts a single context view per
  `State`:
  - `.loading` → `InAppBrowserLoadingView` wrapping a centered animated `LogoLoadingView`.
  - `.error` → `DiscoverErrorView` bound from `InAppBrowserErrorViewModel` (info-square
    icon, body-medium title, footnote body, retry action).
  - `.none` → no context view (web content visible).

State changes cross-dissolve (0.2s within the no-content view; 0.3s between web view and
no-content view).

## Navigation hierarchy

- Abstract base; concrete subclasses are pushed/presented through the app `Router`
  (`open(_:by:)`) — e.g. Discover screens, Cards, Staking, Bidali, Fund, Public Webview.
- In-page navigation interception (`decidePolicyFor`):
  - mail URL → open system mail app, cancel in-view load
  - social-media URL (via `DiscoverSocialMediaRouter`) → open externally, cancel
  - WalletConnect URI → `walletConnectSessionRequestForDiscover` deeplink, cancel
  - web URL → allow; anything else → cancel
- Bridge-driven native pushes/presents: dApp detail, asset detail, generic discover page,
  Swap (`SwapAssetFlowCoordinator` / root `launch(tab: .swap)`), Buy (`MeldFlowCoordinator`),
  Bidali payment (`SendTransactionPreviewScreen`), and public webview push.

## Design tokens

- Background: `Colors.Defaults.background` (web view rendered transparent over it).
- Typography: `bodyMedium` (error title), `footnoteRegular` (error body) via Macaroon
  text providers.
- Themes are Macaroon `LayoutSheet`/`StyleSheet`: `InAppBrowserScreenTheme` aggregates
  `InAppBrowserNoContentViewTheme`, `InAppBrowserLoadingViewTheme`, and
  `DiscoverErrorViewTheme`.

## Assets

- `icon-info-square` (template image) — error state icon.
- Pera logo animation asset used by `LogoLoadingView` for the loading spinner.

## Injected scripts

- `selection` — CSS disabling callout/selection except in inputs/textareas.
- `navigation` — wraps `history.pushState/replaceState` and listens for `popstate`.
- `peraConnect` — `MutationObserver` that detects the Pera Connect modal and posts its
  WalletConnect URI to native.
- `bidaliPayment(config:balance:)` — installs `window.bidaliProvider` exposing
  `onPaymentRequest` / `openUrl` bridges.
