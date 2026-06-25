# PeraWallet_Classes_Collectibles — Design

## Screens & components

- **Collectibles (Gallery)** — `CollectiblesViewController` → embeds `CollectibleListViewController`.
  - Large-title nav bar with "+" (add → receive) and a contextual opt-in button.
  - Grid/list switchable `UICollectionView` (`CollectionViewSwitchableFlowLayout`, `TopAlignedCollectionViewFlowLayout`).
  - Cells: `CollectibleGridItemCell`, `PendingCollectibleGridItemCell`, loading cells (`CollectibleGalleryGridLoadingView` / `...ListLoadingView`), `CollectibleGridItemLoadingView`, UI-actions bar (`CollectibleGalleryUIActionsView`), empty state (`NoContentWithActionIllustratedCell`).
  - **Sort** sub-screen and **Filter** selection sheet (`CollectiblesFilterSelectionViewController`, `AssetFilterItemView`).
- **Collectible Detail** — `CollectibleDetailViewController` (sectioned `UICollectionView`):
  - Media preview pager (`CollectibleMediaPreviewViewController`) with image / video / audio / GIF / WebP / error cells; `AudioPlayerView`, `VideoPlayerView`.
  - Rows: name, description (show-more/less), properties (`CollectiblePropertyView`), asset ID, creator account, account information, opt-out action, loading.
  - Bottom `AssetQuickActionView` (opt-in / opt-out) and share bar button.
- **Receive** — `ReceiveCollectibleAccountListViewController` (account list + header/info) → `ReceiveCollectibleAssetListViewController` (search input, info box, selected-account preview).
- **Send** — `SendCollectibleViewController` (`SendCollectibleView` + `SendCollectibleActionView`, keyboard-tracked) → `ApproveCollectibleTransactionViewController` (`CollectibleTransactionInfoView`).
- **Full screen / 3D** — `FullScreenContentViewController`, `CollectibleFullScreenImageViewController`, `CollectibleFullScreenVideoViewController`; `Collectible3DImageViewController`, `Collectible3DVideoViewController` with custom image/video transitions.

## Navigation hierarchy

```
Collectibles (tab)
└─ CollectibleListViewController (gallery)
   ├─ [+] / receive → ReceiveCollectibleAccountList → ReceiveCollectibleAssetList → opt-in
   ├─ filter → CollectiblesFilterSelection (sheet)
   ├─ sort → SortCollectibleList
   └─ tap item → CollectibleDetailViewController
      ├─ media tap → FullScreen image/video / 3D viewer
      ├─ quick action → optInAsset / optOutAsset (bottom sheet) → Ledger connect/sign (sheets)
      ├─ send → SendTransaction / SendCollectible → ApproveCollectibleTransaction (sheet)
      ├─ asset ID → ASA Detail / ASA Discovery
      └─ creator → Pera Explorer (external)
```

## Design tokens & theming

- Per-component `*Theme` / `*ViewTheme` structs (MacaroonUIKit) own colors, typography, spacing, and corner radii; `calculatePreferredSize` computes cell/view sizing from view model + layout constraints.
- Backgrounds use `Colors.Defaults.background`; strings via `String(localized:)` keys (e.g. `title-collectibles`, `title-generic-error`, `title-retry`).
- Status bar style on the send screen switches on `api.isTestNet` (dark on TestNet, light otherwise).

## Assets

- Illustrated empty-state art (`NoContentWithActionViewIllustratedTheme+Collectible`), iconography such as `icon-info-green`, and remote collectible media loaded via MacaroonURLImage (`URLImageView`).
