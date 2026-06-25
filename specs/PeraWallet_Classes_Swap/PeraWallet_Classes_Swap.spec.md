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

App-target UI/feature module (`PeraWallet/Classes/Swap`). Internal-by-default; see Public API for any cross-module-public surface.

## Public API

| Export | Description |
|--------|-------------|
| `calculatePreferredSize` | Document caller-visible behavior and constraints. |

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.

## Behavioral Examples

### Scenario: Placeholder
- **Given** the app is running
- **When** this module's flow is entered
- **Then** it behaves per its screens/controllers

## Error Cases

| Condition | Behavior |
|-----------|----------|
| N/A | Documented per screen |

## Dependencies

| Module | Usage |
|--------|-------|
| PeraWalletCore | Shared models/services |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
