# PeraWallet_Data_Providers — Context

## Overview

Architectural context for the `PeraWallet_Data_Providers` module. The
authoritative contract is `PeraWallet_Data_Providers.spec.md`. The module is a
pair of small, stateless app-target helpers that bridge PeraWalletCore domain
models and the presentation layer.

## Key files

- `PeraWallet/Data Providers/AccountIconProvider.swift` — `final class` with
  only `static` methods. `iconData(account:)` is the single entry point; it
  composes three private resolvers (`image`, `tintColor`, `backgroundColor`)
  into an `ImageType.IconData`. Pure function of `PeraAccount?`.
- `PeraWallet/Data Providers/ContactsManager.swift` — caseless `enum` used as a
  namespace of `static` CRUD methods over the `Contact` Core Data entity.
  Defines the nested `ContactsManagerError` typed-throws error. Carries a
  `// FIXME: Replace it with a micro-service` marker.

## Architecture

- Not MVVM and not coordinator-based — these are stateless utilities, not
  scenes. No view, view model, or navigation lives here.
- `AccountIconProvider` is a pure mapping (model -> presentation `IconData`);
  it never throws and holds no state.
- `ContactsManager` is a thin facade over PeraWalletCore's `DBStorable` /
  Core Data stack (`Contact.create`, `.save`, `.fetchAllSyncronous`). It uses
  Swift typed throws (`throws(ContactsManagerError)`) to wrap the underlying
  `DBOperationError` / `DataBaseStoreError`.
- Consumers: SwiftUI/UIKit scenes that render account badges (e.g. Inbox,
  Joint Account, Create Joint Account views) call `AccountIconProvider`;
  contact add/edit flows call `ContactsManager`.

## Architectural decisions

- `ContactsManager` is intentionally temporary. The FIXME indicates the target
  state is a dedicated micro-service / repository rather than direct Core Data
  access from the app target.
- Icon color rules deliberately separate `image` (which collapses to
  `.Icons.rekeyedAccount` when rekeyed) from tint/background (which follow the
  underlying account `type`), so a rekeyed account still reads as its base type.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
`AccountIconProvider` has dedicated unit tests; `ContactsManager` does not.
