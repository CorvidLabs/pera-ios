# PeraWallet_Classes_Stake — Context

## Overview

The `PeraWallet_Classes_Stake` module is the native shell for Pera Wallet's **Staking** feature. There is almost no native staking UI: the screen embeds a `WKWebView` that loads a remotely hosted staking web app and bridges JavaScript messages to native capabilities (PeraConnect, system browser, device ID, dapp webview, close). The authoritative contract is `PeraWallet_Classes_Stake.spec.md`.

## Key files

- `PeraWallet/Classes/Stake/StakingScreen.swift` — `final` tab/pushable screen; subclasses `StakingInAppBrowserScreen` with `destination = .list`, configures web-view scroll/navigation delegates, disables bounce.
- `PeraWallet/Classes/Stake/StakeInAppBrowserScreen.swift` — `StakingInAppBrowserScreen` base; user agent (`pera_ios_<version>`), injected scripts (`.navigation`, `.peraConnect`), theme sync via `updateTheme(...)`, and `StakingInAppBrowserScreenMessage` handling. Defines the message enum.
- `PeraWallet/Classes/Stake/StakeURLGenerator.swift` — `StakingURLGenerator` builds the URL from `AppEnvironment.current.stakingBaseUrl` + query items; defines `StakingDestination` (`.list`).
- `PeraWallet/Classes/Stake/StakeFlowCoordinator.swift` — `StakingFlowCoordinator.launch()` presents the screen full-screen without a nav controller.

## Related (owned by other modules)

- `PeraWallet/Classes/InAppBrowser/InAppBrowserHelpers.swift` — `handleStaking(_:_:)` dispatches the JS messages.
- `PeraWallet/Classes/Routing/Router.swift` — `Screen.staking` → `StakingScreen(...)`; deep link `.staking` presents it.
- `PeraWallet/Classes/Routing/DeepLink/{DeepLinkParser,AppEndpoint,DeeplinkSource}.swift` — `stakingPath` / `staking(path:)` deep-link resolution.
- Entry points: `HomeViewController` (holds a `StakingFlowCoordinator`), `MenuViewController`, `ASADetailViewController`/`ASADetailScreen`.

## Architectural decisions

- **Web-first feature.** Staking UI lives server-side; the native layer is a themed, message-bridged browser shell. This mirrors the Discover/Cards in-app-browser pattern (shares the `InAppBrowserScreen` base and reuses `DiscoverHomeScreenTheme`).
- **No native model/state.** The module holds no staking domain models; all state lives in the web app. Native only supplies session-derived context (currency, theme, locale) via URL query params and responds to JS messages.
- **Theme parity is push-based.** The native side proactively pushes theme changes into the web view rather than the web app polling.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI. Feature is shipping (referenced from Home, Menu, asset detail, and deep links).
