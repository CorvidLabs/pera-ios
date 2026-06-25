# PeraWallet_Classes_IncomingASA — Design

## Navigation hierarchy

```
Inbox entry (IncomingASAAccountsViewController)   [push]
  ├─ asset row tapped → Per-account inbox (IncomingASAAccountInboxViewController)   [push, via .incomingASA]
  │     └─ asset tapped → Detail (IncomingASAsDetailScreen)   [present, via .incomingASAsDetail]
  │           ├─ primary action → Claim → LoadingScreen → SuccessResultScreen → Pera Explorer
  │           └─ secondary action → Reject confirm sheet → Loading → Success
  ├─ invite row → JointAccountInviteConfirmationOverlay → Name & add joint account
  ├─ sign-request row → JointAccountTransactionRequestSummary (fullScreen)
  └─ pending-transaction row → JointAccountPendingTransactionOverlay (+ cancel dialog)
```

`didCompleteTransaction` events bubble back up the stack so each layer dismisses/pops itself after a successful claim/reject.

## Layout & components

**Accounts list** (`Accounts/`)
- `UICollectionView` with `AccountAssetListLayout`, `InboxDiffableDataSource`.
- Cells/views: `IncomingASAAccountCell`, `IncomingASAAccountView` (+ `…ViewTheme`).
- `NoContentView` with `InboxNoContentViewModel` when empty; info bar button → `UISheet`.

**Per-account inbox** (`Inbox/`)
- `UICollectionView` with `IncomingASAAccountInboxListLayout`, `IncomingASAAccountInboxListDataSource`.
- Header: `IncomingASAAccountInboxHeaderTitleCell` + `IncominASAListTitleView`/`…ViewModel`/`…Theme`.
- Rows: `IncomingASAAccountInboxListItemCell` → `IncomingASAListItemView` (+ `IncomingASAListItem`, `IncomingASAListItemViewModel`, themes).
- Row models: `IncomingASAAssetListItemViewModel`, `IncomingASASenderViewModel`.
- Reuses `PendingAssetListItemCell`, `PendingCollectibleAssetListItemCell`, `AccountAssetListLoadingCell` for loading/pending states.

**Detail** (`Detail/`)
- `IncomingASAsDetailView` (+ `…ViewModel`, `…ViewTheme`) inside a `BaseScrollViewController`.
- Header: `IncomingASARequestHeaderView`/`…ViewModel`/`…Theme`.
- Sender: `IncomingASARequesSenderView` (+ `…ViewModel`, `…ViewTheme`).
- Id: `IncomingASARequestIdTheme`; Account: `IncomingASADetailAccountView` (+ theme).
- Footer: `EffectView` linear-gradient + `HStackView` with primary (claim) and secondary (reject) `MacaroonUIKit.Button`s.
- Result: `LoadingScreen` (`IncomingASAsDetailLoadingScreenViewModel`) → `SuccessResultScreen` (`IncomingASAsDetailSuccessResultScreenViewModel`).

## Design tokens

- Backgrounds via `Colors.Defaults.background`; per-view colors/spacing/typography come from the `*Theme`/`*ViewTheme` structs (Macaroon `LayoutSheet`/`StyleSheet`), e.g. `theme.spacingBetweenActions`, `theme.actionMargins`, `theme.secondaryActionWidthMultiplier`.
- Typography helpers: `.bodyLargeMedium()`, `.bodyRegular()` for sheet text.
- Layout via SnapKit constraints + `MacaroonUIKit` stack/effect views.

## Assets

- `iconIncomingAsaError` / `icon-incoming-asa-error` — error/reject sheet image.
- `icon-info-green` — Ledger pairing-issue warning.
- Bottom-sheet presentations via `BottomSheetTransition`; reject confirmation via `UISheet` + `UISheetActionScreenImageTheme`.

## Localized strings (representative)

`inbox-navigation-bar-title`, `incoming-asa-account-inbox-screen-title`, `incoming-asa-account-inbox-header-main-title`, `incoming-asa-detail-screen-info-title`, `incoming-asa-detail-screen-description_reject`, `incoming-asas-detail-success-detail`, `required-min-balance-title`.
