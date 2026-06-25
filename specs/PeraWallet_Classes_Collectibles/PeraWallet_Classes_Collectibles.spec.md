---
module: PeraWallet_Classes_Collectibles
version: 1
status: active
files:
  - PeraWallet/Classes/Collectibles/3DCard/Collectible3DCardDisplayable.swift
  - PeraWallet/Classes/Collectibles/3DCard/Collectible3DImageViewController.swift
  - PeraWallet/Classes/Collectibles/3DCard/Collectible3DVideoViewController.swift
  - PeraWallet/Classes/Collectibles/3DCard/Collectible3DViewerTheme.swift
  - PeraWallet/Classes/Collectibles/Detail/Data/CollectibleDetailAPIDataController.swift
  - PeraWallet/Classes/Collectibles/Detail/Data/CollectibleDetailDataController.swift
  - PeraWallet/Classes/Collectibles/Detail/Data/CollectibleDetailDataSource.swift
  - PeraWallet/Classes/Collectibles/Detail/Data/CollectibleMediaPreviewDataSource.swift
  - PeraWallet/Classes/Collectibles/Detail/Layout/CollectibleDetailCollectionViewFlowLayout.swift
  - PeraWallet/Classes/Collectibles/Detail/Layout/CollectibleDetailLayout.swift
  - PeraWallet/Classes/Collectibles/Detail/Layout/CollectibleDetailLayout+Theme.swift
  - PeraWallet/Classes/Collectibles/Detail/Screens/CollectibleDetailTransactionController.swift
  - PeraWallet/Classes/Collectibles/Detail/Screens/CollectibleDetailViewController.swift
  - PeraWallet/Classes/Collectibles/Detail/Screens/CollectibleMediaPreviewViewController.swift
  - PeraWallet/Classes/Collectibles/Detail/Screens/CollectibleMediaPreviewViewController+Theme.swift
  - PeraWallet/Classes/Collectibles/Detail/ViewModels/Header/CollectibleDetailHeaderViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/ViewModels/Media/CollectibleMediaAudioPreviewViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/ViewModels/Media/CollectibleMediaErrorViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/ViewModels/Media/CollectibleMediaGIFPreviewViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/ViewModels/Media/CollectibleMediaImagePreviewViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/ViewModels/Media/CollectibleMediaStandardImagePreviewViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/ViewModels/Media/CollectibleMediaVideoPreviewViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/ViewModels/Media/CollectibleMediaWebPImagePreviewViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/ViewModels/Property/CollectiblePropertyViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/AccountInformation/CollectibleDetailAccountInformationCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/AccountInformation/CollectibleDetailAccountInformationView.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/AccountInformation/CollectibleDetailAccountInformationViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/AccountInformation/CollectibleDetailAccountInformationViewTheme.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Action/OptOut/CollectibleDetailOptOutActionCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Action/OptOut/CollectibleDetailOptOutActionCellTheme.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Description/CollectibleDescriptionCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Description/CollectibleDescriptionCellTheme.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Description/CollectibleDescriptionView.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Description/CollectibleDescriptionViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Description/CollectibleDescriptionViewTheme.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Information/AssetIDItem/CollectibleDetailAssetIDItemCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Information/AssetIDItem/CollectibleDetailAssetIDItemCellTheme.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Information/AssetIDItem/CollectibleDetailAssetIDItemViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Information/CollectibleDetailInformationCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Information/CreatorAccountItem/CollectibleDetailCreatorAccountItemCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Information/CreatorAccountItem/CollectibleDetailCreatorAccountItemCellTheme.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Information/CreatorAccountItem/CollectibleDetailCreatorAccountItemViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Loading/CollectibleDetailLoadingCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Loading/CollectibleDetailLoadingView.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Loading/CollectibleDetailLoadingViewTheme.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Audio/AudioPlayerView.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Audio/CollectibleMediaAudioPreviewCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Audio/CollectibleMediaAudioPreviewView.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Audio/CollectibleMediaAudioPreviewViewTheme.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/CollectibleMediaPreviewCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Error/CollectibleMediaErrorCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Error/CollectibleMediaErrorView.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Error/CollectibleMediaErrorViewTheme.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Image/CollectibleMediaImagePreviewCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Image/CollectibleMediaImagePreviewView.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Image/CollectibleMediaImagePreviewViewTheme.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Image/URLImageViewNoStyleLayoutSheet.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Shared/CollectiblePlayableMediaPreviewCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Video/CollectibleMediaVideoPreviewCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Video/CollectibleMediaVideoPreviewView.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Video/CollectibleMediaVideoPreviewViewTheme.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Media/Video/VideoPlayerView.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Name/CollectibleDetailNameCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Name/CollectibleDetailNameViewModel.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Name/CollectibleDetailNameViewTheme.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Property/CollectiblePropertyCell.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Property/CollectiblePropertyView.swift
  - PeraWallet/Classes/Collectibles/Detail/Views/Property/CollectiblePropertyViewTheme.swift
  - PeraWallet/Classes/Collectibles/Filter/CollectiblesFilterSelectionViewController.swift
  - PeraWallet/Classes/Collectibles/Filter/CollectiblesFilterSelectionViewControllerTheme.swift
  - PeraWallet/Classes/Collectibles/Filter/Data/CollectibleFilterOptions.swift
  - PeraWallet/Classes/Collectibles/Filter/Data/CollectibleFilterOptionsCache.swift
  - PeraWallet/Classes/Collectibles/Filter/Views/AssetFilterItemView.swift
  - PeraWallet/Classes/Collectibles/Filter/Views/AssetFilterItemViewModel.swift
  - PeraWallet/Classes/Collectibles/Filter/Views/AssetFilterItemViewTheme.swift
  - PeraWallet/Classes/Collectibles/Filter/Views/DisplayCollectibleAssetsInAssetListFilterItemViewModel.swift
  - PeraWallet/Classes/Collectibles/Filter/Views/DisplayOptedInCollectibleAssetsFilterInAssetListItemViewModel.swift
  - PeraWallet/Classes/Collectibles/Filter/Views/DisplayOptedInCollectibleAssetsInCollectibleListFilterItemViewModel.swift
  - PeraWallet/Classes/Collectibles/Filter/Views/DisplayWatchAccountCollectibleAssetsInCollectibleListFilterItemViewModel.swift
  - PeraWallet/Classes/Collectibles/Filter/Views/HideAssetsWithNoBalanceInAssetListFilterItemViewModel.swift
  - PeraWallet/Classes/Collectibles/FullScreen/FullScreenContentViewController.swift
  - PeraWallet/Classes/Collectibles/FullScreen/FullScreenContentViewControllerTheme.swift
  - PeraWallet/Classes/Collectibles/FullScreen/Image/CollectibleFullScreenImageDraft.swift
  - PeraWallet/Classes/Collectibles/FullScreen/Image/CollectibleFullScreenImageViewController.swift
  - PeraWallet/Classes/Collectibles/FullScreen/Image/CollectibleFullScreenImageViewModel.swift
  - PeraWallet/Classes/Collectibles/FullScreen/Transition/CollectibleMediaPreviewController+VideoTransition.swift
  - PeraWallet/Classes/Collectibles/FullScreen/Transition/CollectibleMediaPreviewViewController+ImageTransition.swift
  - PeraWallet/Classes/Collectibles/FullScreen/Video/CollectibleFullScreenVideoDraft.swift
  - PeraWallet/Classes/Collectibles/FullScreen/Video/CollectibleFullScreenVideoViewController.swift
  - PeraWallet/Classes/Collectibles/List/Data/CollectibleGalleryUIStyleCache.swift
  - PeraWallet/Classes/Collectibles/List/Data/CollectibleListDataController.swift
  - PeraWallet/Classes/Collectibles/List/Data/CollectibleListDataSource.swift
  - PeraWallet/Classes/Collectibles/List/Data/CollectibleListLocalDataController.swift
  - PeraWallet/Classes/Collectibles/List/Data/CollectibleListQuery.swift
  - PeraWallet/Classes/Collectibles/List/Data/SelectionValue.swift
  - PeraWallet/Classes/Collectibles/List/Layout/CollectibleListLayout.swift
  - PeraWallet/Classes/Collectibles/List/Layout/CollectionViewSwitchableFlowLayout.swift
  - PeraWallet/Classes/Collectibles/List/Layout/TopAlignedCollectionViewFlowLayout.swift
  - PeraWallet/Classes/Collectibles/List/Screens/CollectibleListViewController.swift
  - PeraWallet/Classes/Collectibles/List/Screens/CollectibleListViewControllerTheme.swift
  - PeraWallet/Classes/Collectibles/List/Screens/CollectiblesViewController.swift
  - PeraWallet/Classes/Collectibles/List/Screens/Sort/SortCollectibleListDataController.swift
  - PeraWallet/Classes/Collectibles/List/Screens/Sort/SortCollectibleListDataSource.swift
  - PeraWallet/Classes/Collectibles/List/Screens/Sort/SortCollectibleListLayout.swift
  - PeraWallet/Classes/Collectibles/List/Screens/Sort/SortCollectibleListLocalDataController.swift
  - PeraWallet/Classes/Collectibles/List/Screens/Sort/SortCollectibleListViewController.swift
  - PeraWallet/Classes/Collectibles/List/ViewModels/Empty/CollectiblesNoContentWithActionViewModel.swift
  - PeraWallet/Classes/Collectibles/List/ViewModels/Items/CollectibleGridItemViewModel.swift
  - PeraWallet/Classes/Collectibles/List/Views/Empty/NoContentWithActionIllustratedCell.swift
  - PeraWallet/Classes/Collectibles/List/Views/Empty/NoContentWithActionViewIllustratedTheme+Collectible.swift
  - PeraWallet/Classes/Collectibles/List/Views/Items/CollectibleGridItemCell.swift
  - PeraWallet/Classes/Collectibles/List/Views/Items/CollectibleGridItemView.swift
  - PeraWallet/Classes/Collectibles/List/Views/Items/CollectibleGridItemViewTheme.swift
  - PeraWallet/Classes/Collectibles/List/Views/Items/Loading/CollectibleGridItemLoadingView.swift
  - PeraWallet/Classes/Collectibles/List/Views/Items/Loading/CollectibleGridItemLoadingViewTheme.swift
  - PeraWallet/Classes/Collectibles/List/Views/Items/PendingCollectibleGridItemCell.swift
  - PeraWallet/Classes/Collectibles/List/Views/Items/Receive/CollectibleListItemReceiveViewTheme.swift
  - PeraWallet/Classes/Collectibles/List/Views/Items/UIActions/CollectibleGalleryUIActionsCell.swift
  - PeraWallet/Classes/Collectibles/List/Views/Items/UIActions/CollectibleGalleryUIActionsView.swift
  - PeraWallet/Classes/Collectibles/List/Views/Items/UIActions/CollectibleGalleryUIActionsViewTheme.swift
  - PeraWallet/Classes/Collectibles/List/Views/Loading/Grid/CollectibleGalleryGridLoadingCell.swift
  - PeraWallet/Classes/Collectibles/List/Views/Loading/Grid/CollectibleGalleryGridLoadingView.swift
  - PeraWallet/Classes/Collectibles/List/Views/Loading/Grid/CollectibleGalleryGridLoadingViewTheme.swift
  - PeraWallet/Classes/Collectibles/List/Views/Loading/List/CollectibleGalleryListLoadingCell.swift
  - PeraWallet/Classes/Collectibles/List/Views/Loading/List/CollectibleGalleryListLoadingView.swift
  - PeraWallet/Classes/Collectibles/List/Views/Loading/List/CollectibleGalleryListLoadingViewTheme.swift
  - PeraWallet/Classes/Collectibles/Receive/Common/Title/ViewModels/TitleViewModel.swift
  - PeraWallet/Classes/Collectibles/Receive/Common/Title/Views/TitleSupplementaryCell.swift
  - PeraWallet/Classes/Collectibles/Receive/Common/Title/Views/TitleView.swift
  - PeraWallet/Classes/Collectibles/Receive/Common/Title/Views/TitleViewTheme.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAccount/Data/ReceiveCollectibleAccountListAPIDataController.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAccount/Data/ReceiveCollectibleAccountListDataController.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAccount/Data/ReceiveCollectibleAccountListDataSource.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAccount/Layout/ReceiveCollectibleAccountListLayout.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAccount/Screens/ReceiveCollectibleAccountListViewController.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAccount/Screens/ReceiveCollectibleAccountListViewControllerTheme.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAccount/ViewModels/ReceiveCollectibleAccountListHeaderViewModel.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAccount/ViewModels/ReceiveCollectibleAccountListInfoViewModel.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAsset/Data/ReceiveCollectibleAssetListAPIDataController.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAsset/Data/ReceiveCollectibleAssetListDataController.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAsset/Data/ReceiveCollectibleAssetListDataSource.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAsset/Layout/ReceiveCollectibleAssetListLayout.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAsset/Screens/ReceiveCollectibleAssetListViewController.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAsset/Screens/ReceiveCollectibleAssetListViewControllerTheme.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAsset/ViewModels/ReceiveCollectibleAssetListInfoViewModel.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAsset/ViewModels/ReceiveCollectibleAssetListSearchNoContentViewModel.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAsset/Views/Info/ReceiveCollectibleInfoBoxCell.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAsset/Views/Search/CollectibleReceiveSearchInputCell.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAsset/Views/SelectedAccountPreview/SelectedAccountPreviewView.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAsset/Views/SelectedAccountPreview/SelectedAccountPreviewViewModel.swift
  - PeraWallet/Classes/Collectibles/Receive/SelectAsset/Views/SelectedAccountPreview/SelectedAccountPreviewViewTheme.swift
  - PeraWallet/Classes/Collectibles/Send/ApproveTransaction/ApproveCollectibleTransactionViewController.swift
  - PeraWallet/Classes/Collectibles/Send/ApproveTransaction/ApproveCollectibleTransactionViewControllerTheme.swift
  - PeraWallet/Classes/Collectibles/Send/ApproveTransaction/ApproveCollectibleTransactionViewModel.swift
  - PeraWallet/Classes/Collectibles/Send/ApproveTransaction/CollectibleTransactionInfoView.swift
  - PeraWallet/Classes/Collectibles/Send/ApproveTransaction/CollectibleTransactionInfoViewModel.swift
  - PeraWallet/Classes/Collectibles/Send/ApproveTransaction/CollectibleTransactionInfoViewTheme.swift
  - PeraWallet/Classes/Collectibles/Send/SendCollectibleActionView.swift
  - PeraWallet/Classes/Collectibles/Send/SendCollectibleActionViewTheme.swift
  - PeraWallet/Classes/Collectibles/Send/SendCollectibleView.swift
  - PeraWallet/Classes/Collectibles/Send/SendCollectibleViewController.swift
  - PeraWallet/Classes/Collectibles/Send/SendCollectibleViewController+Animation.swift
  - PeraWallet/Classes/Collectibles/Send/SendCollectibleViewController+Layout.swift
  - PeraWallet/Classes/Collectibles/Send/SendCollectibleViewControllerTheme.swift
  - PeraWallet/Classes/Collectibles/Send/SendCollectibleViewModel.swift
  - PeraWallet/Classes/Collectibles/Send/SendCollectibleViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Collectibles

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Collectibles`). Internal-by-default; see Public API for any cross-module-public surface.

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
