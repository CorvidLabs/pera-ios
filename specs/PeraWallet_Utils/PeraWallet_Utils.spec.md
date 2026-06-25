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
| `Loggable` | Protocol for a logging sink; requires `log(message:)` which may throw. |
| `LogsStorage` | `Loggable` sub-protocol for persistent log stores: fetch, archive, remove, clear, size, and truncate logs. |
| `PeraLogger` | Shared `ObservableObject` actor that fans out messages to registered loggers and manages the logs store. |
| `LoggerError` | Error type raised when a logger fails to write (`unableToLog`); surfaced via the published `error`. |
| `shared` | Singleton `PeraLogger` instance used app-wide for logging. |
| `log` | Formats a message with a timestamp and forwards it to all registered loggers, capturing failures into `error`. |
| `update` | Replaces the set of active loggers and the optional logs store. |
| `createLogsFile` | Builds and returns an archive URL of stored logs for export, or nil if no store is configured. |
| `deleteExportedLogsFile` | Removes the previously exported logs archive from the logs store. |
| `clearLogs` | Clears all persisted logs in the configured store. |
| `clearLogsIfExceedingSizeLimit` | Clears persisted logs only when their size exceeds the given byte limit (default 1,000,000). |
| `truncateLogs` | Truncates persisted logs when the store determines truncation is needed. |
| `Log` | Static convenience facade dispatching `log`, `clearLogs`, and `truncateLogs` to the shared `PeraLogger` actor. |

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
