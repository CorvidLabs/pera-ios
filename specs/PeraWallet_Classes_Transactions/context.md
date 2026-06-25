# PeraWallet_Classes_Transactions — Context

## Overview

Architectural context for the `PeraWallet_Classes_Transactions` module. The authoritative contract is `PeraWallet_Classes_Transactions.spec.md`; the source files it covers are listed in that spec's `files:` frontmatter.

This module is the transaction-facing UI for Pera Wallet: sending value, browsing history, and inspecting individual transactions. It is an app-target module (internal access), not a library boundary.

## Architecture

- **Pattern:** MVVM + per-screen data controllers. View controllers (`*ViewController` / `*Screen`) own layout and routing; `*ViewModel` types map domain models to display values; `*Theme` / `*+Theme` files hold styling; `*DataController` types (e.g. `TransactionsAPIDataController`, `TransactionDetailLocalDataController`, `InnerTransactionListLocalDataController`) own data fetch, pagination, polling, and diffable snapshots.
- **Navigation:** screens are reached via the app-wide `Screen` router enum (`open(.sendTransactionPreview…, by: .push)`, `.present`, `BottomSheetTransition`). Send → preview → result is a push stack; filters, warnings, edit-note, and opt-in info are bottom sheets.
- **Lists:** `UICollectionView` with diffable data sources (`TransactionsDataSource`, `InnerTransactionListDataSource`, `AppCallAssetListDataSource`) and custom flow layouts (`TransactionsListLayout`, etc.). Items are modeled as an enum of transaction types (algo / asset / app-call / asset-config / key-reg / heartbeat / pending) plus filter/title/empty/next-list rows.
- **Delegation boundary:** signing/submission is delegated to `TransactionController`, `TransactionSendController`, and `ARC59TransactionSendController` (not in this module); domain models and services come from `pera_wallet_core`.

## Key files

- Send entry/validation: `Send/Preview/Main/Screens/SendTransaction/SendTransactionScreen.swift`, `…/TransactionAmountValidator.swift`
- Send preview/confirm: `Send/Preview/Main/Screens/SendTransactionPreview/SendTransactionPreviewScreen.swift`
- ARC-59 asset inbox: `Send/Inbox/SendAssetInboxScreen.swift`, `SendAssetInboxDraft.swift`
- Key-reg send: `KeyReg/SendKeyRegTransactionScreen.swift`
- List/history: `List/Screens/TransactionsViewController.swift`, `List/Screens/TransactionsAPIDataController.swift`, `List/Screens/Filter/TransactionFilterViewController.swift`
- Detail: `Detail/Screens/TransactionDetailViewController.swift`, `Detail/ViewModels/TransactionDetailViewModel.swift`
- App-call detail + inner txns: `AppCallDetail/AppCallTransactionDetailViewController.swift`, `InnerTransactionsList/InnerTransactionListViewController.swift`
- Explorer linking: `AlgoExplorerType.swift`; transfer direction: `TransferType.swift`

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI. Send, history, detail, ARC-59 inbox, and key-reg flows are all live in the shipping app.
