---
module: Migrations
version: 1
status: active
files:
  - PeraWalletCore/Migrations/AppGroupDataStoreMigration.swift
  - PeraWalletCore/Migrations/BiometricAuthenticationMigration.swift
  - PeraWalletCore/Migrations/PasswordMigration.swift
db_tables: []
depends_on:
  - specs/Demo/Demo.spec.md
  - specs/Models/Models.spec.md
  - specs/Utils/Utils.spec.md
---

# Migrations

## Purpose

Houses one-time, idempotent data migrations that move legacy on-device state into its current home as the app evolves. Covers relocating the Core Data store into the shared App Group container, migrating the stored password from the Core Data database into the Keychain, and converting the legacy biometric-authentication flag into a Keychain-backed biometric password. Each migration is safe to run on every launch: it detects whether work is needed and no-ops otherwise.

## Public API

| Export | Description |
|--------|-------------|
| `moveDatabaseToAppGroup` | Migrates the legacy Core Data store to the App Group container when the old DB has content and the new one does not, then deletes the old files. |
| `AppGroupDataStoreMigrationError` | Typed error enum describing why the App Group store migration failed, each case carrying the underlying cause. |
| `cause` | Returns the wrapped underlying `Error` (if any) associated with an `AppGroupDataStoreMigrationError` case. |
| `init` | Initializes a migration with its required dependency: an App Group identifier for the data-store migration, or a `Session` for the password/biometric migrations. |
| `migratePasswordToKeychain` | Migrates the password (or legacy biometric auth flag) from the Core Data database into the Keychain, no-op if already migrated or absent. |

## Invariants

1. Each migration is idempotent: running it when no migration is required performs no destructive action.
2. `moveDatabaseToAppGroup` only relocates the store when the legacy DB has content and the App Group DB does not, preventing overwrite of newer data.
3. `PasswordMigration` never overwrites an existing Keychain password; if one exists it instead clears any stale copy from the database.
4. The biometric password is only set silently when the legacy local-authentication status was `allowed`.
5. After a successful password or biometric migration, the corresponding legacy value is removed from the database/defaults.

## Behavioral Examples

### Scenario: Legacy database needs relocation
- **Given** a legacy Core Data store with content and an empty App Group store
- **When** `moveDatabaseToAppGroup` is called
- **Then** the store is moved into the App Group container, old files are deleted, and a new persistent container is created.

### Scenario: Password already in Keychain
- **Given** a `Session` that already has a password in the Keychain
- **When** `migratePasswordToKeychain` is called
- **Then** no migration occurs and any leftover password is removed from the database.

### Scenario: Biometric auth previously allowed
- **Given** a legacy local-authentication status of `enabled`
- **When** `BiometricAuthenticationMigration.migratePasswordToKeychain` is called
- **Then** the biometric password is set silently and the legacy status is removed from defaults.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Core Data store move/destroy fails | Throws `AppGroupDataStoreMigrationError.migrationFailed(cause:)` |
| Directory contents cannot be read while detecting content | Throws `AppGroupDataStoreMigrationError.contentNotDetected(cause:)` |
| Setting the biometric password silently fails | Migration returns early without removing the legacy status |
| No password present in database during password migration | No-op; returns without modifying the Keychain |

## Dependencies

| Module | Usage |
|--------|-------|
| CoreData / NSPersistentContainer | Opens, moves, and destroys the legacy and App Group persistent stores |
| Session | Reads/writes password and biometric state across database, Keychain, and defaults |
| CoreAppConfiguration | Holds the active persistent container reference updated after migration |
| Log | Emits migration progress and outcome messages |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
