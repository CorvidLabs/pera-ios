---
module: PeraWallet_Classes_Contacts
version: 1
status: active
files:
  - PeraWallet/Classes/Contacts/Add/Screens/AddContactViewController.swift
  - PeraWallet/Classes/Contacts/Add/Screens/AddContactViewController+Theme.swift
  - PeraWallet/Classes/Contacts/Add/Views/AddContactView.swift
  - PeraWallet/Classes/Contacts/Add/Views/AddContactViewTheme.swift
  - PeraWallet/Classes/Contacts/Add/Views/BadgedImageVIew.swift
  - PeraWallet/Classes/Contacts/Add/Views/BadgedImageViewTheme.swift
  - PeraWallet/Classes/Contacts/ContactImageProcessor.swift
  - PeraWallet/Classes/Contacts/Detail/Screens/ContactDetailViewController.swift
  - PeraWallet/Classes/Contacts/Detail/Screens/ContactDetailViewController+Theme.swift
  - PeraWallet/Classes/Contacts/Detail/ViewModels/ContactInformationViewModel.swift
  - PeraWallet/Classes/Contacts/Detail/Views/ContactDetailView.swift
  - PeraWallet/Classes/Contacts/Detail/Views/ContactDetailViewTheme.swift
  - PeraWallet/Classes/Contacts/Detail/Views/ContactInformationView.swift
  - PeraWallet/Classes/Contacts/Detail/Views/ContactInformationViewTheme.swift
  - PeraWallet/Classes/Contacts/Edit/Screens/EditContactViewController.swift
  - PeraWallet/Classes/Contacts/Edit/Screens/EditContactViewController+Theme.swift
  - PeraWallet/Classes/Contacts/Edit/ViewModels/EditContactViewModel.swift
  - PeraWallet/Classes/Contacts/Edit/Views/EditContactView.swift
  - PeraWallet/Classes/Contacts/Edit/Views/EditContactViewTheme.swift
  - PeraWallet/Classes/Contacts/List/Screens/ContactsViewController.swift
  - PeraWallet/Classes/Contacts/List/ViewModels/ContactsNoContentWithActionViewModel.swift
  - PeraWallet/Classes/Contacts/List/ViewModels/ContactsSearchNoContentViewModel.swift
  - PeraWallet/Classes/Contacts/List/ViewModels/ContactsViewModel.swift
  - PeraWallet/Classes/Contacts/List/Views/ContactsView.swift
  - PeraWallet/Classes/Contacts/List/Views/ContactsViewTheme.swift
  - PeraWallet/Classes/Contacts/List/Views/Item/ContactCell.swift
  - PeraWallet/Classes/Contacts/List/Views/Item/ContactContextView.swift
  - PeraWallet/Classes/Contacts/List/Views/Item/ContactContextViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Contacts

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Contacts`) implementing the
address-book feature of Pera Wallet: the local list of saved Algorand addresses
("contacts") a user can name, give a photo, browse, and reuse when sending
transactions.

It owns four screens, organized MVVM-style (ViewController + View + Theme +
ViewModel) with no dedicated coordinator — navigation is driven directly by each
view controller via the shared `open(_:by:)` / `Screen` routing helpers:

- **List** (`ContactsViewController`) — a searchable `UICollectionView` of all
  saved contacts, with pull-to-refresh, an empty/no-content state, an "add"
  bar button, and a per-cell QR display action. The list is also reusable as a
  picker: when a `ContactsViewControllerDelegate` is set, tapping a row selects
  the contact and dismisses instead of pushing detail.
- **Add** (`AddContactViewController`) — a form (name + address + optional
  photo) for creating a new contact, with QR scanning and image-picker support.
- **Detail** (`ContactDetailViewController`) — read-only contact info plus the
  contact account's on-chain Algo/asset balances (fetched live from the API),
  with edit/share bar buttons, QR display, and per-asset "send" entry points.
- **Edit** (`EditContactViewController`) — edits or deletes an existing contact.

The persistent `Contact` model is a Core Data `NSManagedObject` owned by
**PeraWalletCore** (`PeraWalletCore/Models/Contacts/Contact.swift`); this module
only presents and mutates it. Cross-screen state is synchronized via app-wide
`NotificationCenter` notifications (`.ContactAddition`, `.ContactEdit`,
`.ContactDeletion`) rather than a shared store, so other features (e.g.
Transactions) react to contact changes too.

`ContactImageProcessor` is the module's only standalone helper: it decodes
contact image `Data`, resizes it to a requested size, and falls back to the
`icon-user-placeholder` asset when no image exists.

Ownership boundary: this module owns the Contacts UI/flows only. The `Contact`
entity, Core Data persistence (`fetchAll`/`create`/`update`/`remove`), account
and asset fetching (`api`, `sharedDataController`), and send-transaction routing
all belong to other modules; this module consumes them.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. A contact cannot be saved without both a non-blank name and a syntactically
   valid Algorand address — `parseFieldsForContact()` validates both in Add and
   Edit and shows an alert (never persists) when either fails. The address is
   trimmed of whitespace/newlines before being written.
3. Persistence is single-sourced through the Core Data `Contact` entity. Every
   create/update/delete posts the corresponding `NotificationCenter`
   notification (`.ContactAddition` / `.ContactEdit` / `.ContactDeletion`) so
   the list and any other observing screens stay consistent; the list re-fetches
   from Core Data on `.ContactDeletion` rather than trusting in-memory state.
4. Search is non-destructive: `searchResults` is a filtered view over the full
   `contacts` array (or a `name contains[c]` Core Data query); clearing the
   query restores the full list. The cell QR action and row selection always
   operate on `searchResults`, guarded by an index-in-bounds check.
5. When `ContactsViewController` is used as a picker (delegate set), selecting a
   row dismisses the screen and forwards the contact to the delegate; it never
   pushes the detail screen in that mode.
6. The contact photo is optional: when the displayed image is still the
   `icon-user-placeholder`, no image data is persisted, and display always falls
   back to that placeholder via `ContactImageProcessor`.

## Behavioral Examples

### Scenario: Adding a new contact by scanning a QR code
- **Given** the user is on the Add Contact screen and taps the QR-code button
- **When** the camera reads a valid Algorand `address`-mode QR
- **Then** the scanned address is filled into the address field; on tapping
  "Add", after name+address validation the `Contact` is created in Core Data, a
  `.ContactAddition` notification is posted, and the screen pops/dismisses while
  the list appends the new contact.

### Scenario: Viewing a contact's on-chain balances
- **Given** a saved contact with an address that exists on-chain
- **When** the user opens Contact Detail
- **Then** the screen fetches the account via `api.fetchAccount`, shows a loading
  indicator, then lists the Algo balance plus each standard asset; tapping the
  send button on an asset opens the account-list sheet and routes into the send
  flow with the contact preset as recipient. If the account is not found
  (HTTP 404) only the zero Algo balance is shown.

### Scenario: Deleting a contact from Edit
- **Given** the user is on the Edit screen and taps delete
- **When** they confirm in the bottom warning sheet
- **Then** the `Contact` is removed from Core Data, the navigation stack pops
  back past Edit and Detail to the list, and a `.ContactDeletion` notification is
  posted causing the list to re-fetch (and any open Detail to pop).

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Empty/blank contact name on save | Alert "title-error" / "contacts-name-validation-error"; not persisted |
| Invalid Algorand address on save | Alert "title-error" / "contacts-address-validation-error"; not persisted |
| QR scan returns a non-address QR | Alert "qr-scan-should-scan-address-message"; address field unchanged |
| QR scanner failure | Alert "qr-scan-should-scan-valid-qr" |
| Camera unavailable when opening QR scanner | Alert "qr-scan-error-title" / "qr-scan-error-message"; scanner not opened |
| Contact account fetch returns HTTP 404 | Treated as new/empty account; shows only zero Algo balance |
| Contact account fetch fails (non-404) | Loading stops; no assets shown |
| Send tapped but no eligible accounts hold the asset | Error banner "asset-support-your-add-title" / "asset-support-your-add-message"; send not opened |
| Search query matches no contacts | Collection view shows search no-content view |
| No contacts saved at all | Collection view shows no-content-with-action (add) view |

## Dependencies

| Module | Usage |
|--------|-------|
| PeraWalletCore (`pera_wallet_core`) | `Contact` Core Data model, `Account`/`StandardAsset`/`AssetItem`, `api`, `sharedDataController`, currency formatting, base view controllers |
| Macaroon UIKit | View/Theme/ViewModel building blocks (`TextProvider`, `NoContentView`, `EditText`, layout) |
| QR Scanner / QR Generator screens | `QRScannerViewController` for address capture; `qrGenerator` for displaying a contact's address QR |
| Image Picker | `ImagePicker` for choosing a contact photo |
| Send Transaction flow | `SendTransactionDraft` + `accountList` sheet to send to a contact from Detail |
| ASA Discovery / Asset detail | `asaDiscovery` screen opened when tapping a non-Algo asset row in Detail |
| Transactions module | Observes `.ContactAddition` / `.ContactEdit` to refresh transaction screens |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
