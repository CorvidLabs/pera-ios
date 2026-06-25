# PeraWallet_Utils — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Remove the stray `enum TestError` (and its `case test`) left in `SharedAccountSignWithLedgerHandler.swift` — it is unused production code.
- [ ] Fix the misspelled license header comment in `PollingService.swift` (`"AS IS BASIS` — missing closing quote/`"`).
- [ ] Rename misspelled symbols for clarity: `isNagativeValuesAllowed`/`exludedWords` in `DefaultRelativeDateTimeFormatter`, `singature`/`normalLocalAcounts`/`unableToResoreMessagesFromLogsFile` referenced across the handlers and `FileLogger`.
- [ ] `PeraLogger.update(loggers:logsStore:)` is declared `throws` but never throws — drop `throws` or document the intended failure mode.
- [ ] Add unit tests for `FileLogger` size cap / `truncateLogsIfNeeded` and 7-day pruning, and for `PollingService` start/stop/restart semantics.
- [ ] Consider surfacing logging `error` (the published `LoggerError`) somewhere observable instead of letting it silently accumulate.

## Done
- [x] Spec and companion files scaffolded.
- [x] Logging API documented in the spec Public API table (`Loggable`, `LogsStorage`, `PeraLogger`, `Log`, store actions).
- [x] Joint/shared-account signing flow (coordinator + handler + ledger handler) implemented and wired to the pending-transaction overlay.
- [x] `PollingService` actor with single-loop / deinit-cancel guarantees.
