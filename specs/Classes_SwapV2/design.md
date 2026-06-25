# Classes_SwapV2 — Design

## Screens & components

### Main Swap screen (`SwapView`)
- **`SwapTitleView`** — "Swap" title, info button (Tinyman link), and an `AccountSelectionButton` chip on the right; 60pt header on `Color.Defaults.bg`.
- **`AssetSelectionView` × 2** — stacked "You pay" / "You receive" cards. The paying card is editable (`TextField`, decimal pad); the receiving card is read-only and shows a `ShimmerSUIView` while a quote loads. Each card carries an `AssetSwapButton` chip (asset icon + name + verification badge) and the asset balance. 144pt tall, 12pt corner radius; paying card uses `Color.Defaults.bg`, receiving card uses `Color.Layer.grayLighter`.
- **`SwitchSwapButton`** (left) and **`SettingsSwapButton`** (right, settings + max actions) overlaid between the cards.
- **`ProviderSelectionView`** — appears once both amounts are positive; shows selected provider icon/name and exchange rate with a chevron.
- **`SwapButton`** — primary CTA, animated in (`.move(edge:.bottom)` + opacity) with `shouldShowSwapButton`.

### Bottom sheets
- **`SwapSettingsSheet`** — `SheetTitleView` ("Swap settings", dismiss/apply); `.height(600)` detent. Body not yet implemented.
- **`ProviderSheet`** — provider selection.
- **`ConfirmSwapView`** — full-detent (`.large`) confirmation: close button, account header, in/out `ConfirmSwapAssetView` rows separated by a "to" divider, a details list (price, provider, slippage, price impact, minimum received, exchange fee, Pera fee), and a `ConfirmSlideButton`. Slippage and price-impact rows have info buttons opening `ConfirmSwapInfoSheet` (`.slippageTolerance` 320pt / `.priceImpact` 250pt detents).
- **`ConfirmSwapInfoSheet`** — contextual explainer for slippage tolerance / price impact.
- **High-price-impact warning** — UIKit `UISheet` (`icon-info-red`), title + highlighted body, confirm/cancel actions, presented via `BottomSheetTransition`.

## Navigation hierarchy

```
TabBarController (Swap tab)
└─ NavigationContainer
   └─ SwapViewController (BaseViewController, nav bar hidden)
      └─ UIHostingController<SwapView>
         ├─ sheet: SwapSettingsSheet
         ├─ sheet: ProviderSheet
         └─ sheet: ConfirmSwapView
            └─ sheet: ConfirmSwapInfoSheet (slippage / price impact)
      └─ UISheet: high-price-impact warning (BottomSheetTransition)

Account / asset-in / asset-out selection and quoting → SwapAssetFlowCoordinator (legacy Classes/Swap)
```

The Swap tab hides the navigation bar while visible (`viewWillAppear`/`viewWillDisappear`) and keeps the tab bar shown.

## Design tokens

- **Typography:** DM Sans via `.font(.dmSans.medium/.regular.size(...))` — titles 19pt, section labels 13pt, amount field 19pt, confirm amounts 18pt, detail rows 13pt.
- **Colors:** `Color.Text.main`, `Color.Text.gray`, `Color.Text.grayLighter`, `Color.Layer.grayLighter`, `Color.Layer.grayLightest`, `Color.Defaults.bg`; warning sheet uses `Colors.Helpers.positive` and `Typography.bodyMediumAttributes`.
- **Spacing:** card radius 12, chip radius 16; horizontal insets of 8/16/24 across the layout.

## Assets

Asset-catalog images referenced: `icon-info-gray`, `icon-info-20`, `icon-info-red`, `icon-close`, `icon-repeat`, `icon-arrow-24`, `icon-shield-16`, `icon-algo-circle`, `icon-swap-empty`, `icon-verified`, `icon-trusted`. Remote asset logos are loaded via `AsyncImage(url: assetItem.asset.logoURL)` with `icon-swap-empty` as the placeholder.
