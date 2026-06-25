# PeraWallet_Data_Providers — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as
discovered.

## Open
- [ ] Replace `ContactsManager` Core Data access with a micro-service /
      repository (tracked by the `// FIXME: Replace it with a micro-service`
      marker in `ContactsManager.swift`).
- [ ] Add unit tests for `ContactsManager` (create / update / fetch happy
      paths and each `ContactsManagerError` case); only `AccountIconProvider`
      is currently covered.
- [ ] Review `ContactsManager.fetchContact` use of synchronous
      `fetchAllSyncronous` — consider an async API to avoid blocking the
      caller's thread.
- [ ] Confirm `AccountIconProvider` covers any future `PeraAccount.AccountType`
      cases (the `switch` is exhaustive today; new cases must update tints).

## Done
- [x] Spec and companion files scaffolded.
- [x] `AccountIconProvider.iconData(account:)` implemented as a pure mapping
      over account type / auth type with full color-token resolution.
- [x] Parameterized unit tests for `AccountIconProvider` across all account
      types and auth types (`algorand-tests/Data Providers/AccountIconProviderTests.swift`).
- [x] `ContactsManager` create / update / fetch implemented with typed
      `ContactsManagerError`.
