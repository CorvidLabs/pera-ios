# PeraWallet_Classes_ViewControllers — Context

## Overview

This module is the Ledger hardware-wallet feature area of the Pera Wallet app, living under
`PeraWallet/Classes/ViewControllers/Ledger`. It covers connecting a Ledger Nano X over Bluetooth,
selecting and verifying derived Algorand accounts, rekeying accounts to/from Ledger signers, and the
on-device signing UX. The authoritative contract is `PeraWallet_Classes_ViewControllers.spec.md`; the
exact source files are listed in that spec's `files:` frontmatter.

## Architecture

- **Pattern:** MVVM + thin view-controllers. Each screen has a `*ViewController`/`*Screen`, a
  `MacaroonUIKit` view (`*View`), one or more `*ViewModel` value types, and a `*Theme` describing
  layout/tokens. Screens are built imperatively (`prepareLayout`, `bindData`) — no storyboards/XIBs.
- **Navigation:** App-wide routing via `open(_:by:)` (push/present/customPresent) plus
  `BottomSheetTransition` for the Ledger connection, sign-with-ledger, overwrite/undo confirmation, and
  "re-pair" warning sheets.
- **Service boundary:** All BLE I/O and signing live in `pera_wallet_core`. Controllers own
  `LedgerAccountFetchOperation` (discovery/fetch), `LedgerAccountVerifyOperation` (verification), and
  `TransactionController` (rekey signing), acting as their delegates. Joint-account rekeys are driven
  through `JointAccountTransactionCoordinator` over Combine.
- **State flow:** `AccountSetupFlow` (initialize / addNewAccount(mode) / rekey / backUp) threads through
  every screen and decides single- vs multi-select, which success/failure screen to show, and whether
  to launch Home or dismiss.

## Key files

- `Connection/LedgerConnectionScreen.swift` — animated BLE-approval bottom sheet (cancel-only).
- `Devices/Screens/LedgerDeviceListViewController.swift` — BLE scan, device list, 10s watchdog timer.
- `Selection/Screens/LedgerAccountSelectionViewController.swift` — derived-account list + selection.
- `Selection/Screens/Detail/LedgerAccountDetailViewController.swift` — per-account detail.
- `Selection/Screens/Verification/LedgerAccountVerificationViewController.swift` — re-derive & import.
- `Rekey/Instructions/RekeyInstructionsScreen.swift` + `Rekey/Instructions/*Draft.swift` — rekey intros.
- `Rekey/Confirmation/RekeyConfirmationScreen.swift` — composes/sends the rekey transaction.
- `Rekey/UndoRekey/UndoRekeyScreen.swift` — symmetric undo-rekey flow.
- `SignWithLedgerProcessScreen/SignWithLedgerProcessScreen.swift` — per-transaction signing progress.
- `Tutorial/*` and `Troubleshoot/*` — onboarding and BLE/app troubleshooting screens.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI. The Ledger pairing-warning sheet
(`LedgerPairWarningViewController`) is currently bypassed in `LedgerDeviceListViewController` — the
relevant code is commented out (note dated 27.09.2023) pending resolution of a device connection issue.
