---
module: PeraWallet_Scenes
version: 1
status: active
files:
  - PeraWallet/Scenes/Add Account/AddAccountCompatibilityController.swift
  - PeraWallet/Scenes/Add Account/AddAccountConstructor.swift
  - PeraWallet/Scenes/Add Account/AddAccountModel.swift
  - PeraWallet/Scenes/Add Account/AddAccountView.swift
  - PeraWallet/Scenes/Add Account/AddAccountViewController.swift
  - PeraWallet/Scenes/Add Account/Views/AddAccountExpandListRow.swift
  - PeraWallet/Scenes/Add Account/Views/CreateJointAccountOverlay.swift
  - PeraWallet/Scenes/Add Account/Views/RoundedMenuRow.swift
  - PeraWallet/Scenes/Create Joint Account/Data Types/AddedAccountData.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Accounts List/CreateJointAccountAccountsListConstructor.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Accounts List/CreateJointAccountAccountsListModel.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Accounts List/CreateJointAccountAccountsListView.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Add Account/CreateJointAccountAddAccountConstructor.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Add Account/CreateJointAccountAddAccountModel.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Add Account/CreateJointAccountAddAccountView.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Edit Account/CreateJointAccountEditAccountConstructor.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Edit Account/CreateJointAccountEditAccountModel.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Edit Account/CreateJointAccountEditAccountView.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Name Account/CreateJointAccountNameAccountConstructor.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Name Account/CreateJointAccountNameAccountModel.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Name Account/CreateJointAccountNameAccountView.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Name Account/CreateJointAccountNameAccountViewModel.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Set Threshold/CreateJointAccountSetThresholdConstructor.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Set Threshold/CreateJointAccountSetThresholdModel.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Set Threshold/CreateJointAccountSetThresholdView.swift
  - PeraWallet/Scenes/Create Joint Account/Views/CreationConfirmationSheet.swift
  - PeraWallet/Scenes/Home/Views/InboxButton.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/InboxConstructor.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/InboxModel.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/InboxNoContentViewModel.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/Views/InboxJointAccountCoreRow.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/Views/JointAccountInviteInboxRow.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/Views/JointAccountSendRequestInboxCapsule.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/Views/JointAccountSendRequestInboxRow.swift
  - PeraWallet/Scenes/Inbox/Scenes/Joint Account Invite Confirmation/JointAccountInviteConfirmationOverlay.swift
  - PeraWallet/Scenes/Inbox/Scenes/Joint Account Invite Confirmation/JointAccountInviteConfirmationOverlayCompatibilityController.swift
  - PeraWallet/Scenes/Inbox/Scenes/Joint Account Invite Confirmation/JointAccountInviteConfirmationOverlayConstructor.swift
  - PeraWallet/Scenes/Inbox/Scenes/Joint Account Invite Confirmation/JointAccountInviteConfirmationOverlayModel.swift
  - PeraWallet/Scenes/Inbox/Scenes/Joint Account Invite Confirmation/Views/JointAccountInviteConfirmationOverlayAccountRow.swift
  - PeraWallet/Scenes/Inbox/Scenes/Name Joint Account/NameAddedJointAccountConstructor.swift
  - PeraWallet/Scenes/Inbox/Scenes/Name Joint Account/NameAddedJointAccountHostingController.swift
  - PeraWallet/Scenes/Inbox/Scenes/Name Joint Account/NameAddedJointAccountModel.swift
  - PeraWallet/Scenes/Inbox/Scenes/Name Joint Account/NameAddedJointAccountView.swift
  - PeraWallet/Scenes/Joint Account/Detail/JointAccountDetail.swift
  - PeraWallet/Scenes/Joint Account/Detail/JointAccountDetailCompatibilityController.swift
  - PeraWallet/Scenes/Joint Account/Detail/JointAccountDetailConstructor.swift
  - PeraWallet/Scenes/Joint Account/Detail/JointAccountDetailModel.swift
  - PeraWallet/Scenes/Joint Account/Pending Transaction Overlay/JointAccountPendingTransactionOverlay.swift
  - PeraWallet/Scenes/Joint Account/Pending Transaction Overlay/JointAccountPendingTransactionOverlayConstructor.swift
  - PeraWallet/Scenes/Joint Account/Pending Transaction Overlay/JointAccountPendingTransactionOverlayHostingController.swift
  - PeraWallet/Scenes/Joint Account/Pending Transaction Overlay/JointAccountPendingTransactionOverlayModel.swift
  - PeraWallet/Scenes/Joint Account/Pending Transaction Overlay/JointAccountPendingTransactionOverlayViewController.swift
  - PeraWallet/Scenes/Joint Account/Pending Transaction Overlay/Views/JointAccountPendingTransactionOverlayRow.swift
  - PeraWallet/Scenes/Joint Account/Transaction Request/Summary/JointAccountTransactionRequestSummaryConstructor.swift
  - PeraWallet/Scenes/Joint Account/Transaction Request/Summary/JointAccountTransactionRequestSummaryHostingViewController.swift
  - PeraWallet/Scenes/Joint Account/Transaction Request/Summary/JointAccountTransactionRequestSummaryView.swift
  - PeraWallet/Scenes/Joint Account/Transaction Request/Summary/JointAccountTransactionRequestSummaryViewController.swift
  - PeraWallet/Scenes/Joint Account/Transaction Request/Summary/JointAccountTransactionRequestSummaryViewModel.swift
  - PeraWallet/Scenes/Joint Account/Transaction Request/Summary/TransactionViewModel.swift
  - PeraWallet/Scenes/Recovered Accounts List/RecoveredAccountsListConstructor.swift
  - PeraWallet/Scenes/Recovered Accounts List/RecoveredAccountsListModel.swift
  - PeraWallet/Scenes/Recovered Accounts List/RecoveredAccountsListView.swift
  - PeraWallet/Scenes/Recovered Accounts List/RecoveredAccountsListViewController.swift
  - PeraWallet/Scenes/Recovered Accounts List/Views/Checkbox.swift
  - PeraWallet/Scenes/Recovered Accounts List/Views/FormButton.swift
  - PeraWallet/Scenes/Recovered Accounts List/Views/RecoveredAccountsListCell.swift
  - PeraWallet/Scenes/Settings/DeveloperMenu/DeveloperMenuListView.swift
  - PeraWallet/Scenes/Settings/DeveloperMenu/DeveloperMenuModel.swift
  - PeraWallet/Scenes/Settings/DeveloperMenu/Views/DeveloperMenuListNavigationCell.swift
  - PeraWallet/Scenes/Settings/DeveloperMenu/Views/DeveloperMenuListToggleCell.swift
  - PeraWallet/Scenes/Settings/DeveloperMenu/Views/RemoteConfigListCell.swift
  - PeraWallet/Scenes/Settings/DeveloperMenu/Views/RemoteConfigListView.swift
  - PeraWallet/Scenes/Settings/Settings List/SettingsListCompatibilityController.swift
  - PeraWallet/Scenes/Settings/Settings List/SettingsListConstructor.swift
  - PeraWallet/Scenes/Settings/Settings List/SettingsListModel.swift
  - PeraWallet/Scenes/Settings/Settings List/SettingsListView.swift
  - PeraWallet/Scenes/Settings/Settings List/SettingsListViewController.swift
  - PeraWallet/Scenes/Settings/Settings List/Views/ListSectionHeader.swift
  - PeraWallet/Scenes/Settings/Settings List/Views/SettingsListCell.swift
  - PeraWallet/Scenes/SwapV2/Formatters/SwapAmountFormatter.swift
  - PeraWallet/Scenes/SwapV2/Models/NoAccountViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/PercentageValue.swift
  - PeraWallet/Scenes/SwapV2/Models/ProviderSelectionViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/ProviderSheetViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/SlippageValue.swift
  - PeraWallet/Scenes/SwapV2/Models/SwapConfirmViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/SwapHistoryViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/SwapSettingsViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/SwapSharedViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/SwapTopPairViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/TextFieldType.swift
  - PeraWallet/Scenes/SwapV2/Services/SwapCurrencyService.swift
  - PeraWallet/Scenes/SwapV2/Services/SwapPricingService.swift
  - PeraWallet/Scenes/SwapV2/SwapViewController.swift
  - PeraWallet/Scenes/SwapV2/Views/AssetSelectionView.swift
  - PeraWallet/Scenes/SwapV2/Views/BottomSheets/ConfirmSwapInfoSheet.swift
  - PeraWallet/Scenes/SwapV2/Views/BottomSheets/ProviderSheet.swift
  - PeraWallet/Scenes/SwapV2/Views/BottomSheets/SwapHistorySheet.swift
  - PeraWallet/Scenes/SwapV2/Views/BottomSheets/SwapSettingsSheet.swift
  - PeraWallet/Scenes/SwapV2/Views/Buttons/AccountSelectionButton.swift
  - PeraWallet/Scenes/SwapV2/Views/Buttons/AssetSwapButton.swift
  - PeraWallet/Scenes/SwapV2/Views/Buttons/ConfirmSlideButton.swift
  - PeraWallet/Scenes/SwapV2/Views/Buttons/SettingsSwapButton.swift
  - PeraWallet/Scenes/SwapV2/Views/Buttons/SwapButton.swift
  - PeraWallet/Scenes/SwapV2/Views/Buttons/SwitchSwapButton.swift
  - PeraWallet/Scenes/SwapV2/Views/ConfirmSwapView.swift
  - PeraWallet/Scenes/SwapV2/Views/NoAccountSwapView.swift
  - PeraWallet/Scenes/SwapV2/Views/ProviderSelectionView.swift
  - PeraWallet/Scenes/SwapV2/Views/SheetTitleView.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapHistoryListItem.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapHistoryListView.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapLogosView.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapSettingsHListItem.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapSettingsTextField.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapSettingsToogle.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapTitleView.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapTopPairsListView.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapView.swift
db_tables: []
depends_on: []
---

# PeraWallet_Scenes

## Purpose

App-target UI/feature module (`PeraWallet/Scenes`). Internal-by-default; see Public API for any cross-module-public surface.

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
