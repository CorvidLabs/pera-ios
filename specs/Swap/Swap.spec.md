---
module: Swap
version: 1
status: active
files:
  - PeraWalletCore/Swap/SwapAssetValueFormatter.swift
  - PeraWalletCore/Swap/SwapTransactionSigning/SwapTransactionGroupSigner.swift
  - PeraWalletCore/Swap/SwapTransactionSigning/SwapTransactionSigner.swift
  - PeraWalletCore/Swap/TransactionTracker/TransactionMonitor.swift
  - PeraWalletCore/Swap/TransactionTracker/TransactionPoolMonitor.swift
db_tables: []
depends_on:
  - specs/Analytics/Analytics.spec.md
  - specs/API/API.spec.md
  - specs/Data/Data.spec.md
  - specs/Demo/Demo.spec.md
  - specs/Models/Models.spec.md
  - specs/Utils/Utils.spec.md
---

# Swap

## Purpose

Provides the supporting infrastructure for the asset-swap flow: formatting swap asset amounts and display names for the UI, signing the swap transaction groups returned by the swap provider (supporting standard, HD wallet, and Ledger accounts), and monitoring the on-chain confirmation of submitted swap transactions. It does not own the swap quote/routing logic itself; it owns value formatting, transaction signing, and post-submission tracking.

## Public API

| Export | Description |
|--------|-------------|
| `SwapAssetValueFormatter` | Stateless formatter producing display names and currency-formatted amounts for swap assets. |
| `getAssetDisplayName` | Returns the asset's unit name, falling back to its name, then its id as a string. |
| `getFormattedAlgoAmount` | Formats a decimal amount as an Algo value using a standalone Algo currency context. |
| `getFormattedAssetAmount` | Formats a decimal amount with no currency and a capped maximum fraction-digit count. |
| `getDecimalAmount` | Converts a raw integer asset amount into a `Decimal` scaled by the asset's decimals. |
| `init` | Initializers for the formatter and the signer/monitor types (parameterless or dependency-injected). |
| `EventHandler` | Closure typealias delivering signer/monitor events to observers. |
| `eventHandler` | Settable callback property invoked when a signer or monitor emits an event. |
| `signTransactions` | Signs every unsigned transaction across the provided swap transaction groups, one at a time for Ledger accounts. |
| `clearTransactions` | Discards the currently held transaction groups in the group signer. |
| `disconnectFromLedger` | Tears down the active Ledger connection used by the group signer. |
| `Event` | Enum of signing lifecycle events emitted by the signers (signed, completed, failed, Ledger states). |
| `signTransaction` | Signs a single unsigned transaction, routing to Ledger, HD wallet, or standard signing per account type. |
| `disonnectFromLedger` | Disconnects the current Ledger device, stops scanning, and cancels the connection timer (note: misspelled). |
| `ledgerTransactionOperation` | Delegate callbacks handling received Ledger signatures and Ledger operation failures. |
| `ledgerTransactionOperationDidFinishTimingOperation` | Delegate callback that stops the timer and emits a `didFinishTiming` event. |
| `ledgerTransactionOperationDidResetOperation` | Delegate callback emitting a `didLedgerReset` event. |
| `ledgerTransactionOperationDidResetOperationOnSuccess` | Delegate callback emitting a `didLedgerResetOnSuccess` event. |
| `ledgerTransactionOperationDidRejected` | Delegate callback emitting a `didLedgerRejectSigning` event. |
| `SignError` | Error enum distinguishing Ledger operation errors from API/transaction errors during signing. |
| `TransactionMonitor` | Protocol for observing a submitted transaction until completion, failure, or network error. |
| `TransactionMonitorEvent` | Enum of monitor outcomes: completed, failed transaction, or network failure. |
| `Seconds` | `TimeInterval` typealias for the pool monitor's polling intervals. |
| `hasReachedRepeatingLimit` | Indicates the monitor has exhausted its 30 polling attempts. |
| `monitor` | Begins polling the transaction pool for the given transaction's confirmation status. |
| `stop` | Cancels any in-flight request and stops the polling repeater. |

## Invariants

1. `getDecimalAmount` scales the raw value by the asset's `decimals` exactly, so round-tripping never loses precision for valid `UInt64` inputs.
2. The group signer only emits `didCompleteSigningTransactions` once every transaction in every group has a non-nil signature.
3. For accounts that require a Ledger connection, the group signer signs exactly one transaction per round and resumes after each successful Ledger signature.
4. `TransactionPoolMonitor` polls at most `repeatingLimit` (30) times before failing the transaction.
5. On either completion or failure, the pool monitor calls `stop()`, leaving no active request or repeater.
6. The pool monitor ignores HTTP 404 (not-yet-propagated) responses until the repeating limit is reached.

## Behavioral Examples

### Scenario: Standard account signs all swap transactions
- **Given** a non-Ledger account and a set of swap transaction groups with empty signature slots
- **When** `signTransactions` is called
- **Then** each transaction is signed and `didCompleteSigningTransactions` is emitted with the upload-ready data

### Scenario: Transaction confirms on chain
- **Given** a submitted transaction id being monitored
- **When** the pool reports the transaction status as `completed`
- **Then** the monitor emits `didCompleted` and stops polling

### Scenario: Transaction never confirms
- **Given** a monitored transaction that stays pending
- **When** the monitor reaches its 30th poll
- **Then** it emits `didFailedTransaction` and stops

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Ledger connection not established within 10s | Emits `Event.didFailSigning(.ledger(.ledgerConnectionWarning))` |
| Ledger operation fails | Emits `Event.didFailSigning(.ledger(error:))` |
| SDK fails to produce raw/signed transaction for HD account | Emits `Event.didFailSigning(.api(error: HIPTransactionError...))` |
| Standard account has no private key for signer address | Signing silently returns without emitting an event |
| Pool monitor exhausts its polling limit | Emits `TransactionMonitorEvent.didFailedTransaction` |
| Pool request fails (non-404, or 404 past limit) | Emits `TransactionMonitorEvent.didFailedNetwork(error)` |

## Dependencies

| Module | Usage |
|--------|-------|
| ALGAPI | Pending-transaction polling and session private-key access |
| ALGAnalytics | Analytics for Ledger transaction operations |
| HDWalletStorable | Retrieves HD wallet seed for HD-account signing |
| SharedDataController | Resolves auth/rekeyed accounts for signing decisions |
| LedgerTransactionOperation | Drives Ledger scanning, signing, and delegate callbacks |
| CurrencyFormatter | Formats Algo and asset amounts |
| MagpieCore / MagpieHipo | Networking primitives and typed network errors |
| MacaroonUtils | `Repeater` driving the polling loop |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
