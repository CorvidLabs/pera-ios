# PeraWallet_Classes_Cards — Design

## Layout & components

This is a WebView-driven feature: the visual UI is rendered by Pera's hosted
cards web app inside a `WKWebView`. The native layer contributes only the
container chrome and behavior.

- `CardsScreen` — full-screen `WKWebView` host.
  - Tab bar remains visible (`customizeTabBarAppearence` sets
    `tabBarHidden = false`).
  - Scroll view: bounce disabled; `scrollViewDidScroll` pins `contentOffset` to
    `.zero` when not actively dragging, so the page does not rubber-band.
  - Pull-to-refresh disabled (`allowsPullToRefresh = false`).
- `CardsInAppBrowserScreen` — base in-app-browser shell (loading, theme push,
  JS bridge); no native subviews beyond the inherited web view container.

## Navigation hierarchy

```
Entry point (menu / coordinator)
  └─ CardsFlowCoordinator.launch()
       └─ open(.cards(path: nil),
               by: .customPresentWithoutNavigationController(.fullScreen))
            └─ CardsScreen (destination: .welcome)
                 └─ WKWebView → hosted cards web app
                      ├─ getAuthorizedAddresses → returns CardsAccounts
                      ├─ peraconnect            → native Pera Connect flow
                      ├─ openSystemBrowser      → Safari
                      ├─ getDeviceId            → device ID response
                      └─ closePeraCards         → dismissScreen()
```

Destinations (`CardsDestination`): `.welcome` (cards home) and
`.other(path:)` (deep path appended to the cards base URL).

## Design tokens

- Appearance/theme: native pushes the resolved light/dark mode into the page
  via `updateTheme('<light|dark>')` (using `UIUserInterfaceStyle.peraRawValue`)
  and as the `theme` URL query item, so the web app honors the app design
  system's light/dark scheme.
- `CardsScreen` reuses `DiscoverHomeScreenTheme` for native styling, keeping it
  visually consistent with the Discover home shell.
- Locale/currency context (`currency`, `language`, `region` query items) lets
  the web app localize formatting to match the wallet's settings.

## Assets

- No native asset-catalog imagery in this module; all visual assets are served
  by the hosted cards web app. Native chrome inherits the shared in-app-browser
  and tab-bar assets.
