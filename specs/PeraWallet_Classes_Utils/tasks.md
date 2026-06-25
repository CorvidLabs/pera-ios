# PeraWallet_Classes_Utils — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Refactor `TransactionController` toward async/await; the reset-on-success path is flagged in source as a temporary workaround (`transactionControllerDidResetLedgerOperationOnSuccess`) "until the whole flow is refactored."
- [ ] Add unit coverage for `TransactionController` signer routing (Algo25 / HD-wallet / Ledger) and the `*TransactionDataBuilder`s; only `TransactionFeeCalculator` is currently tested.
- [ ] Add tests for validators: `RekeyingValidator`, `TransactionSignatureValidator`, `NoteSizeValidator`, `SlippageToleranceValidator`.
- [ ] Add tests for `ARC59TransactionSendController` group ordering and cancel-on-failure behavior.
- [ ] Verify Behavioral Examples and Error Cases stay in sync as the transaction flow evolves.

## Done
- [x] Spec and companion files scaffolded.
- [x] Rewrote Purpose / Invariants / Behavioral Examples / Error Cases / Dependencies from source.
- [x] Documented architecture (delegate-driven transaction engine, MVVM banner/tooltip/nav components, DI via `ViewControllerConfiguration`).
