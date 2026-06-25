# PeraWallet_Utils — Testing

## Automated tests

- App/library test bundle: `algorand-tests/` (run via the Xcode test action — see `BUILDING.md`).
- Relevant existing fixtures: `algorand-tests/Mock/AccountServiceMock.swift` (mocks `AccountsServiceable`, usable to drive `JointAccountTransactionHandler`/`Coordinator` in tests).
- No dedicated unit tests for `PeraLogger`/`FileLogger`/`PollingService` currently exist — see tasks.md.

## Manual QA checklist

### Logging / log export
- [ ] Use the app for a while, then export logs from Settings; confirm a `logs.zip` is produced and shareable.
- [ ] Re-export logs twice in a row; confirm the previous archive is removed and a fresh one is generated.
- [ ] With no `logsStore` configured, confirm export is a no-op (returns nil) and does not crash.
- [ ] Background/foreground the app across a day boundary; confirm logs roll into a new day-bucketed file and files older than 7 days are pruned on activation.

### Joint / shared account signing
- [ ] Shared account with non-Ledger local signers: submit a send; confirm pending-transaction overlay appears with correct threshold/signer info.
- [ ] Shared account where all local participants are Ledger accounts: confirm `.connectionWithLedgerNeeded` triggers the Ledger connection screen, then the sign-with-ledger progress screen.
- [ ] Cancel a pending opt-in transaction; confirm overlay dismisses and opt-in monitoring is cancelled (no spurious "added asset" notification).
- [ ] Cancel a pending opt-out transaction; confirm overlay dismisses and opt-out updates are marked for notification.
- [ ] Trigger a minimum-amount / network error during ledger signing; confirm the correct error banner text appears.

### Bridging & formatting
- [ ] Screen using `SwiftUICompatibilityBaseViewController` / `SwiftUICompatibilityView` renders edge-to-edge and self-sizes correctly in a list/stack.
- [ ] Relative timestamps show "just now" under 60s, and respect `.none` (no in/ago) and `.custom` prefix/suffix options.

## Edge cases

- Concurrent log writes from multiple threads (must serialize on the actor; no data races).
- Log file exactly at / just over the 1 MB cap → `truncateLogsIfNeeded` trims oldest content while keeping newest.
- Joint account that is rekeyed (`isJointAccountRekeyed`) → signers resolved from the auth-holder account's participants, not the joint account's.
- Mixed Ledger + non-Ledger participants → only non-Ledger local accounts sign locally; all-Ledger falls back to the first Ledger account.
- `PollingService.start` called repeatedly → only one loop runs; `deinit` cancels the in-flight task.
- Propose-sign response missing a raw transaction or non-base64 → `unableToEncodeTransaction`.
