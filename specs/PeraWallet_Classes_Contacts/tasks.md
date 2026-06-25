# PeraWallet_Classes_Contacts — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Migrate cross-screen sync from `NotificationCenter` (`.ContactAddition` /
      `.ContactEdit` / `.ContactDeletion`) to an observable shared store; the
      current pattern duplicates append/refresh logic across List, Detail, and
      the Transactions module and is easy to get out of sync.
- [ ] De-duplicate the near-identical contact-append logic in
      `ContactsViewController.didContactAdded(notification:)` and
      `addContactViewController(_:didSave:)` — they implement the same
      search-aware insertion twice.
- [ ] Move Core Data access (`Contact.fetchAll` / `create` / `update` /
      `remove`) out of the view controllers behind a service/repository so the
      screens are testable without Core Data.
- [ ] `EditContactViewController.popScreenToContactsScreen()` hard-codes
      `removeLast(2)`; make it robust if the navigation stack depth changes.
- [ ] Add automated tests — there are currently none for this module (see
      `testing.md`). Start with `ContactImageProcessor` and the validation in
      `parseFieldsForContact()`.
- [ ] Replace `[unowned self]` captures in `ContactDetailViewController`
      bar-button closures with `[weak self]` for safety.
- [ ] `EditContactViewController.isUserEdited` is set but never read — wire it
      into a discard-changes prompt or remove it.

## Done
- [x] Spec and companion files scaffolded.
- [x] Add/Edit/Detail/List screens with MVVM (View + Theme + ViewModel) shipped.
- [x] QR scan-to-fill and QR display for contacts.
- [x] Contact photo via image picker with placeholder fallback
      (`ContactImageProcessor`).
- [x] Detail screen shows live on-chain Algo + asset balances and send entry
      points.
</content>
</invoke>
