# PeraWallet_Data_Providers — Testing

## Automated tests

- `algorand-tests/Data Providers/AccountIconProviderTests.swift` — Swift
  Testing suite (`@Suite("Data Providers - AccountIconProvider Tests", .tags(.dataProvider))`).
  Parameterized `@Test`s assert the exact `ImageType.IconData` returned for:
  - each `PeraAccount.AccountType` (`algo25`, `universalWallet`, `watch`,
    `ledger`, `joint`, `invalid`) with `authType == nil`;
  - each `AuthorizedAccountType` against algo25 / universalWallet (rekeyed image,
    base-type colors) and against the other account types.
- No automated coverage for `ContactsManager` yet (Core Data dependency).
- Run via the Xcode test action / the app test bundle (see `BUILDING.md`).

## Manual QA checklist

- [ ] Account list / detail badges show the correct icon per account type
      (standard wallet, watch, ledger, joint).
- [ ] A rekeyed account shows the rekeyed badge while keeping its base-type
      color (e.g. rekeyed ledger stays in the ledger palette).
- [ ] An invalid / no-auth account shows the negative (red) palette.
- [ ] A missing/unknown account renders the neutral gray question icon and
      does not crash.
- [ ] Adding a contact persists name + address and the contact reappears after
      relaunch.
- [ ] Editing an existing contact (same address) updates the saved name.
- [ ] Attempting to edit a contact whose address does not exist surfaces a
      "not found" condition rather than creating a duplicate.

## Edge cases

- `nil` account passed to `AccountIconProvider` (placeholder path).
- `authType == .invalid` on an otherwise-valid account (forces negative palette).
- Duplicate addresses: `fetchContact` returns the first match from
  `fetchAllSyncronous`; verify there is only one row per address upstream.
- Core Data save/fetch failures are wrapped — verify callers handle each
  `ContactsManagerError` case (`contactNotFound`, `unableToFetch`,
  `unableToCreateContact`, `unableToUpdateContact`).
