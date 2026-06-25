# PeraWallet_Classes_AlgorandSecureBackup — Context

## Overview

Architectural context for the `PeraWallet_Classes_AlgorandSecureBackup` module — the
Algorand Secure Backup (ASB) feature: encrypted export of account private keys to a
portable backup, and re-import of that backup on another device. The authoritative
contract is `PeraWallet_Classes_AlgorandSecureBackup.spec.md`; the source files it covers
are listed in that spec's `files:` frontmatter.

## Architecture

- **Pattern:** Coordinator + MVVM. Each screen is a `BaseScrollViewController`/`ScrollScreen`
  subclass that owns a `*Theme` (layout/tokens), binds `*ViewModel`s into views, and emits a
  typed `Event` enum to its coordinator. Coordinators build screens via the app's `Screen`
  router/transition enum and wire the event handlers.
- **Two flows / two coordinators:**
  - `AlgorandSecureBackupFlowCoordinator` (export) — launched from `HomeViewController`.
  - `AlgorandSecureBackupImportFlowCoordinator` (import) — launched from
    `RecoverAccountViewController`.
- **Crypto is delegated**, not implemented here: `AlgorandSDK` (Go-bind) derives backup keys
  and mnemonics; `Cryptor` performs `sodium_secretbox_easy` encrypt/decrypt. This module only
  encodes/validates the payload and drives screens.

## Key files

- `AlgorandSecureBackupFlowCoordinator.swift` — export flow + password gate + success/error
  routing + `session.backups` metadata write.
- `AlgorandSecureBackupImportFlowCoordinator.swift` — import flow + account parsing/filtering
  + relaunch into main.
- `BackupValidator.swift` — `BackupValidation` / `BackupValidationError`; enforces version
  `1.0` and suite `HMAC-SHA256:sodium_secretbox_easy`.
- `SecureBackup.swift` — `ALGAPIModel` for the `{version, suite, ciphertext}` envelope.
- `BackupParameters.swift` — encodable `{accounts, provider_name}` payload of
  `AccountImportParameters`.
- `Mnemonics/AlgorandSecureBackupMnemonicsScreen.swift` — passphrase display, copy,
  regenerate, and `generateBackup()` (encrypt + emit).
- `Import/Recover/AlgorandSecureBackupRecoverMnemonicScreen.swift` — 12-word entry,
  suggestions, decrypt.
- `Import/Backup/AlgorandSecureBackupImportBackupScreen.swift` — file picker / paste +
  validation.
- `Import/Success/Data/AlgorandSecureBackupImportSuccessScreenLocalDataController.swift` —
  subclass of `WebImportSuccessScreenLocalDataController` that saves transfer accounts.
- `Result/Success/AlgorandSecureBackupSuccessScreen.swift` — save/share/copy + transient file.
- `Instructions/AlgorandSecureBackupInstructionsScreen.swift` — entry/explainer screen.

## Architectural decisions

- The import success screen deliberately re-uses the shared web-import data controller
  (`WebImportSuccessScreenLocalDataController`) and only overrides the ASB-specific header /
  missing-accounts list items, so account-saving logic stays unified across import paths.
- The exported plaintext file lives only in the documents directory for the duration of the
  share sheet and is removed on screen `deinit` to limit on-disk key exposure.
- Password gating is decided by `session.hasPassword()` inside the coordinator, not the screen,
  keeping the Instructions screen agnostic.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
