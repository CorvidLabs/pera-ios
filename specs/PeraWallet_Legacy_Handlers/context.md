# PeraWallet_Legacy_Handlers — Context

## Overview

`PeraWallet_Legacy_Handlers` is a thin compatibility layer that lets newer
account-creation surfaces talk to the legacy session-based account model in
`pera_wallet_core`. The authoritative contract is
`PeraWallet_Legacy_Handlers.spec.md`.

## Key files

- `PeraWallet/Legacy Handlers/LegacyBridgeAccountManager.swift` — the only file in
  the module. A stateless `enum` namespace exposing static factory functions:
  - `createUniversalWalletAccount(hdWalletService:session:hdWalletStorage:sharedDataController:pushNotificationController:)`
    and its `ViewControllerConfiguration` overload (HD / BIP-39 accounts).
  - `createAlgo25Account(session:pushNotificationController:)` (legacy single-key accounts).
  - `addLocalAccount(session:sharedDataController:address:name:isWatchAccount:participants:)`
    (server-created / joint accounts).
  - Nested `ManagerError` with `.unableToCreateUniversalWallet` and `.unableToCreateLocalAccount`.

## Callers (outside the module)

- `PeraWallet/Scenes/Add Account/AddAccountCompatibilityController.swift` — universal and
  Algo25 creation, then pushes naming screens.
- `PeraWallet/Managers/Core/Services/AccountsService.swift` — `createJointAccount` calls
  `addLocalAccount`.
- `PeraWallet/Classes/Settings/Developer/Screens/DeveloperSettingsViewController.swift` —
  developer tooling.

## Architectural decisions

- **Stateless namespace, not a service object.** All entry points are `static`; there is
  no instance state. Dependencies (session, services, controllers) are passed in per call,
  which keeps the bridge testable and free of ownership/lifecycle concerns.
- **Typed throws on the throwing creators** (`throws(ManagerError)`) so callers handle a
  closed error set; `createAlgo25Account` instead returns `Optional` because failures are
  expected and non-exceptional.
- **Side effects are explicit and ordered**: build `AccountInformation` → attach to `User`
  (or bootstrap one) → name wallet (HD only) → push device details (existing user only).

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
