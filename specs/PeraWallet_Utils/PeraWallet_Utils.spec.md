---
module: PeraWallet_Utils
version: 1
status: active
files:
  - PeraWallet/Utils/Archive/FileArchiver.swift
  - PeraWallet/Utils/Compatibility/SwiftUICompatibilityBaseViewController.swift
  - PeraWallet/Utils/Compatibility/SwiftUICompatibilityView.swift
  - PeraWallet/Utils/Constants/ViewIdentifier.swift
  - PeraWallet/Utils/Formatters/Data Types/CurrencyFormatterSettings.swift
  - PeraWallet/Utils/Formatters/DefaultRelativeDateTimeFormatter.swift
  - PeraWallet/Utils/Handlers/JointAccountTransactionCoordinator.swift
  - PeraWallet/Utils/Handlers/JointAccountTransactionHandler.swift
  - PeraWallet/Utils/Handlers/SharedAccountSignWithLedgerHandler.swift
  - PeraWallet/Utils/Logging/FileLogger.swift
  - PeraWallet/Utils/Logging/PeraLogger.swift
  - PeraWallet/Utils/Logging/TerminalLogger.swift
  - PeraWallet/Utils/Services/PollingService.swift
db_tables: []
depends_on: []
---

# PeraWallet_Utils

## Purpose

App-target UI/feature module (`PeraWallet/Utils`). Internal-by-default; see Public API for any cross-module-public surface.

## Public API

| Export | Description |
|--------|-------------|
| `Loggable` | Document caller-visible behavior and constraints. |
| `LogsStorage` | Document caller-visible behavior and constraints. |
| `PeraLogger` | Document caller-visible behavior and constraints. |
| `LoggerError` | Document caller-visible behavior and constraints. |
| `shared` | Document caller-visible behavior and constraints. |
| `log` | Document caller-visible behavior and constraints. |
| `update` | Document caller-visible behavior and constraints. |
| `createLogsFile` | Document caller-visible behavior and constraints. |
| `deleteExportedLogsFile` | Document caller-visible behavior and constraints. |
| `clearLogs` | Document caller-visible behavior and constraints. |
| `clearLogsIfExceedingSizeLimit` | Document caller-visible behavior and constraints. |
| `truncateLogs` | Document caller-visible behavior and constraints. |
| `Log` | Document caller-visible behavior and constraints. |

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
