# PeraWallet_Classes_Authentication — Context

## Overview

This module is the onboarding / account-setup feature area of the Pera Wallet iOS app (`PeraWallet/Classes/Authentication`). It covers every screen between "no account / locked" and "account registered": welcome, mnemonic-type choice, create, back-up, verify, recover, rekeyed-account selection, watch-account addition, and the PIN lockout screen. The authoritative contract is `PeraWallet_Classes_Authentication.spec.md`; the full source file list lives in that spec's `files:` frontmatter.

## Architecture

- **Pattern:** MVVM + view-theme separation, the house style used across the app target. Each screen is a `BaseViewController` / `BaseScrollViewController` subclass that owns a Macaroon-style `*View`, a `*ViewModel` (or `bindData` view models), and a `*Theme` (often split into `*Bip39Theme` / `*CommonTheme`). Lists use `*DataController` / `*DataSource` types with event-handler closures or delegate protocols (e.g. `AccountRecoverDataControllerDelegate`, `WatchAccountAdditionDataController`).
- **Flow threading:** there is no single coordinator object; navigation is driven imperatively via the app-wide `Screen` enum and `open(_:by:)`. Context is carried explicitly as `AccountSetupFlow` + `AccountSetupMode` + `WalletFlowType` value types passed into each screen's initializer (`AccountFlow.swift`, `WalletFlowType.swift`).
- **Persistence side effects:** screens write account state through `pera_wallet_core` — `Session` (private keys, authenticated `User`), `HDWalletStorage` / `HDWalletService` (BIP39 wallets & derived addresses), and `SharedDataController` (account collection, preferred ordering). Secrets are staged under the `"temp"` key in `Session` during create and removed once the address is derived.

## Key files

- `AccountFlow.swift` — `AccountSetupFlow`, `AccountSetupMode`, `RecoverType` enums that define the onboarding context model.
- `WalletFlowType.swift` — `bip39` vs `algo25` selector for mnemonic provider + themes.
- `Introduction/Welcome/Screens/WelcomeViewController.swift` — create-vs-import entry point; creates the first HD wallet.
- `Introduction/MnemonicTypes/Screens/MnemonicTypeSelectionScreen.swift` — BIP39 vs Algo25 backup-type bottom sheet.
- `Introduction/PinLimit/Screens/PinLimitViewController.swift` — countdown lockout + reset-all-data.
- `Common/HDWallet/Screens/HDWalletSetupViewController.swift` — list existing HD wallets / create new wallet / derive new address.
- `Create/Passphrase/Screens/Verify/PassphraseVerifyViewController.swift` — verify words, then commit the account.
- `Recover/List/Screens/AccountRecoverViewController.swift` + `Recover/List/Data/AccountRecoverDataController.swift` — mnemonic entry, validation, recover error model.
- `RekeyedAccountList/RekeyedAccountSelectionListScreen.swift` — post-recovery rekeyed-account import.
- `WatchAccount/Screens/WatchAccountAdditionViewController.swift` — view-only account by address / QR / name service.

## Architectural decisions

- BIP39 and Algo25 share screens but diverge through `WalletFlowType` (provider + theme) rather than separate controllers.
- The create flow stages entropy/private key under `Session`'s `"temp"` key and only materialises a real account after passphrase verification, keeping un-backed-up secrets short-lived.
- Recovery deliberately fans out to `fetchRekeyedAccounts` so users importing a key also recover accounts rekeyed to it.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
