# PeraWallet_Classes_ViewControllers — Tasks

Work items for the Ledger feature module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Re-enable the Ledger pairing-warning sheet in `LedgerDeviceListViewController.didSelectItemAt`
      (currently commented out with `OneTimeDisplayStorage`, note dated 27.09.2023) once the underlying
      device connection issue is resolved.
- [ ] Fix typo'd localization key `ledger-account-fetct-error` used for the indexer-fetch failure banner.
- [ ] `transactionControllerDidFailToSignWithLedger` / `transactionControllerDidRejectedLedgerOperation`
      in `RekeyConfirmationScreen` are empty — confirm whether the user should get feedback on these.
- [ ] Verify timeout/watchdog values are consistent: device-list uses a hard-coded 10s `Timer`, while
      the operations have their own timing — reconcile or document.
- [ ] Add automated coverage for the verification flow (`LedgerAccountVerificationViewController`) and
      rekey save logic (`saveRekeyedAccountDetails`); only `LedgerAccountSelectionViewModel` is tested.

## Done
- [x] Single-/multi-select gating wired to `AccountSetupFlow` in account selection.
- [x] Overwrite-rekey and undo-rekey confirmation sheets in place.
- [x] Joint-account rekey routed through `JointAccountTransactionCoordinator`.
- [x] Spec and companion files scaffolded.
