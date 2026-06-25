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

App-target UI/feature module (`PeraWallet/Classes/Contacts`). Internal-by-default; see Public API for any cross-module-public surface.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.

## Behavioral Examples

### Scenario: Placeholder
- **Given** the app is running
- **When** this module's flow is entered
- **Then** it behaves per its screens/controllers

## Error Cases

| Condition | Behavior |
|-----------|----------|
| N/A | Documented per screen |

## Dependencies

| Module | Usage |
|--------|-------|
| PeraWalletCore | Shared models/services |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
