# PeraWallet_Classes_Routing — Context

## Overview

Architectural context for the `PeraWallet_Classes_Routing` module — the app
target's navigation core. The authoritative contract is
`PeraWallet_Classes_Routing.spec.md`; the source files it covers are listed in
that spec's `files:` frontmatter.

## Key files

- `Router.swift` (~4k lines) — the central `final class Router`. Holds an
  `unowned RootViewController` and `AppConfiguration`, lazily builds
  `TransactionController` / `ChartAPIDataController` / `ScanQRFlowCoordinator`,
  and exposes:
  - `route(to:from:by:then:)` — generic transition executor over
    `Screen.Transition.Open`.
  - `buildViewController(for:)` — the big `Screen -> UIViewController` factory.
  - `findVisibleScreen(...)` — topmost-visible-controller resolution across
    presented / navigation / `TabbedContainer` hierarchies.
  - `launchAuthorization` / `launchOnboarding` / `launchMain` /
    `launch(deeplink:)` / `launchWithBottomWarning` — app entry points.
  - Conforms to several delegates (`TransactionControllerDelegate`,
    `SelectAccountViewControllerDelegate`, `PeraConnectObserver`,
    `NotificationObserver`) and contains the WalletConnect v1/v2 session and
    transaction-signing handling.
- `Screen.swift` — `indirect enum Screen` (~180 cases) plus
  `Screen.Transition.Open` / `.Close` and the `Screen.EventHandler<Event>`
  typealias. Each case carries the dependencies (drafts, data controllers,
  delegates, event handlers) the target screen needs.
- `DeepLink/DeepLinkParser.swift` — `final class DeepLinkParser` (api +
  `SharedDataController` + `PeraConnect`). `discover(...)` overloads turn
  notifications / QR text / WalletConnect requests into a
  `Result = Swift.Result<DeepLinkParser.Screen, Error>`. Defines the nested
  `Screen`, `Error`, and `NotificationAction` enums.
- `DeepLink/AppEndpoint.swift` — `enum AppEndpoint` for the
  `perawallet://app/<endpoint>?...` URL family and `AppDeeplinkParser`
  (detection + endpoint extraction). Each case parses query params into a
  `QRText`.
- `DeepLink/DeeplinkQR.swift` — `struct DeeplinkQR` wrapping a `URL`; decides
  app-endpoint vs. custom-scheme deep link vs. universal link and produces a
  `QRText` (or a WalletConnect `URL`).
- `DeepLink/DeeplinkSource.swift` — `enum DeeplinkSource` (inbound channel),
  `ExternalDeepLink`, and the WalletConnect sign-request draft structs.
- `DeepLink/WalletConnectSessionRequestResponse.swift` — small value type for a
  WC session-request response.

## Architectural decisions

- **Centralized, enum-driven routing (not coordinators-per-screen).** All
  destinations are `Screen` cases; one `Router` builds and presents them. This
  keeps navigation logic in one place at the cost of a very large `switch` in
  `buildViewController(for:)`.
- **Parse/navigate separation.** The `DeepLink/` types only resolve external
  input into `QRText` / `DeepLinkParser.Screen` / `Result`. Actual navigation is
  performed later by the app launch controller through `Router`.
- **Dependencies travel in the `Screen` payload.** Target screens get their data
  controllers, drafts, delegates, and event handlers from the enum case rather
  than reaching back into `Router`, keeping the dependency direction one-way.
- **MVVM-ish targets.** Routed screens are typically view controllers backed by
  view models / data controllers; `Router` itself is closer to a navigator than
  a coordinator.

## Consumers

`Router` and `DeepLinkParser` are owned/driven by the app launch layer:
`ALGAppLaunchController` (holds the `DeepLinkParser`, buffers a
`pendingDeeplinkSource`), `AppDelegate`, and `RootViewController`. Feature
screens such as `InAppBrowserScreen` and `NotificationsViewController` also route
through it.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
