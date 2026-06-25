# PeraWallet_Classes_WalletConnect — Context

## Overview

UIKit feature module for Pera Wallet's WalletConnect integration (v1 + v2). It renders connection approval, session management, and transaction-signing request screens. The authoritative contract is `PeraWallet_Classes_WalletConnect.spec.md`; the source files it covers are listed in that spec's `files:` frontmatter.

## Key files

- `Connection/WCSessionConnectionScreen.swift` — bottom-sheet dApp connection approval; account selection; emits `performConnect(accounts:)` / `performCancel`.
- `Sessions/Screens/List/WCSessionListViewController.swift` — connected-sessions list with live status pings and "Disconnect all".
- `Sessions/WCSessionDetail/WCSessionDetailScreen.swift` — session detail: profile, connected accounts, advanced permissions, status check, disconnect.
- `Transaction/Main/Screens/Main/Transaction/WCMainTransactionScreen.swift` — transaction-signing host (validate → fetch → sign → respond); chooses single vs unsigned/group fragment.
- `Transaction/Main/Screens/SingleRequest/...`, `.../UnsignedRequest/...`, `Transaction/Group/...` — request fragments and per-type detail screens (Algos, Asset, AssetAddition, AssetConfig, AppCall, KeyReg, ArbitraryData).

## Architecture

- **MVVM + DataController/DataSource.** Screens are `BaseViewController`s; each list-bearing screen pairs a `*DataController` (data + event handler), a `*DataSource` (diffable snapshot), a `*Layout`, and per-cell `*ViewModel`/`*View`/`*Theme` triplets. Themes carry design tokens (Macaroon `Colors`, spacing, insets).
- **Event handlers / delegates** propagate user intent outward (`EventHandler` closures, e.g. `WCSessionConnectionScreen.Event`, `WCSessionDetailScreen.Event`; `WCMainTransactionScreenDelegate`). Navigation is done by `Router`/`Screen`, not by these screens.
- **Protocol stack is external.** Pairing, ping, disconnect, and session events flow through `PeraConnect`/`walletConnectCoordinator` (observed via `PeraConnectObserver` + `PeraConnectEvent`). Signing is delegated to `WCTransactionSigner` (`WCTransactionSignerDelegate`), including Ledger/rekey handling.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI. Session-expiry extension UI is intentionally disabled (see tasks.md).
