---
module: PeraWallet_Data_Providers
version: 1
status: active
files:
  - PeraWallet/Data Providers/AccountIconProvider.swift
  - PeraWallet/Data Providers/ContactsManager.swift
db_tables: []
depends_on: []
---

# PeraWallet_Data_Providers

## Purpose

App-target data-provider helpers under `PeraWallet/Data Providers`. These are
small, stateless utilities that map domain models onto presentation data or
mediate persistence for a single entity — they sit between PeraWalletCore
models and the SwiftUI/UIKit scenes that render them. There are no screens or
view controllers of their own; they are consumed by other UI modules.

Two providers are covered:

- **`AccountIconProvider`** — a stateless icon-resolution helper. Given an
  optional `PeraAccount`, it returns an `ImageType.IconData` (image resource +
  tint color + background color) that describes the wallet/account badge to
  render. It encodes the visual rules for each account type
  (`algo25`, `universalWallet`, `watch`, `ledger`, `joint`, `invalid`) and for
  rekeyed accounts (any account whose `authType != nil`).
- **`ContactsManager`** — a Core Data-backed CRUD facade for the `Contact`
  entity. It creates, updates and fetches contacts by address, translating
  the lower-level `DBOperationError` / `DataBaseStoreError` from PeraWalletCore
  into a single typed `ContactsManagerError`. It is explicitly marked as
  temporary (`// FIXME: Replace it with a micro-service`).

Ownership boundary: this module owns the icon-mapping policy and the contact
persistence facade. It does not own the `PeraAccount` / `Contact` models
(PeraWalletCore), the color/image design tokens (`ImageType`, `.Wallet.*`,
`.Helpers.*` asset catalogs), or any navigation.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. `AccountIconProvider` is total: it returns a valid `ImageType.IconData` for
   every input, including a `nil` account (`.Icons.question` with neutral
   gray tint/background). It never throws and holds no state.
3. Rekeying takes visual precedence: any account with a non-`nil` `authType`
   renders the `.Icons.rekeyedAccount` image, while tint/background still
   follow the underlying `type` (e.g. a rekeyed ledger keeps wallet3 colors).
4. An invalid account or invalid auth type (`type == .invalid` or
   `authType == .invalid`) always renders with the negative/error palette
   (`.Helpers.negative` / `.Helpers.negativeLighter`).
5. `ContactsManager.fetchContact(address:)` and `updateContact` key strictly on
   `address` via an `NSPredicate(format: "address == %@")`; updating a
   non-existent address throws `.contactNotFound` rather than creating a row.
6. Every Core Data failure surfaced by `ContactsManager` is wrapped in the
   typed `ContactsManagerError`; the raw `DBOperationError` /
   `DataBaseStoreError` never escape the facade.

## Behavioral Examples

### Scenario: Icon for a standard (algo25) account
- **Given** a `PeraAccount` with `type == .algo25` and `authType == nil`
- **When** `AccountIconProvider.iconData(account:)` is called
- **Then** it returns `IconData(image: .Icons.wallet, tintColor: .Wallet.wallet4Icon, backgroundColor: .Wallet.wallet4)`

### Scenario: Icon for a rekeyed ledger account
- **Given** a `PeraAccount` with `type == .ledger` and a non-`nil` `authType`
- **When** `AccountIconProvider.iconData(account:)` is called
- **Then** the image is `.Icons.rekeyedAccount` while tint/background stay the ledger palette (`.Wallet.wallet3Icon` / `.Wallet.wallet3`)

### Scenario: Save a new contact
- **Given** an address that has no existing `Contact` row
- **When** `ContactsManager.createContact(name:address:)` is called
- **Then** a new `Contact` is created, `name`/`address` are set, the context is saved, and the `Contact` is returned; on any persistence failure it throws `ContactsManagerError.unableToCreateContact` or `.unableToUpdateContact`

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `iconData(account:)` called with `nil` account | Returns neutral placeholder: `.Icons.question`, tint `.Text.grayLighter`, background `.Layer.grayLighter`; never throws |
| `updateContact(name:address:)` for an unknown address | Throws `ContactsManagerError.contactNotFound` |
| Core Data fetch fails in `fetchContact` | Throws `ContactsManagerError.unableToFetch(error:)` wrapping the `DBOperationError` |
| `Contact.create()` fails | `createContact` throws `ContactsManagerError.unableToCreateContact(error:)` wrapping the `DataBaseStoreError` |
| `Contact.save()` fails during update | Throws `ContactsManagerError.unableToUpdateContact(error:)` wrapping the `DataBaseStoreError` |

## Dependencies

| Module | Usage |
|--------|-------|
| `pera_wallet_core` (PeraWalletCore) | `Contact` Core Data entity + `DBStorable` API (`create`, `save`, `fetchAllSyncronous`); `DBOperationError` / `DataBaseStoreError` error types |
| `PeraAccount` (app target model) | Input to `AccountIconProvider`: `AccountType`, `AuthorizedAccountType` drive the icon/color resolution |
| `ImageType` (`PeraWallet/Data Types`) | Output value type `ImageType.IconData` (image resource + tint + background) |
| Asset catalogs (`.Icons.*`, `.Wallet.*`, `.Helpers.*`, `.Text.*`, `.Layer.*`) | Image resources and design-token colors returned in `IconData` |
| SwiftUI | `AccountIconProvider` returns SwiftUI `Color` values via `import SwiftUI` |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
