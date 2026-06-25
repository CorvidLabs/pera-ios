# PeraWallet_Classes_Swap — Design

## Screens & components

- **SwapIntroductionScreen** (`ScrollScreen`): illustration, title + "new" badge, body, "powered by" line, terms-of-service text view, primary CTA, close button. Themed by `SwapIntroductionScreenTheme`.
- **SwapAccountSelectionListScreen**: account list (`SwapAccountSelectionListAccountListItemCell` + theme) with a section header (`SwapAccountSelectionListHeader` + view model/theme); backed by `SwapAccountSelectionListDataSource` / `...LocalDataController` and a `SwapAccountSelectionListLayout`.
- **SwapAssetScreen** (main composer): in/out `SwapAssetSelectionView` (with empty-state `SwapAssetSelectionEmptyView`), `AssetAmountInputView`, `SwapAssetAmountView`, `SwapQuickActionsView` (percentage/max quick actions in grouped sub-views), and `SwapErrorView` for inline errors. Many parallel view models distinguish in vs out and edit vs confirm contexts (`SwapAssetAmountIn/OutViewModel`, `ConfirmSwapAmountIn/OutViewModel`, etc.).
- **SelectAssetScreen**: searchable asset list (`SelectAssetListItemCell` + theme), no-content and error items (`SelectAssetNoContentItemViewModel`, `SelectAssetErrorItemViewModel`), optional `SwapQuickActionsView`; `SelectAssetDataSource` + `SelectAssetListLayout`.
- **EditSwapAmountScreen** / **EditSwapSlippageScreen**: bottom-sheet editors built on `AdjustableSingleSelectionInputView` (+ view model/theme) and the percentage input view models.
- **ConfirmSwapScreen**: titled info rows via `SwapInfoItemView` + per-row view models (price, price impact, minimum received, exchange fee, Pera fee, slippage tolerance), `TitleSeparatorView`, and `SwapInfoActionItemView`. Themed by `ConfirmSwapScreenTheme`.
- **SwapAssetSuccessScreen**: success confirmation with View Detail / Summary / Done actions.
- **SwapSummaryScreen**: `SwapSummaryAccountView`, `SwapSummaryStatusView`, and `SwapSummaryItemView` rows (paid, received, price impact, exchange/Algorand/Pera/opt-in fees).
- **Shared overlays**: `LoadingScreen` (with `SwapAssetLoadingScreenViewModel`), `ErrorScreen` (`SwapAPIErrorViewModel` / `SwapUnexpectedErrorViewModel`), Ledger connection & signing sheets, opt-in sheet, and `UISheet` info sheets for slippage/price-impact.

## Navigation hierarchy

```
SwapContainerVC (tab)
└─ SwapAssetFlowCoordinator
   ├─ [if not accepted] SwapIntroductionScreen (present)
   ├─ [if no account]   SwapAccountSelectionListScreen (present)
   └─ SwapAssetScreen (present/push)
      ├─ SelectAssetScreen — in asset (push/present)
      ├─ SelectAssetScreen — out/pool asset (push/present) → OptInAsset sheet (present)
      ├─ EditSwapAmountScreen / EditSwapSlippageScreen (present, bottom sheet)
      └─ ConfirmSwapScreen (push)
         ├─ Slippage / Price-impact info sheets (present)
         ├─ [Ledger] SignWithLedgerConfirmation → LedgerConnectionScreen → SignWithLedgerProcessScreen
         └─ LoadingScreen → SwapAssetSuccessScreen
            └─ SwapSummaryScreen (present)  /  Pera Explorer link (external)
```

## Design tokens

- Each screen/cell/view has a paired `*Theme` (Macaroon `LayoutSheet`/`StyleSheet`) supplying colors, typography, spacing, and corner styles from the app design system.
- Typography via `Typography` / string styling helpers (`bodyLargeMedium`, `bodyRegular`, `bodyMediumAttributes`, etc.).
- Cell/header sizing computed by `calculatePreferredSize` (the module's public export).

## Assets

- `icon-ledger-48` (Ledger signing sheet), `icon-info-green` (Ledger connection-issues warning), plus the swap introduction illustration and per-cell asset icons referenced by the themes/view models.
