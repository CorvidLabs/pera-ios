# PeraWallet_Classes_ViewControllers — Testing

## Automated tests

- App test bundle: `algorand-tests/`.
- Closest existing coverage for this module:
  `algorand-tests/ViewModels/Ledger/Selection/LedgerAccountSelectionViewModelTests.swift`
  (exercises the account-selection view model state). Most screens here are UI/BLE-driven and are
  validated manually rather than in unit tests.
- Run via the Xcode test action (see `BUILDING.md`). Requires a real device for any BLE path —
  CoreBluetooth does not work in the simulator.

## Manual QA checklist (requires a physical Ledger Nano X + iOS device)

- [ ] **Discovery:** Open Connect Ledger; with the Ledger awake and Algorand app open, the device
      appears in `LedgerDeviceListViewController`.
- [ ] **Approval sheet:** Tapping a device shows `LedgerConnectionScreen`; Cancel stops the scan and
      dismisses cleanly.
- [ ] **Selection — initialize/add:** Multi-select is enabled; the "Add" count updates; "More info"
      opens `LedgerAccountDetailViewController`.
- [ ] **Selection — rekey:** Only single-select is allowed; choosing one account opens
      `RekeyConfirmationScreen`.
- [ ] **Verification:** Each selected account re-derives on the device and flips to verified; only
      verified accounts are imported; Home shows the new-account animation.
- [ ] **Rekey to Ledger:** Confirm → (overwrite sheet if already rekeyed) → connection → sign sheet →
      `RekeySuccessScreen`; back-swipe is disabled on success.
- [ ] **Undo rekey:** `UndoRekeyScreen` → confirmation sheet → sign → `UndoRekeySuccessScreen`.
- [ ] **Tutorial/troubleshoot:** Tutorial steps and the Bluetooth/open-app/install-app troubleshooting
      screens render and navigate.

## Edge cases

- Bluetooth toggled off (or permission denied) before/after selecting a device → state-specific banner.
- Ledger locks or the Algorand app is closed mid-flow → open-app error banner.
- Connection hangs > 10s → watchdog fires: scan stopped, error banner, "re-pair" warning sheet.
- Zero accounts verified on "Add" → `failedToImportLedgerAccounts` tutorial instead of Home.
- Rekeying an account that is already rekeyed → overwrite confirmation must appear before signing.
- Rekey of a joint account → routed through `JointAccountTransactionCoordinator` (Combine actions).
- View dismissed mid-operation (`viewWillDisappear`/`viewDidDisappear`) → operation `reset()` and timers
  invalidated; no dangling BLE scan.
- Dark/light appearance switch on `LedgerConnectionScreen` → Lottie animation swaps and restarts.
