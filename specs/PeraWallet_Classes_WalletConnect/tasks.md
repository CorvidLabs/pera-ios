# PeraWallet_Classes_WalletConnect — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Refactor `WCMainTransactionScreen` — large, callback/`DispatchGroup`-heavy data flow that the file's own `<todo>` flags; "Fix the data management which blocks the main thread on too many transactions."
- [ ] Re-enable or remove the disabled session-expiry extension path in `WCSessionDetailScreen` / `ExtendWCSessionValiditySheet` (`extendSessionValidity()` is a no-op, primary action commented out since 05.09.2023).
- [ ] Reduce force-unwraps of `api!` in `WCMainTransactionScreen` (status-bar style, signer creation, asset fetch) per app safety conventions.
- [ ] Audit the single-select branch in `WCSessionConnectionScreen.toggleCellForSingleOrMultipleSelection` (manual previous-cell deselection loop) for correctness on rapid taps.

## Done
- [x] Connection approval screen with single/multi account selection and auto-select for single-account sessions.
- [x] Session list with live v1/v2 connection status, ping-timeout timers, pull-to-refresh, and disconnect-all.
- [x] Session detail with ping-based status check, advanced-permissions info, and v1/v2 disconnect handling.
- [x] Transaction signing host with validation (group/network/signer/asset), Ledger + rekey support, and per-type detail screens.
- [x] Spec and companion files scaffolded.
