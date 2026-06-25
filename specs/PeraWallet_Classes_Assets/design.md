# PeraWallet_Classes_Assets — Design

## Layout & components

Screens (UIKit):

- **Add Asset** (`AssetAdditionViewController`): top `SearchInputView` over an
  `EffectView` background, below it a `UICollectionView` of opt-in rows
  (`OptInAssetListItemCell`) with loading / next-page-loading / error / not-found cells. Right
  nav `info` bar button opens `AsaVerificationInfoScreen`.
- **Opt-in confirmation** (`OptInAssetScreen`): compressed bottom sheet — `PrimaryTitleView`,
  three `SecondaryListItemView` rows (asset ID, account, transaction fee), description label, and
  approve / close buttons.
- **ASA Detail** (`ASADetailScreen`): `AccountNameTitleView` nav title, `ASAProfileView` header,
  `ASADetailQuickActionsView` (send / receive / swap / buy), `ASADetailMarketView`, and a
  `PageContainer` hosting Activity and About fragments. Compositional collection-view layout.
- **ASA Discovery** (`ASADiscoveryScreen`): `ASAProfileView` (discovery variant) + About fragment
  + floating `AssetQuickActionView` for inline opt-in.
- **Manage Assets** (`ManageAssetListViewController`): title/subtitle, `SearchInputView`, and a
  list of `OptOutAssetListItemCell` / `OptOutCollectibleAssetListItemCell` with loading cells;
  `ManagementOptionsViewController` is the add-vs-manage chooser.
- **Asset Filter** (`AssetsFilterSelectionViewController`): toggle list bound to
  `AssetFilterOptions`.
- **Select Asset** (`SelectAssetViewController`): list of `AssetListItemCell` /
  `CollectibleListItemCell` with `PreviewLoadingCell`.
- **Asset Action Confirmation** (`AssetActionConfirmationViewController`): compressed bottom sheet
  with `AssetActionConfirmationLoadingView` → `AssetActionConfirmationView`.

## Navigation hierarchy

- Add Asset → (row tap) ASA Discovery / Collectible Detail → opt-in.
- Add Asset → ("+" accessory) Opt-in confirmation sheet → opt-in transaction → Ledger connect /
  Sign-with-ledger sheets (ledger accounts) → joint-account sign overlay (joint accounts).
- Manage Assets → opt-out / transfer-balance sheet → same ledger/joint signing branch.
- ASA Detail → quick-action flow coordinators (Send / Receive / Swap / Meld buy / Rekey).
- Asset list entry points → Asset Filter sheet (persisted) and Select Asset (send flows).

## Design tokens

- Colors via the app design system (`Colors.Defaults.background`, theme-provided colors); each
  view pulls spacing, typography, and color from its sibling `*Theme` / `*ViewTheme`
  (MacaroonUIKit styling), so no literal styling lives in view code.
- Bottom sheets use `MacaroonBottomSheet` with `ModalHeight.compressed`.
- Constraints via SnapKit; effect/blur backgrounds via `EffectView`.

## Assets

- Catalog images referenced by name (e.g. `icon-info-green` for the ledger re-pairing warning,
  verification-tier and quick-action icons supplied through the per-view themes).
- Localized strings via `String(localized:)` (e.g. `title-add-asset`, `asset-filter-title`,
  `send-select-asset`, `asset-min-transaction-error-title`).
