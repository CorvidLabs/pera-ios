---
module: Data
version: 1
status: active
files:
  - PeraWalletCore/Data/Storable/DBStorable.swift
  - PeraWalletCore/Data/Storable/HDWallet/HDWalletStorable.swift
  - PeraWalletCore/Data/Storable/HDWallet/HDWalletStorage.swift
  - PeraWalletCore/Data/Storable/OneTime/OneTimeDisplayStorage.swift
  - PeraWalletCore/Data/Storable/PinLimit/PinLimitStore.swift
  - PeraWalletCore/Data/Storable/TransactionTutorial/TransactionTutorialStorage.swift
db_tables: []
depends_on:
  - specs/Models/Models.spec.md
  - specs/Utils/Utils.spec.md
---

# Data

## Purpose

Provides the persistence primitives for the wallet: a Core Data CRUD facade (`DBStorable`), a Keychain-backed HD wallet store for seeds and derived addresses (`HDWalletStorage`), and lightweight `UserDefaults`-backed flag stores for one-time UI displays, PIN attempt limiting, and the transaction tutorial. Each store owns a single storage backend (Core Data, Keychain, or UserDefaults) and exposes typed read/write operations to the rest of the app.

## Public API

| Export | Description |
|--------|-------------|
| `DataBaseStoreError` | Error enum for Core Data container/save failures (`unableToGetPersistentContainer`, `unableToSaveContext`). |
| `DBStorable` | Protocol giving `NSManagedObject` subclasses Core Data CRUD operations against the app's persistent container. |
| `create` | Inserts a new managed object for an entity (or a typed `Self`) into the view context and saves it. |
| `save` | Saves the persistent container's view context, throwing `DataBaseStoreError` on failure. |
| `fetchAll` | Asynchronously fetches all objects for an entity with optional predicate/sort, returning results via handler. |
| `fetchAllSyncronous` | Synchronously fetches all objects for an entity, returning a `DBOperationResult` directly. |
| `clear` | Batch-deletes every object of an entity from the view context. |
| `update` | Reapplies keyed values to the existing managed object and saves the context. |
| `removeValue` | Sets a single key on the managed object to nil and saves the context. |
| `remove` | Deletes the managed object from the view context and saves. |
| `hasResult` | Returns whether any object matches the entity/predicate. |
| `DBOperationError` | Error enum for Core Data operations (`readFailed`, `writeFailed`, `noContext`). |
| `DBOperationResult` | Result enum wrapping a single object, an object array, or a `DBOperationError`. |
| `HDWalletStorable` | Protocol for persisting HD wallet seeds and their derived addresses. |
| `wallet` | Retrieves the stored `HDWalletSeed` for a wallet id, or nil if absent. |
| `deleteWallet` | Removes the stored seed for a wallet id from the keychain. |
| `address` | Retrieves a specific derived `HDWalletAddress` for a wallet id, or nil if absent. |
| `addresses` | Returns all stored derived addresses for a given wallet id. |
| `deleteAddress` | Removes a specific derived address for a wallet id from the keychain. |
| `allHDWalletKeys` | Returns every key currently stored in the HD wallet keychain. |
| `init` | Initializer for the store types; `HDWalletStorage` accepts an injectable `Keychain`. |
| `OneTimeDisplayStorage` | `UserDefaults`-backed store tracking whether one-time warnings have been shown. |
| `Object` | Associated `Storable` type alias (`Any`) declared by the flag-store types. |
| `setDisplayedOnce` | Marks a one-time display key as having been shown. |
| `isDisplayedOnce` | Returns whether a one-time display key has already been shown. |
| `StorageKey` | String-raw enum of one-time display keys (WC initial warning, ledger pairing warning). |
| `hash` | Hashes a `StorageKey` by combining its raw value. |
| `PinLimitStore` | `UserDefaults`-backed store tracking PIN attempt count and lockout remaining time. |
| `allowedAttemptLimitCount` | Maximum allowed PIN attempts before lockout (5). |
| `attemptCount` | Current number of failed PIN attempts read from defaults. |
| `remainingTime` | Remaining lockout time in seconds read from defaults. |
| `TransactionTutorialStorage` | `UserDefaults`-backed store tracking whether the transaction tutorial was shown. |
| `setTransactionTutorialDisplayed` | Marks the transaction tutorial as displayed. |
| `isTransactionTutorialDisplayed` | Returns whether the transaction tutorial has already been displayed. |

## Invariants

1. Core Data operations resolve their container from `CoreAppConfiguration.shared?.persistentContainer` by default; with no container, write operations no-op and reads return `.error(.noContext)` or `false`.
2. HD wallet seeds and addresses are persisted only in the keychain, namespaced by `wallet.` and `address.<walletId>.` prefixes; no seed material is written to `UserDefaults`.
3. `PinLimitStore.allowedAttemptLimitCount` is always 5 and `attemptCount`/`remainingTime` default to 0 when their keys are unset.
4. Flag stores (`OneTimeDisplayStorage`, `PinLimitStore`, `TransactionTutorialStorage`) persist boolean/integer flags only, never sensitive data.
5. `StorageKey` equality and hashing are derived solely from the raw string value.

## Behavioral Examples

### Scenario: Persist and read back an HD wallet seed
- **Given** an `HDWalletStorage` and a `HDWalletSeed` with id `w1`
- **When** `save(wallet:)` is called and then `wallet(id: "w1")`
- **Then** the decoded seed is returned from the keychain

### Scenario: One-time warning shown once
- **Given** a fresh `OneTimeDisplayStorage`
- **When** `setDisplayedOnce(for: .wcInitialWarning)` is called
- **Then** `isDisplayedOnce(for: .wcInitialWarning)` returns true

### Scenario: Saving without a persistent container
- **Given** no `CoreAppConfiguration.shared.persistentContainer`
- **When** `save()` is invoked on a `DBStorable`
- **Then** `DataBaseStoreError.unableToGetPersistentContainer` is thrown

## Error Cases

| Condition | Behavior |
|-----------|----------|
| No persistent container on `create`/`save` | Throws `DataBaseStoreError.unableToGetPersistentContainer` |
| Context save fails on `save` | Throws `DataBaseStoreError.unableToSaveContext(error:)` |
| Missing entity description on `create` | Handler receives `.error(.noContext)` |
| Fetch fails on `fetchAll`/`fetchAllSyncronous` | Handler/result is `.error(.readFailed)` |
| Save fails on `update`/`removeValue`/`remove` | Handler receives `.error(.writeFailed)` |
| Object lookup fails on `update`/`removeValue`/`remove` | Handler receives `.error(.readFailed)` |
| Keychain encode/decode or access failure | The underlying error is rethrown to the caller |

## Dependencies

| Module | Usage |
|--------|-------|
| CoreData | Persistent container, managed objects, fetch/batch-delete requests |
| KeychainAccess | Secure keychain storage for HD wallet seeds and addresses |
| Foundation (`UserDefaults`) | Flag persistence via the `Storable` protocol |
| CoreAppConfiguration | Supplies the default `persistentContainer` |
| HDWalletSeed / HDWalletAddress | Codable models persisted by `HDWalletStorage` |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
