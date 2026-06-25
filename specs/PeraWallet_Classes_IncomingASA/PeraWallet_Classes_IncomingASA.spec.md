---
module: PeraWallet_Classes_IncomingASA
version: 1
status: active
files:
  - PeraWallet/Classes/IncomingASA/Accounts/InboxDiffableDataSource.swift
  - PeraWallet/Classes/IncomingASA/Accounts/IncomingASAAccountCell.swift
  - PeraWallet/Classes/IncomingASA/Accounts/IncomingASAAccountsNoContentViewModel.swift
  - PeraWallet/Classes/IncomingASA/Accounts/IncomingASAAccountsViewController.swift
  - PeraWallet/Classes/IncomingASA/Accounts/IncomingASAAccountsViewController+Theme.swift
  - PeraWallet/Classes/IncomingASA/Accounts/IncomingASAAccountView.swift
  - PeraWallet/Classes/IncomingASA/Accounts/IncomingASAAccountViewTheme.swift
  - PeraWallet/Classes/IncomingASA/Detail/AccountView/IncomingASADetailAccountView.swift
  - PeraWallet/Classes/IncomingASA/Detail/AccountView/IncomingASADetailAccountViewTheme.swift
  - PeraWallet/Classes/IncomingASA/Detail/Header/IncomingASARequestHeaderTheme.swift
  - PeraWallet/Classes/IncomingASA/Detail/Header/IncomingASARequestHeaderViewModel.swift
  - PeraWallet/Classes/IncomingASA/Detail/Id/IncomingASARequestIdTheme.swift
  - PeraWallet/Classes/IncomingASA/Detail/IncomingASAsDetailScreen.swift
  - PeraWallet/Classes/IncomingASA/Detail/IncomingASAsDetailScreen+Theme.swift
  - PeraWallet/Classes/IncomingASA/Detail/IncomingASAsDetailSuccessResultScreenViewModel.swift
  - PeraWallet/Classes/IncomingASA/Detail/IncomingASAsDetailView.swift
  - PeraWallet/Classes/IncomingASA/Detail/IncomingASAsDetailViewModel.swift
  - PeraWallet/Classes/IncomingASA/Detail/IncomingASAsDetailViewTheme.swift
  - PeraWallet/Classes/IncomingASA/Detail/Loading/IncomingASAsDetailLoadingScreenViewModel.swift
  - PeraWallet/Classes/IncomingASA/Detail/Sender/IncomingASARequesSenderView.swift
  - PeraWallet/Classes/IncomingASA/Detail/Sender/IncomingASARequestSenderViewModel.swift
  - PeraWallet/Classes/IncomingASA/Detail/Sender/IncomingASARequestSenderViewTheme.swift
  - PeraWallet/Classes/IncomingASA/Detail/Transaction/IncomingASATransactionController.swift
  - PeraWallet/Classes/IncomingASA/Detail/Transaction/IncomingASATransactionController+Delegate.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Data/IncomingASAAccountInboxAPIDataController.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Data/IncomingASAAccountInboxDataController.swift
  - PeraWallet/Classes/IncomingASA/Inbox/ListItemView/IncomingASAListItem.swift
  - PeraWallet/Classes/IncomingASA/Inbox/ListItemView/IncomingASAListItemTheme.swift
  - PeraWallet/Classes/IncomingASA/Inbox/ListItemView/IncomingASAListItemView.swift
  - PeraWallet/Classes/IncomingASA/Inbox/ListItemView/IncomingASAListItemViewModel.swift
  - PeraWallet/Classes/IncomingASA/Inbox/ListItemView/IncomingASAListItemViewTheme.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Model/IncomingASAAssetListItemViewModel.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Model/IncomingASASenderViewModel.swift
  - PeraWallet/Classes/IncomingASA/Inbox/TitleView/IncominASAListTitleView.swift
  - PeraWallet/Classes/IncomingASA/Inbox/TitleView/IncominASAListTitleViewModel.swift
  - PeraWallet/Classes/IncomingASA/Inbox/TitleView/IncominASAListTitleViewTheme.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxHeaderTitleCell.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxListDataSource.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxListItemCell.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxListLayout.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxListLayout+Theme.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxViewController.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxViewController+Theme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_IncomingASA

## Purpose

App-target UI/feature module (`PeraWallet/Classes/IncomingASA`) for the **Incoming ASA inbox** — Pera Wallet's implementation of asset claiming via the ARC-59 inbox-router smart contract. When someone sends an Algorand Standard Asset (ASA) to a recipient who has not opted in, the asset is parked in an on-chain "inbox" account. This module lets the recipient review those pending assets and either **claim** them (opt in + pull from inbox into the wallet account) or **reject** them (return to the sender), signing the composed ARC-59 transaction group with a standard, HD-wallet, or Ledger signer.

The feature spans three screen levels:

- **Accounts list** (`IncomingASAAccountsViewController`) — the inbox entry surface. A Combine-driven `InboxModelable`/`InboxViewModel` renders rows for assets with pending requests, plus joint-account invite/sign-request rows. Tapping an asset row drills into the per-account inbox; tapping an invite/request row branches into the joint-account flows. Marks inbox messages as read on deinit.
- **Account inbox** (`IncomingASAAccountInboxViewController`) — per-account list of pending incoming assets for one address. Backed by `IncomingASAAccountInboxAPIDataController`, which pages `api.fetchIncomingASAsRequest(address:with:)` into a diffable snapshot (loading → assets / empty). Supports copy-asset-ID context menu and an info sheet. Tapping an asset presents the detail screen.
- **Detail** (`IncomingASAsDetailScreen`) — claim/reject action screen for a single `IncomingASAListItem`. Shows asset header, sender(s), request id, account portfolio, and the Algo gain/cost of claiming vs. rejecting. The primary action claims; the secondary action opens a reject-confirmation sheet. Both routes flow through `IncomingASATransactionController`, then to a loading screen and a success result screen with a Pera Explorer link.

Ownership boundary: this module owns the inbox UI, its data controllers, and the ARC-59 claim/reject transaction controller. It depends on `pera_wallet_core` (PeraWalletCore) for models, API, signing SDK, and shared services, and reuses app-target joint-account and Ledger flows. It does not own the ARC-59 contract, the backend inbox indexer, or the wallet's general transaction infrastructure.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. The detail screen resolves its acting `Account` by matching `draft.accountAddress` against `sharedDataController.sortedAccounts()`; claim/reject is a no-op when no draft or matching account is present (`performPrimaryAction`/`performSecondaryAction` guard and return).
3. A claim/reject is blocked with a min-balance error banner before composing transactions when `draft.hasInsufficientAlgoForClaiming` (claim) or `draft.hasInsufficientAlgoForRejecting` (reject) is true; the transaction is never submitted in that case.
4. Claim composes an ARC-59 *claim* transaction group (opting in when `!account.isOptedIn(to:)`); reject composes an ARC-59 *reject* group. The correct ARC-59 app ID is selected by network (`testNetARC59AppID` on TestNet, `mainNetARC59AppID` otherwise).
5. Signing is routed by account type: HD-wallet accounts (or accounts whose auth account is HD) sign via `HDWalletTransactionSigner`; Algo25 accounts sign with stored private data; Ledger-backed accounts go through the BLE Ledger flow with a 50-second timeout. A transaction group is uploaded only after every transaction in it is signed.
6. The account inbox list reflects request count: when `requestsCount == 0` the data controller emits the empty section/no-content state instead of asset rows; paging continues while the API returns a non-nil `nextCursor`.
7. On a completed transaction the detail screen surfaces success, then propagates `didCompleteTransaction` up through the inbox and accounts screens, which pop/dismiss back toward the wallet.

## Behavioral Examples

### Scenario: Claim an incoming asset with a standard account
- **Given** the user opens the inbox and taps an asset row whose `IncomingASAListItem` has sufficient Algo for claiming
- **When** they tap the primary action on `IncomingASAsDetailScreen`
- **Then** `IncomingASATransactionController` fetches transaction params, composes the ARC-59 claim group (opting in if needed), signs it with the account's signer, uploads it, shows a loading then success screen, and the "View transaction" action opens the transaction in Pera Explorer for the current network.

### Scenario: Reject an incoming asset
- **Given** the user is on the detail screen for a pending asset
- **When** they tap the secondary action and confirm "reject" in the bottom sheet (which shows the Algo gain on reject)
- **Then** the controller composes and signs the ARC-59 reject group and submits it, returning the asset to the sender; on success the screen dismisses and emits `didCompleteTransaction`.

### Scenario: Insufficient Algo to cover claim/reject cost
- **Given** an asset whose draft has `hasInsufficientAlgoForClaiming == true`
- **When** the user taps the primary (claim) action
- **Then** an error banner with the min-balance message is shown and no transaction is composed or submitted.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Inbox request fetch fails (`api.fetchIncomingASAsRequest` failure) | Data controller publishes `didReceiveError`; inbox screen shows an error banner with the API's localized description |
| Insufficient Algo for claim/reject | Min-balance error banner; claim/reject aborted before composing |
| ARC-59 SDK fails to compose claim/reject group (`composeArc59ClaimAssetTxn`/`composeArc59RejectAssetTxn` returns nil) | Error banner with SDK error; `didFailedComposing(.inapp(.sdkError))` reported, flow stops |
| Transaction params fetch fails | Error banner; `didFailedComposing(.inapp(.other))` reported |
| Upload fails (no transaction ID / network error) | Error banner; `didFailedTransaction(.network)` reported, loading screen popped |
| `displayTransactionError` — `.minimumAmount` | Formatted min-transaction error banner |
| `displayTransactionError` — `.invalidAddress` | Receiver-address validation error banner |
| Ledger connection lost / 50s timeout | BLE/ledger-connection error banner; ledger connection issues warning sheet; ledger operation reset |
| Ledger user cancels / closes app / address mismatch | Corresponding BLE error banner (`ble-error-*`) |

## Dependencies

| Module | Usage |
|--------|-------|
| `pera_wallet_core` (PeraWalletCore) | `Account`, `Asset`/`StandardAsset`/`CollectibleAsset`, `AssetDecoration`, `Senders`, `SharedDataController`, `ALGAPI` (`fetchIncomingASAsRequest`), `CurrencyFormatter`, `AppEnvironment` (ARC-59 app IDs) |
| AlgorandSDK (`algoSDK`) | Compose ARC-59 claim/reject transaction groups; raw/signed transaction encoding |
| HD wallet signing | `HDWalletTransactionSigner` + `HDWalletStorable` for HD-account signing |
| Ledger flow | `LedgerTransactionOperation`, `LedgerTransactionSigner`, `LedgerConnectionScreen`, `SignWithLedgerProcessScreen` for hardware-wallet signing |
| Transaction infra | `TransactionAPIConnector` (upload), `TransactionController`, `TransactionParams` |
| Joint-account flows | `JointAccountInviteConfirmationOverlay`, `JointAccountTransactionRequestSummary`, `JointAccountPendingTransactionOverlay` (invite/sign-request rows from the accounts list) |
| Routing | `Screen.incomingASA` / `Screen.incomingASAsDetail` via `Router` (`open(_:by:)`) |
| Macaroon UIKit / SnapKit | Theming, layout, diffable data sources, bottom sheets |
| Analytics | `ALGAnalytics` joint-account event tracking |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
