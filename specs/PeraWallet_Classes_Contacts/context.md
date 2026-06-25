# PeraWallet_Classes_Contacts — Context

## Overview

Architectural context for the `PeraWallet_Classes_Contacts` module — the
address-book feature of Pera Wallet. The authoritative contract is
`PeraWallet_Classes_Contacts.spec.md`; the source files it covers are listed in
that spec's `files:` frontmatter.

## Key files

Organized by screen, each following the app's MVVM convention
(`ViewController` + `View` + `ViewTheme` + `ViewModel`):

- **List** — `List/Screens/ContactsViewController.swift`,
  `List/Views/ContactsView.swift`, `List/Views/Item/ContactCell.swift` +
  `ContactContextView.swift`, and view models
  `ContactsViewModel.swift`, `ContactsNoContentWithActionViewModel.swift`,
  `ContactsSearchNoContentViewModel.swift`.
- **Add** — `Add/Screens/AddContactViewController.swift`,
  `Add/Views/AddContactView.swift`, `Add/Views/BadgedImageVIew.swift`
  (note the typo in the filename).
- **Detail** — `Detail/Screens/ContactDetailViewController.swift`,
  `Detail/Views/ContactDetailView.swift`,
  `Detail/Views/ContactInformationView.swift`,
  `Detail/ViewModels/ContactInformationViewModel.swift`.
- **Edit** — `Edit/Screens/EditContactViewController.swift`,
  `Edit/Views/EditContactView.swift`,
  `Edit/ViewModels/EditContactViewModel.swift`.
- **Shared helper** — `ContactImageProcessor.swift` (image decode/resize +
  placeholder fallback).

Out-of-module collaborators:
- `PeraWalletCore/Models/Contacts/Contact.swift` — the Core Data `Contact`
  `NSManagedObject` (fields: `name`, `address`, `image`).
- `PeraWallet/Data Providers/ContactsManager.swift`.

## Architectural decisions

- **MVVM, no coordinator.** Each screen is a `BaseViewController` /
  `BaseScrollViewController` subclass that builds its own UI from a Macaroon
  `Theme` and binds data through a `ViewModel`. Navigation is performed inline
  via `open(_:by:)` with `Screen` cases — there is no separate flow/coordinator
  object for Contacts.
- **Persistence in PeraWalletCore.** The `Contact` entity and all Core Data
  operations live in PeraWalletCore; the screens call `Contact.fetchAll`,
  `.create`, `.update`, `.remove` directly.
- **NotificationCenter for cross-screen sync.** `.ContactAddition`,
  `.ContactEdit`, and `.ContactDeletion` (with a `["contact": Contact]`
  userInfo) propagate changes between List, Detail, and unrelated screens
  (Transactions, Root). This is the integration seam and the main source of the
  duplicated-state risk noted in `tasks.md`.
- **List doubles as a picker.** Setting `ContactsViewControllerDelegate` switches
  selection behavior from "push detail" to "select + dismiss".

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI. Feature is
shipped and stable; no automated tests currently cover it.
</content>
