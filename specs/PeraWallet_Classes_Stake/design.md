# PeraWallet_Classes_Stake — Design

## Layout & components

This is a web-shell feature; the native surface is intentionally minimal.

- **StakingScreen** — full-bleed `WKWebView` filling the screen. Scroll bounce is disabled and pull-to-refresh is disabled, so the page behaves like an embedded app rather than a scroll-bounce web page. Tab bar remains visible (`customizeTabBarAppearence` keeps `tabBarHidden = false`) when used as a tab; the navigation bar is hidden while visible and restored on disappear.
- **StakingInAppBrowserScreen** — the browser base providing the web view, user-agent, injected user scripts, and the JS message bridge. No native chrome beyond the host browser's.

## Navigation hierarchy

```
HomeViewController / MenuViewController / ASADetailScreen / staking deep link
        └── open(.staking, by: .push | .present)
                └── StakingScreen  (StakingInAppBrowserScreen → InAppBrowserScreen)
                        └── WKWebView → remote staking web app (destination: .list)

StakingFlowCoordinator.launch()
        └── customPresentWithoutNavigationController(.fullScreen) → .staking
```

Inbound web→native messages (`StakingInAppBrowserScreenMessage`): `openSystemBrowser`, `closeWebView`, `peraconnect`, `getDeviceId`, `openDappWebview`. Outbound native→web: `updateTheme('light'|'dark')`.

## Design tokens

- Visual styling is owned by the **remote web app**, not native code. The native shell only forwards the active interface style so the web app can pick the correct token set.
- Native theme bridge: device `UIUserInterfaceStyle` → `peraRawValue` (`"light"` / `"dark"`) injected via JS. Theme is pushed on appear, on interface-style change, and on app-foreground.
- `StakingScreen` instantiates a `DiscoverHomeScreenTheme` (reused from the Discover module) — currently unused (see tasks.md); no bespoke staking theme exists natively.

## Assets

- No dedicated asset-catalog entries are owned by this module; iconography and imagery are served by the remote staking web app. Entry-point icons (Home/Menu rows) belong to their respective modules.
