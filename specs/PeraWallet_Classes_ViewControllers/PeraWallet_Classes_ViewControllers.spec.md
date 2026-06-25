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

App-target UI/feature module under `PeraWallet/Classes/ViewControllers/Ledger`. It owns the full
hardware-wallet (Ledger) experience inside Pera Wallet:

- **Onboarding & tutorial** — `LedgerTutorialViewController`, `LedgerTutorialInstructionListViewController`
  and the troubleshooting set (`LedgerTroubleshootBluetoothViewController`,
  `LedgerTroubleshootOpenAppViewController`, `LedgerTroubleshootInstallAppViewController`,
  `TutorialStepsViewController`) explain how to connect a Ledger Nano X over Bluetooth.
- **Device discovery & pairing** — `LedgerDeviceListViewController` scans for nearby Ledger
  peripherals over BLE (CoreBluetooth `CBPeripheral`), drives the `LedgerAccountFetchOperation`, and
  presents `LedgerConnectionScreen` (an animated bottom sheet) while waiting for the user to approve
  the connection on-device.
- **Account selection & verification** — `LedgerAccountSelectionViewController` lists the Algorand
  accounts derived from the device (single- or multi-select depending on the flow),
  `LedgerAccountDetailViewController` shows a derived account's assets/rekeyed accounts, and
  `LedgerAccountVerificationViewController` re-derives each selected address on the device to confirm
  ownership before importing.
- **Rekeying** — `RekeyInstructionsScreen` → `RekeyConfirmationScreen` → `RekeySuccessScreen` (and the
  symmetric `UndoRekeyScreen` → `UndoRekeySuccessScreen`) let a user change an account's signer
  (auth address) to a Ledger account, a standard account, or a joint account, with
  `OverwriteRekeyConfirmationSheet`/`UndoRekeyConfirmationSheet` guarding existing rekey state.
- **Ledger signing UX** — `SignWithLedgerProcessScreen` (driven by `SignWithLedgerProcessDraft`) shows
  per-transaction progress while the device signs.

Ownership boundary: this module is **UI orchestration only**. It composes screens, view models
(`*ViewModel`), themes (`*Theme`), and `MacaroonUIKit`/`MacaroonBottomSheet` views, and delegates all
BLE I/O, account derivation, and transaction signing to services owned by `pera_wallet_core`
(`LedgerAccountFetchOperation`, `LedgerAccountVerifyOperation`, `TransactionController`,
`SharedDataController`, `Session`). It is internal to the app target — there is no public library
surface (see Public API).

## Public API

| Export | Description |
|--------|-------------|
| `calculatePreferredSize` | Macaroon view-sizing method computing a cell/view's preferred size for a given view model, layout sheet, and fitting size. |

## Invariants

1. **Verify-before-import.** Accounts derived from a Ledger are never persisted as local
   `AccountInformation` until each address is re-derived and confirmed on the device by
   `LedgerAccountVerificationViewController`; `getVerifiedAccounts()` gates the "Add" action and only
   verified accounts are saved (`saveVerifiedAccounts`).
2. **No signing without a live connection.** Rekey/undo-rekey screens call
   `transactionController.canSignTransaction(for:)` and, when `sourceAccount.requiresLedgerConnection()`,
   present `LedgerConnectionScreen` and start a watchdog timer before composing the transaction. The
   transparent "Sign with Ledger" sheet is only shown after `didRequestUserApprovalFrom ledger`.
3. **Single Ledger operation at a time.** Each screen holds at most one `ledgerConnectionScreen` and one
   `signWithLedgerProcessScreen`; on cancel/reset/success they are dismissed and set to `nil`, and the
   underlying BLE scan + timer are stopped (`stopBLEScan`, `stopTimer`, `operation.reset()`).
4. **Multi-select is flow-dependent.** `LedgerAccountSelectionViewController.isMultiSelect` is `true`
   for `.initializeAccount` and `.addNewAccount` (non-rekey) and `false` for `.rekey`/`.backUpAccount`,
   so a rekey flow can only choose one new signer.
5. **BLE must be powered on.** Tapping a device in `LedgerDeviceListViewController` first checks
   `bleConnectionManager.state == .poweredOn`; otherwise it presents a state-specific BLE error and does
   not attempt to connect.

## Behavioral Examples

### Scenario: Pair a Ledger and import accounts
- **Given** the user opens "Connect Ledger" with `AccountSetupFlow.initializeAccount`
- **When** `LedgerDeviceListViewController` discovers a peripheral and the user taps it with Bluetooth on
- **Then** `LedgerAccountFetchOperation` connects, `LedgerConnectionScreen` is shown until on-device
  approval, accounts are fetched, and the app pushes `LedgerAccountSelectionViewController` (multi-select)

### Scenario: Verify selected accounts before saving
- **Given** the user selected one or more accounts and tapped "Add"
- **When** `LedgerAccountVerificationViewController` re-derives each address via `LedgerAccountVerifyOperation`
- **Then** each row updates to `verified`/`unverified`; only verified accounts are persisted via
  `setupLocalAccount`/`updateLocalAccount`, push-device details are sent for new accounts, and the user
  is sent to Home — or to the `failedToImportLedgerAccounts` tutorial if none verified

### Scenario: Rekey an account to a Ledger signer
- **Given** the user confirms on `RekeyConfirmationScreen` for a source account that requires a Ledger
- **When** the source account is already rekeyed, `OverwriteRekeyConfirmationSheet` is confirmed, then
  the rekey transaction is composed and the device approval + `SignWithLedgerProcessScreen` complete
- **Then** the rekey detail is saved to the local account (`saveRekeyedAccountDetails`), a `rekeyAccount`
  analytics event is tracked, and `RekeySuccessScreen` is pushed with the back-swipe gesture disabled

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Bluetooth off / unauthorized when selecting a device | `presentBLEError` shows a `CBManagerState`-specific banner; no connection attempt |
| Connection attempt exceeds 10s watchdog timer | Scan stopped, "BLE connection" error banner, and the "pairing issue / re-pair" bottom warning is shown |
| Ledger app closed / wrong app (`closedApp`) | `ble-error-ledger-connection-open-app-error` banner |
| Address fetch fails (`failedToFetchAddress`) | `ble-error-fail-fetch-account-address` banner |
| Indexer lookup fails (`failedToFetchAccountFromIndexer`) | `ledger-account-fetct-error` banner |
| BLE link error (`failedBLEConnectionError(state)`) | State-derived title/subtitle banner; connection screen dismissed |
| User cancels on connection/sign sheet | `LedgerConnectionScreen`/`SignWithLedgerProcessScreen` dismissed, BLE scan + timer stopped, loading cleared |
| Account selection fetch fails | `LedgerAccountSelectionView` enters error state with a "Try again" action that reloads |
| Verification fails for an account | Row marked `unverified`; flow advances to the next account; on "Add" with zero verified, the `failedToImportLedgerAccounts` tutorial opens |
| Rekey transaction below minimum / invalid address / SDK error | `displayTransactionError` shows a formatted minimum-amount, invalid-address, or SDK-error banner |
| Rekey ledger connection drops mid-flow (`.ledgerConnection`) | Connection screen dismissed and the "re-pair" bottom warning shown |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core | `Account`, `AccountInformation`, `AccountSetupFlow`, `LedgerAccountFetchOperation`, `LedgerAccountVerifyOperation`, `TransactionController`, `SharedDataController`, `Session`, `ALGAPI`, `RekeyTransactionSendDraft`, `JointAccountTransactionCoordinator`, `PeraCoreManager`, `ALGAnalytics` |
| MacaroonUIKit | `ScrollScreen`, `BaseView`, `Button`, stack views, theming/`customizeAppearance`, `calculatePreferredSize` |
| MacaroonBottomSheet | `BottomSheetScrollPresentable`, `BottomSheetTransition` for Ledger connection / sign / warning sheets |
| CoreBluetooth | `CBPeripheral`/`CBManagerState` for device discovery and BLE-state error handling |
| Lottie (via `LottieImageView`) | Animated Ledger connection illustration in `LedgerConnectionScreen` |
| App shared UI (`BaseViewController`, `BannerController`, `LoadingController`, routing `open(_:by:)`, `BottomWarningViewConfigurator`) | Navigation, banners, loading HUD, and warning sheets |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
