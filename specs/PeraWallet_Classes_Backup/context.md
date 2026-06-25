# PeraWallet_Classes_Backup — Context

## Overview

Architectural context for the `PeraWallet_Classes_Backup` module — the account back-up flow in Pera Wallet. The authoritative contract is `PeraWallet_Classes_Backup.spec.md`; the source files it covers are listed in that spec's `files:` frontmatter.

## Key files

- `BackUpAccountFlowCoordinator.swift` — flow entry point. Conforms to `NotificationObserver`. `launch(_ AccountHandle)` / `launch([AccountHandle])` decide whether to show account selection, then open the `.backUp` or `.backUpBip39` tutorial via `presentingScreen.open(_:by:)`. Observes `didBackUpAccount`, emits a `.didBackUpAccount(AccountHandle)` event, and dismisses.
- `AccountSelection/Data/BackUpAccountSelectionListLocalDataController.swift` — `AccountSelectionListDataController` + `BackUpAccountSelectionListItemDataSource`. Filters `sortedAccountsForDisplay()` to `!isBackedUp`, builds `AccountListItemViewModel`s, and delivers loading/empty/accounts diffable snapshots. Defines the section/item identifier enums.
- `AccountSelection/Data/BackUpAccountSelectionListDataSource.swift` — cell + supplementary-view providers; registers the account cell, shared loading cell, shared no-content cell, and the header.
- `AccountSelection/BackUpAccountSelectionListLayout.swift` — flow-layout sizing for header / account / empty / loading items, with a per-reuse-identifier size cache.
- `AccountSelection/Views/AccountCell/*` — `BackUpAccountSelectionListAccountListItemCell` + theme (reuses `AccountListItemViewTheme`, bottom separator).
- `AccountSelection/Views/Header/*` — header view, theme, and `BackUpAccountSelectionListHeaderViewModel` (single localized description line).
- Host wiring lives outside the module: `Routing/Screen.swift` (`.backUpAccountSelection` case) and `Routing/Router.swift` (~line 2412) assemble `AccountSelectionListScreen<BackUpAccountSelectionListLocalDataController>`.

## Architectural decisions

- **MVVM + Coordinator + diffable list.** A coordinator owns navigation; a local data controller produces `NSDiffableDataSourceSnapshot`s consumed by a generic `AccountSelectionListScreen`. View models (`AccountListItemViewModel`, header view model) feed Macaroon `StyleSheet`/`LayoutSheet` themes.
- **Reuse over reimplementation.** The screen, loading cell, and no-content cell come from the Accounts `AccountSelection` infrastructure; this module only specializes identifiers, data filtering, the account cell, and the header.
- **Threading split.** Snapshots are computed on a private serial background queue; publishing the event and storing `lastSnapshot` always hops to main.
- **Account-type branching.** HD/BIP-39 vs legacy Algo25 accounts open different tutorial flows; the branch is decided in the coordinator, not the screen.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
