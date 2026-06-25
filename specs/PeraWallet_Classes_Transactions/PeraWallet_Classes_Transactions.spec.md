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

App-target UI/feature module (`PeraWallet/Classes/Transactions`) that owns the **send**, **list/history**, and **detail** experiences for on-chain transactions in Pera Wallet. It covers the full lifecycle of a transaction from the user's perspective:

- **Send flow** (`Send/`): the amount-entry screen (`SendTransactionScreen`) with numpad input, MAX, note editing, and live fiat conversion; amount validation via `TransactionAmountValidator`; the preview/confirm screen (`SendTransactionPreviewScreen`); the first-time send tutorial; the insufficient-min-balance and opt-in info bottom sheets; and the ARC-59 asset-inbox path (`SendAssetInboxScreen`) used when the receiver has not opted into the asset. Key registration (online/offline staking) transactions have their own send screen (`SendKeyRegTransactionScreen`).
- **List/history flow** (`List/`): the per-account/per-asset transaction history (`TransactionsViewController`) backed by a paginated, polling API data controller (`TransactionsAPIDataController`); item view models per transaction type (algo, asset, app-call, asset-config, key-reg, heartbeat, pending); date-range filtering (`TransactionFilterViewController`, custom-range selection); grouping by day; and CSV export/share of history.
- **Detail flow** (`Detail/`, `AppCallDetail/`, `KeyRegTransactionDetail/`, `InnerTransactionsList/`): read-only detail screens that render amount, status, sender/receiver (with contact resolution), fee, note, and a deep link to the Pera Explorer; specialized detail screens for application-call transactions (with foreign-asset lists and inner-transaction drill-down) and key-registration transactions.

Ownership boundary: this module owns transaction-specific **UI, view models, themes, and list/detail data controllers**. It does **not** own transaction construction, signing, or submission — those are delegated to `TransactionController` / `TransactionSendController` / `ARC59TransactionSendController` and the `pera_wallet_core` SDK. Account, asset, and currency models, the shared data controller, and the `Screen`/router navigation enum are all provided by other app modules and `pera_wallet_core`. The module is internal-by-default (app target); the only cross-module-public surface is the `Result where Success == Void` convenience listed in Public API.

## Public API

| Export | Description |
|--------|-------------|
| `success` | Convenience static property on `Result where Success == Void` returning a `.success(())` value for void-result validations. |

## Invariants

1. **Amounts are validated before preview.** `SendTransactionScreen.didTapNext()` always routes through `TransactionAmountValidator` (and `TransactionSendController.validate()`) before any preview/confirm screen is pushed; on validation failure the flow shows a banner or warning sheet and does not advance.
2. **Signing/submission is delegated, never performed in views.** Screens build a `SendTransactionDraft` and hand it to `TransactionSendController` / `ARC59TransactionSendController` / `TransactionController`; the UI layer never signs or broadcasts directly.
3. **Detail routing is type-driven.** `TransactionsViewController.openTransactionDetail` picks the destination by inspecting the item: an `appId` opens the app-call detail (loading the v2 detail first when needed), a `keyRegTransaction` opens the key-reg detail, otherwise the standard transaction detail — so each transaction type renders in its matching screen.
4. **Pending-transaction polling is lifecycle-bound.** `TransactionsAPIDataController` starts polling in `viewWillAppear` and stops it in `viewWillDisappear`/`deinit`; selecting a custom date range whose end is in the future also stops polling.
5. **Privacy mode is honored.** The list data controller re-delivers its snapshot with `isAmountHidden` whenever `ObservableUserDefaults.isPrivacyModeEnabled` changes, so amounts stay masked across the history and detail views.

## Behavioral Examples

### Scenario: Sending an asset to a receiver that has not opted in
- **Given** the user enters a valid amount on `SendTransactionScreen` and taps Next, then selects a receiver
- **When** `TransactionSendController` reports `.asset(.assetNotSupported(address))` for an address that is not an authorized local account
- **Then** the screen opens `SendAssetInboxScreen` (ARC-59 asset inbox) so the asset can be sent to the inbox instead of failing

### Scenario: Viewing an application-call transaction from history
- **Given** the user taps a transaction row in `TransactionsViewController`
- **When** the selected item has a non-nil `appId`
- **Then** the controller resolves foreign assets via `sharedDataController.assetDetailCollection`, loads the v2 detail through `TransactionDetailLocalDataController` if the row is not already a `TransactionV2`, and presents `appCallTransactionDetail` (with inner-transaction drill-down)

### Scenario: Exporting filtered history
- **Given** a transaction history is shown with an active filter option
- **When** the user taps share on the history filter cell
- **Then** the controller builds an `ExportTransactionsDraft` from the filter's date range and calls `api.exportTransactions`, presenting a share sheet on success or an error banner on failure

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Amount exceeds available balance (asset) | `send-asset-amount-error` banner; preview not shown |
| Amount would drop account below min-balance (algo) | `MaximumBalanceWarningViewModel` bottom warning; user can continue with adjusted MAX amount |
| Sending MAX from a participation-key account | Confirmation alert (`send-algos-account-delete-*`) before proceeding |
| Receiver address invalid / not selected | `send-algos-receiver-address-validation` / `send-algos-address-not-selected` banner |
| Closing/sending to the same account | `send-transaction-max-same-account-error` banner |
| Receiver not opted into asset (authorized local account) | Opt-in info screen (`SendAssetAndOptInTransactionInfoScreen`) or sets `isReceiverOptingInToAsset` and continues, per stored permission |
| Receiver not opted into asset (external address) | Routes to ARC-59 `SendAssetInboxScreen` |
| No internet connection during validation | `title-internet-connection` banner |
| App-call detail v2 load fails | `title-generic-error` banner; detail not presented |
| Transaction params fetch fails | Error banner with `error.localizedDescription`; send blocked |
| History export returns a fault/error file | Friction-guard returns silently on fault; otherwise `title-generic-api-error` banner |

## Dependencies

| Module | Usage |
|--------|-------|
| `pera_wallet_core` | `ALGAPI`, `SharedDataController`, account/asset/currency models (`Account`, `Asset`, `StandardAsset`, `CollectibleAsset`), transaction models (`TransactionItem`, `Transaction`, `TransactionV2`, `PendingTransaction`), `CurrencyExchanger`/`CurrencyFormatter`, feature flags |
| Transaction send controllers | `TransactionSendController`, `ARC59TransactionSendController`, `TransactionController` for build/validate/sign/submit |
| App router / `Screen` enum | Push/present navigation to preview, detail, receiver selection, edit-note, warning, and share-activity screens |
| MacaroonUIKit / MacaroonBottomSheet / MacaroonUtils / SnapKit | View styling, theming, bottom-sheet transitions, layout |
| MagpieCore / MagpieExceptions / MagpieHipo / Alamofire | Networking primitives behind `ALGAPI` (pagination, export, error models) |
| Contacts module | `Contact` resolution for sender/receiver display in list and detail |
| Ledger flow screens | `LedgerConnectionScreen` / `SignWithLedgerProcessScreen` during key-reg and ARC-59 signing |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
