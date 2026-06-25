# PeraWallet_Classes_Assets — Context

## Overview

Architectural context for the `PeraWallet_Classes_Assets` module — the asset (ASA/collectible)
lifecycle UI for a single account. The authoritative contract is
`PeraWallet_Classes_Assets.spec.md`; the source files it covers are listed in that spec's
`files:` frontmatter.

## Key files

- `Addition/AssetAdditionScreen/AssetAdditionViewController.swift` — searchable, paginated opt-in
  asset list; owns the opt-in `TransactionController` map and ledger/joint-account handshakes.
- `Addition/OptInAssetScreen/OptInAssetScreen.swift` — bottom-sheet opt-in confirmation
  (asset ID, account, transaction fee).
- `Detail/ASADetailScreen/ASADetailScreen.swift` — per-account asset detail with profile header,
  quick actions, market info, and paged Activity/About fragments.
- `Detail/ASADiscoveryScreen/ASADiscoveryScreen.swift` — pre-opt-in detail variant with inline
  opt-in quick action.
- `Removal/ManageAssetsScreen/ManageAssetListViewController.swift` — opted-in asset/collectible
  list and opt-out / transfer-balance flow.
- `Select/Screens/SelectAssetViewController.swift` — asset picker for send flows.
- `Filter/AssetFilterOptions.swift` + `Filter/AssetFilterOptionsCache.swift` — persisted list
  filters; `Filter/Screens/AssetsFilterSelectionViewController.swift` is the UI.
- `Common/Alert/Screens/AssetActionConfirmationViewController.swift` — shared add/remove
  confirmation bottom sheet (with async asset-detail fetch).
- `Common/Views/AssetQuickAction/AssetQuickActionView.swift` — reusable floating opt-in/opt-out
  action bar.

## Architectural decisions

- **MVVM + data controllers.** Screens are `UIViewController`s; each list is backed by a
  `*DataController` protocol with an `eventHandler` closure and an API-backed implementation
  (e.g. `AssetListViewAPIDataController`, `ManageAssetListDataController`,
  `ASADetailScreenDataController`). Diffable data sources (`*DataSource`) + `*Layout` types drive
  the collection views. Per-cell content is a `*ViewModel` + `*Theme` pair.
- **Themes are separate value types.** Every view has a sibling `*Theme` / `*ViewTheme`
  conforming to MacaroonUIKit's styling, keeping layout constants out of view code.
- **Coordinators for cross-feature navigation.** Detail quick actions and joint/ledger signing are
  delegated to flow coordinators (swap, send, receive, rekey, Meld) and
  `JointAccountTransactionCoordinator`, which publishes `$action` over Combine.
- **On-chain work via `TransactionController`.** Opt-in/opt-out screens never build transactions
  directly; they key a `TransactionController` by `AssetID` and react to its delegate callbacks,
  coordinating with `sharedDataController.blockchainUpdatesMonitor`.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI. Two legacy detail
controllers (`AlgosDetailViewController`, `AssetDetailViewController`) coexist with the newer
`ASADetailScreen` and are pending consolidation.
