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

App-target UI/feature module (`PeraWallet/Classes/Collectibles`) implementing Pera Wallet's NFT / collectible-asset experience. It owns four primary flows plus shared media playback:

- **List / Gallery** (`List/`) — `CollectiblesViewController` hosts `CollectibleListViewController`, a `UICollectionView` gallery of an account's collectible (NFT) assets. Supports a grid/list layout switch (`CollectibleGalleryUIStyle`), search, pending (opting-in/out) items, an empty/no-content state with a receive action, and a sort sub-screen (`Sort/SortCollectibleListViewController`). The bar-button "add" opens the receive flow; an opt-in banner button toggles based on header visibility.
- **Detail** (`Detail/`) — `CollectibleDetailViewController` renders a single `CollectibleAsset`: a paged media preview (image / video / audio / GIF / WebP / 3D), name, description (truncatable show-more/less), properties, asset ID, creator account, and account-information rows. It drives opt-in / opt-out, send, copy-media, save-to-photos, and share actions, including Ledger-signed transactions via `TransactionController`.
- **Receive** (`Receive/`) — a two-step select-account (`ReceiveCollectibleAccountListViewController`) then select-asset (`ReceiveCollectibleAssetListViewController`) flow that opts the chosen account in to a collectible so it can be received.
- **Send** (`Send/`) — `SendCollectibleViewController` and the `ApproveCollectibleTransactionViewController` bottom sheet compose, preview, and approve a collectible transfer (including ask-receiver-to-opt-in handling and Ledger signing).
- **Filter** (`Filter/`) — `CollectiblesFilterSelectionViewController` toggles persisted display options (show opted-in assets, show watch-account assets) backed by `CollectibleFilterOptionsCache`.
- **FullScreen** (`FullScreen/`) and **3DCard** (`3DCard/`) — full-screen image/video viewers and a 3D card viewer reachable from the media preview.

Ownership boundary: this is internal app-target UI built on the MVVM + DataController/DataSource + Theme conventions of the Pera Wallet app. It consumes models, services, and transaction infrastructure from `pera_wallet_core`; it does not expose a public library surface.

## Public API

| Export | Description |
|--------|-------------|
| `calculatePreferredSize` | Macaroon view-sizing hook computing a cell/view's preferred size for a given view model and layout sizing constraints. |

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. State-changing collectible actions (send, opt-in, opt-out) are blocked on accounts that cannot authorize: when `account.authorization.isNoAuth` an error banner ("action not available for account type") is shown instead. Watch accounts surface a read-only gallery (the watch-account filter governs whether their collectibles appear at all).
3. Quick actions reflect the on-chain opt-in status: the detail screen only shows the opt-in quick action when `accountCollectibleStatus == .notOptedIn` and the opt-out quick action when `== .optedIn`; after a successful opt-in/opt-out the quick action is removed and the list is reloaded.
4. Opt-in / opt-out / send transactions are monitored via `sharedDataController.blockchainUpdatesMonitor`; on any failure, cancellation, or Ledger reset the corresponding monitoring is cancelled and the loading indicator is stopped, so the UI never stays stuck "loading".
5. List and detail stay in sync through `NotificationCenter`: opting in/out or sending posts `CollectibleListLocalDataController.didAddCollectible` / `.didRemoveCollectible` / `.didSendCollectible`, which the local data controller observes to reload the gallery.
6. Switching the gallery layout (grid ⇄ list) temporarily disables list updates (`canPerformUpdates`) to avoid inconsistent snapshot application during the transition.

## Behavioral Examples

### Scenario: Receiving a collectible from an empty gallery
- **Given** an authorizable account is showing the collectible gallery
- **When** the user taps the "+" (add) bar button, or the receive action in the no-content state (`.didTapReceive`)
- **Then** `CollectiblesViewController` presents `ReceiveCollectibleAccountListViewController`; selecting an account proceeds to `ReceiveCollectibleAssetListViewController`, and confirming an asset composes an opt-in transaction so the collectible can be received.

### Scenario: Opting out of a collectible from the detail screen
- **Given** the collectible detail screen for an account that is opted in (`accountCollectibleStatus == .optedIn`)
- **When** the user triggers the opt-out quick action and approves the bottom-sheet confirmation
- **Then** `CollectibleDetailTransactionController.optOutAsset` composes the transaction (prompting Ledger connect/sign if `account.requiresLedgerConnection()`); on success the quick action is removed, `didRemoveCollectible` is posted, the data controller reloads, and the appropriate `Event` (`.didOptOutAssetFromAccount` / `.didOptOutFromAssetWithQuickAction`) is emitted to the host.

### Scenario: Sending a collectible to a receiver that has not opted in
- **Given** the send-collectible flow with a valid receiver address entered
- **When** the user submits and the receiver has not opted in to the asset
- **Then** `SendCollectibleViewController` presents the ask-receiver-to-opt-in bottom sheet rather than broadcasting; once the receiver opts in (or for a normal receiver) the approve-transaction sheet (`ApproveCollectibleTransactionViewController`) is shown for final confirmation and signing.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Gallery/list fetch fails (`.didFinishRunning(hasError: true)`) | `CollectiblesViewController` presents a bottom actionable fetch-error banner with a retry action; dismissed on the next successful run. |
| Collectible detail API response fails (`.didResponseFail`) | Bottom fetch-error banner ("generic api error" + message); retry re-invokes `dataController.load()`. |
| Copy-image media download fails (`.didImageResponseFail`) | Loading stops; fetch-error banner with retry that restarts loading and re-requests the image data to copy. |
| Save-media download fails (`.didMediaResponseFail`) | Loading stops; fetch-error banner with retry that re-downloads the media for the displayed media's extension. |
| Action attempted on a no-auth account (send / opt-in / opt-out) | Error banner "action not available for account type"; no transaction is composed. |
| Opt-out attempted on a collectible whose creator is the account (`.optOutFromCreator`) | Error banner "asset-creator-opt-out-error-message". |
| Transaction amount below minimum (`.minimumAmount`) | Error banner with the formatted minimum Algo amount required. |
| Ledger pairing/connection failure (`.ledgerConnection`) | Ledger connection screen is dismissed and a Ledger pairing-issue warning sheet is presented. |
| Transaction compose/broadcast network or SDK error | `transactionController(_:didFailedComposing:)` / `didFailedTransaction:` stop loading, cancel opt-in/out monitoring, and present an error banner with the API/SDK description. |
| Receiver not opted in (send flow) | Ask-receiver-to-opt-in bottom sheet is presented instead of broadcasting the transfer. |

## Dependencies

| Module | Usage |
|--------|-------|
| `pera_wallet_core` | Domain models (`CollectibleAsset`, `Account`, `AssetDecoration`, `Media`), `SharedDataController` + `blockchainUpdatesMonitor`, `AccountsServiceable`, currency formatting, and analytics. |
| `TransactionController` (app + core) | Composes and broadcasts opt-in / opt-out / send transactions; drives Ledger connection and sign-with-Ledger flows. |
| `CollectibleDetailTransactionController` (this module) | Wraps `TransactionController` for the detail screen's opt-in/opt-out, including joint-account transaction handling. |
| Screen routing (`Screen` / `open(_:by:)`) | Navigation to `sendTransaction`, `optInAsset`, `optOutAsset`, `asaDetail`, `asaDiscovery`, share activity, and the receive sub-flows. |
| `CopyToClipboardController` | Copy address / asset ID / URL / image to clipboard. |
| `BottomActionableBannerController`, `BottomSheetTransition`, `BannerController` | Error banners, bottom-sheet presentation (opt-in/out, approve, ask-to-opt-in, Ledger, warnings). |
| MacaroonUIKit / MacaroonURLImage / MacaroonUtils / SnapKit | Layout, theming (`*Theme` files), `calculatePreferredSize` sizing, remote image loading, and layout constraints. |
| AVFoundation / SceneKit (via media + 3DCard) | Video/audio playback (`VideoPlayerView`, `AudioPlayerView`) and 3D collectible viewing. |
| `JointAccountTransactionCoordinator` | Coordinates opt-in/send transactions for joint (shared) accounts in the receive/send flows. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
