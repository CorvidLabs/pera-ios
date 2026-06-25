# PeraWallet_Legacy_Handlers — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Replace the optional `session?` chains in `createUniversalWalletAccount` with an
      explicit guard so a missing session fails as `ManagerError` instead of silently
      no-op'ing the user attachment while still returning an account.
- [ ] Extract the duplicated "attach account to authenticated user or bootstrap a new
      `User`, then push device details" block (repeated in `createUniversalWalletAccount`
      and `createAlgo25Account`) into a private helper.
- [ ] Decide whether `createAlgo25Account` should also use typed throws for parity with the
      other creators instead of returning `nil`, so callers get a reason on failure.
- [ ] Confirm whether the legacy Algo25 path should remain reachable from production UI or
      is developer-tooling only, and gate accordingly.
- [ ] Add unit coverage for the temp-key lifecycle in `createAlgo25Account` (save under
      "temp" → resolve address → re-save → remove "temp").

## Done
- [x] Spec and companion files scaffolded.
- [x] Documented the three creation paths and the `ManagerError` cases against source.
