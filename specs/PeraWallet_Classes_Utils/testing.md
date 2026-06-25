# PeraWallet_Classes_Utils — Testing

## Automated tests

- App test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- Covering this module today:
  - `algorand-tests/Transactions/TransactionFeeCalculatorTests.swift` — exercises `Transaction/Fee/TransactionFeeCalculator`.
- Gaps (no dedicated unit coverage found): `TransactionController` signing/routing, the `*TransactionDataBuilder`s, `RekeyingValidator`, `NoteSizeValidator`, `SlippageToleranceValidator`, `TransactionSignatureValidator`, `MediaCleaner`, ARC-59 controllers.

## Manual QA checklist

- [ ] Send Algos from a standard account: fee shown, transaction confirms, success banner appears.
- [ ] Send an ASA (asset) from a standard account; verify opt-in / opt-out / opt-in-and-send each compose and complete.
- [ ] Rekey an account to a Ledger/HD/standard auth account; `RekeyingValidator` blocks invalid rekeys.
- [ ] Sign with a Ledger account: approval prompt appears, signature returns, transaction uploads.
- [ ] Sign with an HD-wallet account: seed retrieved, transaction signs and uploads.
- [ ] Key-registration (participation) transaction composes and uploads.
- [ ] ARC-59 send to a not-opted-in recipient: group signs, uploads sequentially, confirms.
- [ ] WalletConnect single transaction (algos / asset / asset-config / app-call / key-reg) routes to the correct screen; unknown type rejects + dismisses.
- [ ] Banners: error, success, info, and in-app-notification each render with correct theme and tap action.
- [ ] Bottom-sheet present (interactive and non-interactive) dismisses cleanly.
- [ ] Tooltip shows/hides; large-title nav bar collapses on scroll.
- [ ] App Store review prompt triggers under expected conditions (`AlgorandAppStoreReviewer`).

## Edge cases

- Insufficient balance: Algos send must surface `.inapp(.minimumAmount(...))`, not upload.
- Ledger connection 20s timeout: BLE error banner + `didFailedComposing(.inapp(.ledgerConnection))`.
- Rekeyed account signing: auth account's ledger/HD detail must be substituted before signing.
- Joint accounts: bypass signature validation gate; participants signed individually.
- Fee re-composition: if projected fee != calculated fee for Algos, transaction is re-composed once with `initialSize`.
- Transaction upload returns no id: Ledger op reset, `nonAcceptanceLedgerTransaction` analytics logged.
- ARC-59 mid-group failure: remaining queue operations cancelled.
- `MediaCleaner.performOneTimeMediaCleanup`: runs once (guarded by `PeraUserDefaults.isMediaCleanupCompleted`); only removes media-extension temp files older than one hour.
