---
module: PeraWallet_Classes_Stake
version: 1
status: active
files:
  - PeraWallet/Classes/Stake/StakeFlowCoordinator.swift
  - PeraWallet/Classes/Stake/StakeInAppBrowserScreen.swift
  - PeraWallet/Classes/Stake/StakeURLGenerator.swift
  - PeraWallet/Classes/Stake/StakingScreen.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Stake

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Stake`) that surfaces Pera Wallet's **Staking** experience. The feature is a thin native shell around a remotely hosted web application: rather than rendering staking UI natively, the module loads Pera's staking web app inside an in-app `WKWebView` and bridges JavaScript messages to native capabilities.

Key pieces:
- `StakingScreen` — the tab/pushable staking screen. Subclasses `StakingInAppBrowserScreen`, always opens with `destination = .list`, and wires the web view's scroll/navigation delegates (bounce disabled, pull-to-refresh disabled).
- `StakingInAppBrowserScreen` — the base in-app browser specialization. Builds the staking URL, injects user scripts (`.navigation`, `.peraConnect`), sets a Pera-specific user agent (`pera_ios_<version>`), keeps the web app's theme in sync with the device interface style via an injected `updateTheme('light'|'dark')` JS call, and handles inbound `StakingInAppBrowserScreenMessage` cases.
- `StakingURLGenerator` — builds the remote URL from `AppEnvironment.current.stakingBaseUrl` plus query items for theme, platform (`ios`), preferred currency, language, and region.
- `StakingFlowCoordinator` — convenience entry point that presents the staking screen full-screen without a navigation controller from a presenting view controller.

Ownership boundary: this module owns only the staking shell. The actual JS-message handling logic (`handleStaking`) lives in `PeraWallet/Classes/InAppBrowser/InAppBrowserHelpers.swift`, and screen instantiation/routing (`.staking`, deep-link `stakingPath`) is owned by `PeraWallet/Classes/Routing`. Entry points are `HomeViewController`, `MenuViewController`, asset-detail screens, and `staking` deep links.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary. All types are `final`/`internal` and consumed only within the app target.
2. `StakingScreen` always loads with `destination = .list`; the remote URL is always derived from `AppEnvironment.current.stakingBaseUrl` (no hard-coded host) via `StakingURLGenerator`.
3. The web view's theme always tracks the device interface style: the screen reloads/re-evaluates `updateTheme(...)` on `viewWillAppear`, `preferredUserInterfaceStyleDidChange`, and `applicationDidBecomeActive`, so the web app never renders in a stale light/dark mode.
4. Only the message names enumerated in `StakingInAppBrowserScreenMessage` (`openSystemBrowser`, `closeWebView`, `peraconnect`, `getDeviceId`, `openDappWebview`) are handled; any other JS message name is ignored.
5. `closeWebView` resolves contextually: if the screen can be dismissed it is dismissed, else if it can go back it is popped — so the staking shell never strands the user on an empty screen.

## Behavioral Examples

### Scenario: Opening the staking screen from Home/Menu
- **Given** a signed-in user with an active `Session`
- **When** they tap Staking (Home list, Menu, or an asset detail, routed via `open(.staking, ...)`)
- **Then** `StakingScreen` is presented and loads `stakingBaseUrl` with query items `theme`, `platform=ios`, `currency` (preferred currency), `language`, and `region`, injecting the `.navigation` and `.peraConnect` user scripts.

### Scenario: Switching the device to dark mode while staking is open
- **Given** the staking web app is loaded in light mode
- **When** the user switches the device interface style to dark (or backgrounds and re-foregrounds the app)
- **Then** the screen evaluates `updateTheme('dark')` against the web view so the web content matches the new appearance.

### Scenario: Web app requests a PeraConnect / WalletConnect session
- **Given** the staking web app posts a `peraconnect` message
- **When** `StakingInAppBrowserScreen` receives it
- **Then** it forwards to `handlePeraConnectAction`, initiating the native WalletConnect pairing flow; a `closeWebView` message instead dismisses or pops the screen depending on the navigation context.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `stakingBaseUrl` produces an invalid/un-parseable URL (`URLComponents.url` is `nil`) | `StakingURLGenerator.generateURL` returns `nil`; `load(url:)` is called with `nil` and the web view shows no content (handled by the in-app browser base). |
| `Session` is `nil` (no active session) | URL is still generated; `currency` query items resolve to `nil` and are omitted/empty. Staking page loads without currency context. |
| Inbound JS message name not in `StakingInAppBrowserScreenMessage` | Message is ignored (the `StakingInAppBrowserScreenMessage(rawValue:)` guard fails), no native action taken. |
| `closeWebView` received when screen cannot be dismissed and cannot go back | No-op (neither `dismissScreen()` nor `popScreen()` is invoked). |
| Web content fails to load (network/web errors) | Handled by the shared `InAppBrowserScreen` base behavior; pull-to-refresh is disabled here so recovery is via re-entry. |

## Dependencies

| Module | Usage |
|--------|-------|
| `pera_wallet_core` (PeraWalletCore) | `Session` (preferred currency), `AppEnvironment.current.stakingBaseUrl`, theme `peraRawValue`/`localValue` helpers, shared environment config. |
| `PeraWallet/Classes/InAppBrowser` (`InAppBrowserScreen`, `InAppBrowserScript`, `InAppBrowserScriptMessage`, `InAppBrowserHelpers`) | Base web-view browser, user-script injection (`.navigation`, `.peraConnect`), and the `handleStaking` message dispatcher. |
| `PeraWallet/Classes/Routing` (`Router`, `Screen.staking`, `DeepLinkParser`, `AppEndpoint.stakingPath`) | Instantiates `StakingScreen`, routes `open(.staking, ...)`, and resolves `staking`/`stakingPath` deep links. |
| WebKit (`WKWebView`, `WKScriptMessage`, `WKUserContentController`) | Hosting the remote staking web app and the JS↔native message bridge. |
| MacaroonUIKit / MacaroonUtils | UI primitives and the `DiscoverHomeScreenTheme` reused by `StakingScreen`. |
| WalletConnect / PeraConnect (via `handlePeraConnectAction`) | Pairing initiated when the web app posts a `peraconnect` message. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
| Documented staking web-shell purpose, invariants, flows, errors, deps | 2026-06-24 | 1 |
