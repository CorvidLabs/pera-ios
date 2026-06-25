# PeraWallet_Classes_Application — Context

## Overview

This is the app's bootstrap/foundation layer and UI shell — the composition root, application lifecycle owner, window/root view controller, tab-bar container, base view-controller classes, and the WalletConnect request gateway. The authoritative contract is `PeraWallet_Classes_Application.spec.md`; covered source files are listed in its `files:` frontmatter.

## Key files

- `AppConfigurator.swift` — async logging setup (`TerminalLogger` + `FileLogger` into `PeraLogger.shared`).
- `AppDelegate.swift` — `@UIApplicationMain`; lifecycle, DI composition root (lazy `create…()` factories), `AppConfiguration` / `CoreAppConfiguration.shared` assembly, migrations, third-party lib setup, deeplink/QR/push/quick-action routing into `AppLaunchController`, testnet banner + privacy blur.
- `Core/Root/RootViewController.swift` — window root; hosts `TabBarController`, builds the 5 tabs, status-bar styling, `deleteAllData` reset.
- `Core/Root/RootViewController+WalletConnect.swift` — WC v1/v2 request validation + forwarding/rejection + post-sign success sheets.
- `Core/Base/BaseViewController.swift` — base class for all screens: lifecycle hooks, nav/status/tab-bar config, analytics screen tracking, shared-service accessors off `ViewControllerConfiguration`.
- `Core/Base/BaseScrollViewController.swift` / `ScrollScreen.swift` — scroll + footer-effect scaffolding.
- `Core/Container/TabBar/TabBarController.swift` — tab selection, analytics, pop-to-root on re-tap, Discover gating, Swap/Fund/Discover deeplink launchers.
- `Core/Container/Navigation/NavigationController.swift` — `NavigationContainer` app-wide nav-bar appearance.

## Architecture

- **Pattern:** Composition-root + container hierarchy. `AppDelegate` is the single DI root; all shared services are created lazily there and published via `CoreAppConfiguration.shared`. Screens are MVVM-ish (view controllers + API data controllers) and read services through `BaseViewController`'s `configuration` (`ViewControllerConfiguration`).
- **Container hierarchy:** `UIWindow` → `RootViewController` → `TabBarController` (`TabBarContainer`) → per-tab `NavigationContainer` → feature screens.
- **Launch flow:** `AppDelegate` delegates state transitions to `AppLaunchController` (PeraWalletCore), which calls back into `AppDelegate` (`AppLaunchUIHandler`) to drive onboarding/authorization/main UI and deeplinks.
- **WalletConnect:** `RootViewController` is the `PeraConnectObserver` and v1/v2 request-handler delegate; it validates then forwards requests as deeplinks rather than presenting screens directly.

## Architectural decisions / notes

- Migrations and Core Data init are non-recoverable by design (`fatalError`) because no user-facing error page exists — see TODOs in `runMigrations`/`createAppConfiguration`.
- WC URIs opened from background are delayed ~1s (HACK in `application(_:open:)`) to work around the sign sheet not appearing.
- `TabBarController` retains analytics/api and hosts deeplink launchers — flagged in-source as not-yet-refactored routing.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
