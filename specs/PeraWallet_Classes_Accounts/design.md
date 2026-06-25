# PeraWallet_Classes_Accounts — Design

## Layout & components

### Screens
- **Home** (`HomePortfolioNavigationView` title, `UICollectionView` + `HomeListLayout`):
  account portfolio cells, watch-account portfolio cells, single-line title/action
  headers, TestNet title view.
- **Account Detail** (`PageContainer`): page bar with three `PrimaryPageBarButtonItem`
  tabs — Overview (assets), Collectibles, History (transactions). Navigation title
  is `AccountNameTitleView` (long-press to copy address); right bar button is the
  account options `ALGBarButtonItem`.
  - Assets tab: loading cells, asset/algo cells, asset-title header, add-asset item,
    management item, not-backed-up warning cell, asset verification info.
- **Account Information sheets** (bottom sheets): one screen + theme + type-info
  view-model per authorization (Standard, Watch, Ledger, NoAuth, Rekeyed,
  RekeyedJoint, AnyToNoAuthRekeyed). Shared `AccountTypeInformationView`,
  `AccountInformationOptionsView`, copy/no-auth/undo-rekey account item view models.
- **Options**: options list sheet, edit account, rename account sheet, passphrase
  warning + passphrase display, passphrase warning check cells.
- **Selection pickers**: AccountSelection, SelectAccount, Select (AccountSelectScreen),
  ReceiverAccountSelection (contact cell, clipboard view, select-contact view,
  preview/title cells, no-content view), AccountDiscovery/SelectAddress (address
  cell + already-imported address cell).
- **Rewards**: `RewardDetailViewController` bottom sheet.
- **Remove account**: back-up-before-removing warning sheet, remove-account sheet.

### Component conventions
- Each view has a paired `*Theme` / `*ViewTheme` struct (Macaroon `LayoutSheet` /
  `StyleSheet`) and, for content, a `*ViewModel`.
- Lists use `*DataController` (state/orchestration) + `*DataSource`
  (`UICollectionViewDiffableDataSource`-style) + `*Layout` triples; API-backed
  variants are suffixed `APIDataController`, local variants `LocalDataController`.

## Navigation hierarchy

```
Home (tab)
└─ Account Detail (PageContainer)
   ├─ Overview / Collectibles / History tabs
   ├─ Account action menu (bottom sheet) → Send / Receive / Swap / Buy-Sell / Add Asset
   ├─ Options sheet → Passphrase (warning → display) / Rename / Remove / Rekey / Rescan
   └─ Account Information sheet (per authorization)
      └─ Rekey-to-{Standard,Ledger,Joint} / Undo-Rekey / Rescan / Import-Connected
```

Cross-screen transitions are mediated by `*FlowCoordinator` objects; modal sheets
use `BottomSheetTransition` (`.present` / `.presentWithoutNavigationController`),
inline pushes use `open(_:by: .push)` / `.pop`.

## Design tokens

- **Colors:** app design system via `Colors.*` (e.g. `Colors.Defaults.background`)
  and theme structs; page bar background set from `Colors.Defaults.background`.
- **Typography / spacing:** supplied by each screen/view `*Theme` struct
  (Macaroon `LayoutSheet`), not hard-coded in controllers.
- **Currency:** `CurrencyFormatter` from core formats portfolio/asset/reward values.

## Assets

- Account-type and option icons, QR/clipboard glyphs, and asset/verification badges
  referenced through the shared asset catalog via Macaroon image styling in the
  `*Theme` structs.
