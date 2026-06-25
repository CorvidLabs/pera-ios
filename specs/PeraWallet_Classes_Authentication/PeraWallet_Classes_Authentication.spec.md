---
module: PeraWallet_Classes_Authentication
version: 1
status: active
files:
  - PeraWallet/Classes/Authentication/AccountFlow.swift
  - PeraWallet/Classes/Authentication/Common/AccountName/Screens/AccountNameSetupViewController.swift
  - PeraWallet/Classes/Authentication/Common/AccountName/Screens/AccountNameSetupViewControllerTheme.swift
  - PeraWallet/Classes/Authentication/Common/AccountName/Views/AccountNameSetupView.swift
  - PeraWallet/Classes/Authentication/Common/AccountType/ViewModels/AccountTypeViewModel.swift
  - PeraWallet/Classes/Authentication/Common/AccountType/Views/AccountTypeView.swift
  - PeraWallet/Classes/Authentication/Common/AccountType/Views/AccountTypeViewTheme.swift
  - PeraWallet/Classes/Authentication/Common/AccountType/Views/NewAccountWarningOverlayView.swift
  - PeraWallet/Classes/Authentication/Common/AddressName/Screens/AddressNameSetupViewController.swift
  - PeraWallet/Classes/Authentication/Common/AddressName/Screens/AddressNameSetupViewControllerTheme.swift
  - PeraWallet/Classes/Authentication/Common/HDWallet/Cells/HDWalletCell.swift
  - PeraWallet/Classes/Authentication/Common/HDWallet/Cells/HDWalletListItemView.swift
  - PeraWallet/Classes/Authentication/Common/HDWallet/Data/HDWalletSetupDataController.swift
  - PeraWallet/Classes/Authentication/Common/HDWallet/Screens/HDWalletSetupViewController.swift
  - PeraWallet/Classes/Authentication/Common/HDWallet/Screens/HDWalletSetupViewControllerTheme.swift
  - PeraWallet/Classes/Authentication/Common/HDWallet/ViewModels/HDWalletItemViewModel.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/DataSource/PassphraseVerifyDataSource.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Screens/BackUp/PassphraseBackUpViewController.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Screens/BackUp/PassphraseBackUpViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Screens/Verify/PassphraseVerifyViewController.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Screens/Verify/PassphraseVerifyViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Screenshot/ScreenshotWarningViewController.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Screenshot/ScreenshotWarningViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/ViewModels/BackUp/PassphraseCellViewModel.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/ViewModels/Verify/PassphraseVerifyCardViewModel.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/ViewModels/Verify/PassphraseVerifyViewModel.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseBackUpView.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseBackUpViewTheme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseCell.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseCellView.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseCellViewTheme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseView.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseViewTheme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/Verify/PassphraseVerifyCardView.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/Verify/PassphraseVerifyCardViewTheme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/Verify/PassphraseVerifyView.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/Verify/PassphraseVerifyViewTheme.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicType/ViewModels/MnemonicTypeViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicType/Views/MnemonicTypeView.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicType/Views/MnemonicTypeViewTheme.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicTypes/MnemonicProvider.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicTypes/Screens/MnemonicTypeSelectionScreen +Theme.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicTypes/Screens/MnemonicTypeSelectionScreen.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicTypes/ViewModels/MnemonicTypeSelectionViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicTypes/Views/MnemonicTypeSelectionView.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicTypes/Views/MnemonicTypeSelectionViewTheme.swift
  - PeraWallet/Classes/Authentication/Introduction/PeraIntroduction/PeraIntroductionViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/PinLimit/Screens/PinLimitViewController.swift
  - PeraWallet/Classes/Authentication/Introduction/PinLimit/Views/PinLimitView.swift
  - PeraWallet/Classes/Authentication/Introduction/PinLimit/Views/PinLimitViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/PinLimit/Views/PinLimitViewTheme.swift
  - PeraWallet/Classes/Authentication/Introduction/Recover/RecoverAccountView.swift
  - PeraWallet/Classes/Authentication/Introduction/Recover/RecoverAccountViewController.swift
  - PeraWallet/Classes/Authentication/Introduction/Recover/RecoverAccountViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Introduction/Recover/RecoverAccountViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/Recover/RecoverAccountViewTheme.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/Screens/WelcomeViewController.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/Screens/WelcomeViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/ViewModels/WelcomeTypeViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/ViewModels/WelcomeViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/Views/WelcomeTypeView.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/Views/WelcomeTypeViewTheme.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/Views/WelcomeView.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/Views/WelcomeViewTheme.swift
  - PeraWallet/Classes/Authentication/Recover/List/Data/AccountRecoverDataController.swift
  - PeraWallet/Classes/Authentication/Recover/List/Screens/AccountRecoverViewController.swift
  - PeraWallet/Classes/Authentication/Recover/List/Screens/AccountRecoverViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Recover/List/ViewModels/RecoverInputViewModel.swift
  - PeraWallet/Classes/Authentication/Recover/List/Views/AccountRecoverView.swift
  - PeraWallet/Classes/Authentication/Recover/List/Views/AccountRecoverViewTheme.swift
  - PeraWallet/Classes/Authentication/Recover/List/Views/RecoverInputView.swift
  - PeraWallet/Classes/Authentication/Recover/List/Views/RecoverInputViewTheme.swift
  - PeraWallet/Classes/Authentication/Recover/Loading/RecoverAccountsLoadingScreen.swift
  - PeraWallet/Classes/Authentication/Recover/Loading/RecoverAccountsLoadingTheme.swift
  - PeraWallet/Classes/Authentication/Recover/Loading/RecoverAccountsLoadingViewModel.swift
  - PeraWallet/Classes/Authentication/Recover/Options/Screens/AccountRecoverOptionsViewController.swift
  - PeraWallet/Classes/Authentication/Recover/Options/Screens/AccountRecoverOptionsViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/DataSource/InputSuggestionDataSource.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/DataSource/InputSuggestionsDataController.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/Layout/InputSuggestionLayoutBuilder.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/Screens/InputSuggestionViewController.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/ViewModels/InputSuggestionViewModel.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/Views/InputSuggestionCell.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/Views/InputSuggestionView.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/Views/InputSuggestionViewTheme.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Data/RekeyedAccountSelectionListDataController.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Data/RekeyedAccountSelectionListDataSource.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Data/RekeyedAccountSelectionListLocalDataController.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/RekeyedAccountSelectionListLayout.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/RekeyedAccountSelectionListScreen.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/RekeyedAccountSelectionListScreenTheme.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountCell/RekeyedAccountSelectionListAccountCell.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountCell/RekeyedAccountSelectionListAccountCellTheme.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountCell/RekeyedAccountSelectionListAccountItemAccessory.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountLoadingCell/RekeyedAccountSelectionListAccountLoadingCell.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountLoadingCell/RekeyedAccountSelectionListAccountLoadingItemView.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountLoadingCell/RekeyedAccountSelectionListAccountLoadingItemViewTheme.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountLoadingCell/RekeyedAccountSelectionListAccountLoadingView.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountLoadingCell/RekeyedAccountSelectionListAccountLoadingViewTheme.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/Header/RekeyedAccountSelectionListHeader.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/Header/RekeyedAccountSelectionListHeaderTheme.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/Header/RekeyedAccountSelectionListHeaderViewModel.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/NavigationBar/RekeyedAccountSelectionListNavigationBarView.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/NavigationBar/RekeyedAccountSelectionListNavigationBarViewModel.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/NavigationBar/RekeyedAccountSelectionListNavigationBarViewTheme.swift
  - PeraWallet/Classes/Authentication/WalletFlowType.swift
  - PeraWallet/Classes/Authentication/WatchAccount/Data/WatchAccountAdditionAPIDataController.swift
  - PeraWallet/Classes/Authentication/WatchAccount/Data/WatchAccountAdditionDataController.swift
  - PeraWallet/Classes/Authentication/WatchAccount/Screens/WatchAccountAdditionViewController.swift
  - PeraWallet/Classes/Authentication/WatchAccount/Screens/WatchAccountAdditionViewControllerTheme.swift
  - PeraWallet/Classes/Authentication/WatchAccount/Views/WatchAccountAdditionView.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Authentication

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Authentication`). Internal-by-default; see Public API for any cross-module-public surface.

## Public API

| Export | Description |
|--------|-------------|
| `calculatePreferredSize` | Macaroon view-sizing method computing a view/cell's preferred `CGSize` for its view model, layout sheet, and fitting size. |

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
