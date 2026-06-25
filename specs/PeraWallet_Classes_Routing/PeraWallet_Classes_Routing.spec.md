---
module: PeraWallet_Classes_Routing
version: 1
status: active
files:
  - PeraWallet/Classes/Routing/DeepLink/AppEndpoint.swift
  - PeraWallet/Classes/Routing/DeepLink/DeepLinkParser.swift
  - PeraWallet/Classes/Routing/DeepLink/DeeplinkQR.swift
  - PeraWallet/Classes/Routing/DeepLink/DeeplinkSource.swift
  - PeraWallet/Classes/Routing/DeepLink/WalletConnectSessionRequestResponse.swift
  - PeraWallet/Classes/Routing/Router.swift
  - PeraWallet/Classes/Routing/Screen.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Routing

## Purpose

App-target navigation core (`PeraWallet/Classes/Routing`). This module owns
two responsibilities:

1. **Screen catalog + central router.** `Screen` is an `indirect enum` that
   enumerates every destination in the app (~180 cases: account onboarding and
   recovery, account/asset/collectible detail, send/swap/buy-sell flows, the
   full WalletConnect transaction-signing surface, rekey flows, settings,
   Algorand Secure Backup, Discover in-app browser, cards, staking, etc.).
   `Router` is a single `final class` that maps a `Screen` case to a concrete
   `UIViewController` via `buildViewController(for:)` and performs the actual
   UIKit transition via `route(to:from:by:then:)`. The transition style is
   described by `Screen.Transition.Open` (`root`, `push`, `present`,
   `presentWithoutNavigationController`, `launch`, `set`, and their custom
   variants) and `Screen.Transition.Close` (`pop`, `dismiss`). `Router` also
   provides the `findVisibleScreen(...)` family that walks the
   presented/navigation/tab hierarchy to locate the topmost visible controller
   to present from, and the `launch*` entry points (`launchAuthorization`,
   `launchOnboarding`, `launchMain`, `launch(deeplink:)`,
   `launchWithBottomWarning`) used by the app launch controller.

2. **Deep-link / QR / notification parsing.** The `DeepLink/` subfolder turns
   external inputs (push notifications, universal links, `perawallet://`
   custom-scheme deep links, app-endpoint URLs, and scanned QR codes) into
   either a `QRText` (`DeeplinkQR`, `AppEndpoint`) or a resolved
   `DeepLinkParser.Screen` (`DeepLinkParser`). `DeeplinkSource` models the
   inbound channel (`remoteNotification`, `walletConnectSessionRequest`,
   `qrText`, `externalDeepLink`, etc.); `AppEndpoint` decodes the newer
   `perawallet://app/<endpoint>?...` URL family (asset-transfer, asset-opt-in,
   keyreg, wallet-connect, buy/sell, swap, web-import, joint-account-import, …).

Ownership boundary: this module is the app target's navigation layer. It
depends on PeraWalletCore (`pera_wallet_core`) for models/services and on the
many feature view controllers it instantiates, but those feature screens do not
depend back on `Router`/`Screen` — they receive their dependencies through the
`Screen` case payloads (drafts, data controllers, event handlers, delegates).

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. Every navigable destination is a `Screen` case, and `Router` is the single
   place that instantiates the matching `UIViewController`. A screen is never
   presented without going through `buildViewController(for:)` /
   `route(to:from:by:)`; `buildViewController` returns `nil` for an
   unconstructible screen and `route` then performs no transition.
3. Transitions always target the topmost visible controller: `route` is given a
   source resolved through `findVisibleScreen(over:)`, which descends through
   presented controllers, the active `UINavigationController`, and the selected
   `TabbedContainer` tab to find the controller the user is actually looking at.
4. Deep-link/QR/notification parsing is pure resolution and never navigates:
   parsers return a `QRText`, a `DeepLinkParser.Screen`, or a
   `DeepLinkParser.Result` (`Swift.Result<Screen, Error>`). Navigation only
   happens later when the launch controller hands the resolved screen to
   `Router`. When shared data is not yet ready the parser returns
   `.failure(.waitingForAccountsToBeAvailable)` / `.waitingForAssetsToBeAvailable`
   rather than producing a partial/invalid screen.
5. Account-type safety is enforced at parse time: opt-in / action deep links for
   watch accounts or no-auth local accounts resolve to a typed `Error`
   (`tryingToOptInForWatchAccount`, `tryingToOptInForNoAuthInLocalAccount`)
   instead of a transaction screen.

## Behavioral Examples

### Scenario: Routing to the onboarding flow at launch
- **Given** the app has no authenticated session and the launch controller calls `router.launchOnboarding()`
- **When** `Router` resolves `findVisibleScreen(over: rootViewController)` and calls `route(to: .welcome(flow: .initializeAccount(mode: .none)), by: .customPresent(presentationStyle: .fullScreen, ...))`
- **Then** `buildViewController(for:)` constructs the welcome controller, it is wrapped in a `NavigationContainer`, presented full-screen, and on completion `rootViewController.terminateTabs()` runs

### Scenario: Opening an asset-transfer QR / app deep link
- **Given** a scanned QR or `perawallet://app/asset-transfer?receiverAddress=...&amount=...&assetId=...` URL
- **When** `DeeplinkQR.qrText()` detects an app-based deep link and `AppEndpoint.assetTransfer.parseQRText(from:)` runs
- **Then** it returns a `QRText` with mode `.algosRequest` when `assetId == 0` or `.assetRequest` otherwise (with amount/note/label), which the launch controller later resolves into a send/account-selection screen via `Router`

### Scenario: Asset opt-in notification for a watch account
- **Given** an `asset/opt-in` push notification whose target account is a watch account
- **When** `DeepLinkParser.discover(notification:)` parses it and inspects `account.authorization.isWatch`
- **Then** it returns `.failure(.tryingToOptInForWatchAccount)`, whose `uiRepresentation` supplies a localized error title/description and no transaction screen is opened

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `buildViewController(for:)` cannot construct the screen | `route(...)` returns `nil` and performs no transition |
| `route(by: .root / .set)` but source has no `navigationController` | Returns `nil`; no navigation occurs |
| Deep link / QR scheme not recognized (`DeeplinkQR.qrText()`) | Returns `nil`; input is ignored |
| App-endpoint URL with missing required query params (e.g. opt-in without `assetId`, keyreg/contact without `address`) | The `AppEndpoint` parser returns `nil` |
| Notification parse while `sharedDataController` not yet available | `.failure(.waitingForAccountsToBeAvailable)` / `.waitingForAssetsToBeAvailable` (caller retries) |
| Account in deep link not found in `accountCollection` | `.failure(.accountNotFound)` with localized UI representation |
| Referenced asset / transaction not found | `.failure(.assetNotFound)` / `.failure(.transactionNotFound)` |
| Opt-in / action deep link for watch or no-auth local account | `.failure(.tryingToOptInForWatchAccount)` / `.failure(.tryingToOptInForNoAuthInLocalAccount)` |
| Asset already has a pending opt-in/opt-out request | `.failure(.tryingToActForAssetWithPendingOptInRequest(accountName:))` / `...OptOutRequest(...)` |

## Dependencies

| Module | Usage |
|--------|-------|
| PeraWalletCore (`pera_wallet_core`) | `Account`, `Asset`, `CollectibleAsset`, `QRText`, `ALGAPI`, `SharedDataController`, `PeraConnect`, drafts and WalletConnect models used across `Screen`/parsers |
| MacaroonUIKit / MacaroonUtils | `BottomSheetTransition`, `@Atomic`-style mutation, UI helpers used by `Router` |
| Feature view-controller modules (app target) | Concrete screens that `buildViewController(for:)` instantiates (onboarding, send/swap/buy-sell, WalletConnect, settings, collectibles, Discover, cards, staking, Secure Backup, etc.) |
| `TransactionController` / `ChartAPIDataController` | Built lazily by `Router` for transaction signing and chart-backed asset detail |
| Flow coordinators (`ScanQRFlowCoordinator`, `MeldFlowCoordinator`, `SwapAssetFlowCoordinator`) | Multi-screen flows orchestrated from routed screens |
| App launch layer (`ALGAppLaunchController`, `AppDelegate`, `RootViewController`) | Consumers that own a `Router` + `DeepLinkParser` and drive `launch(deeplink:)` |
| WalletConnect (`PeraConnect`, v1/v2 session models) | Session-request/transaction-sign handling inside `Router` |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
