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

App-target cross-cutting utility layer (`PeraWallet/Utils`) — not a single screen but the shared plumbing several features rely on:

- **Logging** (`Logging/`, `Archive/`): `PeraLogger` is an app-wide `actor` that fans messages out to multiple `Loggable` sinks (`TerminalLogger` via `os.Logger`, `FileLogger` writing day-bucketed `.txt` files). `FileLogger` also implements `LogsStorage`, exposing fetch/clear/size/truncate plus a zip export built with `FileArchiver` (ZIPFoundation) for the Settings "export logs" flow. `Log` is a fire-and-forget static facade onto the shared actor.
- **Joint / shared account signing** (`Handlers/`): `JointAccountTransactionCoordinator` drives the multi-signer (m-of-n) transaction flow for shared accounts. It proposes a sign request through `JointAccountTransactionHandler` (which builds raw transactions per type, collects local signers' signatures, and calls the propose-sign API), presents the pending-transaction overlay, and routes ledger-backed signers through `SharedAccountSignWithLedgerHandler` (Ledger BLE connection + sign-with-ledger UI as a `TransactionControllerDelegate`).
- **Service helpers** (`Services/`): `PollingService` is a reusable `actor` that runs an async closure on a fixed `Duration` interval until stopped/deinit.
- **UIKit↔SwiftUI bridging** (`Compatibility/`): `SwiftUICompatibilityBaseViewController` embeds a hosting controller inside a `BaseViewController`; `SwiftUICompatibilityView` wraps a SwiftUI `View` in a self-sizing `UIView`.
- **Formatting & constants** (`Formatters/`, `Constants/`): `DefaultRelativeDateTimeFormatter` (relative "x ago" / "just now" strings with optional sign stripping), `CurrencyFormatterSettings` (a `LocalCurrency` value), and `ViewIdentifier` (accessibility/automation IDs).

Ownership boundary: app target, internal-by-default. The only intentionally `public` surface is the logging API (see Public API). Everything else is consumed in-process by other UI modules.

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

1. `PeraLogger` is an `actor` with a single `shared` instance; all mutable state (registered `loggers`, `logsStore`, published `error`) is mutated only on the actor, so concurrent `log` calls from any thread are serialized.
2. A logging failure never propagates to callers: `PeraLogger.log(message:)` swallows per-sink throws into the published `error`, and the `Log` facade dispatches into detached `Task`s — logging is best-effort and side-effect-only.
3. `FileLogger` keeps logs bounded: files are bucketed per calendar day, logs older than 7 days are purged on `didBecomeActive`, and total size is capped at 1 MB via `truncateLogsIfNeeded` / `clearLogsIfExceedingSizeLimit`.
4. In the shared-account flow, the signer set is derived from `jointAccountParticipants`; if every local participant has a Ledger detail, signing requires a Ledger connection (`isConnectionWithLedgerRequired`), and at least one signer with an `address` must exist or the handler throws `noSignersAccounts`.
5. `PollingService.start` always cancels any in-flight task before scheduling a new one, and the task self-cancels on `Task.isCancelled`, on `stop()`, and on `deinit` — so at most one polling loop runs per instance.

## Behavioral Examples

### Scenario: Joint account transaction with all-Ledger signers
- **Given** a shared (joint) account whose local participants all have Ledger details
- **When** the user submits a send/opt-in/rekey transaction and `JointAccountTransactionCoordinator.handleTransaction` runs
- **Then** the coordinator immediately emits `.connectionWithLedgerNeeded`, proposes the sign request via `JointAccountTransactionHandler`, presents the pending-transaction overlay, and on "Sign with Ledger" hands the signer off to `SharedAccountSignWithLedgerHandler`, which opens the Ledger connection screen and the sign-with-ledger progress screen.

### Scenario: Cancelling a pending shared-account transaction
- **Given** the joint-account pending-transaction overlay is shown for an opt-in/opt-out transaction
- **When** the user taps cancel and confirms in the bottom-warning dialog
- **Then** `cancelTransaction` dismisses the overlay and `cancelAssetMonitoring` calls the `blockchainUpdatesMonitor` to stop (opt-in) or mark-for-notification (opt-out) the asset update for that account.

### Scenario: Exporting logs from Settings
- **Given** `PeraLogger.shared` has been configured with a `FileLogger` as its `logsStore`
- **When** `createLogsFile()` is called
- **Then** any previous `logs.zip` is removed, the day-bucketed log directory is zipped via `FileArchiver` into the temp directory, and the archive `URL` is returned for sharing (returns `nil` if no store is configured).

## Error Cases

| Condition | Behavior |
|-----------|----------|
| A `Loggable` sink throws while writing | Caught in `PeraLogger.log`; stored in published `error` as `.unableToLog`; other sinks still receive the message; caller is unaffected |
| Log message is not UTF-8 encodable / file write fails | `FileLogger` throws `unableToConvertLogMessageToData` / `unableToUpdateLogsFile`; surfaced to `PeraLogger.error` |
| Zip export fails | `FileLogger.createLogsArchive` throws `unableToCreateArchive`; `createLogsFile()` rethrows |
| Joint account has no local signer with an address | `JointAccountTransactionHandler` throws `noSignersAccounts`; coordinator emits `.failure` |
| Propose-sign response has no raw transaction / not base64 | Coordinator throws `InternalError.unableToEncodeTransaction` and emits `.failure` |
| Signer account for a Ledger sign cannot be resolved by address | Coordinator emits `.failure(InternalError.signerAccountNotFound)` |
| `signRequestMetadata` is nil after propose | Coordinator emits `.overlayDismissed` (no overlay shown) |
| Ledger pairing/connection error during sign | `SharedAccountSignWithLedgerHandler` dismisses the connection screen and shows the "ledger pairing issue" bottom warning |
| Transaction `minimumAmount` / SDK / network error during ledger sign | Error banner presented via `bannerController` with the formatted minimum amount or SDK/network message |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core (PeraWalletCore) | `Account`, `AccountsServiceable`, `SharedDataController`, `TransactionController`(+delegate), transaction draft/builder types, `ProposeSignResponse`/`SignRequestMetadata`, `LocalCurrency`/`CurrencyID`, `CurrencyFormatter`, `BaseViewController`/`ViewControllerConfiguration` |
| ZIPFoundation | `FileManager.zipItem` used by `FileArchiver` for log archives |
| os.Logger (OSLog) | Backing sink for `TerminalLogger` |
| UIKit | View-controller hosting, bottom sheets, banners, Ledger/sign-with-ledger screens |
| SwiftUI | `UIHostingController` bridging in `Compatibility/` |
| Combine | `FileLogger` observes `UIApplication.didBecomeActiveNotification` to prune old logs |
| Other app UI modules | Consume the bottom-sheet/Ledger/overlay screens (`BottomSheetTransition`, `LedgerConnectionScreen`, `SignWithLedgerProcessScreen`, `JointAccountPendingTransactionOverlay*`) |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
