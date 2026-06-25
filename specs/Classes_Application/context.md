# Classes_Application — Context

## Overview

This module is the **root tab-bar container** for Pera Wallet. The single
covered source file, `TabBarController.swift`, defines a `final` subclass
of MacaroonUIKit's `TabBarContainer` that acts as the persistent
navigation shell hosting the app's primary sections. The authoritative
contract is `Classes_Application.spec.md`.

## Key files

- `Classes/Application/Core/Container/TabBar/TabBarController.swift` — the
  module's only covered file. Manages tab selection, re-tap-to-pop,
  conditional tab enablement (Discover/Swap), analytics, and programmatic
  deep-link entry points (`launchDiscover`, `launchSwap`).

### Related (outside this module, for orientation)
- `Classes/Application/Core/Root/RootViewController.swift` — instantiates
  `TabBarController(configuration:)` as `mainContainer`, builds the tab
  items, assigns `mainContainer.items`, and exposes `launch(tab:with:and:)`.
- `Classes/Demo/TabBarItems.swift` — defines the `TabBarItem` structs
  (`HomeTabBarItem`, `DiscoverTabBarItem`, `SwapTabBarItem`,
  `FundTabBarItem`, `MenuTabBarItem`, `StakeTabBarItem`,
  `CollectiblesTabBarItem`) and the `TabBarItemID` enum.
- `Classes/Routing/Screen.swift`, `Router.swift`, `DeepLinkParser.swift` —
  the routing layer that drives `route`/`launchSwap`/`launchDiscover`.

## Architecture

- **Pattern:** UIKit container view controller built on MacaroonUIKit's
  `TabBarContainer`. Not MVVM — it is a thin coordinating shell. There is
  no view model; state is the selected index plus reactive enablement.
- **Selection model:** `selectedTab: TabBarItemID?` is a computed bridge
  over the base class's `selectedIndex`, resolving identity by matching
  `TabBarItem.id` to `TabBarItemID.rawValue`.
- **Reactivity:** uses notification observation (`observe(notification:)`)
  for network changes (`NodeSettingsViewController.didUpdateNetwork`) and
  account changes (`.userAccountsChanged`) to re-evaluate Discover/Swap
  tab enablement.
- **Dependency injection:** `analytics`, `api`, and `session` are pulled
  from the injected `AppConfiguration`. Note the in-source `<todo>`: the
  controller retains these because the routing approach has not yet been
  refactored away from controller-held state.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
