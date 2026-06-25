# PeraWallet_Utils — Context

## Overview

`PeraWallet_Utils` (`PeraWallet/Utils/`) is the app target's cross-cutting utility layer — shared plumbing rather than a single feature screen. The authoritative contract is `PeraWallet_Utils.spec.md`; the exact source files it covers are in that spec's `files:` frontmatter.

## Key files

- `Logging/PeraLogger.swift` — `actor PeraLogger` (shared singleton) + `Loggable`/`LogsStorage` protocols + `Log` static facade. The only `public` surface of the module.
- `Logging/FileLogger.swift` — `LogsStorage` impl: day-bucketed `.txt` files, 7-day pruning on app activation, 1 MB cap, zip export.
- `Logging/TerminalLogger.swift` — `Loggable` impl backed by `os.Logger`.
- `Archive/FileArchiver.swift` — thin ZIPFoundation wrapper for log export.
- `Handlers/JointAccountTransactionCoordinator.swift` — orchestrates the shared-account (m-of-n) signing flow; emits `Action`s, presents overlay, routes to ledger handler.
- `Handlers/JointAccountTransactionHandler.swift` — builds raw transactions per `TransactionType`, collects local signers' signatures, calls the propose-sign API; maps response to `SignRequestMetadata`.
- `Handlers/SharedAccountSignWithLedgerHandler.swift` — `TransactionControllerDelegate` driving Ledger BLE connection + sign-with-ledger UI for a single signer.
- `Services/PollingService.swift` — `actor` running an async closure on a fixed `Duration` interval.
- `Compatibility/SwiftUICompatibilityBaseViewController.swift`, `Compatibility/SwiftUICompatibilityView.swift` — UIKit↔SwiftUI hosting bridges.
- `Formatters/DefaultRelativeDateTimeFormatter.swift`, `Formatters/Data Types/CurrencyFormatterSettings.swift`, `Constants/ViewIdentifier.swift` — formatting + identifier helpers.

## Architectural decisions

- **Logging is actor-isolated and best-effort.** `PeraLogger` serializes all access; sink failures are captured into a published `error` instead of throwing to callers. The `Log` facade dispatches into detached `Task`s so call sites stay synchronous.
- **Multiple loggers via protocol fan-out.** `Loggable`/`LogsStorage` let terminal + file sinks be registered together and swapped via `update(loggers:logsStore:)`.
- **Coordinator pattern for shared-account signing.** `JointAccountTransactionCoordinator` exposes state through a `@Published action` and delegates network/crypto work to `JointAccountTransactionHandler` and ledger UI to `SharedAccountSignWithLedgerHandler`, keeping presentation and signing separable.
- **Concurrency via Swift actors** (`PeraLogger`, `PollingService`) rather than locks; `PollingService` guarantees a single in-flight loop and cancels on `deinit`.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI. Module depends on `pera_wallet_core` plus UIKit/SwiftUI/Combine/OSLog/ZIPFoundation.
