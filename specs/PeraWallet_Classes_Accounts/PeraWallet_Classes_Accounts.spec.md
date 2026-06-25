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

App-target UI/feature module (`PeraWallet/Classes/Accounts`) covering the
account-centric screens and flows of Pera Wallet. It owns:

- **Home / Account List** (`List/Screens/HomeViewController`,
  `AccountList/`) — the portfolio landing screen that lists every local
  account, total portfolio value, watch-account variants, TestNet banner,
  and account ordering/sorting.
- **Account Detail** (`Detail/Main/Screens/AccountDetailViewController`) — a
  `PageContainer` paging between three tabs: Assets
  (`Detail/Assets/List/AccountAssetListViewController`), Collectibles
  (`Detail/Collectibles/`), and Transactions
  (`Detail/Transactions/`). It is the launch point for send / receive / swap /
  buy-sell / fund actions, asset management (add, remove, sort, filter), and
  the account options menu.
- **Account Information sheets** (`Detail/AccountInformation/`) — per
  authorization-type bottom sheets (Standard, Watch, Ledger, No-Auth, Rekeyed,
  Rekeyed-Joint, Any-to-No-Auth-Rekeyed) routed by
  `AccountInformationFlowCoordinator` based on `account.authorization`.
- **Rekey / Undo-Rekey flows** (`Detail/Main/Screens/RekeyTo*FlowCoordinator`,
  `UndoRekeyFlowCoordinator`) — entry points into rekeying an account to a
  Standard, Ledger, or Joint auth account, and undoing a rekey.
- **Remove Account flow** (`Detail/RemoveAccount/`) — a back-up warning →
  confirmation sheet sequence guarded by a chain-of-responsibility authorization
  validator.
- **Account Options** (`Options/`) — view/copy passphrase (gated by local auth
  and a warning screen), rename account, edit account, and options list.
- **Account selection surfaces** — `AccountSelection/`, `SelectAccount/`,
  `Select/`, `ReceiverAccountSelection/` (send-transaction receiver picker with
  contacts + clipboard paste), and `AccountDiscovery/SelectAddress/` (HD-wallet
  address discovery / import picker).
- **Rewards detail** (`Rewards/`) and **Account Search Recovery** tool
  (`AccountSearchRecovery/`).

Ownership boundary: this module is the app-target UI layer for accounts. All
account/asset model data and persistence live in `pera_wallet_core`
(`Account`, `AccountHandle`, `SharedDataController`, `Session`); this module
only renders, navigates, and delegates mutations back to core services and
flow coordinators.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. **Authorization gates actions.** Action-bearing flows check
   `account.authorization` before proceeding. No-auth accounts cannot send,
   swap, add assets, buy/sell, or be removed via management; instead an
   "action not available for account type" banner is presented
   (`AccountDetailViewController.presentActionsNotAvailableForAccountBanner`).
3. **Account Information routing is authorization-driven and total.**
   `AccountInformationFlowCoordinator.launch(_:)` dispatches to exactly one
   sheet by inspecting `isStandard / isWatch / isLedger / isNoAuth /
   isJointAccountRekeyed / isRekeyed`, resolving the auth account from
   `sharedDataController.authAccount(of:)` for rekeyed variants.
4. **Removing an auth account is blocked while it has dependents.**
   `RemoveAuthAccountAuthorizationValidator` denies removal (chain-of-
   responsibility `RemoveAccountAuthorizationResult.denied`) when
   `sharedDataController.rekeyedAccounts(of:)` is non-empty, surfacing a banner;
   watch accounts skip the check.
5. **Passphrase reveal requires authentication + explicit acknowledgement.**
   Viewing the passphrase routes through local-auth / password confirm
   (`LocalAuthenticator`, `ChoosePasswordViewController`) and a
   `PassphraseWarningScreen` before the mnemonic is shown, and the display
   screen observes screenshot notifications.

## Behavioral Examples

### Scenario: Opening account information for a rekeyed account
- **Given** the user is on `AccountDetailViewController` for an account whose
  `authorization.isRekeyed` is true and whose auth account is known to
  `SharedDataController`
- **When** the user taps the account options bar button
- **Then** `AccountInformationFlowCoordinator` presents
  `RekeyedAccountInformationScreen` as a bottom sheet exposing rekey-to-ledger,
  rekey-to-standard, rekey-to-joint, undo-rekey, rescan, and import-connected
  options; each dismisses the sheet first, then launches the matching flow
  coordinator.

### Scenario: Removing an auth account that still has rekeyed dependents
- **Given** the user invokes "Remove account" from the options menu on an
  account that is the auth account of one or more rekeyed accounts
- **When** `RemoveAccountFlowCoordinator.launch(_:)` runs
  `RemoveAuthAccountAuthorizationValidator.validate`
- **Then** validation returns `.denied`, no removal sheet is shown, and a
  banner with the localized `remove-auth-account-rekeyed-accounts-error-title`
  (count-formatted) message is presented.

### Scenario: Sending from a no-auth account
- **Given** the user is on `AccountDetailViewController` for an account where
  `authorization.isNoAuth`
- **When** the user taps Send
- **Then** `openSendTransactionIfPossible` short-circuits and presents the
  "action-not-available-for-account-type" error banner instead of launching
  `SendTransactionFlowCoordinator`.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Action invoked on a no-auth account (send / swap / add asset / buy-sell / management remove) | Error banner `action-not-available-for-account-type`; flow not launched |
| Remove requested on an auth account with rekeyed dependents | `.denied` result; banner with rekeyed-count error message; removal sheet not shown |
| Passphrase view requested but local auth fails | Falls back to `ChoosePasswordViewController` confirm; passphrase only shown after confirmation |
| `rootViewController` unavailable when launching swap/fund tab | `guard` returns early; no navigation occurs |
| Auth account not resolvable for a rekeyed/joint account | `launch(_:)` returns without presenting a sheet (no crash) |
| Screenshot taken on passphrase display | Screenshot notification observed; user is warned (no force-unwrap path) |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core | `Account`, `AccountHandle`, `Session`, `SharedDataController`, `LocalAuthenticator`, authorization model, sorting/filter algorithms, `PassphraseUtils`, `PeraCoreManager` |
| MacaroonUIKit / MacaroonForm / MacaroonBottomSheet / MacaroonUtils | Theming, view models, list layouts, bottom-sheet transitions, base view controllers |
| Transaction flows (Send/Receive/Swap/Buy-Sell) | `SendTransactionFlowCoordinator`, `ReceiveTransactionFlowCoordinator`, `SwapAssetFlowCoordinator`, `MeldFlowCoordinator`, `BidaliFlowCoordinator`, `MoonPayFlowCoordinator` |
| Backup module | `BackUpAccountFlowCoordinator`, `AlgorandSecureBackupFlowCoordinator` |
| Rekey / Ledger | `RekeyTo{Standard,Ledger,Joint}AccountFlowCoordinator`, `UndoRekeyFlowCoordinator`, `RescanRekeyedAccountsCoordinator`, `RekeyingValidator` |
| Asset management | `AssetAdditionViewController`, `ManageAssetListViewController`, `AssetsFilterSelectionViewController` |
| QR / Clipboard | `QRCreationDraft` / `.qrGenerator`, `CopyToClipboardController` |
| Analytics | `ALGAnalyticsScreen`, `analytics.track(.recordAccountDetailScreen(...))` |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
| Enriched Purpose/Invariants/Examples/Errors/Dependencies from source | 2026-06-24 | 1 |
