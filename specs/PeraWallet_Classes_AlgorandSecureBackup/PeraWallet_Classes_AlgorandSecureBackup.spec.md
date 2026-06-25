---
module: PeraWallet_Classes_AlgorandSecureBackup
version: 1
status: active
files:
  - PeraWallet/Classes/AlgorandSecureBackup/AlgorandSecureBackupFlowCoordinator.swift
  - PeraWallet/Classes/AlgorandSecureBackup/AlgorandSecureBackupImportFlowCoordinator.swift
  - PeraWallet/Classes/AlgorandSecureBackup/BackupParameters.swift
  - PeraWallet/Classes/AlgorandSecureBackup/BackupValidator.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Backup/AlgorandSecureBackupImportBackupScreen.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Backup/AlgorandSecureBackupImportBackupScreenTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Backup/Views/AlgorandSecureBackupFileView.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Backup/Views/AlgorandSecureBackupFileViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Backup/Views/AlgorandSecureBackupFileViewTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Recover/AlgorandSecureBackupRecoverMnemonicScreen.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Recover/AlgorandSecureBackupRecoverMnemonicScreenTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Recover/Views/AlogranSecureBackupImportMnemonicTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Success/Data/AlgorandSecureBackupImportSuccessScreenLocalDataController.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Success/Views/AlgorandSecureBackupImportSuccessHeaderViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Success/Views/AlgorandSecureBackupImportSuccessInfoBoxViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/AlgorandSecureBackupInstructionsScreen.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/AlgorandSecureBackupInstructionsScreenTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/Views/AlgorandSecureBackupInstructionItemView.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/Views/AlgorandSecureBackupInstructionItemViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/Views/AlgorandSecureBackupInstructionItemViewTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/Views/AlgorandSecureBackupSaveBackupFileInstructionItemViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/Views/AlgorandSecureBackupSelectAccountsInstructionItemViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/Views/AlgorandSecureBackupStoreKeysInstructionItemViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Mnemonics/AlgorandSecureBackupMnemonicsScreen.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Mnemonics/AlgorandSecureBackupMnemonicsScreenTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Mnemonics/Views/AlgorandSecureBackupMnemonicViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Error/AlgorandSecureBackupErrorScreen.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Error/AlgorandSecureBackupErrorScreenTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Error/Views/AlgorandSecureBackupErrorResultViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Error/Views/AlgorandSecureBackupErrorResultViewTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/AlgorandSecureBackupSuccessScreen.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/AlgorandSecureBackupSuccessScreenTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/Views/FileInfo/FileInfoView.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/Views/FileInfo/FileInfoViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/Views/FileInfo/FileInfoViewTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/Views/Header/AlgorandSecureBackupSuccessHeaderViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/Views/Header/AlgorandSecureBackupSuccessHeaderViewTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/SecureBackup.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_AlgorandSecureBackup

## Purpose

App-target UI/feature module (`PeraWallet/Classes/AlgorandSecureBackup`) implementing the
**Algorand Secure Backup (ASB)** feature: an encrypted, portable export of a user's
account private keys that can be saved to a file / clipboard and later re-imported on
another device.

The module owns two coordinator-driven flows:

- **Export flow** (`AlgorandSecureBackupFlowCoordinator`, launched from
  `HomeViewController`): `Instructions` screen → optional `ChoosePassword` gate (when the
  session has an app password) → `Mnemonics` screen (12-word backup passphrase derived
  from a backup private key) → `Success` screen (save/share the encrypted `.txt` backup
  file or copy the base64 ciphertext) or `Error` screen on failure. On success it writes
  `BackupMetadata` into `session.backups` for each exported account.
- **Import flow** (`AlgorandSecureBackupImportFlowCoordinator`, launched from
  `RecoverAccountViewController`): `ImportBackup` screen (pick a backup file via the
  document picker or paste base64) → `RecoverMnemonic` screen (enter the 12-word backup
  passphrase to decrypt) → `ImportSuccess` screen (re-uses the shared web-import success
  data controller) → relaunch into the app's main tab bar.

Cryptography is delegated to `AlgorandSDK` (Go-bind) plus the local `Cryptor`
(`sodium_secretbox_easy`); the module only orchestrates screens, encoding
(`BackupParameters`, `SecureBackup`), and validation (`BackupValidator`). It is
internal-by-default and exposes no public cross-module API.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. When the session has an app password (`session.hasPassword()`), the export flow MUST
   pass through the `ChoosePassword` (login) gate before any mnemonic or private-key
   material is shown; otherwise it goes straight to the `Mnemonics` screen.
3. Only single (non-HD, non-Ledger) accounts are exportable: the export coordinator filters
   to accounts where `hdWalletAddressDetail == nil && ledgerDetail == nil`. On import, watch
   accounts and accounts with an auth account are filtered out before being saved.
4. A backup is only accepted when it round-trips `BackupValidator`: non-empty, valid base64,
   decodable `SecureBackup` JSON, with `version == "1.0"` and
   `suite == "HMAC-SHA256:sodium_secretbox_easy"`. Any other shape yields a typed
   `BackupValidationError` surfaced to the user, never a decrypt attempt.
5. The exported plaintext backup file is transient: `AlgorandSecureBackupSuccessScreen`
   writes the base64 `.txt` into the documents directory only for the share sheet and
   deletes it again in `removeFile()` on `deinit`.
6. On successful export, the coordinator persists a `BackupMetadata(id: address, createdAtDate:)`
   into `session.backups` for every exported account so the account is marked backed up.

## Behavioral Examples

### Scenario: Export accounts to an encrypted secure backup
- **Given** the user opens the Algorand Secure Backup flow from Home and the session has an app password
- **When** they tap Start on the Instructions screen, authenticate on the ChoosePassword screen, and tap "Store" on the Mnemonics screen
- **Then** `AlgorandSDK` derives a backup cipher key from the backup private key, `Cryptor` encrypts the encoded `BackupParameters`, and the `Success` screen presents a `SecureBackup` (version `1.0`, suite `HMAC-SHA256:sodium_secretbox_easy`) the user can save to a `.txt` file or copy, while `BackupMetadata` is recorded for each account.

### Scenario: Import a secure backup file on a new device
- **Given** the user chooses "Import from backup" on the Recover Account screen
- **When** they pick a backup file (or paste base64) on the ImportBackup screen, `BackupValidator` validates it, and they enter the 12-word backup passphrase on the RecoverMnemonic screen
- **Then** `AlgorandSDK` recovers the backup private key from the mnemonic, `Cryptor` decrypts the ciphertext into `BackupParameters`, importable accounts are saved via the shared web-import success data controller, and the app relaunches into the main tab bar.

### Scenario: Backup generation fails mid-export
- **Given** the user taps "Store" on the Mnemonics screen
- **When** the backup private key is missing or `AlgorandSDK.generateBackupCipherKey` returns nil (or encryption throws)
- **Then** the screen emits `.backupFailed`, the coordinator replaces the stack with the `Error` screen, and tapping "Try again" pops back to retry.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Pasted / selected backup string empty or blank | `BackupValidator` → `.emptySource`; clipboard-empty error banner; file picker shows empty-source banner |
| Backup not valid base64 / not decodable JSON | `.wrongFormat` / `.jsonSerialization`; "wrong format" error banner, no decrypt attempted |
| Backup JSON missing `version` / `suite` / `ciphertext` | `.keyNotFound(key)`; banner naming the missing key |
| Backup `version != "1.0"` | `.unsupportedVersion`; unsupported-version error banner |
| Backup `suite` unknown | `.cipherSuiteUnknown`; cipher-suite error banner |
| Selected file not authorized (security-scoped access denied) | `bindFile(.uploadFailed(.unauthorized))`; file row shows upload-failed state, Next stays disabled |
| Wrong backup passphrase on import (mnemonic → key → decrypt fails) | `RecoverMnemonic` presents the mnemonics error banner; stays on screen |
| Missing backup private key / cipher key during export encryption | `Mnemonics` emits `.backupFailed`; coordinator shows the `Error` screen |
| Saving the export `.txt` file throws | `Success` screen presents an error banner with `error.localizedDescription` |

## Dependencies

| Module | Usage |
|--------|-------|
| `pera_wallet_core` (PeraWalletCore) | `Account`, `AccountInformation`, `AccountImportParameters`, `Session`, `BackupMetadata`, `ALGAPIModel`, `AlgorandSecureBackup` file model, `WebImportSuccessScreenLocalDataController`, `ImportAccountScreen.Result` |
| `AlgorandSDK` (Go-bind) | `generateBackupPrivateKey`, `backupMnemnoic`/`backupPrivateKey(fromMnemonic:)`, `generateBackupCipherKey`, account importability checks |
| `Cryptor` | `sodium_secretbox_easy` encrypt/decrypt of the backup payload |
| MacaroonUIKit / MacaroonForm / MacaroonUtils | Base scroll screens, buttons, large-title nav, keyboard handling, themes |
| App UI shared infra | `Screen` routing/transitions, `ChoosePasswordViewController`, `BottomWarningView`, banners, `CopyToClipboardController`, document picker, share activity, `AppDelegate.launchMain()` |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
