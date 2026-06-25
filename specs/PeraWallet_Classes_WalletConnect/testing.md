# PeraWallet_Classes_WalletConnect — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- These screens are heavily I/O- and UI-driven (PeraConnect events, Ledger, signing); most coverage is manual QA. Prefer unit tests around the view models (`WC*ViewModel`) and data controllers where logic is pure.

## Manual QA checklist

### Connection approval
- [ ] Scan a v2 dApp pairing URI → `WCSessionConnectionScreen` shows dApp name/URL/logo, requested methods/events, and account list.
- [ ] With multi-select enabled, selecting/deselecting multiple accounts toggles the primary action enabled state correctly.
- [ ] With single-select (URI requesting a single account), selecting account B deselects account A; "Connect" stays single-account.
- [ ] Single eligible account is auto-selected and the action is enabled.
- [ ] Reject/cancel emits `performCancel` and dismisses without connecting.
- [ ] Tapping the dApp link opens the URL in-app browser.

### Sessions list / detail
- [ ] Settings > WalletConnect lists active sessions; per-row status resolves to active/failed (v1) or pings to active/failed (v2).
- [ ] "Disconnect all" confirms via action sheet and removes all sessions; success/failure banner shown.
- [ ] Pull-to-refresh re-checks visible cell statuses.
- [ ] Detail "Check status" runs the ping repeater, shows pinging → active/failed → idle.
- [ ] Disconnect from detail (v1 and v2) pops back to list with the disconnected-successfully banner.
- [ ] Empty state offers "scan QR" entry to add a session.

### Transaction signing
- [ ] Single transaction request: confirm signs and returns to dApp; reject responds rejected.
- [ ] Group/multiple request: unsigned-request fragment lists items; confirm signs all-or-nothing.
- [ ] Arbitrary-data request renders and signs via the arbitrary-data path.
- [ ] Per-type detail drill-ins render (Algos, Asset, Asset addition, Asset create/reconfigure/delete, App call, KeyReg) and JSON display opens.
- [ ] Ledger/rekeyed signer triggers Ledger connection + sign-with-Ledger progress; cancel aborts cleanly.
- [ ] First-time initial WC warning sheet shows once (`OneTimeDisplayStorage`).

## Edge cases

- [ ] Network mismatch (TestNet draft on MainNet device or vice versa) → rejected `nodeMismatch`.
- [ ] Invalid group → rejected `failedValidation` (single reject sheet only, no duplicates).
- [ ] Asset detail unavailable from indexer → node fallback; both failing → `unableToFetchAsset`.
- [ ] Future-dated transaction → accept/cancel warning.
- [ ] Many transactions in one request (known main-thread/data-management concern in `WCMainTransactionScreen`).
- [ ] v2 ping timeout vs late success arriving after timer fired.
- [ ] Backgrounding/foregrounding the list re-evaluates connection status of visible cells.
- [ ] Rapid account taps in single-select mode keep exactly one selection.
