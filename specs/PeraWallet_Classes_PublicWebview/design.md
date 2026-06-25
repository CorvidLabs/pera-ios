# PeraWallet_Classes_PublicWebview — Design

## Screens & components

- **PublicWebviewScreen** — full-screen embedded browser presented over the main navigation.
  - Single component: a `WKWebView` (from `InAppBrowserScreen`) filling the screen.
  - Navigation bar is hidden while visible (`viewWillAppear` sets it hidden, `viewWillDisappear`
    restores it); the **tab bar stays visible** (`customizeTabBarAppearence` sets
    `tabBarHidden = false`).
  - Scroll bounce disabled (`webView.scrollView.bounces = false`) for an app-like feel.
- **PublicWebviewInAppBrowserScreen** — non-routed base; same web-view component plus the JS bridge.

## Navigation hierarchy

```
Router.open(.publicWebview(url:), by: .push)
  └─ PublicWebviewScreen (nav bar hidden, tab bar visible)
       └─ [JS bridge: pushWebView] → another PublicWebviewScreen (pushed)
       └─ [JS bridge: openSystemBrowser] → leaves app to Safari
       └─ [JS bridge: closeWebView / onBackPressed] → dismiss or pop
```

The screen is also a `pushWebView` target from the Fund in-app browser
(`handleFund` → `open(.publicWebview(url:), by: .push)`).

## Theming & design tokens

- Adopts **`DiscoverHomeScreenTheme`** (shared Discover/web theme).
- Web view is transparent: `isOpaque = false`, `backgroundColor = .clear` (set by the base class),
  so the native background shows through and theme transitions look seamless.
- **Light/dark sync**: the device interface style is converted via `UIUserInterfaceStyle.peraRawValue`
  and pushed to the page with `updateTheme('<light|dark>')` on appear, on app-activation, and on
  `preferredUserInterfaceStyleDidChange`. The page is expected to expose a global `updateTheme`
  JS function.
- Scroll indicators are hidden (vertical + horizontal) by the base web-view factory.

## Assets

- No bundled asset-catalog images are owned by this module; all visual content is remote web content.
- App version string (`CFBundleShortVersionString`) is read from `Bundle.main` to compose the
  `pera_ios_<version>` user agent.
