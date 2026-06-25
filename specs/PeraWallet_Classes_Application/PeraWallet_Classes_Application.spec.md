---
module: PeraWallet_Classes_Application
version: 1
status: active
files:
  - PeraWallet/Classes/Application/AppConfigurator.swift
  - PeraWallet/Classes/Application/AppDelegate.swift
  - PeraWallet/Classes/Application/Core/Base/BaseScrollViewController.swift
  - PeraWallet/Classes/Application/Core/Base/BaseViewController.swift
  - PeraWallet/Classes/Application/Core/Base/ScrollScreen.swift
  - PeraWallet/Classes/Application/Core/Container/Navigation/NavigationController.swift
  - PeraWallet/Classes/Application/Core/Container/TabBar/TabBarController.swift
  - PeraWallet/Classes/Application/Core/Root/RootViewController.swift
  - PeraWallet/Classes/Application/Core/Root/RootViewController+WalletConnect.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Application

## Purpose

App-target foundation/bootstrap layer (`PeraWallet/Classes/Application`). This is the composition root and UI shell of the Pera Wallet iOS app — it owns the application lifecycle, the dependency graph, the window/root view controller, the tab-bar container, the base view-controller classes every screen inherits from, and the WalletConnect (v1 + v2) request gateway.

Responsibilities by file:

- **`AppDelegate`** — `@UIApplicationMain` entry point. On `didFinishLaunching` it configures logging (`AppConfigurator`), sets up the app target, third-party libs (Firebase/Remote Config, SwiftDate, Kingfisher with a Pera user-agent), runs data migrations, builds the `UIWindow` with `RootViewController` as its root, and hands off to `AppLaunchController`. It is the composition root: every shared service (`ALGAPI`, `Session`, `SharedDataController`, `WalletConnectCoordinator`, `PeraConnect`, analytics, banner/loading/toast controllers, feature flags, HD wallet service/storage) is lazily created here and bundled into the `AppConfiguration` that is published as `CoreAppConfiguration.shared`. It also dispatches inbound deeplinks/universal-links/QR/push notifications/quick-actions to `AppLaunchController`, and renders the testnet network banner + privacy blur overlay on backgrounding.
- **`AppConfigurator`** — async logging bootstrap; wires `TerminalLogger` + `FileLogger` into `PeraLogger.shared` and truncates old logs.
- **`RootViewController`** — the window root. Hosts the `TabBarController` (`mainContainer`), lazily builds the five tabs (Home, Discover, Swap, Fund, Menu) on `launchTabsIfNeeded()`, owns push-notification registration, drives status-bar styling (testnet vs mainnet), tracks in-app-browser visibility, and implements `deleteAllData` (full account/session/WalletConnect reset).
- **`RootViewController+WalletConnect`** — the WalletConnect request gateway. Validates incoming WC v1 and v2 sign requests (session lookup, namespace/method/chain authorization, duplicate-request guard), forwards valid ones as deeplinks to `AppLaunchController`, rejects invalid ones via `PeraConnect`, and presents the post-sign success bottom sheets.
- **`Core/Base/*`** — `BaseViewController` (lifecycle hooks, navigation-bar/status-bar/tab-bar config, analytics screen tracking, accessors for shared services off `ViewControllerConfiguration`), `BaseScrollViewController` (scroll + footer-effect scaffolding), `ScrollScreen`.
- **`Core/Container/*`** — `TabBarController` (tab selection, analytics on tab taps, pop-to-root on re-tap, Discover-tab gating by network/build, deeplink launchers for Swap/Fund/Discover) and `NavigationContainer` (app-wide navigation-bar appearance: DM Sans fonts, back icon, colors).

Ownership boundary: this module owns app startup, the DI graph, and the UI container shell. Individual feature screens (Home, Discover, Swap, Send, Settings, etc.) live in their own modules and are merely instantiated/hosted here.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. **Single composition root.** All shared services are created once in `AppDelegate` and exposed app-wide through the `AppConfiguration` published as `CoreAppConfiguration.shared`; screens never construct these services themselves, they read them off `ViewControllerConfiguration` via `BaseViewController` accessors.
2. **`RootViewController` is the sole window root** and the only owner of the `TabBarController`. Tabs are built lazily exactly once (`launchTabsIfNeeded()` returns early when `areTabsVisible`) and torn down only via `terminateTabs()`.
3. **Every WalletConnect sign request is either forwarded or rejected, never dropped.** A request that fails any validation gate (unknown session, unsupported/unauthorized namespace/method/chain, or an already-displayed duplicate for the same topic) is rejected through `PeraConnect`; only fully validated requests are forwarded as deeplinks to `AppLaunchController`.
4. **At most one in-flight WC request per topic.** `sessionsForOngoingWCRequests[topic]` is set when a request is forwarded and cleared on sign/reject; a second request for the same topic while one is ongoing is rejected with `.alreadyDisplayed`.
5. **Network identity is reflected in chrome.** Status-bar style and the top network banner are driven by `api.network`; the testnet banner/background appears only on testnet, mainnet shows none.
6. **Migrations and core DB init must succeed at launch.** App-group data-store migration and `NSPersistentContainer` creation are treated as non-recoverable — failure triggers `fatalError`/`assertionFailure` rather than continuing in a corrupt state.

## Behavioral Examples

### Scenario: Cold launch into the tab bar
- **Given** an authenticated user opens the app
- **When** `AppDelegate.didFinishLaunching` runs and `AppLaunchController` resolves to the main UI state
- **Then** the window's `RootViewController` calls `launchTabsIfNeeded()`, building the Home/Discover/Swap/Fund/Menu tabs (Discover gated off on production testnet) and selecting Home.

### Scenario: Incoming WalletConnect v2 transaction sign request
- **Given** an active WC v2 session exists for the request topic
- **When** `peraConnect(_:didPublish: .transactionRequestV2)` fires and `canSignWCV2Request` passes namespace/method/chain checks with no duplicate in flight
- **Then** the topic is marked ongoing and a `.walletConnectTransactionSignRequest` deeplink is sent to `AppLaunchController` to present the sign screen; after signing, the success bottom sheet is presented (unless the in-app browser is active) and the topic is cleared.

### Scenario: Deeplink / QR / universal link entry
- **Given** the app receives a URL via `application(_:open:)` or `continue userActivity`
- **When** the URL parses as a MoonPay redirect, browser/in-app-browser link, WalletConnect URI, external deeplink, or QR text
- **Then** the matching `DeeplinkSource` is constructed and forwarded to `AppLaunchController.receive(deeplinkWithSource:)` (WC URIs are deferred ~1s when launched from background to work around the sign-sheet-not-appearing issue).

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Logging bootstrap fails (no logs dir / logger creation / config update) | `AppConfigurator.configure()` throws `ConfigError`; caught in `AppDelegate` as an `assertionFailure`, launch continues |
| App-group data migration fails | Logged + analytics `MigrationFailureLog`, then `fatalError` (no user-facing recovery page exists) |
| Core Data persistent container creation fails | `assertionFailure` during `AppConfiguration` setup |
| WC request references an unknown/missing session | Rejected via `PeraConnect` with `.invalidInput(.session)` (v1) / `.noSessionForTopic` (v2) |
| WC v2 request on unsupported namespace / unauthorized method / unauthorized or unsupported chain | Rejected with `.unsupportedNamespace` / `.unauthorizedMethod` / `.unauthorizedChain` / `.unsupportedChains` |
| WC request arrives while one is already displayed for that topic | Rejected with `.rejected(.alreadyDisplayed)` |
| WC transaction/arbitrary-data payload fails to parse | `didInvalidate…Request` rejects with `.invalidInput(.transactionParse / .dataParse)` |
| `saveContext` fails on terminate | `fatalError` with the unresolved Core Data error |
| Quick-action / shortcut item unknown | Ignored (guard returns) |

## Dependencies

| Module | Usage |
|--------|-------|
| `pera_wallet_core` (PeraWalletCore) | `AppConfiguration`/`CoreAppConfiguration`, `ALGAPI`, `Session`, `SharedDataController`, `AppLaunchController`, `PeraConnect`/WalletConnect coordinator + protocols, `PeraLogger`/`FileLogger`/`TerminalLogger`, `PeraCoreManager`, feature flags, HD wallet service/storage, deeplink/QR types |
| MacaroonUIKit / MacaroonUtils / MacaroonBottomSheet / MacaroonStorySheet | Base UI scaffolding: `TabBarContainer`, `NavigationContainer`, appearance customization, notification observing, bottom-sheet transitions |
| Firebase (Core / Crashlytics / RemoteConfig) | Crash reporting, analytics, remote-config-backed feature flags |
| Kingfisher | Remote image downloading (custom downloader with Pera user-agent) + media cache cleanup |
| SwiftDate | Default region/locale configuration |
| Feature screen modules (Home, Discover, Swap, Fund, Menu, WC sign screens, etc.) | Instantiated and hosted by `RootViewController`/`TabBarController`; not owned here |
| UIKit / CoreData / UserNotifications | App lifecycle, persistence, push notifications |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
