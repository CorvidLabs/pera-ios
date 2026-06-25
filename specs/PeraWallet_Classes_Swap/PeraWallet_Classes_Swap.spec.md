---
module: PeraWallet_Classes_Swap
version: 1
status: active
files:
  - PeraWallet/Classes/Swap/AccountSelectionScreen/Data/SwapAccountSelectionListDataSource.swift
  - PeraWallet/Classes/Swap/AccountSelectionScreen/Data/SwapAccountSelectionListLocalDataController.swift
  - PeraWallet/Classes/Swap/AccountSelectionScreen/SwapAccountSelectionListLayout.swift
  - PeraWallet/Classes/Swap/AccountSelectionScreen/SwapAccountSelectionListScreen.swift
  - PeraWallet/Classes/Swap/AccountSelectionScreen/Views/AccountCell/SwapAccountSelectionListAccountListItemCell.swift
  - PeraWallet/Classes/Swap/AccountSelectionScreen/Views/AccountCell/SwapAccountSelectionListAccountListItemCellTheme.swift
  - PeraWallet/Classes/Swap/AccountSelectionScreen/Views/Header/SwapAccountSelectionListHeader.swift
  - PeraWallet/Classes/Swap/AccountSelectionScreen/Views/Header/SwapAccountSelectionListHeaderTheme.swift
  - PeraWallet/Classes/Swap/AccountSelectionScreen/Views/Header/SwapAccountSelectionListHeaderViewModel.swift
  - PeraWallet/Classes/Swap/Auxiliaries/AssetCache/AssetCache.swift
  - PeraWallet/Classes/Swap/Auxiliaries/AssetCache/MobileAPIAssetCache.swift
  - PeraWallet/Classes/Swap/Auxiliaries/Flow/SlippageTolerancePercentage.swift
  - PeraWallet/Classes/Swap/Auxiliaries/Flow/SwapAssetFlowCoordinator.swift
  - PeraWallet/Classes/Swap/Auxiliaries/Flow/SwapAssetFlowDraft.swift
  - PeraWallet/Classes/Swap/Auxiliaries/Flow/SwapDisplayStore.swift
  - PeraWallet/Classes/Swap/Auxiliaries/Formatter/SwapAssetInputValidator.swift
  - PeraWallet/Classes/Swap/Auxiliaries/SwapController/ALGSwapController.swift
  - PeraWallet/Classes/Swap/Auxiliaries/SwapController/ALGSwapControllerDraft.swift
  - PeraWallet/Classes/Swap/Auxiliaries/SwapController/SwapController.swift
  - PeraWallet/Classes/Swap/Auxiliaries/SwapController/TransactionUploadAndWaitOperation.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/Auxiliaries/PriceImpactLimit.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/ConfirmSwapScreen.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/ConfirmSwapScreenTheme.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/ConfirmSwapScreenViewModel.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/Data/ConfirmSwapAPIDataController.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/Data/ConfirmSwapDataController.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/Views/SwapInfoItemView/SwapConfirmExchangeFeeInfoViewModel.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/Views/SwapInfoItemView/SwapConfirmMinimumReceivedInfoViewModel.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/Views/SwapInfoItemView/SwapConfirmPeraFeeInfoViewModel.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/Views/SwapInfoItemView/SwapConfirmPriceImpactInfoViewModel.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/Views/SwapInfoItemView/SwapConfirmPriceInfoViewModel.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/Views/SwapInfoItemView/SwapConfirmSlippageToleranceInfoViewModel.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/Views/TitleSeparatorView/TitleSeparatorView.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/Views/TitleSeparatorView/TitleSeparatorViewModel.swift
  - PeraWallet/Classes/Swap/ConfirmSwapScreen/Views/TitleSeparatorView/TitleSeparatorViewTheme.swift
  - PeraWallet/Classes/Swap/Data/SwapAmountPercentage.swift
  - PeraWallet/Classes/Swap/Data/SwapAmountPercentageStore.swift
  - PeraWallet/Classes/Swap/Data/SwapDataLocalStore.swift
  - PeraWallet/Classes/Swap/Data/SwapDataStore.swift
  - PeraWallet/Classes/Swap/Data/SwapDataStoreObservation.swift
  - PeraWallet/Classes/Swap/Data/SwapSlippageTolerancePercentage.swift
  - PeraWallet/Classes/Swap/Data/SwapSlippageTolerancePercentageStore.swift
  - PeraWallet/Classes/Swap/EditSwapAmountScreen/Auxiliaries/SwapAmountPercentageValidator.swift
  - PeraWallet/Classes/Swap/EditSwapAmountScreen/Data/EditSwapAmountDataProvider.swift
  - PeraWallet/Classes/Swap/EditSwapAmountScreen/Data/EditSwapAmountLocalDataProvider.swift
  - PeraWallet/Classes/Swap/EditSwapAmountScreen/EditSwapAmountScreen.swift
  - PeraWallet/Classes/Swap/EditSwapAmountScreen/EditSwapAmountScreenTheme.swift
  - PeraWallet/Classes/Swap/EditSwapAmountScreen/Views/SwapAmountPercentageInputView/SwapAmountPercentageInputViewModel.swift
  - PeraWallet/Classes/Swap/EditSwapSlippageScreen/Auxiliaries/SwapSlippageTolerancePercentageValidator.swift
  - PeraWallet/Classes/Swap/EditSwapSlippageScreen/Data/EditSwapSlippageDataProvider.swift
  - PeraWallet/Classes/Swap/EditSwapSlippageScreen/Data/EditSwapSlippageToleranceLocalDataProvider.swift
  - PeraWallet/Classes/Swap/EditSwapSlippageScreen/EditSwapSlippageScreen.swift
  - PeraWallet/Classes/Swap/EditSwapSlippageScreen/EditSwapSlippageScreenTheme.swift
  - PeraWallet/Classes/Swap/EditSwapSlippageScreen/Views/SwapSlippageTolerancePercentageInputView/SwapSlippageTolerancePercentageInputViewModel.swift
  - PeraWallet/Classes/Swap/IntroScreen/Auxiliaries/SwapIntroductionDraft.swift
  - PeraWallet/Classes/Swap/IntroScreen/SwapIntroductionScreen.swift
  - PeraWallet/Classes/Swap/IntroScreen/SwapIntroductionScreenTheme.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/Data/SelectAssetDataController.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/Data/SelectLocalAssetDataController.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/Data/SelectSwapPoolAssetDataController.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/SelectAssetDataSource.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/SelectAssetListLayout.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/SelectAssetScreen.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/SelectAssetScreenTheme.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/Views/SelectAssetErrorItem/SelectAssetErrorItemViewModel.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/Views/SelectAssetListItem/SelectAssetListItemCell.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/Views/SelectAssetListItem/SelectAssetListItemCellTheme.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/Views/SelectAssetNoContentItem/SelectAssetNoContentItemViewModel.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/Views/SwapQuickActions/SwapQuickActionsView.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/Views/SwapQuickActions/SwapQuickActionsViewModel.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/Views/SwapQuickActions/SwapQuickActionsViewTheme.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/Views/SwapQuickActions/Views/SwapQuickActionsGroupView/SwapQuickActionsGroupView.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/Views/SwapQuickActions/Views/SwapQuickActionsGroupView/SwapQuickActionsGroupViewModel.swift
  - PeraWallet/Classes/Swap/SelectAssetScreen/Views/SwapQuickActions/Views/SwapQuickActionsGroupView/SwapQuickActionsGroupViewTheme.swift
  - PeraWallet/Classes/Swap/SwapAssetSuccessScreen/SwapAssetSuccessScreen.swift
  - PeraWallet/Classes/Swap/SwapAssetSuccessScreen/SwapAssetSuccessScreenTheme.swift
  - PeraWallet/Classes/Swap/SwapAssetSuccessScreen/SwapAssetSuccessScreenViewModel.swift
  - PeraWallet/Classes/Swap/SwapContainerVC.swift
  - PeraWallet/Classes/Swap/SwapScreen/Auxiliaries/SwapAssetScreenDraft.swift
  - PeraWallet/Classes/Swap/SwapScreen/Auxiliaries/SwapAvailableBalanceCalculator/SwapAvailableBalancePercentageValidator.swift
  - PeraWallet/Classes/Swap/SwapScreen/Auxiliaries/SwapAvailableBalanceCalculator/SwapAvailableBalanceQuoteValidator.swift
  - PeraWallet/Classes/Swap/SwapScreen/Auxiliaries/SwapAvailableBalanceCalculator/SwapAvailableBalanceValidator.swift
  - PeraWallet/Classes/Swap/SwapScreen/Data/SwapAssetAPIDataController.swift
  - PeraWallet/Classes/Swap/SwapScreen/Data/SwapAssetDataController.swift
  - PeraWallet/Classes/Swap/SwapScreen/SwapAssetScreen.swift
  - PeraWallet/Classes/Swap/SwapScreen/SwapAssetScreenTheme.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/AssetAmountInputView/AssetAmountInputView.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/AssetAmountInputView/AssetAmountInputViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/AssetAmountInputView/AssetAmountInputViewTheme.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/AssetAmountInputView/ConfirmSwapAmountInInputViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/AssetAmountInputView/ConfirmSwapAmountOutInputViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/AssetAmountInputView/SwapAssetAmountInInputViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/AssetAmountInputView/SwapAssetAmountOutInputViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetAmountView/ConfirmSwapAmountInViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetAmountView/ConfirmSwapAmountOutViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetAmountView/SwapAssetAmountInViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetAmountView/SwapAssetAmountOutViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetAmountView/SwapAssetAmountView.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetAmountView/SwapAssetAmountViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetAmountView/SwapAssetAmountViewTheme.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetSelectionEmptyView/SwapAssetSelectionEmptyView.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetSelectionEmptyView/SwapAssetSelectionEmptyViewDraft.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetSelectionEmptyView/SwapAssetSelectionEmptyViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetSelectionEmptyView/SwapAssetSelectionEmptyViewTheme.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetSelectionView/ConfirmSwapAssetSelectionViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetSelectionView/SwapAssetSelectionView.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetSelectionView/SwapAssetSelectionViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetSelectionView/SwapAssetSelectionViewTheme.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapAssetSelectionView/SwapInputAssetSelectionViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapErrorView/SwapAssetErrorViewModel.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapErrorView/SwapErrorView.swift
  - PeraWallet/Classes/Swap/SwapScreen/Views/SwapErrorView/SwapErrorViewTheme.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/SwapSummaryScreen.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/SwapSummaryScreenTheme.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/SwapSummaryScreenViewModel.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryAccountView/SwapSummaryAccountView.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryAccountView/SwapSummaryAccountViewModel.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryAccountView/SwapSummaryAccountViewTheme.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryItemView/SwapSummaryAlgorandFeeItemViewModel.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryItemView/SwapSummaryExchangeFeeItemViewModel.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryItemView/SwapSummaryItemView.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryItemView/SwapSummaryItemViewModel.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryItemView/SwapSummaryItemViewTheme.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryItemView/SwapSummaryOptInFeeItemViewModel.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryItemView/SwapSummaryPaidItemViewModel.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryItemView/SwapSummaryPeraFeeItemViewModel.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryItemView/SwapSummaryPriceImpactItemViewModel.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryItemView/SwapSummaryReceivedItemViewModel.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryStatusView/SwapSummaryStatusView.swift
  - PeraWallet/Classes/Swap/SwapSummaryScreen/Views/SwapSummaryStatusView/SwapSummaryStatusViewTheme.swift
  - PeraWallet/Classes/Swap/Views/AdjustableSingleSelectionInputView/AdjustableSingleSelectionInputView.swift
  - PeraWallet/Classes/Swap/Views/AdjustableSingleSelectionInputView/AdjustableSingleSelectionInputViewModel.swift
  - PeraWallet/Classes/Swap/Views/AdjustableSingleSelectionInputView/AdjustableSingleSelectionInputViewTheme.swift
  - PeraWallet/Classes/Swap/Views/SwapAssetLoadingScreen/SwapAssetLoadingScreenViewModel.swift
  - PeraWallet/Classes/Swap/Views/SwapErrorScreenViewModel/SwapAPIErrorViewModel.swift
  - PeraWallet/Classes/Swap/Views/SwapErrorScreenViewModel/SwapUnexpectedErrorViewModel.swift
  - PeraWallet/Classes/Swap/Views/SwapInfoActionItemView/SwapInfoActionItemView.swift
  - PeraWallet/Classes/Swap/Views/SwapInfoActionItemView/SwapInfoActionItemViewTheme.swift
  - PeraWallet/Classes/Swap/Views/SwapInfoItemView/SwapInfoItemView.swift
  - PeraWallet/Classes/Swap/Views/SwapInfoItemView/SwapInfoItemViewModel.swift
  - PeraWallet/Classes/Swap/Views/SwapInfoItemView/SwapInfoItemViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Swap

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Swap`) implementing the in-wallet asset swap experience (powered by the Pera swap aggregator / Tinyman-style pools on Algorand). It lets a user exchange one Algorand asset (the *user/in* asset) for another (the *pool/out* asset) on a chosen account.

The flow is driven by `SwapAssetFlowCoordinator`, a UIKit coordinator (`<todo> remove after routing refactor`) instantiated by the tab container `SwapContainerVC`. The coordinator owns navigation, transaction signing (standard and Ledger), analytics, and swap-status reporting back to the API. Screens it presents/pushes:

- **`SwapIntroductionScreen`** — one-time user-agreement / terms gate. Acceptance is persisted in `SwapDisplayStore`; only shown until `isConfirmedSwapUserAgreement` is true.
- **`SwapAccountSelectionListScreen`** — account picker (skipped when the draft already carries an account); validates opt-in to the in/out assets.
- **`SwapAssetScreen`** — the main swap composer: in/out asset selection, amount entry, live quote display, available-balance validation, and the Swap CTA.
- **`SelectAssetScreen`** — asset pickers for the in asset (local opted-in assets) and out/pool asset (assets supported by the swap providers); offers opt-in for non-held pool assets.
- **`EditSwapAmountScreen`** / **`EditSwapSlippageScreen`** — bottom-sheet editors for amount-percentage and slippage tolerance.
- **`ConfirmSwapScreen`** — quote review (price, price impact, minimum received, exchange fee, Pera fee, slippage) before signing.
- **`LoadingScreen`** → **`SwapAssetSuccessScreen`** → optional **`SwapSummaryScreen`** — execution, success, and detailed summary with a Pera Explorer deep link.

Shared swap state (selected assets, amount percentage, slippage tolerance) lives in `SwapDataStore`/`SwapDataLocalStore`, an observable store passed between screens. `ALGSwapController` (conforming to `SwapController`) coordinates quote loading, transaction grouping, signing via `SwapTransactionSigner`, upload, and status updates.

Ownership boundary: this module owns the swap UI/navigation and the app-side swap orchestration. The aggregator/quote/transaction models and API endpoints (`SwapQuote`, `SwapProvider`, `PeraSwapAmount`, `api.getProviders`, `api.calculateSwapAmount`, `api.updateSwapStatus`, etc.) belong to `pera_wallet_core`. Internal-by-default; see Public API for the only cross-module-public surface.

## Public API

| Export | Description |
|--------|-------------|
| `calculatePreferredSize` | Macaroon view-sizing method computing a cell/header's preferred `CGSize` for the given view model, layout sheet, and fitting size. |

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. The swap introduction/agreement gate is shown until accepted: while `SwapDisplayStore.isConfirmedSwapUserAgreement` is `false`, `launch()` opens `SwapIntroductionScreen` and does not start the swap flow. Accepting sets the flag (persisted) and proceeds.
3. A swap requires an account opted in to the *in* asset, and (for the *out* asset) either an existing opt-in or a completed opt-in. Selecting an account not opted in to the in asset surfaces an error banner and aborts; a non-held pool asset routes through `openOptInAsset` before it can be selected.
4. The in and out assets are always distinct: pool-asset selection filters exclude the current user asset (and user-asset selection excludes the pool asset) via `AssetExcludeFilterAlgorithm`, and zero-balance in-assets are filtered out (`AssetZeroBalanceFilterAlgorithm`).
5. Every executed swap reports its lifecycle to the backend: completion fires `analytics.swapCompleted` while failures (blockchain or network) call `logFailedSwap`, which tracks `swapFailed`, posts `updateSwapStatus(.failed, …)` for v2 swaps, and patches the quote via `updateSwapQuote`. Loading/error screens only act when the current visible screen is the expected `LoadingScreen`.

## Behavioral Examples

### Scenario: First-time user accepts the swap agreement
- **Given** the user opens the Swap tab and has never accepted the swap terms (`isConfirmedSwapUserAgreement == false`)
- **When** `SwapContainerVC` appears and `SwapAssetFlowCoordinator.launch()` runs
- **Then** `SwapIntroductionScreen` is presented; tapping the primary action sets `isConfirmedSwapUserAgreement = true`, dismisses the sheet, and relaunches into the swap tab; tapping close dismisses without starting the flow.

### Scenario: Completing a swap on a standard (non-Ledger) account
- **Given** an opted-in account with an in asset, an out asset, and an amount producing a valid quote on `SwapAssetScreen`
- **When** the user taps Swap, reviews the quote on `ConfirmSwapScreen`, and taps Confirm
- **Then** the coordinator starts loading and calls `swapController.signTransactions(...)`; on `didSignAllTransactions` it opens the `LoadingScreen`, and on `didCompleteSwap` it tracks `swapCompleted`, shows `SwapAssetSuccessScreen`, and offers View Detail (Pera Explorer group link) / Summary / Done.

### Scenario: Selecting a pool (out) asset the account does not hold
- **Given** the user is on the pool-asset `SelectAssetScreen`
- **When** they pick an asset the account is not opted in to
- **Then** `openOptInAsset` presents the opt-in bottom sheet; approving publishes `didApproveOptInToAsset` / `didSelectPoolAsset` and pops back to `SwapAssetScreen` with the new out asset set.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Selected account not opted in to the in asset | Error banner `swap-asset-not-opted-in-error`; account selection aborts (no flow start). |
| In-asset amount exceeds available balance (after fee/min-balance reservation) | `SwapAvailableBalanceValidator` emits `.failure(insufficientAlgoBalance / insufficientAssetBalance)`; quote not requested, swap CTA blocked. |
| Pera fee / quote unavailable during balance validation | `.failure(.unavailablePeraFee(...))`; user cannot proceed until a valid quote loads. |
| Quote load fails (`SwapAssetDataController.Error`) | `onQuoteLoaded(nil, error)`; `SwapErrorView` / `SwapAPIErrorViewModel` shown, no transactions built. |
| On-chain transaction fails (`didFailTransaction`) | `swapController.clearTransactions()`, stop loading, `logFailedSwap(... .blockchainError)`, push `SwapUnexpectedErrorViewModel`; primary action returns to `SwapAssetScreen` and refetches the quote. |
| Network failure during submission (`didFailNetwork`) | Clear transactions, stop loading, `logFailedSwap(error:)`, push `SwapAPIErrorViewModel`; primary action returns to `SwapAssetScreen` and refetches the quote. |
| Signing error (`didFailSigning`) | API errors → error banner via `displaySigningError`; Ledger errors routed through `displayLedgerError` (cancelled / app-closed / BLE / fetch-address banners) and screens dismissed. |
| Ledger reset / cancel during signing | Clear transactions, stop loading, dismiss `LedgerConnectionScreen` / `SignWithLedgerProcessScreen`. |
| High price impact (≥ 5/10/15% per `PriceImpactLimit`) | Confirm screen surfaces price-impact warning styling; user must acknowledge before confirming. |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core | Swap domain models & API: `SwapQuote`, `SwapProvider(V2)`, `PeraSwapAmount`, `SwapTransactionGroup`, `Account`/`Asset`/`AssetDecoration`, `ALGAPI` (`getProviders`, `calculateSwapAmount`, `updateSwapStatus`, `updateSwapQuote`, `swapTopPairs`, `getSwapHistory`, `fetchAssetList`), `SharedDataController`, `CurrencyFormatter`, `FeatureFlagServicing`, `HDWalletStorable`. |
| Ledger / signing (app) | `SwapTransactionSigner`, `LedgerConnectionScreen`, `SignWithLedgerProcessScreen`, `LedgerOperationError`. |
| Shared UI infrastructure (app) | `BaseViewController`, `Screen`/routing, `BottomSheetTransition`, `AlertUITransition`, `LoadingScreen`, `ErrorScreen`, `BannerController`, `LoadingController`, `OptInAssetDraft`/opt-in screen, `UISheet`. |
| Macaroon (MacaroonUIKit/MacaroonUtils) | View theming, `calculatePreferredSize` sizing, weak-observer publishing. |
| Magpie (MagpieCore/Hipo/Exceptions) | API networking and `HIPNetworkError` / `HIPTransactionError` error modeling. |
| Analytics | `ALGAnalytics` events: `swapCompleted`, `swapFailed`, `swapBannerTry`, `swapBannerLater`. |
| AlgorandWeb | `PeraExplorer.group` deep link for swap transaction details. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
