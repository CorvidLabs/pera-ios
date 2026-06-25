# PeraWallet_Classes_Discover — Design

## Layout & components

### Screens
- **Discover Home** (`DiscoverHomeScreen`) — full-bleed `WKWebView` with a collapsing large-title nav bar (`DiscoverNavigationBarView`: title label + search button). Nav bar is hidden by the system bar and rendered as a custom large-title view that fades with web scroll; a search `ALGBarButtonItem` appears as a right bar button when the large title is hidden.
- **Asset / token detail** (`DiscoverAssetDetailScreen`) and **Generic** (`DiscoverGenericScreen`) — web-view screens with the tab bar hidden, pushed onto the navigation stack.
- **External / dApp browser** (`DiscoverExternalInAppBrowserScreen`, `DiscoverDappDetailScreen`) — web view + custom `navigationItem.titleView` (`DiscoverExternalInAppBrowserNavigationView`, two-line title/subtitle) + bottom `UIToolbar` (previous / next / home, plus a favorite button for dApps). Left bar button = close, right bar button = reload.
- **Search** (`DiscoverSearchScreen`) — `SearchInputView` with an effect-view background, a Cancel button, and a `UICollectionView` driven by `DiscoverSearchDataSource` + `DiscoverSearchScreenLayout`, with `MacaroonForm.KeyboardController` managing keyboard insets.

### Cells / views (Search)
- `DiscoverSearchAssetCell` (asset row; bound by `DiscoverSearchAssetListItemViewModel` / `DiscoverSearchAssetNameListItemViewModel`).
- `DiscoverSearchListLoadingCell` / nested `DiscoverSearchAssetLoadingView` (initial skeleton).
- `DiscoverSearchListNotFoundCell` (empty results).
- `DiscoverErrorCell` (full-list error, retry).
- `DiscoverSearchNextListLoadingCell` / `DiscoverSearchNextListErrorCell` (pagination footer loading / error+retry).

## Navigation hierarchy

```
Tab bar
└─ Discover Home (DiscoverHomeScreen)          [tab bar visible]
   ├─ search button → DiscoverSearchScreen      [fullScreen custom present]
   │                     └─ select asset → DiscoverAssetDetailScreen [push, tab bar hidden]
   ├─ DiscoverGenericScreen                      [push/present, tab bar hidden]
   └─ DiscoverExternalInAppBrowserScreen / DiscoverDappDetailScreen  [tab bar hidden]
        └─ close → goBack event
```

External browser back/forward/home is intra-web-view history navigation via `WKBackForwardList`, distinct from the native navigation stack.

## Design tokens

- Themes are `MacaroonUIKit` `LayoutSheet`/`StyleSheet` structs (`DiscoverHomeScreenTheme`, `DiscoverNavigationBarViewTheme`, `DiscoverSearchScreenTheme`, the per-cell `*ViewTheme` files, `DiscoverExternalInAppBrowserNavigationViewTheme`, `DappDetailNavigationViewTheme`).
- Colors via the app palette, e.g. `Colors.Defaults.background`, `Colors.Text.main`.
- Discover Home spacing: `navigationBarEdgeInset = (8, 24, .noMetric, 24)`, `webContentTopInset = 10`.
- The web content itself receives a `theme` query param (`light-theme` / `dark-theme` via `UIUserInterfaceStyle.peraRawValue`) so the web UI matches native appearance.

## Assets

- `icon-navigation-search` (home search button), `icon-favourite` / `icon-favourite-filled` (dApp favorite toggle), and toolbar icons via `ALGBarButtonItem` kinds `.discoverHome`, `.discoverPrevious`, `.discoverNext`, `.reload`, `.close`, `.search`.
