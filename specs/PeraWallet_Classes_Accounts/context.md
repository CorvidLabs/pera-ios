# PeraWallet_Classes_Accounts — Context

## Overview

App-target UI/feature layer for everything account-centric in Pera Wallet:
the Home portfolio list, Account Detail (Assets / Collectibles / Transactions),
account-information sheets, rekey/undo-rekey, remove-account, account options
(passphrase, rename, edit), and the various account/address selection pickers.
The authoritative contract is `PeraWallet_Classes_Accounts.spec.md`; the source
files it covers are listed in that spec's `files:` frontmatter.

## Key files

- `List/Screens/HomeViewController.swift` — portfolio landing screen; wires up
  most flow coordinators (send/receive/swap/scan/backup/staking).
- `Detail/Main/Screens/AccountDetailViewController.swift` — `PageContainer`
  hosting the Assets/Collectibles/Transactions tabs; orchestrates the account
  action menu and options.
- `Detail/Main/Screens/AccountInformationFlowCoordinator.swift` — routes to the
  correct account-information sheet by `account.authorization`.
- `Detail/Main/Screens/RekeyTo{Standard,Ledger,Joint}AccountFlowCoordinator.swift`,
  `UndoRekeyFlowCoordinator.swift` — rekey lifecycle entry points.
- `Detail/RemoveAccount/RemoveAccountFlowCoordinator.swift` +
  `Validator/RemoveAuthAccountAuthorizationValidator.swift` — guarded removal.
- `Options/Passphrase/Screens/PassphraseDisplayViewController.swift` +
  `Warning/Screens/PassphraseWarningScreen.swift` — gated mnemonic reveal.
- `AccountInformation/` subtree — one screen+theme+view-model trio per auth type.
- `*/Data/*DataController.swift`, `*DataSource.swift` — list data plumbing.

## Architectural decisions

- **MVVM + view-model-per-cell.** Screens own `*ViewModel` types and `*Theme`
  structs (Macaroon theming); collection content is driven by
  `*DataController` / `*DataSource` pairs (API-backed and local variants).
- **Coordinator-driven navigation.** Cross-screen flows are encapsulated in
  `*FlowCoordinator` objects retained by the host view controller and driven by
  `EventHandler` closures; bottom sheets use `BottomSheetTransition`.
- **Chain-of-responsibility validation** for account removal
  (`RemoveAccountAuthorizationValidator` protocol with `setNext`).
- **Authorization-type polymorphism** instead of subclassing: routing and
  action-gating branch on the `account.authorization` flags from core.
- Known debt: several view controllers retain data stores / construct flow
  coordinators inline (`// <todo> ... routing approach hasn't been refactored`).

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
