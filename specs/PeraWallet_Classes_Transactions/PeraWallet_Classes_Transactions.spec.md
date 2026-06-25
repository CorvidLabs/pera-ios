---
module: PeraWallet_Classes_Transactions
version: 1
status: active
files:
  - PeraWallet/Classes/Transactions/AlgoExplorerType.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetListDataController.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetListDataSource.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetListLayout.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetListLocalDataController.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetListViewController.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetListViewControllerTheme.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetPreviewStackViewTheme.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetPreviewView.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetPreviewViewModel.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetPreviewViewStackView.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetPreviewViewStackViewModel.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetPreviewViewTheme.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetPreviewViewWithImage.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetPreviewViewWithImageTheme.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetPreviewWithImageCell.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallAssetPreviewWithImageViewModel.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallTransactionAssetInformationView.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallTransactionAssetInformationViewModel.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallTransactionAssetInformationViewTheme.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallTransactionDetailView.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallTransactionDetailViewController.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallTransactionDetailViewModel.swift
  - PeraWallet/Classes/Transactions/AppCallDetail/AppCallTransactionDetailViewTheme.swift
  - PeraWallet/Classes/Transactions/Detail/Data/TransactionDetailDataController.swift
  - PeraWallet/Classes/Transactions/Detail/Data/TransactionDetailLocalDataController.swift
  - PeraWallet/Classes/Transactions/Detail/Screens/TransactionDetailViewController.swift
  - PeraWallet/Classes/Transactions/Detail/ViewModels/TransactionActionInformationViewModel.swift
  - PeraWallet/Classes/Transactions/Detail/ViewModels/TransactionAmountInformationViewModel.swift
  - PeraWallet/Classes/Transactions/Detail/ViewModels/TransactionContactInformationViewModel.swift
  - PeraWallet/Classes/Transactions/Detail/ViewModels/TransactionCurrencyAmountInformationViewModel.swift
  - PeraWallet/Classes/Transactions/Detail/ViewModels/TransactionDetailViewModel.swift
  - PeraWallet/Classes/Transactions/Detail/ViewModels/TransactionHistoryNoContentViewModel.swift
  - PeraWallet/Classes/Transactions/Detail/ViewModels/TransactionStatusInformationViewModel.swift
  - PeraWallet/Classes/Transactions/Detail/ViewModels/TransactionTextInformationViewModel.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Common/TransactionAccountInformationView.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionActionView/TransactionActionInformationView.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionActionView/TransactionActionInformationViewTheme.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionAmountInformationView/TransactionAmountInformationView.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionAmountInformationView/TransactionAmountInformationViewTheme.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionContactInformationView/ContactDisplayView/ContactDisplayView.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionContactInformationView/ContactDisplayView/ContactDisplayViewModel.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionContactInformationView/ContactDisplayView/ContactDisplayViewTheme.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionContactInformationView/TransactionContactInformationView.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionContactInformationView/TransactionContactInformationViewTheme.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionDetailTitleLabel.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionMultipleAmountInformationView/TransactionMultipleAmountInformationView.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionMultipleAmountInformationView/TransactionMultipleAmountInformationViewTheme.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionStatusInformationView/TransactionStatusInformationView.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionStatusInformationView/TransactionStatusInformationViewTheme.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionStatusInformationView/TransactionStatusView/TransactionStatusView.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionStatusInformationView/TransactionStatusView/TransactionStatusViewModel.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionStatusInformationView/TransactionStatusView/TransactionStatusViewTheme.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionTextInformationView/TransactionTextInformationView.swift
  - PeraWallet/Classes/Transactions/Detail/Views/Components/TransactionTextInformationView/TransactionTextInformationViewTheme.swift
  - PeraWallet/Classes/Transactions/Detail/Views/TransactionDetailView.swift
  - PeraWallet/Classes/Transactions/Detail/Views/TransactionDetailViewTheme.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/AlgoInnerTransactionPreviewViewModel.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/AppCallInnerTransactionPreviewViewModel.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/AssetConfigInnerTransactionPreviewViewModel.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/AssetInnerTransactionPreviewViewModel.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/InnerTransactionListDataController.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/InnerTransactionListDataSource.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/InnerTransactionListHeaderViewModel.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/InnerTransactionListLayout.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/InnerTransactionListLocalDataController.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/InnerTransactionListTitleSupplementaryCell.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/InnerTransactionListViewController.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/InnerTransactionListViewControllerTheme.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/InnerTransactionPreviewCell.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/InnerTransactionPreviewView.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/InnerTransactionPreviewViewModel.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/InnerTransactionPreviewViewTheme.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/KeyRegInnerTransactionPreviewViewModel.swift
  - PeraWallet/Classes/Transactions/InnerTransactionsList/TitleViewTheme+InnerTransactionList.swift
  - PeraWallet/Classes/Transactions/KeyReg/KeyRegTransactionItem.swift
  - PeraWallet/Classes/Transactions/KeyReg/SendKeyRegTransactionItemViewModel.swift
  - PeraWallet/Classes/Transactions/KeyReg/SendKeyRegTransactionScreen.swift
  - PeraWallet/Classes/Transactions/KeyReg/SendKeyRegTransactionView.swift
  - PeraWallet/Classes/Transactions/KeyReg/SendKeyRegTransactionViewTheme.swift
  - PeraWallet/Classes/Transactions/KeyRegTransactionDetail/KeyRegTransactionDetailViewController.swift
  - PeraWallet/Classes/Transactions/KeyRegTransactionDetail/Views/KeyRegTransactionDetailView.swift
  - PeraWallet/Classes/Transactions/KeyRegTransactionDetail/Views/KeyRegTransactionDetailViewModel.swift
  - PeraWallet/Classes/Transactions/KeyRegTransactionDetail/Views/KeyRegTransactionDetailViewTheme.swift
  - PeraWallet/Classes/Transactions/List/Screens/DraftComposer/AlgoTransactionItemDraftComposer.swift
  - PeraWallet/Classes/Transactions/List/Screens/DraftComposer/AppCallTransactionItemDraftComposer.swift
  - PeraWallet/Classes/Transactions/List/Screens/DraftComposer/AssetConfigTransactionItemDraftComposer.swift
  - PeraWallet/Classes/Transactions/List/Screens/DraftComposer/AssetTransactionItemDraftComposer.swift
  - PeraWallet/Classes/Transactions/List/Screens/DraftComposer/KeyRegTransactionItemDraftComposer.swift
  - PeraWallet/Classes/Transactions/List/Screens/DraftComposer/PendingTransactionItemDraftComposer.swift
  - PeraWallet/Classes/Transactions/List/Screens/DraftComposer/TransactionListItemDraftComposer.swift
  - PeraWallet/Classes/Transactions/List/Screens/Filter/TransactionCustomRangeSelectionViewController.swift
  - PeraWallet/Classes/Transactions/List/Screens/Filter/TransactionFilterViewController.swift
  - PeraWallet/Classes/Transactions/List/Screens/Filter/TransactionFilterViewController+Theme.swift
  - PeraWallet/Classes/Transactions/List/Screens/Grouping/AllTransactionListGrouping.swift
  - PeraWallet/Classes/Transactions/List/Screens/Grouping/TransactionListGrouping.swift
  - PeraWallet/Classes/Transactions/List/Screens/LoadingCell.swift
  - PeraWallet/Classes/Transactions/List/Screens/TransactionsAPIDataController.swift
  - PeraWallet/Classes/Transactions/List/Screens/TransactionsDataController.swift
  - PeraWallet/Classes/Transactions/List/Screens/TransactionsDataSource.swift
  - PeraWallet/Classes/Transactions/List/Screens/TransactionsListLayout.swift
  - PeraWallet/Classes/Transactions/List/Screens/TransactionsListLayout+Theme.swift
  - PeraWallet/Classes/Transactions/List/Screens/TransactionsViewController.swift
  - PeraWallet/Classes/Transactions/List/Screens/TransactionsViewController+Theme.swift
  - PeraWallet/Classes/Transactions/List/ViewModels/AlgoTransactionItemViewModel.swift
  - PeraWallet/Classes/Transactions/List/ViewModels/AppCallTransactionItemViewModel.swift
  - PeraWallet/Classes/Transactions/List/ViewModels/AssetConfigTransactionItemViewModel.swift
  - PeraWallet/Classes/Transactions/List/ViewModels/AssetTransactionItemViewModel.swift
  - PeraWallet/Classes/Transactions/List/ViewModels/Filter/TransactionHistoryFilterViewModel.swift
  - PeraWallet/Classes/Transactions/List/ViewModels/HeartbeatTransactionItemViewModel.swift
  - PeraWallet/Classes/Transactions/List/ViewModels/KeyRegTransactionItemViewModel.swift
  - PeraWallet/Classes/Transactions/List/ViewModels/PendingTransactionItemViewModel.swift
  - PeraWallet/Classes/Transactions/List/ViewModels/TransactionListItemViewModel.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/HistoryCell/Pending/PendingTransactionCell.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/HistoryCell/Pending/PendingTransactionView.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/HistoryCell/Pending/PendingTransactionViewTheme.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/HistoryCell/TransactionHistoryCell.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/HistoryCell/TransactionHistoryContextView.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/HistoryCell/TransactionHistoryContextViewTheme.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/HistoryFilterCell/TransactionHistoryFilterCell.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/HistoryFilterCell/TransactionHistoryFilterView.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/HistoryFilterCell/TransactionHistoryHeaderViewTheme.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/HistoryTitleCell/TransactionHistoryTitleCell.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/HistoryTitleCell/TransactionHistoryTitleContextView.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/HistoryTitleCell/TransactionHistoryTitleContextViewModel.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/HistoryTitleCell/TransactionHistoryTitleContextViewTheme.swift
  - PeraWallet/Classes/Transactions/List/Views/Cell/History/TransactionHistoryDateContextViewTheme.swift
  - PeraWallet/Classes/Transactions/List/Views/Filter/Cell/TransactionFilterOptionCell.swift
  - PeraWallet/Classes/Transactions/List/Views/Filter/Cell/TransactionFilterOptionView.swift
  - PeraWallet/Classes/Transactions/List/Views/Filter/Cell/TransactionFilterOptionViewModel.swift
  - PeraWallet/Classes/Transactions/List/Views/Filter/Cell/TransactionFilterOptionViewTheme.swift
  - PeraWallet/Classes/Transactions/List/Views/Filter/Range/RangeSelection/RangeSelectionView.swift
  - PeraWallet/Classes/Transactions/List/Views/Filter/Range/RangeSelection/RangeSelectionViewModel.swift
  - PeraWallet/Classes/Transactions/List/Views/Filter/Range/RangeSelection/RangeSelectionViewTheme.swift
  - PeraWallet/Classes/Transactions/List/Views/Filter/Range/TransactionCustomRangeSelection/TransactionCustomRangeSelectionView.swift
  - PeraWallet/Classes/Transactions/List/Views/Filter/Range/TransactionCustomRangeSelection/TransactionCustomRangeSelectionViewModel.swift
  - PeraWallet/Classes/Transactions/List/Views/Filter/Range/TransactionCustomRangeSelection/TransactionCustomRangeSelectionViewTheme.swift
  - PeraWallet/Classes/Transactions/List/Views/Filter/TransactionFilterView.swift
  - PeraWallet/Classes/Transactions/List/Views/Filter/TransactionFilterViewTheme.swift
  - PeraWallet/Classes/Transactions/Result/TransactionResultScreen.swift
  - PeraWallet/Classes/Transactions/Result/TransactionResultScreen+Theme.swift
  - PeraWallet/Classes/Transactions/Send/Approve/ViewModels/SendTransactionViewModel.swift
  - PeraWallet/Classes/Transactions/Send/Inbox/ARC59SendAssetInformationViewModel.swift
  - PeraWallet/Classes/Transactions/Send/Inbox/ARC59SendFeeInformationViewModel.swift
  - PeraWallet/Classes/Transactions/Send/Inbox/SendAssetInboxDraft.swift
  - PeraWallet/Classes/Transactions/Send/Inbox/SendAssetInboxScreen.swift
  - PeraWallet/Classes/Transactions/Send/Inbox/SendAssetInboxScreenTheme.swift
  - PeraWallet/Classes/Transactions/Send/Inbox/SendAssetInboxScreenViewModel.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/EditNote/EditNoteScreen.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/EditNote/EditNoteScreenTheme.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/InsufficientAlgoBalanceScreen/InsufficientAlgoBalanceDraft.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/InsufficientAlgoBalanceScreen/InsufficientAlgoBalanceScreen.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/InsufficientAlgoBalanceScreen/InsufficientAlgoBalanceScreenTheme.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/SendAssetAndOptInTransactionInfo/SendAssetAndOptInTransactionInfoScreen.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/SendAssetAndOptInTransactionInfo/SendAssetAndOptInTransactionInfoScreen+Theme.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/SendAssetAndOptInTransactionInfo/SendAssetAndOptInTransactionInfoScreenDisplayStore.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/SendAssetAndOptInTransactionInfo/SendAssetAndOptInTransactionInfoScreenViewModel.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/SendTransaction/SendTransactionScreen.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/SendTransaction/SendTransactionScreen+Theme.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/SendTransaction/TransactionAmountValidator.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/SendTransactionPreview/SendTransactionPreviewScreen.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Screens/SendTransactionPreview/SendTransactionPreviewScreen+Theme.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/ViewModels/SendTransactionPreviewViewModel.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Views/SendTransaction/TransactionShadowButtonTheme.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Views/SendTransactionPreview/SendTransactionPreviewView.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Main/Views/SendTransactionPreview/SendTransactionPreviewViewTheme.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Max/ViewModels/MaximumBalanceWarningViewModel.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Tutorial/Screens/TransactionTutorialViewController.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Tutorial/ViewModels/TransactionCorrectAddressInstructionViewModel.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Tutorial/ViewModels/TransactionSmallTestTransactionInstructionItemViewModel.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Tutorial/ViewModels/TransactionTutorialViewModel.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Tutorial/Views/TransactionTutorialView.swift
  - PeraWallet/Classes/Transactions/Send/Preview/Tutorial/Views/TransactionTutorialViewTheme.swift
  - PeraWallet/Classes/Transactions/TransferType.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Transactions

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Transactions`). Internal-by-default; see Public API for any cross-module-public surface.

## Public API

| Export | Description |
|--------|-------------|
| `success` | Convenience static property on `Result where Success == Void` returning a `.success(())` value for void-result validations. |

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
