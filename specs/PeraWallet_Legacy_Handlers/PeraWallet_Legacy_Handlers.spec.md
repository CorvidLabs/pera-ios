---
module: PeraWallet_Legacy_Handlers
version: 1
status: active
files:
  - PeraWallet/Legacy Handlers/LegacyBridgeAccountManager.swift
db_tables: []
depends_on: []
---

# PeraWallet_Legacy_Handlers

## Purpose

App-target compatibility layer (`PeraWallet/Legacy Handlers`) that bridges the
app's newer account-creation surfaces (SwiftUI `AddAccountCompatibilityController`,
async `AccountsService`, developer tools) to the legacy session-based account
model in `pera_wallet_core`.

The module's single type, `LegacyBridgeAccountManager`, is a stateless namespace
(`enum`) of static factory functions that build an `AccountInformation`, persist it
into the legacy `Session`/`User` graph, and register the new account for push
notifications. It owns three creation paths:

- **HD (universal) wallet account** — `createUniversalWalletAccount(...)` derives a
  BIP-39 HD wallet via `HDWalletServicing.saveHDWalletAndComposeHDWalletAddressDetail`,
  builds an `AccountInformation` with the resulting `hdWalletAddressDetail`, attaches
  it to the authenticated `User` (creating one if none exists), names the wallet by
  its `walletId`, and triggers `sendDeviceDetails()`. A convenience overload accepts a
  `ViewControllerConfiguration` so legacy view controllers can call it with their
  ambient dependencies.
- **Algo25 (single-key) account** — `createAlgo25Account(...)` generates a raw private
  key through the `Session`, stores it under a temporary key, resolves its address,
  re-saves the key under the address, removes the temp entry, and attaches the account.
- **Local / joint account** — `addLocalAccount(...)` records an already-known address
  (e.g. a server-created joint multisig account) into the authenticated `User` with its
  `jointAccountParticipants`.

Ownership boundary: this module performs only the account-construction and session
mutation. UI, navigation, naming screens, and analytics belong to the callers
(`AddAccountCompatibilityController`, `AccountsService`, `DeveloperSettingsViewController`).

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. Every successful creation path produces an `AccountInformation` that is attached to
   the authenticated `User`: if `session.authenticatedUser` exists the account is added
   to it, otherwise a fresh `User(accounts:)` is created and assigned. No account is
   returned without being persisted into the session graph.
3. New accounts are always created with `isBackedUp: false`; backup state is the
   caller's concern, not the bridge's.
4. The Algo25 temporary key is transient: after the address is derived the private key
   is re-saved under the real address and the `"temp"` entry is removed, so no key is
   left orphaned under the placeholder key.
5. Push registration (`pushNotificationController.sendDeviceDetails()`) fires only when
   an authenticated user already existed (adding to an existing user), not when the
   first user is bootstrapped.
6. The throwing creators use Swift typed throws (`throws(ManagerError)`); only the two
   `ManagerError` cases can surface from them. `createAlgo25Account` is non-throwing and
   signals failure by returning `nil`.

## Behavioral Examples

### Scenario: Create a universal (HD) wallet account from the Add Account flow
- **Given** the user taps "Create Universal Wallet" in `AddAccountCompatibilityController`
- **When** `createUniversalWalletAccount(legacyConfiguration:pushNotificationController:)`
  runs and `HDWalletServicing` returns a non-nil `(hdWalletAddressDetail, address)`
- **Then** an `AccountInformation` is built (name = `address.shortAddressDisplay`,
  `isWatchAccount: false`, `isBackedUp: false`), added to the authenticated `User`,
  the wallet is named via `setWalletName(for: walletId)`, device details are pushed,
  and the account is returned so the controller can push `AddressNameSetupViewController`.

### Scenario: Create a legacy Algo25 single-key account
- **Given** the user chooses "Create Algo25 Wallet"
- **When** `createAlgo25Account(session:pushNotificationController:)` generates a private
  key, stores it under `"temp"`, and resolves the address
- **Then** the key is re-saved under the real address, the `"temp"` entry is removed, the
  account is attached to the user, and the account is returned; the controller then pushes
  `AccountNameSetupViewController`.

### Scenario: Register a server-created joint account
- **Given** `AccountsService.createJointAccount(...)` received a multisig `address` from
  the mobile API
- **When** it calls `addLocalAccount(session:sharedDataController:address:name:isWatchAccount:participants:)`
- **Then** an `AccountInformation` with the given `jointAccountParticipants` is added to
  the authenticated `User`, or `ManagerError.unableToCreateLocalAccount` is thrown if no
  authenticated user is present.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| HD wallet service returns nil `hdWalletAddressDetail` or `address` | `createUniversalWalletAccount` throws `ManagerError.unableToCreateUniversalWallet`; caller (`AddAccountCompatibilityController`) uses `try?` so the result is `nil` and the flow aborts silently. |
| `addLocalAccount` called with no `session.authenticatedUser` | Throws `ManagerError.unableToCreateLocalAccount`; `AccountsService.createJointAccount` wraps it as `ActionError.unableToCreateLocalAccount(error:)`. |
| `session.generatePrivateKey()` returns nil in `createAlgo25Account` | Returns `nil` (no throw); caller aborts the Algo25 creation flow. |
| `session.address(for: tempKey)` returns nil after saving the temp key | Returns `nil` (no throw); the Algo25 account is not created. |
| No `session.authenticatedUser` on a create-* path | A new `User(accounts:)` is created and assigned to `session.authenticatedUser`; push device details are NOT sent for this first-user bootstrap. |

## Dependencies

| Module | Usage |
|--------|-------|
| `pera_wallet_core` | Imported directly; provides `AccountInformation`, `Session`, `User`, `SharedDataController`, `PushNotificationController`, `HDWalletServicing`, `HDWalletStorable`, and `ViewControllerConfiguration`. |
| `HDWalletServicing` / `HDWalletStorable` | Derives and persists the BIP-39 HD wallet and composes the `hdWalletAddressDetail` used for universal-wallet accounts. |
| `Session` / `User` | Legacy account graph: holds `authenticatedUser`, generates/saves/removes private keys, and stores wallet names. |
| `SharedDataController` | Supplies `getPreferredOrderForNewAccount()` for ordering new accounts. |
| `PushNotificationController` | `sendDeviceDetails()` re-registers the device after a new account is added to an existing user. |
| `AddAccountCompatibilityController` (caller) | Drives the universal-wallet and Algo25 creation flows and the follow-up naming screens. |
| `AccountsService` (caller) | Calls `addLocalAccount` to register server-created joint accounts. |
| `DeveloperSettingsViewController` (caller) | Invokes creation helpers from developer tooling. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
