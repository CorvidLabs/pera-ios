# PeraWallet_Classes_Fund — Design

## Layout & components

- **FundInAppBrowserScreen** — full-screen `WKWebView` hosting the Pera fund web app.
  It is one of the root tab containers (the **Fund** tab) inside the app's `TabBarController`.
  There is no native chrome beyond the tab bar: the screen hides the navigation bar while
  visible (`setNavigationBarHidden(true)` in `viewWillAppear`, restored on disappear) and
  keeps the tab bar shown (`tabBarHidden = false`). Bottom safe-area inset is respected
  (`useSafeAreaBottom = true`). Pull-to-refresh reloads the page.
- All visual content below the tab bar is rendered by the remote web app, not by native
  views; this module supplies the container, URL, and bridge.

## Navigation hierarchy

```
TabBarController
└── Fund tab → NavigationContainer
    └── FundInAppBrowserScreen (WKWebView)
        ├── pushWebView      → nested public in-app web view (Router.open(.publicWebview))
        ├── openSystemBrowser/openNativeURI → external Safari / system handler
        └── closeWebView/onBackPressed → dismiss or pop back to Fund
```

Entry points: `RootViewController` builds the screen; `TabBarController.launchFund(with:)`
and `launchFundFromDeeplink(with:and:)` select the tab and inject an address/path.

## Design tokens

- **Theme:** native interface style is mapped through `UIUserInterfaceStyle.peraRawValue`
  and pushed into the page as a `theme` URL param plus a live `updateTheme('<style>')`
  JS call, so the web UI matches the app's light/dark mode.
- **Currency / locale:** `currency`, `language`, and `region` are passed as URL params and
  kept in sync via `updateCurrency('<id>')`, letting the remote page format values using
  the app's design/locale conventions.
- Native colors/typography/spacing are not defined here — they belong to the embedded web
  design system. Native banners/toasts surfaced via `notifyUser` use the app-wide banner
  controller styling.

## Assets

- No local asset-catalog entries are owned by this module; visual assets are served by the
  remote Pera fund web app.
