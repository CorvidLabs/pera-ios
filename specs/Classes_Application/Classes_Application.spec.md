---
module: Classes_Application
version: 1
status: active
files:
  - Classes/Application/Core/Container/TabBar/TabBarController.swift
db_tables: []
depends_on: []
---

# Classes_Application

## Purpose

App-target UI module that implements the root tab-bar container for Pera
Wallet (`Classes/Application/Core/Container/TabBar/TabBarController.swift`).
`TabBarController` is a `final` subclass of Macaroon's `TabBarContainer`
and is the persistent shell that hosts the app's primary navigation
sections — Home, Discover, Swap, Fund, and Menu (with Stake and
Collectibles tabs also modeled in `TabBarItemID`). Each tab wraps its
root screen in a `NavigationContainer`.

It owns:
- **Tab selection state** via `selectedTab` (a `TabBarItemID`) mapped to
  the underlying `selectedIndex`.
- **Re-tap-to-pop** behavior: tapping the already-selected tab pops its
  navigation stack to root.
- **Conditional tab enablement**: the Discover tab is enabled based on
  network/build target, and the Swap tab is disabled when the user has no
  accounts.
- **Analytics tracking** of tab selection.
- **Programmatic deep-link entry points** into the Discover and Swap tabs
  (`launchDiscover(with:)`, `launchSwap(with:)`).

Ownership boundary: this module is the tab-bar shell only. The
controller is instantiated and its `items` are configured by
`RootViewController` (outside this module); the individual tab screens
(`HomeViewController`, `DiscoverHomeScreen`, `SwapViewController`,
`MenuViewController`, `FundInAppBrowserScreen`) and the `TabBarItem`
structs live in other modules. This module does not build the tab items
or own their screens — it coordinates selection, enablement, and routing
across them.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. `selectedTab` is the single source of truth for the active section; its
   getter/setter is a bijection with `selectedIndex` resolved by matching
   `TabBarItem.id` against `TabBarItemID.rawValue`. Setting an unknown tab
   resolves to `nil` and leaves selection unchanged.
3. Tapping the currently selected tab pops that tab's navigation stack to
   its root only when its `selectedScreen` is a `UINavigationController`
   with more than one view controller; otherwise selection is a no-op
   re-select.
4. The Discover tab is enabled iff the build is non-production OR the API
   is not on TestNet (`!ALGAppTarget.current.isProduction || !api.isTestNet`).
   The Swap tab is enabled iff the authenticated user has at least one
   account. Enablement is recomputed reactively on `didUpdateNetwork` and
   `.userAccountsChanged` notifications.
5. On `viewWillAppear`, the parent navigation bar is hidden and
   `session.isValid` is set to `true` (the tab bar is only shown for a
   valid, unlocked session).
6. `setTabBarItemEnabled` is idempotent — it returns early when the target
   bar button is already in the requested enabled state.

## Behavioral Examples

### Scenario: Re-tapping the active tab pops to root
- **Given** the Home tab is selected and its navigation stack has pushed
  detail screens (`viewControllers.count > 1`)
- **When** the user taps the Home tab again (`itemDidSelect` fires with the
  already-selected index)
- **Then** the controller calls `popToRootViewController(animated: true)`
  on the tab's navigation controller instead of changing selection.

### Scenario: Swap tab disabled when no accounts exist
- **Given** the authenticated user has zero accounts
- **When** a `.userAccountsChanged` notification is observed
- **Then** `setNeedsSwapTabBarItemUpdateIfNeeded()` computes `isSwapEnabled`
  as `false` and disables the Swap tab's bar button.

### Scenario: Deep-link launch into the Swap tab with a draft
- **Given** an external deep link requests a swap with a `SwapAssetFlowDraft`
- **When** `launchSwap(with: draft)` is called
- **Then** `selectedTab` switches to `.swap`, and if the tab's root screen
  is a `SwapViewController`, its `launchDraft` is set to the provided draft;
  if the draft is `nil` or the root screen is not a `SwapViewController`,
  selection still switches but no draft is applied.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `selectedTab` set to a `TabBarItemID` with no matching item in `items` | `items.index(of:)` returns `nil`; `selectedIndex` is set from a `nil` unwrap, leaving selection unchanged (no crash). |
| Re-tap on a tab whose `selectedScreen` is not a `UINavigationController` (or stack depth ≤ 1) | Guard falls through to a plain `selectedIndex = index` re-select; no pop occurs. |
| `launchSwap(with:)` called but the tab's root screen is not a `SwapViewController`, or `draft == nil` | Tab is selected via `selectedTab = .swap`; the method returns early without applying `launchDraft`. |
| `launchDiscover(with:)` when the Discover root is not a `DiscoverHomeScreen` | Optional chaining yields `nil`; tab is selected but `destination` is not assigned (silent no-op). |
| Discover tab disabled (production build on TestNet) | `setNeedsDiscoverTabBarItemUpdateIfNeeded()` disables the Discover bar button; tapping has no effect. |
| `setTabBarItemEnabled` for an item ID not present in `items` | Early return; no state change. |

## Dependencies

| Module | Usage |
|--------|-------|
| MacaroonUIKit | Provides `TabBarContainer` (base class), `TabBarItem`, `TabBarButtonItem`, appearance customization (`customizeAppearance`), and `customizeViewAppearance`. |
| `AppConfiguration` | Injected at init; supplies `analytics` (`ALGAnalytics`), `api` (`ALGAPI`), and `session` (`Session`). |
| `ALGAnalytics` | Tracks `.tabBarPressed(type:)` events on tab selection change. |
| `ALGAPI` | `api.isTestNet` gates Discover tab enablement. |
| `Session` | `session.authenticatedUser?.accounts` gates Swap tab enablement; `session.isValid` set on appear. |
| `ALGAppTarget` | `ALGAppTarget.current.isProduction` distinguishes store vs. staging behavior for the Discover tab. |
| `Colors` (design system) | `Colors.Defaults.background` for tab bar and view background. |
| `TabBarItemID` | Enum (`Classes/Demo/TabBarItems.swift`) mapping tab identities to raw IDs. |
| `Screen` (routing) | `route: Screen?` property used by the app's routing layer. |
| Tab screens (other modules) | `DiscoverHomeScreen`, `SwapViewController` (+ `SwapAssetFlowDraft`), `DiscoverDestination` reached via `launchDiscover`/`launchSwap`. |
| `NodeSettingsViewController` | Source of the `didUpdateNetwork` notification observed for Discover re-evaluation. |
| Notifications | `.userAccountsChanged` (Swap re-evaluation), `didUpdateNetwork` (Discover re-evaluation). |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
