# PeraWallet_Classes_Web — Context

## Overview

`PeraWallet/Classes/Web` implements the **Pera Web Wallet account import** flow:
importing accounts from the browser-based Pera Web Wallet into the iOS app by
scanning a QR code, fetching an encrypted backup, decrypting it locally, and
registering the accounts. The authoritative contract is
`PeraWallet_Classes_Web.spec.md`; covered source files are in its `files:`
frontmatter.

## Architecture

- **Coordinator-driven navigation.** `AccountImportFlowCoordinator` owns the
  whole flow and wires screen events to the next screen via the app `Screen`
  router and `open(_:by:)` (push/present). Entry points:
  `launch(qrBackupParameters:)` either starts at the instruction screen (no
  params) or jumps straight to import (pre-scanned params).
- **MVVM screens.** Each screen is a `BaseViewController`/`ScrollScreen` with a
  `Theme` struct for layout/tokens and per-row view models (e.g. the four
  `WebImport...InstructionItemViewModel`s, `WebImportErrorViewModel`,
  `WebImportSuccessHeaderViewModel`, `WebImportSuccessInfoBoxViewModel`).
- **Data controller for the success list.** `WebImportSuccessScreen` uses a
  diffable-snapshot `WebImportSuccessScreenDataController`
  (impl: `...LocalDataController`) + `...DataSource` + `...ListLayout`, building
  header / missing-accounts / account-row items off a background queue.
- **Crypto.** `Cryptor` wraps `AlgoSdkEncrypt`/`AlgoSdkDecrypt`; `EncryptionError`
  maps SDK error codes. The QR `encryptionKey` is the symmetric key.

## Key files

- `Import/AccountImportFlowCoordinator.swift` — flow orchestration + error routing.
- `Import/Account/ImportAccountScreen.swift` — fetch, decrypt, deserialize, save,
  and import; also HD-wallet recovery branch (unused by this coordinator).
- `QRBackupParameters.swift` — QR payload model (`backupId`, `encryptionKey`,
  `version`, `action`); `isSupported()` gates on `version == "1"`.
- `Import/AccountImportParameters.swift` — per-account decrypted model
  (address/name/accountType/privateKey) + `isImportable(using:)`.
- `Import/QRScanner/ImportQRScannerScreen.swift` — AVFoundation QR scanner.
- `Import/Introduction/WebImportInstructionScreen.swift` — 4-step onboarding.
- `Import/Success/...` — success list (data controller, data source, layout, cells).
- `Import/Error/...` — error result screen + view model.
- `Cryptor.swift` — encrypt/decrypt wrapper over AlgoSDK.

## Architectural decisions

- Backup payloads are decrypted on-device; cleartext private keys never leave the
  decryption step before being written to the session keychain.
- Already-present accounts are reported as "unimported" rather than re-saved.
- The HD-wallet recovery path shares `ImportAccountScreen` but is intentionally
  unreachable from the web-import coordinator (`fatalError` guard).

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
