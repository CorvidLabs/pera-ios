# PeraWallet_Classes_Backup — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- No dedicated unit tests for this module today. Highest-value targets to add:
  - `BackUpAccountSelectionListLocalDataController.load()` — assert the `!isBackedUp` filter and the loading → no-content / loading → accounts snapshot transitions.
  - `BackUpAccountFlowCoordinator` — assert HD accounts open `.backUpBip39`/`.addBip39Wallet`, others open `.backUp`/`.addAlgo25Account`, and that `needsAccountSelection` is correct per launch overload.
  - `didBackUpAccount` handling — valid `account` user-info emits `.didBackUpAccount` and dismisses; missing/invalid user-info no-ops.

## Manual QA checklist

- [ ] Single not-backed-up account: triggering back-up opens the tutorial directly (no selection list).
- [ ] Multiple not-backed-up accounts: the selection list appears first and lists exactly the not-backed-up accounts.
- [ ] HD (BIP-39) account opens the passphrase/back-up flow for HD wallets; legacy Algo25 account opens the standard back-up flow.
- [ ] Completing back-up dismisses the flow and the account no longer appears in any future back-up selection list.
- [ ] No accounts left to back up: the no-content / empty state renders instead of an account list.
- [ ] Loading state shows the three placeholder loading cells momentarily before content.
- [ ] Header description text renders and wraps correctly; account rows show icon, title, subtitle, portfolio value, and bottom separator.

## Edge cases

- Singular multi-account launch where the list's `first` is nil → flow returns silently, nothing presented (verify no leaked notification observation).
- `didBackUpAccount` posted with a missing or wrong-typed `account` → completion ignored; observation must remain active.
- Currency / amount hidden formatting: `AccountPortfolioItem` is built with `isAmountHidden: false` here regardless of the global privacy setting — verify expected behavior.
- Rotation / Dynamic Type after first layout: cell sizes are cached by reuse identifier and not invalidated — check for clipped or oversized rows.
- Rapid open/dismiss: ensure `stopObservingNotifications()` (completion + `deinit`) prevents duplicate `.didBackUpAccount` events.
