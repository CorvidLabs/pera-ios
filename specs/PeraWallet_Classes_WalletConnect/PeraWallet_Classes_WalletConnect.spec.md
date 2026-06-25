---
module: PeraWallet_Classes_WalletConnect
version: 1
status: active
files:
  - PeraWallet/Classes/WalletConnect/Connection/Approval/Screens/WCConnectionApprovalViewController.swift
  - PeraWallet/Classes/WalletConnect/Connection/Data/WCSessionConnectionDataController.swift
  - PeraWallet/Classes/WalletConnect/Connection/Data/WCSessionConnectionDataSource.swift
  - PeraWallet/Classes/WalletConnect/Connection/Data/WCSessionConnectionLocalDataController.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/Account/WCSessionConnectionAccountCell.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/Account/WCSessionConnectionAccountCellTheme.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/Account/WCSessionConnectionAccountListItemAccessory.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/Header/WCSessionConnectionHeader.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/Header/WCSessionConnectionHeaderView.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/Header/WCSessionConnectionHeaderViewModel.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/Header/WCSessionConnectionHeaderViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/Header/WCSessionConnectionSelectAccountHeaderViewModel.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/Profile/WCSessionConnectionProfileCell.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/Profile/WCSessionConnectionProfileView.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/Profile/WCSessionConnectionProfileViewModel.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/Profile/WCSessionConnectionProfileViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/RequestedPermissions/WCSessionEventsRequestedPermissionViewModel.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/RequestedPermissions/WCSessionMethodsRequestedPermissionViewModel.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/RequestedPermissions/WCSessionRequestedPermissionItemCell.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/RequestedPermissions/WCSessionRequestedPermissionItemCellTheme.swift
  - PeraWallet/Classes/WalletConnect/Connection/Views/RequestedPermissions/WCSessionRequestedPermissionItemView.swift
  - PeraWallet/Classes/WalletConnect/Connection/WCSessionConnectionListLayout.swift
  - PeraWallet/Classes/WalletConnect/Connection/WCSessionConnectionScreen.swift
  - PeraWallet/Classes/WalletConnect/Connection/WCSessionConnectionScreenTheme.swift
  - PeraWallet/Classes/WalletConnect/Sessions/DataSource/List/WCSessionListDataController.swift
  - PeraWallet/Classes/WalletConnect/Sessions/DataSource/List/WCSessionListDataSource.swift
  - PeraWallet/Classes/WalletConnect/Sessions/DataSource/List/WCSessionListLocalDataController.swift
  - PeraWallet/Classes/WalletConnect/Sessions/DataSource/ShortList/WCSessionShortListDataSource.swift
  - PeraWallet/Classes/WalletConnect/Sessions/ExtendWCSessionValiditySheet/ExtendWCSessionValiditySheet.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Layout/List/WCSessionListLayout.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Layout/ShortList/WCSessionShortListLayout.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Screens/List/WCSessionListViewController.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Screens/List/WCSessionListViewControllerTheme.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Screens/ShortList/WCSessionShortListViewController.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Screens/ShortList/WCSessionShortListViewController+Theme.swift
  - PeraWallet/Classes/WalletConnect/Sessions/ViewModels/List/WCSessionItemViewModel.swift
  - PeraWallet/Classes/WalletConnect/Sessions/ViewModels/ShortList/WCSessionShortListItemViewModel.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Views/Empty/WCSessionListNoContentViewModel.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Views/List/Item/WCSessionItemCell.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Views/List/Item/WCSessionItemView.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Views/List/Item/WCSessionItemViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Views/ShortList/Item/WCSessionShortListItemCell.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Views/ShortList/Item/WCSessionShortListItemView.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Views/ShortList/Item/WCSessionShortListItemViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Views/ShortList/WCSessionShortListView.swift
  - PeraWallet/Classes/WalletConnect/Sessions/Views/ShortList/WCSessionShortListViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCAdvancedSessionsInfo/WCAdvancedPermissionsInfoSheet.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionConnectionSuccessfulSheet/WCSessionConnectionSuccessfulSheet.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/AdvancedPermissions/Cell/WCSessionAdvancedPermissionCell.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/AdvancedPermissions/Cell/WCSessionAdvancedPermissionViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/AdvancedPermissions/Cell/WCSessionSupportedEventsAdvancedPermissionViewModel.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/AdvancedPermissions/Cell/WCSessionSupportedMethodsAdvancedPermissionViewModel.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/AdvancedPermissions/Header/WCSessionAdvancedPermissionsHeader.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/AdvancedPermissions/Header/WCSessionAdvancedPermissionsHeaderContentConfiguration.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/AdvancedPermissions/Header/WCSessionAdvancedPermissionsHeaderView.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/AdvancedPermissions/Header/WCSessionAdvancedPermissionsHeaderViewModel.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/AdvancedPermissions/Header/WCSessionAdvancedPermissionsHeaderViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/ConnectedAccounts/Cell/WCSessionConnectedAccountListItemCell.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/ConnectedAccounts/Header/WCSessionConnectedAccountsHeader.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/ConnectedAccounts/Header/WCSessionConnectedAccountsHeaderTheme.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/ConnectedAccounts/Header/WCSessionConnectedAccountsHeaderViewModel.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/Info/WCSessionConnectionDateSecondaryListItemViewModel.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/Info/WCSessionExpirationDateSecondaryListItemViewModel.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/Info/WCSessionInfoCell.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/Info/WCSessionInfoView.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/Info/WCSessionInfoViewModel.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/Info/WCSessionInfoViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/Info/WCSessionStatus.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/Info/WCSessionStatusSecondaryListItemViewModel.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/Profile/WCSessionProfileCell.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/Profile/WCSessionProfileView.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/Profile/WCSessionProfileViewModel.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/Profile/WCSessionProfileViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/WCV1Info/WCV1SessionBadgeCell.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/WCV1Info/WCV1SessionBadgeView.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/WCV1Info/WCV1SessionBadgeViewModel.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/Views/WCV1Info/WCV1SessionBadgeViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/WCSessionDetailDataController.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/WCSessionDetailDataSource.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/WCSessionDetailLayout.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/WCSessionDetailLocalDataController.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/WCSessionDetailScreen.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCSessionDetail/WCSessionDetailScreenTheme.swift
  - PeraWallet/Classes/WalletConnect/Sessions/WCTransactionSignSuccessfulSheet/WCTransactionSignSuccessfulSheet.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Algos/Screens/WCAlgosTransactionViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Algos/ViewModels/WCAlgosTransactionViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Algos/Views/WCAlgosTransactionView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Algos/Views/WCAlgosTransactionViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AppCall/Screens/WCAppCallTransactionViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AppCall/ViewModels/WCAppCallTransactionViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AppCall/Views/WCAppCallTransactionView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AppCall/Views/WCAppCallTransactionViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/ArbitraryData/Views/WCArbitraryDataView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/ArbitraryData/Views/WCArbitraryDataView+Theme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/ArbitraryData/Views/WCArbitraryDataViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/ArbitraryData/WCArbitraryDataViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Asset/Screens/WCAssetTransactionViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Asset/ViewModels/WCAssetInformationViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Asset/ViewModels/WCAssetTransactionViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Asset/Views/WCAssetInformationView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Asset/Views/WCAssetInformationViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Asset/Views/WCAssetTransactionView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Asset/Views/WCAssetTransactionViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetAddition/Screens/WCAssetAdditionTransactionViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetAddition/ViewModels/WCAssetAdditionTransactionViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetAddition/Views/WCAssetAdditionTransactionView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetAddition/Views/WCAssetAdditionTransactionViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetConfig/Screens/WCAssetCreationTransactionViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetConfig/Screens/WCAssetDeletionTransactionViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetConfig/Screens/WCAssetReconfigurationTransactionViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetConfig/ViewModels/WCAssetCreationTransactionViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetConfig/ViewModels/WCAssetDeletionTransactionItemViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetConfig/ViewModels/WCAssetReconfigurationTransactionViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetConfig/Views/WCAssetCreationTransactionView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetConfig/Views/WCAssetCreationTransactionViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetConfig/Views/WCAssetDeletionTransactionView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetConfig/Views/WCAssetDeletionTransactionViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetConfig/Views/WCAssetReconfigurationTransactionView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/AssetConfig/Views/WCAssetReconfigurationTransactionViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/Screens/Detail/JSONDisplayViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/Screens/WCSingleTransactionViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/Screens/WCTransactionFullDappDetailViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/Screens/WCTransactionFullDappDetailViewController+Theme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/ViewModels/Detail/JSONDisplayViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/ViewModels/Detail/WCTransactionActionableInformationViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/ViewModels/Message/WCTransactionDappMessageViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/ViewModels/Message/WCTransactionFullDappDetailConfigurator.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/ViewModels/Warning/WCTransactionWarningViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/Views/Detail/JSONDisplayView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/Views/Message/WCTransactionDappMessageView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/Views/Message/WCTransactionFullDappDetailView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/Views/Message/WCTransactionFullDappDetailViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/Views/Warning/WCTransactionWarningView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Common/Views/WCSingleTransactionView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/DataSource/WCGroupTransactionDataSource.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/Layout/WCGroupTransactionLayout.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/Screens/WCGroupTransactionViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/ViewModels/Header/WCGroupTransactionHeaderViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/ViewModels/Item/WCGroupTransactionAccountInformationViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/ViewModels/Item/WCGroupTransactionItemViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/Views/Header/WCGroupTransactionHeaderView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/Views/Header/WCGroupTransactionSupplementaryHeaderView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/Views/Item/WCAccountInformationNameView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/Views/Item/WCGroupAnotherAccountTransactionItemCell.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/Views/Item/WCGroupTransactionAccountInformationView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/Views/Item/WCGroupTransactionItemCell.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/Views/Item/WCGroupTransactionItemView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/Views/WCGroupTransactionView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Group/Views/WCGroupTransactionViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/KeyReg/Views/WCKeyRegTransactionView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/KeyReg/Views/WCKeyRegTransactionView+Theme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/KeyReg/Views/WCKeyRegTransactionViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/KeyReg/WCKeyRegTransactionViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/DataSource/ArbitraryData/WCMainArbitraryDataDataSource.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/DataSource/Transaction/WCMainTransactionDataSource.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Fragments/WCDetailOverlayFragment.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Fragments/WCScrollOverlayFragment.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Layout/ArbitraryData/WCMainArbitraryDataLayout.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Layout/Transaction/WCMainTransactionLayout.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Screens/Main/ArbitraryData/WCMainArbitraryDataScreen.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Screens/Main/ArbitraryData/WCMainArbitraryDataScreen+Theme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Screens/Main/Transaction/WCMainTransactionScreen.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Screens/Main/Transaction/WCMainTransactionScreen+Theme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Screens/SingleRequest/ArbitraryData/WCSingleArbitraryDataRequestScreen.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Screens/SingleRequest/ArbitraryData/WCSingleArbitraryDataRequestScreen+Theme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Screens/SingleRequest/Transaction/WCSingleTransactionRequestScreen.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Screens/SingleRequest/Transaction/WCSingleTransactionRequestScreen+Theme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Screens/UnsignedRequest/ArbitraryData/WCUnsignedArbitrayDataRequestScreen.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Screens/UnsignedRequest/ArbitraryData/WCUnsignedArbitrayDataRequestScreen+Theme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Screens/UnsignedRequest/Transaction/WCUnsignedRequestScreen.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Screens/UnsignedRequest/Transaction/WCUnsignedRequestScreen+Theme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/ViewModels/Item/AppCall/WCAppCallTransactionItemViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/ViewModels/Item/AssetConfig/WCAssetConfigTransactionItemViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/ViewModels/Item/WCMultipleTransactionItemViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/ViewModels/WCSingleTransactionRequestBottomViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/ViewModels/WCSingleTransactionRequestMiddleViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/ViewModels/WCSingleTransactionRequestViewModel.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/BottomOverlayTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Item/AppCall/WCAppCallTransactionItemCell.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Item/AppCall/WCAppCallTransactionItemView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Item/AssetConfig/WCAssetConfigAnotherAccountTransactionItemCell.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Item/AssetConfig/WCAssetConfigTransactionItemCell.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Item/AssetConfig/WCAssetConfigTransactionItemView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Item/WCMultipleTransactionItemCell.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Item/WCMultipleTransactionItemView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Rekey Support/RekeySupportHandler.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Rekey Support/RekeySupportOverlayView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Rekey Support/RekeySupportOverlayViewController.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Request/WCSingleTransactionRequestBottomView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Request/WCSingleTransactionRequestBottomViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Request/WCSingleTransactionRequestMiddleView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Request/WCSingleTransactionRequestMiddleViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Request/WCSingleTransactionRequestView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Request/WCSingleTransactionRequestViewTheme.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Request/WCUnsignedRequestView.swift
  - PeraWallet/Classes/WalletConnect/Transaction/Main/Views/Request/WCUnsignedRequestViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_WalletConnect

## Purpose

App-target UI/feature module (`PeraWallet/Classes/WalletConnect`). Internal-by-default; see Public API for any cross-module-public surface.

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
