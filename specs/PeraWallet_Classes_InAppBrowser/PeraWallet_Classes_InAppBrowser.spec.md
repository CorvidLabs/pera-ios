---
module: PeraWallet_Classes_InAppBrowser
version: 1
status: active
files:
  - PeraWallet/Classes/InAppBrowser/InAppBrowserHelpers.swift
  - PeraWallet/Classes/InAppBrowser/InAppBrowserMessageParams.swift
  - PeraWallet/Classes/InAppBrowser/InAppBrowserScreen.swift
  - PeraWallet/Classes/InAppBrowser/InAppBrowserScreenTheme.swift
  - PeraWallet/Classes/InAppBrowser/InAppBrowserScripts.swift
  - PeraWallet/Classes/InAppBrowser/Views/NoContentView/InAppBrowserNoContentView.swift
  - PeraWallet/Classes/InAppBrowser/Views/NoContentView/InAppBrowserNoContentViewTheme.swift
  - PeraWallet/Classes/InAppBrowser/Views/NoContentView/Views/InAppBrowserErrorView/InAppBrowserErrorViewModel.swift
  - PeraWallet/Classes/InAppBrowser/Views/NoContentView/Views/InAppBrowserLoadingView/InAppBrowserLoadingView.swift
  - PeraWallet/Classes/InAppBrowser/Views/NoContentView/Views/InAppBrowserLoadingView/InAppBrowserLoadingViewTheme.swift
  - PeraWallet/Classes/InAppBrowser/Views/NoContentView/Views/InAppBrowserLoadingView/Views/LogoLoadingView/LogoLoadingView.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_InAppBrowser

## Purpose

App-target UI/feature module (`PeraWallet/Classes/InAppBrowser`) that provides the
shared, abstract `WKWebView` host used by every embedded web experience in the app:
Discover (home, asset detail, dApp viewer, generic pages), Pera Cards, Staking,
Bidali sell, Fund, and the generic Public Webview.

`InAppBrowserScreen` (a `BaseViewController` subclass) owns:

- A configured `WKWebView` with pull-to-refresh, a custom user-agent hook, link
  preview disabled, and a transparent background.
- A loading / error / content state machine driven by `InAppBrowserNoContentView`
  (`LogoLoadingView` spinner while loading; `DiscoverErrorView` bound from
  `InAppBrowserErrorViewModel` on failure; the web view once content finishes).
- A JavaScript ↔ native bridge: it injects user scripts (`InAppBrowserScript` —
  text-selection CSS, history navigation hooks, Pera Connect modal observer, Bidali
  payment provider) via an `InAppBrowserUserContentController`, and routes inbound
  `WKScriptMessage` messages. Subclasses declare `extraUserScripts` and
  `handledMessages`; `InAppBrowserHelpers` implements the per-surface handlers
  (`handleDiscoverInApp`, `handleCards`, `handleStaking`, `handleBidali`,
  `handleFund`, `handlePublicWebview`, etc.).
- Navigation interception in `decidePolicyFor`: mail links open in the system mail
  app, social-media URLs route through `DiscoverSocialMediaRouter`, WalletConnect
  URIs are dispatched as `walletConnectSessionRequestForDiscover` deeplinks, and only
  web URLs are allowed to load in-view.

The bridge connects web content to native flows: requesting authorized addresses,
device ID, settings, opening the system browser, pushing dApp/asset-detail/swap
screens, launching Buy (Meld) and Swap coordinators, Bidali payment requests
(`SendTransactionPreviewScreen`), and analytics events.

Ownership boundary: this module defines the abstract base and its loading/error
views only. Concrete screens, their message enums (`DiscoverInAppBrowserScriptMessage`,
`CardsInAppBrowserScriptMessage`, etc.) and feature routing live in their respective
feature modules (Discover, Cards, Stake, Fund, BuySell, PublicWebview).

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. `InAppBrowserScreen` is abstract: `viewDidLoad` calls `fatalError` if the runtime
   type is exactly `InAppBrowserScreen`, so only subclasses may be instantiated.
2. The no-content view is mutually exclusive with the web view — at any moment the
   user sees exactly one of loading, error, or rendered content, swapped via a
   cross-dissolve transition (`State` is `loading`, `error`, or `none`).
3. Only web URLs render in-view. In `decidePolicyFor`, mail / social-media /
   WalletConnect URLs are intercepted and dispatched out-of-view (`.cancel`), and any
   non-web URL is rejected; navigation never silently loads a non-`http(s)` scheme.
4. Inbound JS messages are accepted only through secure handlers: handlers are
   registered with `add(secureScriptMessageHandler:forName:)` for the exact message
   names a subclass declares in `handledMessages`, and several handlers additionally
   guard on `message.isAcceptable`. On `deinit` all script message handlers are removed.
5. `lastURL` (current `webView.url` falling back to the original `sourceURL`) is what
   "retry" and pull-to-refresh reload, so a failed first load can always be retried.

## Behavioral Examples

### Scenario: A Discover page fails to load, then the user retries
- **Given** a concrete `InAppBrowserScreen` subclass has called `load(url:)`
- **When** the provisional navigation fails with a non-cancelled `URLError`
- **Then** `updateUIForError` builds an `InAppBrowserErrorViewModel` (connection vs.
  unexpected copy) and cross-dissolves the web view out for `DiscoverErrorView`
- **And** tapping retry reloads `lastURL` and shows the `LogoLoadingView` spinner again.

### Scenario: Web content requests a Pera Connect session
- **Given** the injected `peraConnect` observer script detects the connect modal and
  posts the WalletConnect URI to the `peraconnect` message handler
- **When** `handlePeraConnectAction` parses it via `DeeplinkQR(...).walletConnectUrl()`
- **Then** it dispatches `.walletConnectSessionRequestForDiscover` to `launchController`
  so the native WalletConnect session-request flow takes over.

### Scenario: A Bidali payment is requested from the sell dApp
- **Given** the Bidali provider script posts a `paymentRequest` with address, amount,
  extra ID and currency protocol
- **When** `handlePaymentRequestAction` resolves the matching `Asset` on the active
  `account` and presents `SendTransactionPreviewScreen`
- **Then** completing the transaction sends `paymentSent` back to the web view and
  dismissing sends `paymentCancelled`.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Provisional/committed navigation fails with non-cancelled `URLError` | `updateUIForError` shows `DiscoverErrorView`; connection errors use connection copy, others use generic/unexpected copy |
| Navigation cancelled (`URLError.cancelled`) | Treated as non-presentable; falls through to `updateUIForURL` instead of showing an error |
| Navigation request has no URL, or URL is non-web | `decidePolicyFor` returns `.cancel`; the page does not load |
| Mail URL encountered and `canOpenURL` is false | Mail app is not opened; navigation is cancelled, web view stays put |
| Inbound script message body/params fail to decode | Handler `guard`s out and returns silently (no crash, no navigation) |
| Bidali payment missing fields or asset cannot be resolved | `presentGenericErrorBanner` shows the generic error banner; no transaction screen is presented |
| Page load exceeds 30s `timeoutInterval` | `URLRequest` times out and surfaces through the error UI path |

## Dependencies

| Module | Usage |
|--------|-------|
| WebKit | `WKWebView`, `WKUserContentController`, navigation/UI/script-message delegates |
| pera_wallet_core (PeraWalletCore) | `Account`, `Asset`, `ALGAPI.Network`, session/shared-data, Bidali/Discover param models, `DeeplinkQR`/`DeeplinkSource` |
| MacaroonUIKit / MacaroonUtils | `BaseViewController`, theming (`LayoutSheet`/`StyleSheet`), `BaseView`, notification observation |
| Discover module | `DiscoverSocialMediaRouter`, `DiscoverErrorView`/`DiscoverErrorViewTheme`, discover screens (asset detail, dApp detail, generic) |
| Swap / BuySell flows | `SwapAssetFlowCoordinator`, `MeldFlowCoordinator`, `SendTransactionPreviewScreen` |
| Routing | `Screen`/`Router` (`open(_:by:)`), `launchController` deeplink dispatch, `rootViewController().launch(tab:)` |
| MagpieCore | `ConnectionError` / `UnexpectedError` mapping in the error view model |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
