# Classes_Application — Design

## Layout & components

The tab bar is the app's persistent bottom navigation shell. Configured
(in `RootViewController`) with five visible tabs, in order:

1. **Home** (`HomeTabBarItem`) — wraps `HomeViewController`.
2. **Discover** (`DiscoverTabBarItem`) — wraps `DiscoverHomeScreen`.
3. **Swap** (`SwapTabBarItem`) — wraps `SwapViewController`.
4. **Fund** (`FundTabBarItem`) — wraps `FundInAppBrowserScreen`.
5. **Menu** (`MenuTabBarItem`) — wraps `MenuViewController`.

`TabBarItemID` also models **Stake** and **Collectibles** tabs (with
analytics + item structs defined) that are not part of the default five.

Each tab's screen is embedded in a `NavigationContainer` so it owns an
independent navigation stack. Re-tapping the active tab pops its stack to
root.

## Navigation hierarchy

```
RootViewController
└─ TabBarController (mainContainer)
   ├─ NavigationContainer → HomeViewController
   ├─ NavigationContainer → DiscoverHomeScreen
   ├─ NavigationContainer → SwapViewController
   ├─ NavigationContainer → FundInAppBrowserScreen
   └─ NavigationContainer → MenuViewController
```

The parent navigation bar is hidden while the tab bar is visible
(`viewWillAppear` sets `navigationBarHidden = true`).

## Conditional presentation

- **Discover** bar button is disabled on production builds connected to
  TestNet; always enabled on staging.
- **Swap** bar button is disabled when the user has no accounts.
- `setTabBarItemEnabled` toggles a `tabBar.barButtons[index].isEnabled`
  flag (idempotent).

## Design tokens

- **Background:** `Colors.Defaults.background` — applied to both the tab
  bar (`addTabBar`) and the container view (`viewDidLoad`).
- **Tab icons** (from `TabBarItems.swift`): per-state asset triplets
  (`.normal` / `.selected` / `.disabled`), e.g.
  `tabbar-icon-accounts`, `tabbar-icon-discover`, `tabbar-icon-swap`,
  `tabbar-icon-collectibles`, `tabbar-icon-stake`, `tabbar-icon-menu`.
- **Fund icon:** rendered from `tabbar-icon-fund` and tinted per state
  with `Colors.TabBar.iconActive`, `Colors.Text.main`, and
  `Colors.TabBar.iconDisabled`.
- **Titles:** localized strings (`title-home`, `title-discover`,
  `title-swap`, `title-fund`, `title-menu`, `title-staking`,
  `title-collectibles`).

## Assets

- Asset catalog `tabbar-icon-*` image sets (normal/selected/disabled
  variants) referenced by the `TabBarItem` structs.
