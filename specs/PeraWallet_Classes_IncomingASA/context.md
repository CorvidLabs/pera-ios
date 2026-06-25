# PeraWallet_Classes_IncomingASA — Context

## Overview

Architectural context for the `PeraWallet_Classes_IncomingASA` module — the **Incoming ASA inbox** (ARC-59 asset claiming) feature in Pera Wallet. The authoritative contract is `PeraWallet_Classes_IncomingASA.spec.md`; the source files it covers are listed in that spec's `files:` frontmatter.

## What it does

When an ASA is sent to a recipient who has not opted in, the asset is held in an on-chain ARC-59 inbox account. This module lets the recipient browse those pending assets and **claim** (opt in + pull) or **reject** (return to sender) them, signing the composed ARC-59 transaction group with their account's signer.

## Architecture

MVVM + data-controller pattern (app-target convention), no dedicated coordinator type — navigation is done imperatively via the global `Router`/`Screen` (`open(.incomingASA…)`, `open(.incomingASAsDetail…)`).

Three screen levels:

1. **Accounts list** — `IncomingASAAccountsViewController` (under `Accounts/`). Combine-driven: subscribes to an `InboxModelable`/`InboxViewModel`'s `$rows` and `$action` publishers and applies an `InboxDiffableDataSource`. Also hosts joint-account invite / sign-request / pending-transaction overlays. Marks messages read on `deinit`.
2. **Per-account inbox** — `IncomingASAAccountInboxViewController` (under `Inbox/`). Driven by `IncomingASAAccountInboxDataController` (protocol) / `IncomingASAAccountInboxAPIDataController` (impl), which pages `api.fetchIncomingASAsRequest` into an `NSDiffableDataSourceSnapshot<IncomingASASection, IncomingASAItem>` (`assetLoading` → `asset` / `empty`). Emits `didUpdate` / `didReceiveError` events.
3. **Detail** — `IncomingASAsDetailScreen` (under `Detail/`), a `BaseScrollViewController` with header/sender/id/account subviews, primary (claim) and secondary (reject) actions, and `IncomingASATransactionController` as its delegate. On success it pushes a `LoadingScreen` then a `SuccessResultScreen` with a Pera Explorer deep link.

The transaction engine is `IncomingASATransactionController` (+ `IncomingASATransactionController+Delegate`): composes ARC-59 claim/reject groups via `AlgorandSDK`, routes signing by account type (HD wallet / Algo25 / Ledger), and uploads via `TransactionAPIConnector`.

## Key files

- `Accounts/IncomingASAAccountsViewController.swift` — inbox entry list + joint-account overlays.
- `Inbox/Views/IncomingASAAccountInboxViewController.swift` — per-account pending-asset list.
- `Inbox/Data/IncomingASAAccountInboxAPIDataController.swift` — fetch/paging/snapshot building.
- `Inbox/Data/IncomingASAAccountInboxDataController.swift` — protocol + `IncomingASASection`/`IncomingASAItem`/event types.
- `Inbox/ListItemView/IncomingASAListItem.swift` — the per-asset draft model (asset, senders, Algo gain/cost, insufficiency flags).
- `Detail/IncomingASAsDetailScreen.swift` — claim/reject action screen + success/loading routing.
- `Detail/Transaction/IncomingASATransactionController.swift` (+ `+Delegate`) — ARC-59 compose/sign/upload.
- `*+Theme.swift` / `*Theme.swift` / `*ViewModel.swift` — Macaroon theming and presentation models for each view.

(Full list in the spec `files:` frontmatter.)

## Architectural decisions

- ARC-59 app ID is chosen at runtime by network (`AppEnvironment.current.testNetARC59AppID` vs `mainNetARC59AppID`).
- Insufficient-Algo guards (`hasInsufficientAlgoForClaiming`/`Rejecting`) short-circuit before any transaction is composed.
- Completion is propagated upward via `didCompleteTransaction` event handlers so each screen layer can dismiss/pop itself.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
