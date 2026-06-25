# PeraWallet_Classes_Contacts — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action
  (see `BUILDING.md`).
- **Current coverage: none.** A search of `algorand-tests/` finds no
  Contacts-specific test files. The best first targets are the pure/near-pure
  units: `ContactImageProcessor.process()` (resize + placeholder fallback) and
  the name/address validation inside `parseFieldsForContact()` in the Add/Edit
  controllers.

## Manual QA checklist

List
- [ ] Empty state shows the "add a contact" no-content view with working
      primary action.
- [ ] Adding a contact updates the list immediately (no manual refresh).
- [ ] Pull-to-refresh clears the search field and reloads from Core Data.
- [ ] Search filters live; clearing the query restores the full list; a
      no-result query shows the search no-content view.
- [ ] Tapping a row pushes Detail; tapping the cell QR icon presents the address
      QR generator.
- [ ] When opened as a picker (from a send flow), tapping a row selects the
      contact and dismisses instead of pushing Detail.

Add
- [ ] Saving with a blank name shows the name validation alert; nothing is
      persisted.
- [ ] Saving with an invalid address shows the address validation alert.
- [ ] Address with surrounding whitespace is trimmed before saving.
- [ ] QR scan of an address-mode code fills the address field; a non-address QR
      shows the "should scan address" alert.
- [ ] Picking a photo shows it with the edit badge; saving without changing the
      placeholder persists no image.

Detail
- [ ] Algo balance and each standard asset render; 404 account shows only zero
      Algo.
- [ ] Tapping a non-Algo asset opens ASA discovery; tapping Algo does nothing.
- [ ] Send on an asset opens the account-list sheet and preselects the contact
      as recipient; with no eligible account an error banner appears.
- [ ] Share presents the system share sheet with the contact's address.
- [ ] Edit bar button pushes Edit and reflects saved changes on return.

Edit
- [ ] Saving updates the contact and propagates to Detail/List.
- [ ] Delete shows the bottom warning sheet; confirming removes the contact,
      pops back to the list, and pops any open Detail.

## Edge cases

- Adding a contact while a search query is active: it is appended to
  `searchResults` only if its name matches the current (case-insensitive) query.
- `.ContactDeletion` triggers a full Core Data re-fetch of the list rather than
  an in-memory removal — verify the list is correct after delete.
- `EditContactViewController` pops two stack levels (`removeLast(2)`) to return
  to the list; verify when reached via paths other than List → Detail → Edit.
- Index-out-of-bounds: row selection, cell QR, and configure all guard on
  `searchResults.count`; verify rapid search-while-scrolling does not crash.
- Image fallback: a corrupt/undecodable image `Data` should still render the
  `icon-user-placeholder`.
</content>
