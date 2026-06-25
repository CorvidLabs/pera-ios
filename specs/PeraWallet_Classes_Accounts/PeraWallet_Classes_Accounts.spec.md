---
module: PeraWallet_Classes_Accounts
version: 1
status: active
files:
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Cells/AddressCell/SelectAddressCell.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Cells/AddressCell/SelectAddressListItemAccessory.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Cells/AddressCell/SelectAddressListItemTheme.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Cells/AddressCell/SelectAddressListItemView.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Cells/AddressCell/SelectAddressListItemViewModel.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Cells/AlreadyImportedAddressCell/AlreadyImportedAddressCell.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Cells/AlreadyImportedAddressCell/AlreadyImportedAddressListItemTheme.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Cells/AlreadyImportedAddressCell/AlreadyImportedAddressListItemView.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Cells/AlreadyImportedAddressCell/AlreadyImportedAddressListItemViewModel.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Data/SelectAddressListDataController.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Header/SelectAddressListHeaderItemState.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Header/SelectAddressListHeaderView.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Header/SelectAddressListHeaderViewModel.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Screens/SelectAddressViewController.swift
  - PeraWallet/Classes/Accounts/AccountDiscovery/SelectAddress/Screens/SelectAddressViewControllerTheme.swift
  - PeraWallet/Classes/Accounts/AccountList/Data/AccountListDataSource.swift
  - PeraWallet/Classes/Accounts/AccountList/Screens/AccountListViewController.swift
  - PeraWallet/Classes/Accounts/AccountList/Screens/AccountListViewController+Theme.swift
  - PeraWallet/Classes/Accounts/AccountList/ViewModels/AccountCellViewModel.swift
  - PeraWallet/Classes/Accounts/AccountList/ViewModels/AccountListViewModel.swift
  - PeraWallet/Classes/Accounts/AccountList/Views/AccountListView.swift
  - PeraWallet/Classes/Accounts/AccountList/Views/AccountListViewTheme.swift
  - PeraWallet/Classes/Accounts/AccountSearchRecovery/AccountSearchRecoveryScreen.swift
  - PeraWallet/Classes/Accounts/AccountSearchRecovery/RecoveryToolModel.swift
  - PeraWallet/Classes/Accounts/AccountSearchRecovery/RecoveryToolView.swift
  - PeraWallet/Classes/Accounts/AccountSelection/AccountSelectionListLayout.swift
  - PeraWallet/Classes/Accounts/AccountSelection/AccountSelectionListScreen.swift
  - PeraWallet/Classes/Accounts/AccountSelection/AccountSelectionListScreenTheme.swift
  - PeraWallet/Classes/Accounts/AccountSelection/Data/AccountSelectionListDataController.swift
  - PeraWallet/Classes/Accounts/AccountSelection/Data/AccountSelectionListDataSource.swift
  - PeraWallet/Classes/Accounts/AccountSelection/Views/LoadingAccountItem/AccountSelectionListLoadingAccountItemCell.swift
  - PeraWallet/Classes/Accounts/AccountSelection/Views/LoadingAccountItem/AccountSelectionListLoadingAccountItemCellTheme.swift
  - PeraWallet/Classes/Accounts/AccountSelection/Views/LoadingAccountItem/AccountSelectionListLoadingAccountItemView.swift
  - PeraWallet/Classes/Accounts/AccountSelection/Views/LoadingAccountItem/AccountSelectionListLoadingAccountItemViewTheme.swift
  - PeraWallet/Classes/Accounts/AccountSelection/Views/NoContent/AccountSelectionListNoContentCell.swift
  - PeraWallet/Classes/Accounts/AccountSelection/Views/NoContent/AccountSelectionListNoContentViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/AnyToNoAuthRekeyedAccountInformation/AnyToNoAuthRekeyedAccountInformationScreen.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/AnyToNoAuthRekeyedAccountInformation/AnyToNoAuthRekeyedAccountInformationScreenTheme.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/AnyToNoAuthRekeyedAccountInformation/Views/AnyToNoAuthRekeyedAccountTypeInformationViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/LedgerAccountInformation/LedgerAccountInformationScreen.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/LedgerAccountInformation/LedgerAccountInformationScreenTheme.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/LedgerAccountInformation/Views/LedgerAccountTypeInformationViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/NoAuthAccountInformation/NoAuthAccountInformationScreen.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/NoAuthAccountInformation/NoAuthAccountInformationScreenTheme.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/NoAuthAccountInformation/Views/NoAuthAccountTypeInformationViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/RekeyedAccountInformation/RekeyedAccountInformationScreen.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/RekeyedAccountInformation/RekeyedAccountInformationScreenTheme.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/RekeyedAccountInformation/Views/RekeyedAccountInformationAccountItem/RekeyedAccountInformationAccountItemView.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/RekeyedAccountInformation/Views/RekeyedAccountInformationAccountItem/RekeyedAccountInformationAccountItemViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/RekeyedAccountInformation/Views/RekeyedAccountInformationAccountItem/RekeyedAccountInformationAccountItemViewTheme.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/RekeyedAccountInformation/Views/RekeyedAccountTypeInformation/RekeyedAccountTypeInformationViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/RekeyedJointAccountInformation/RekeyedJointAccountInformationScreen.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/Shared/Views/AccountInformationAccountItem/AccountInformationCopyAccountItemViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/Shared/Views/AccountInformationAccountItem/AccountInformationNoAuthAccountItemViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/Shared/Views/AccountInformationAccountItem/AccountInformationUndoRekeyAccountItemViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/Shared/Views/AccountInformationOptionsView/AccountInformationOptionItem.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/Shared/Views/AccountInformationOptionsView/AccountInformationOptionItemViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/Shared/Views/AccountInformationOptionsView/AccountInformationOptionsView.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/Shared/Views/AccountInformationOptionsView/AccountInformationOptionsViewTheme.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/Shared/Views/AccountTypeInformation/AccountTypeInformationView.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/Shared/Views/AccountTypeInformation/AccountTypeInformationViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/Shared/Views/AccountTypeInformation/AccountTypeInformationViewTheme.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/StandardAccountInformation/StandardAccountInformationScreen.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/StandardAccountInformation/StandardAccountInformationScreenTheme.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/StandardAccountInformation/Views/AddressScanButton.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/StandardAccountInformation/Views/CombinedAccountListItemView.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/StandardAccountInformation/Views/StandardAccountTypeInformationViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/WatchAccountInformation/Views/WatchAccountTypeInformationViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/WatchAccountInformation/WatchAccountInformationScreen.swift
  - PeraWallet/Classes/Accounts/Detail/AccountInformation/WatchAccountInformation/WatchAccountInformationScreenTheme.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Screens/AccountAssetListAPIDataController.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Screens/AccountAssetListDataController.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Screens/AccountAssetListDataSource.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Screens/AccountAssetListLayout.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Screens/AccountAssetListLayout+Theme.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Screens/AccountAssetListQuery.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Screens/AccountAssetListViewController.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Screens/AccountAssetListViewController+Theme.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/AccountAssetListLoadingCell/AccountAssetListLoadingCell.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/AccountAssetListLoadingCell/AccountAssetListLoadingView.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/AccountAssetListLoadingCell/AccountAssetListLoadingViewTheme.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/AccountNotBackedUpWarningItem/AccountDetailAccountNotBackedUpWarningCell.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/AccountNotBackedUpWarningItem/AccountDetailAccountNotBackedUpWarningModel.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/AddAssetItemView.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/AddAssetItemViewTheme.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/AssetTitleItem/AssetTitleItemCell.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/ManagementItem/ManagementItemAccountDetailCell.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/ManagementItem/ManagementItemAccountDetailView.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/ManagementItem/ManagementItemAccountDetailViewTheme.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/ManagementItem/ManagementItemCell.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/ManagementItem/ManagementItemView.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/ManagementItem/ManagementItemViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/ManagementItem/ManagementItemViewTheme.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/List/Views/ManagementItem/ManagementItemWithSecondaryActionCell.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/Search/Screens/AssetSearchListHeaderViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/Search/Screens/AssetSearchViewController+Theme.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/Sort/SortAccountAssetListDataController.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/Sort/SortAccountAssetListDataSource.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/Sort/SortAccountAssetListLayout.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/Sort/SortAccountAssetListLocalDataController.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/Sort/SortAccountAssetListViewController.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/Verification/ViewModels/AssetLearnMoreListItemButtonViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/Verification/ViewModels/AssetVerificationInfoViewModel.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/Verification/Views/AssetVerificationInfoView.swift
  - PeraWallet/Classes/Accounts/Detail/Assets/Verification/Views/AssetVerificationInfoViewTheme.swift
  - PeraWallet/Classes/Accounts/Detail/Collectibles/Screens/Filter/AccountCollectibleListFilterSelectionViewController.swift
  - PeraWallet/Classes/Accounts/Detail/Collectibles/Screens/Filter/AccountCollectibleListFilterSelectionViewControllerTheme.swift
  - PeraWallet/Classes/Accounts/Detail/Collectibles/Screens/List/AccountCollectibleListViewController.swift
  - PeraWallet/Classes/Accounts/Detail/Main/Screens/AccountDetailViewController.swift
  - PeraWallet/Classes/Accounts/Detail/Main/Screens/AccountDetailViewController+Theme.swift
  - PeraWallet/Classes/Accounts/Detail/Main/Screens/AccountInformationFlowCoordinator.swift
  - PeraWallet/Classes/Accounts/Detail/Main/Screens/Data/AccountDetailAPIDataController.swift
  - PeraWallet/Classes/Accounts/Detail/Main/Screens/Data/AccountDetailDataController.swift
  - PeraWallet/Classes/Accounts/Detail/Main/Screens/Handlers/ImportAccountsHandler.swift
  - PeraWallet/Classes/Accounts/Detail/Main/Screens/RekeyToJointAccountFlowCoordinator.swift
  - PeraWallet/Classes/Accounts/Detail/Main/Screens/RekeyToLedgerAccountFlowCoordinator.swift
  - PeraWallet/Classes/Accounts/Detail/Main/Screens/RekeyToStandardAccountFlowCoordinator.swift
  - PeraWallet/Classes/Accounts/Detail/Main/Screens/UndoRekeyFlowCoordinator.swift
  - PeraWallet/Classes/Accounts/Detail/Main/Views/SearchBarItemView.swift
  - PeraWallet/Classes/Accounts/Detail/Main/Views/SearchBarItemViewTheme.swift
  - PeraWallet/Classes/Accounts/Detail/RemoveAccount/BackUpBeforeRemovingAccountWarning/BackUpBeforeRemovingAccountWarningSheet.swift
  - PeraWallet/Classes/Accounts/Detail/RemoveAccount/RemoveAccountFlowCoordinator.swift
  - PeraWallet/Classes/Accounts/Detail/RemoveAccount/RemoveAccountSheet.swift
  - PeraWallet/Classes/Accounts/Detail/RemoveAccount/Validator/RemoveAccountAuthorizationValidator.swift
  - PeraWallet/Classes/Accounts/Detail/RemoveAccount/Validator/RemoveAuthAccountAuthorizationValidator.swift
  - PeraWallet/Classes/Accounts/Detail/Transactions/Screens/AccountTransactionListViewController.swift
  - PeraWallet/Classes/Accounts/List/Layout/AccountListLayoutBuilder.swift
  - PeraWallet/Classes/Accounts/List/Screens/HomeListLayout.swift
  - PeraWallet/Classes/Accounts/List/Screens/HomeViewController.swift
  - PeraWallet/Classes/Accounts/List/Screens/Invalid/InvalidAccountOptionsViewController.swift
  - PeraWallet/Classes/Accounts/List/Screens/Invalid/InvalidAccountOptionsViewControllerTheme.swift
  - PeraWallet/Classes/Accounts/List/Screens/Sort/AccountOrderingListItemCell.swift
  - PeraWallet/Classes/Accounts/List/Screens/Sort/SortAccountListDataController.swift
  - PeraWallet/Classes/Accounts/List/Screens/Sort/SortAccountListDataSource.swift
  - PeraWallet/Classes/Accounts/List/Screens/Sort/SortAccountListLayout.swift
  - PeraWallet/Classes/Accounts/List/Screens/Sort/SortAccountListLocalDataController.swift
  - PeraWallet/Classes/Accounts/List/Screens/Sort/SortAccountListOrderTitleViewModel.swift
  - PeraWallet/Classes/Accounts/List/Screens/Sort/SortAccountListTitleSupplementaryHeader.swift
  - PeraWallet/Classes/Accounts/List/Screens/Sort/SortAccountListViewController.swift
  - PeraWallet/Classes/Accounts/List/ViewModels/AlgoAssetViewModel.swift
  - PeraWallet/Classes/Accounts/List/ViewModels/AssetViewModel.swift
  - PeraWallet/Classes/Accounts/List/ViewModels/Calculation/PortfolioCalculationDescriptionViewModel.swift
  - PeraWallet/Classes/Accounts/List/ViewModels/Header/SingleLineTitleActionViewModel.swift
  - PeraWallet/Classes/Accounts/List/ViewModels/Main/AccountPortfolioViewModel.swift
  - PeraWallet/Classes/Accounts/List/ViewModels/Main/WatchAccountPortfolioViewModel.swift
  - PeraWallet/Classes/Accounts/List/Views/AssetListSearchNoContentViewModel.swift
  - PeraWallet/Classes/Accounts/List/Views/Header/SingleLineTitleActionView.swift
  - PeraWallet/Classes/Accounts/List/Views/Header/SingleLineTitleActionViewTheme.swift
  - PeraWallet/Classes/Accounts/List/Views/Main/AccountPortfolioCell.swift
  - PeraWallet/Classes/Accounts/List/Views/Main/AccountPortfolioView.swift
  - PeraWallet/Classes/Accounts/List/Views/Main/AccountPortfolioViewTheme.swift
  - PeraWallet/Classes/Accounts/List/Views/Main/WatchAccountPortfolioCell.swift
  - PeraWallet/Classes/Accounts/List/Views/Main/WatchAccountPortfolioView.swift
  - PeraWallet/Classes/Accounts/List/Views/Main/WatchAccountPortfolioViewTheme.swift
  - PeraWallet/Classes/Accounts/List/Views/TestNetTitleView.swift
  - PeraWallet/Classes/Accounts/List/Views/TestNetTitleViewTheme.swift
  - PeraWallet/Classes/Accounts/Options/Edit/Screens/EditAccountViewController.swift
  - PeraWallet/Classes/Accounts/Options/Edit/Views/EditAccountView.swift
  - PeraWallet/Classes/Accounts/Options/List/Screens/OptionsViewController.swift
  - PeraWallet/Classes/Accounts/Options/List/Screens/OptionsViewController+Theme.swift
  - PeraWallet/Classes/Accounts/Options/Passphrase/Screens/PassphraseDisplayViewController.swift
  - PeraWallet/Classes/Accounts/Options/Passphrase/Screens/PassphraseDisplayViewController+Theme.swift
  - PeraWallet/Classes/Accounts/Options/Passphrase/Views/PassphraseDisplayView.swift
  - PeraWallet/Classes/Accounts/Options/Passphrase/Views/PassphraseDisplayViewTheme.swift
  - PeraWallet/Classes/Accounts/Options/Passphrase/Warning/Cells/WarningCheckCell.swift
  - PeraWallet/Classes/Accounts/Options/Passphrase/Warning/Cells/WarningCheckView.swift
  - PeraWallet/Classes/Accounts/Options/Passphrase/Warning/Cells/WarningCheckViewAccessory.swift
  - PeraWallet/Classes/Accounts/Options/Passphrase/Warning/Cells/WarningCheckViewTheme.swift
  - PeraWallet/Classes/Accounts/Options/Passphrase/Warning/Data/PassphraseWarningDataController.swift
  - PeraWallet/Classes/Accounts/Options/Passphrase/Warning/Screens/PassphraseWarningScreen.swift
  - PeraWallet/Classes/Accounts/Options/Passphrase/Warning/Screens/PassphraseWarningScreenTheme.swift
  - PeraWallet/Classes/Accounts/Options/RenameAccount/RenameAccountScreen.swift
  - PeraWallet/Classes/Accounts/Options/RenameAccount/RenameAccountScreenTheme.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Data/ReceiverAccountSelectionListDataController.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Data/ReceiverAccountSelectionListDataSource.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Screens/ReceiverAccountSelectionListAPIDataController.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Screens/ReceiverAccountSelectionListLayout.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Screens/ReceiverAccountSelectionListScreen.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Screens/ReceiverAccountSelectionListScreenTheme.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Views/AccountClipboardView.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Views/AccountClipboardViewModel.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Views/AccountClipboardViewTheme.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Views/ReceiverAccountSelectionListContactCell.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Views/ReceiverAccountSelectionListHeaderViewModel.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Views/ReceiverAccountSelectionListTitleSupplementaryCell.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Views/ReceiverAccountSelectionNoContentViewModel.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Views/ReceiverAccountSelectionPreviewCell.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Views/SelectContactView.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Views/SelectContactViewTheme.swift
  - PeraWallet/Classes/Accounts/ReceiverAccountSelection/Views/TitleVIewTheme+ReceiverAccountSelectionList.swift
  - PeraWallet/Classes/Accounts/Rewards/Screens/RewardDetailViewController.swift
  - PeraWallet/Classes/Accounts/Rewards/ViewModels/RewardDetailViewModel.swift
  - PeraWallet/Classes/Accounts/Rewards/Views/RewardDetailView.swift
  - PeraWallet/Classes/Accounts/Rewards/Views/RewardDetailViewTheme.swift
  - PeraWallet/Classes/Accounts/Select/Screens/AccountSelectScreen.swift
  - PeraWallet/Classes/Accounts/Select/Screens/AccountSelectScreenListAPIDataController.swift
  - PeraWallet/Classes/Accounts/SelectAccount/Data/SelectAccountAPIDataController.swift
  - PeraWallet/Classes/Accounts/SelectAccount/Data/SelectAccountDataController.swift
  - PeraWallet/Classes/Accounts/SelectAccount/Data/SelectAccountDataSource.swift
  - PeraWallet/Classes/Accounts/SelectAccount/Screens/SelectAccountListLayout.swift
  - PeraWallet/Classes/Accounts/SelectAccount/Screens/SelectAccountViewController.swift
  - PeraWallet/Classes/Accounts/SelectAccount/Screens/SelectAccountViewController+Theme.swift
  - PeraWallet/Classes/Accounts/SelectAccount/ViewModels/SelectAccountNoContentViewModel.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Accounts

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Accounts`). Internal-by-default; see Public API for any cross-module-public surface.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

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
