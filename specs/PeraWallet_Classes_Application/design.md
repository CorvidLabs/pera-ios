# PeraWallet_Classes_Application — Design

## Layout & components

This module is the UI shell, not a single screen. It defines the container hierarchy that all feature screens render inside.

- **Window root** — `RootViewController` fills the window; background `Colors.Defaults.background`.
- **Tab bar** — `TabBarController` (`TabBarContainer`) with five items, built lazily:
  - Home (`HomeTabBarItem`) → `HomeViewController`
  - Discover (`DiscoverTabBarItem`) → `DiscoverHomeScreen` (gated by network/build)
  - Swap (`SwapTabBarItem`) → `SwapViewController`
  - Fund (`FundTabBarItem`) → `FundInAppBrowserScreen`
  - Menu (`MenuTabBarItem`) → `MenuViewController`
  - Tab bar background: `Colors.Defaults.background`.
- **Per-tab navigation** — each tab wraps its root in a `NavigationContainer`.
- **Overlays (window-level)** — testnet network banner (`networkBannerView`, `Colors.Testnet.background`, sized to the status-bar height) and a privacy blur (`VisualEffectViewWithCustomIntensity`, light blur intensity 0.25) shown on background.
- **Base screen classes** — `BaseViewController` (nav/status/tab-bar config + lifecycle hooks) and `BaseScrollViewController` (scroll view + footer with a conditional background `Effect` that hides when content reaches the footer).

## Navigation hierarchy

```
UIWindow
└─ RootViewController
   └─ TabBarController
      ├─ NavigationContainer → HomeViewController
      ├─ NavigationContainer → DiscoverHomeScreen
      ├─ NavigationContainer → SwapViewController
      ├─ NavigationContainer → FundInAppBrowserScreen
      └─ NavigationContainer → MenuViewController
```

Re-tapping the selected tab pops its `NavigationContainer` to root. WalletConnect sign screens and bottom-warning/success sheets are presented modally over the visible screen via `BottomSheetTransition`.

## Design tokens

Defined in `NavigationContainer.customizeNavigationBar…Appearance` and the controllers:

- **Typography:** `Fonts.DMSans.medium` — title `15pt`, large title `32pt`.
- **Colors:** `Colors.Text.main` (title/tint), `Colors.Defaults.background` (nav bar, tab bar, view), `Colors.Testnet.background` (testnet banner).
- **Nav bar:** back image `icon-back`, no shadow image/color, large-title margins 24pt left/right; default/highlighted/transparent variants switchable via `switchTo…NavigationBarAppearance()`.
- **Status bar:** style derived from `api.network` (`determinePreferredStatusBarStyle`).

## Assets

- `icon-back` — navigation back button.
- `icon-approval-check` — WC arbitrary-data sign success warning image.
- Tab-bar item icons supplied by each `*TabBarItem`.
