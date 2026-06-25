---
module: PeraWallet_Classes_Backup
version: 1
status: active
files:
  - PeraWallet/Classes/Backup/AccountSelection/BackUpAccountSelectionListLayout.swift
  - PeraWallet/Classes/Backup/AccountSelection/Data/BackUpAccountSelectionListDataSource.swift
  - PeraWallet/Classes/Backup/AccountSelection/Data/BackUpAccountSelectionListLocalDataController.swift
  - PeraWallet/Classes/Backup/AccountSelection/Views/AccountCell/BackUpAccountSelectionListAccountListItemCell.swift
  - PeraWallet/Classes/Backup/AccountSelection/Views/AccountCell/BackUpAccountSelectionListAccountListItemCellTheme.swift
  - PeraWallet/Classes/Backup/AccountSelection/Views/Header/BackUpAccountSelectionListHeader.swift
  - PeraWallet/Classes/Backup/AccountSelection/Views/Header/BackUpAccountSelectionListHeaderTheme.swift
  - PeraWallet/Classes/Backup/AccountSelection/Views/Header/BackUpAccountSelectionListHeaderViewModel.swift
  - PeraWallet/Classes/Backup/BackUpAccountFlowCoordinator.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Backup

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Backup`) that drives the **account back-up flow** — prompting the user to securely back up the recovery passphrase / mnemonic for accounts that are not yet backed up.

It has two responsibilities:

1. **Flow orchestration** — `BackUpAccountFlowCoordinator` is the entry point. Given one not-backed-up `AccountHandle` (or a list), it opens the appropriate back-up tutorial screen. For a single account it routes straight into the tutorial; for multiple accounts it routes into the account-selection list first (`needsAccountSelection`). HD (BIP-39) accounts open the `.backUpBip39` tutorial flow (`.addBip39Wallet`); legacy Algo25 accounts open the `.backUp` tutorial flow (`.addAlgo25Account`). The coordinator presents these as full-screen modals on a `presentingScreen` it is handed.
2. **Account selection list** — the `AccountSelection/` subtree supplies the data layer, layout, and cells for a list of accounts that still need backing up. It is hosted inside the generic `AccountSelectionListScreen<BackUpAccountSelectionListLocalDataController>` constructed in `Router.swift` (`.backUpAccountSelection` route). The local data controller fetches `sharedDataController.sortedAccountsForDisplay()`, filters to `!isBackedUp`, and emits loading / no-content / content diffable snapshots.

The coordinator listens for a `didBackUpAccount` notification (posted elsewhere when back-up completes), re-wraps the account into a `.ready` `AccountHandle`, forwards a `.didBackUpAccount` event, dismisses the presented flow, and stops observing.

Ownership boundary: this module owns only the back-up flow wiring and the back-up account-selection list. The actual tutorial / passphrase screens belong to the Shared Tutorial module; the generic selection-list screen, cells, and view models (`AccountSelectionListScreen`, `AccountListItemViewModel`, `AccountSelectionListNoContentCell`, etc.) belong to the Accounts module and are reused here.

## Public API

| Export | Description |
|--------|-------------|
| `calculatePreferredSize` | Macaroon view-sizing method computing a header/cell's preferred size for a given view model, layout sheet, and fitting size. |

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. The selection list shows **only accounts that are not backed up** — the data controller filters `sortedAccountsForDisplay()` to `!$0.value.isBackedUp` before building any content snapshot.
3. Account-type determines the tutorial: an HD/BIP-39 account (`account.isHDAccount`) always opens the `.backUpBip39` tutorial under the `.addBip39Wallet` mode; any other account opens the `.backUp` tutorial under `.addAlgo25Account`.
4. `needsAccountSelection` is true exactly when the flow is launched without a concrete account (multi-account entry); for a singular or explicit-account launch it is false and the tutorial opens directly.
5. The `didBackUpAccount` observation is single-shot: after firing `.didBackUpAccount` and dismissing, the coordinator calls `stopObservingNotifications()`; it is also torn down in `deinit`.
6. All snapshot delivery is done off the main thread on a private serial queue, while the resulting event (and `lastSnapshot` assignment) is always published back on the main thread.

## Behavioral Examples

### Scenario: Backing up a single not-backed-up account
- **Given** the user triggers back-up for one `AccountHandle` whose account is a legacy Algo25 account
- **When** `BackUpAccountFlowCoordinator.launch(_:)` is called with that account
- **Then** the coordinator starts observing `didBackUpAccount` and presents the `.backUp` tutorial full-screen with `needsAccountSelection == false` and the account address pre-filled

### Scenario: Choosing among several accounts to back up
- **Given** the user has multiple accounts and at least two are not backed up
- **When** the back-up flow launches with the multi-account `launch(_:)` overload (no singular account)
- **Then** the back-up account-selection list opens, loads `sortedAccountsForDisplay()` filtered to `isBackedUp == false`, and renders one `BackUpAccountSelectionListAccountListItemCell` per remaining account under a header describing the back-up prompt

### Scenario: Completing back-up
- **Given** the back-up tutorial flow is presented and the user finishes backing up
- **When** the `didBackUpAccount` notification is posted with the `account` user-info key
- **Then** the coordinator wraps it as a `.ready` `AccountHandle`, emits `.didBackUpAccount(handle)`, dismisses the presented screen, and stops observing the notification

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Multi-account `launch(_:)` receives a singular list whose `first` is nil | `stopObservingNotifications()` is called and the flow returns without presenting anything |
| `didBackUpAccount` notification arrives without an `account` (or wrong type) in `userInfo` | Handler returns early; no event emitted, no dismissal, observation stays active |
| `sortedAccountsForDisplay()` filtered list is empty | Data controller delivers the no-content snapshot (`AccountSelectionListNoContentViewModel`) instead of an accounts section |
| Cell/header size requested before data is bound | Layout returns a cached or sample-derived size (`CustomAccountListItem` placeholder) so layout never blocks on real data |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core | `ALGAPI`, `Account`, `AccountHandle`, `SharedDataController`, `CurrencyFormatter`, `NotificationObserver` |
| PeraWallet Accounts (AccountSelection) | `AccountSelectionListScreen`, `AccountSelectionListDataController`/`DataSource`/`Layout`, `AccountListItemViewModel`, `AccountSelectionListNoContentCell`, `AccountSelectionListLoadingAccountItemCell` reused as the host screen and shared cells |
| PeraWallet Shared Tutorial | `.tutorial` screen / `.backUp` and `.backUpBip39` flows presented as the destination of the back-up flow |
| PeraWallet Routing | `Screen.backUpAccountSelection` route + `Router` build the hosted selection screen; `open(_:by:)` performs presentation |
| MacaroonUIKit / MacaroonUtils | `ViewModel`, `StyleSheet`/`LayoutSheet` theming, diffable list infrastructure, `asyncBackground`/`asyncMain`, `NotificationObserver` |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
