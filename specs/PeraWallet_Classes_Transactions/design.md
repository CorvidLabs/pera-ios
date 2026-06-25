# PeraWallet_Classes_Transactions — Design

## Screens & components

### Send
- **SendTransactionScreen** — amount entry: navigation title showing account/asset (`AccountNameTitleView`), asset/collectible item card on a triple-shadow canvas (`TripleShadowView` + `PrimaryListItemView` / `CollectibleListItemView`), large value + fiat labels, decimal `NumpadView`, NOTE and MAX shadow buttons (`TransactionShadowButtonTheme`), and a primary Next button.
- **SendTransactionPreviewScreen** — review/confirm screen (`SendTransactionPreviewView`).
- **SendAssetInboxScreen** — ARC-59 inbox bottom-style screen: title/icon, asset + fee `SecondaryListItemView` rows, Send/Close buttons; integrates Ledger sub-screens.
- **EditNoteScreen**, **InsufficientAlgoBalanceScreen**, **SendAssetAndOptInTransactionInfoScreen**, **TransactionTutorialViewController** — supporting bottom sheets/modals.
- **SendKeyRegTransactionScreen** — online/offline staking key-registration send.

### List / history
- **TransactionsViewController** — `UICollectionView` history with a filter header cell, day-grouped title cells, per-type history cells, pending-transaction cells, loading/next-list cells, and empty states.
- **TransactionFilterViewController** / **TransactionCustomRangeSelectionViewController** — bottom-sheet date-range filter and custom range picker (`RangeSelectionView`).

### Detail
- **TransactionDetailViewController** — scrollable detail (`TransactionDetailView`) with amount/currency-amount, status, contact/account, and text information rows; copy tooltip on first view; Explorer link.
- **AppCallTransactionDetailViewController** — app-call detail with asset information + foreign-asset list and an inner-transactions list.
- **InnerTransactionListViewController** — drill-down list of inner transactions with per-type preview cells.
- **KeyRegTransactionDetailViewController** — key-registration detail.

## Navigation hierarchy

- Send: `SendTransactionScreen` → (receiver selection if needed) → `SendTransactionPreviewScreen` → result; ARC-59 branch diverts to `SendAssetInboxScreen`. Notes, warnings, opt-in, and tutorial are presented as bottom sheets (`BottomSheetTransition`).
- History: `TransactionsViewController` (embedded in account/asset detail) → tap row → type-matched detail (`transactionDetail` / `appCallTransactionDetail` / `keyRegTransactionDetail`), presented modally. App-call detail → `InnerTransactionListViewController`.

## Design-token usage

- Styling lives in paired `*Theme` / `*+Theme` / `*ViewControllerTheme` files (e.g. `SendTransactionScreen+Theme`, `TransactionsViewController+Theme`, `TransactionDetailViewTheme`).
- Tokens follow the app design system via MacaroonUIKit: color tokens (e.g. value vs. disabled-value vs. currency label styles), spacing/inset constants, multi-layer shadow appearances (`accountContainerFirst/Second/ThirdShadow`), and typography styles applied through `customize`/`customizeAppearance`.
- Imagery from the asset catalog (e.g. `icon-info-red`) and localized strings via `String(localized:)`.
