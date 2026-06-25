---
module: AlgorandSecureBackup
version: 1
status: active
files:
  - PeraWalletCore/AlgorandSecureBackup/BackupMetadata.swift
db_tables: []
depends_on:
  - specs/Models/Models.spec.md
---

# AlgorandSecureBackup

## Purpose

Defines the metadata model for the Algorand Secure Backup feature. `BackupMetadata` captures the identifying and timestamp information that describes a single secure backup, providing a `Codable`, value-comparable representation used when creating, serializing, and reconciling backups.

## Public API

| Export | Description |
|--------|-------------|
| `BackupMetadata` | Immutable, `Codable`/`Equatable` value type describing a single secure backup's identity and creation time. |
| `id` | Stable string identifier of the backup. |
| `createdAtDate` | Timestamp marking when the backup was created. |
| `init` | Memberwise initializer assigning `id` and `createdAtDate`. |

## Invariants

1. A `BackupMetadata` value is immutable; `id` and `createdAtDate` are `let` and never change after initialization.
2. Two `BackupMetadata` values are equal if and only if both `id` and `createdAtDate` are equal.
3. The type round-trips through `Codable` without loss of `id` or `createdAtDate`.

## Behavioral Examples

### Scenario: Create backup metadata
- **Given** a backup identifier and a creation date
- **When** `BackupMetadata(id:createdAtDate:)` is called
- **Then** the returned value exposes the same `id` and `createdAtDate`

### Scenario: Compare two metadata values
- **Given** two `BackupMetadata` values with identical `id` and `createdAtDate`
- **When** they are compared with `==`
- **Then** the comparison returns `true`

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Decoding from JSON missing `id` or `createdAtDate` | `Decodable` initializer throws a `DecodingError` |
| Decoding `createdAtDate` with an unexpected date format | Decoding fails per the configured `JSONDecoder` date strategy |

## Dependencies

| Module | Usage |
|--------|-------|
| Foundation | Provides `Date`, `Codable`, and JSON encoding/decoding support |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
