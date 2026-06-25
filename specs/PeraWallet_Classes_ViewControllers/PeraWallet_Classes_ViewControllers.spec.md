---
module: PeraWallet_Classes_ViewControllers
version: 1
status: active
files:
  - PeraWallet/Classes/ViewControllers/Ledger/Connection/LedgerConnectionScreen.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Connection/LedgerConnectionScreenTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Devices/Screens/LedgerDeviceListViewController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Devices/Screens/LedgerDeviceListViewController+Theme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Devices/ViewModels/LedgerDeviceListViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Devices/Views/LedgerDeviceCell.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Devices/Views/LedgerDeviceCellView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Devices/Views/LedgerDeviceCellViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Devices/Views/LedgerDeviceListView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Devices/Views/LedgerDeviceListViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/LedgerTroubleshootingViewController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/LedgerTutorialViewController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Confirmation/RekeyConfirmationScreen.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Confirmation/RekeyConfirmationScreenTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Confirmation/Views/RekeyConfirmationBodyViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instruction/Views/RekeyToAnyAccountInstructionsViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instruction/Views/RekeyToStandardAccountInstructionsViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/RekeyInstructionsDraft.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/RekeyInstructionsScreen.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/RekeyInstructionsScreenTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/RekeyToJointAccountInstructionsDraft.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/RekeyToLedgerAccountInstructionsDraft.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/RekeyToStandardAccountInstructionsDraft.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/Views/RekeyAnyAccountToAnyAccountNoConfigurationChangeInstructionViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/Views/RekeyAnyAccountToAnyAccountNoLongerAbleToSignInstructionViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/Views/RekeyAnyAccountToAnyAccountOpenBluetoothInstructionViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/Views/RekeyAnyAccountToLedgerAccountFutureTransactionsSignInstructionViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/Views/RekeyLedgerToLedgerAccountNoLongerConnectedInstructionViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/Views/RekeyLedgerToStandardAccountFutureTransactionsSignInstructionViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/Views/RekeyLedgerToStandardAccountNoLongerRequiredToSignInstructionViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/Views/RekeyRekeyedToAnyAccountContinueUnableToSignInstructionViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/Views/RekeyRekeyedToLedgerAccountFutureTransactionsSignInstructionViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/Views/RekeyRekeyedToStandardAccountFutureTransactionsSignInstructionViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Instructions/Views/RekeyStandardToStandardAccountFutureTransactionsSignInstructionViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/OverwriteRekeyConfirmation/OverwriteRekeyConfirmationSheet.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Result/RekeySuccessScreen.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Result/RekeySuccessScreenTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Result/Views/RekeySuccessResultViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Result/Views/RekeySuccessResultViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/AccountSelection/Data/RekeyAccountSelectionListDataSource.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/AccountSelection/Data/RekeyAccountSelectionListLocalDataController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/AccountSelection/RekeyAccountSelectionListLayout.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/AccountSelection/Views/AccountCell/RekeyAccountSelectionListAccountListItemCell.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/AccountSelection/Views/AccountCell/RekeyAccountSelectionListAccountListItemCellTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/AccountSelection/Views/Header/RekeyAccountSelectionListHeader.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/AccountSelection/Views/Header/RekeyAccountSelectionListHeaderTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/AccountSelection/Views/Header/RekeyAccountSelectionListHeaderViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/Views/InformationItem/CurrentlyRekeyedAccount/CurrentlyRekeyedAccountInformationItemViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/Views/InformationItem/RekeyConfirmationInformationItemCommonTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/Views/RekeyInfo/RekeyInfoView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/Views/RekeyInfo/RekeyInfoViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/Views/RekeyInfo/RekeyInfoViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/Views/RekeyInfo/RekeySummaryInfoViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/Shared/Views/RekeyInfo/UndoRekeyInfoViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/UndoRekey/UndoRekeyScreen.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/UndoRekey/UndoRekeyScreenTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/UndoRekeyConfirmation/UndoRekeyConfirmationSheet.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/UndoRekeyResult/UndoRekeySuccessScreen.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/UndoRekeyResult/UndoRekeySuccessScreenTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/UndoRekeyResult/Views/UndoRekeySuccessResultViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Rekey/UndoRekeyResult/Views/UndoRekeySuccessResultViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/DataSource/LedgerAccountDetailDataSource.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/DataSource/LedgerAccountDetailViewDataSource.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/DataSource/LedgerAccountSelectionDataSource.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/DataSource/Verification/LedgerAccountVerificationDataController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Layout/LedgerAccountDetailLayoutBuilder.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Layout/LedgerAccountSelectionListLayout.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Screens/Detail/LedgerAccountDetailViewController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Screens/Detail/LedgerAccountDetailViewController+Theme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Screens/LedgerAccountSelectionViewController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Screens/LedgerAccountSelectionViewController+Theme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Screens/Verification/LedgerAccountVerificationViewController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Screens/Verification/LedgerAccountVerificationViewController+Theme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/ViewModels/Detail/Header/LedgerAccountDetailSectionHeaderViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/ViewModels/LedgerAccountSelectionViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/ViewModels/LedgerAccountViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/ViewModels/Verification/LedgerAccountVerificationStatusViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/Cell/Enabled/LedgerAccountCellView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/Cell/Enabled/SingleSelectionLedgerAccountCell.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/Cell/LedgerAccountViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/Cell/MultipleSelectionLedgerAccountCell.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/Detail/Header/LedgerAccountDetailSectionHeaderView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/Detail/Header/LedgerAccountDetailSectionHeaderViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/Detail/LedgerAccountDetailView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/Detail/LedgerAccountDetailViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/LedgerAccountSelectionView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/LedgerAccountSelectionViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/Verification/LedgerAccountVerificationStatusView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/Verification/LedgerAccountVerificationStatusViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/Verification/LedgerAccountVerificationView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Selection/Views/Verification/LedgerAccountVerificationViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/SignWithLedgerProcessScreen/ALGProgress.swift
  - PeraWallet/Classes/ViewControllers/Ledger/SignWithLedgerProcessScreen/SignWithLedgerProcessDraft.swift
  - PeraWallet/Classes/ViewControllers/Ledger/SignWithLedgerProcessScreen/SignWithLedgerProcessScreen.swift
  - PeraWallet/Classes/ViewControllers/Ledger/SignWithLedgerProcessScreen/SignWithLedgerProcessScreenTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Troubleshoot/LedgerTroubleshootBluetoothConnectionViewController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Troubleshoot/LedgerTroubleshootBluetoothViewController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Troubleshoot/LedgerTroubleshootInstallAppViewController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Troubleshoot/LedgerTroubleshootOpenAppViewController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Troubleshoot/Screens/TutorialStepsViewController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Troubleshoot/Screens/TutorialStepsViewController+Theme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Troubleshoot/Views/TutorialNumberView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Troubleshoot/Views/TutorialNumberViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Troubleshoot/Views/TutorialStepsView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Troubleshoot/Views/TutorialStepsViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Troubleshoot/Views/TutorialStepViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Tutorial/Screens/LedgerTutorialInstructionListViewController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Tutorial/Screens/LedgerTutorialInstructionListViewController+Theme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Tutorial/ViewModels/LedgerTutorialInstructionViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Tutorial/Views/LedgerTutorialInstructionListView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Tutorial/Views/LedgerTutorialInstructionListViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Tutorial/Views/LedgerTutorialInstructionView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Tutorial/Views/LedgerTutorialInstructionViewTheme.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Warning/Screens/LedgerPairWarningViewController.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Warning/Views/LedgerPairCloseAlgorandAppOnLedgerInstructionItemViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Warning/Views/LedgerPairConfirmPairingOnLedgerHomeScreenInstructionItemViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Warning/Views/LedgerPairOpenAlgorandAppOnLedgerInstructionItemViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Warning/Views/LedgerPairOpenYourLedgerDeviceInstructionItemViewModel.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Warning/Views/LedgerPairWarningView.swift
  - PeraWallet/Classes/ViewControllers/Ledger/Warning/Views/LedgerPairWarningViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_ViewControllers

## Purpose

App-target UI/feature module (`PeraWallet/Classes/ViewControllers`). Internal-by-default; see Public API for any cross-module-public surface.

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
