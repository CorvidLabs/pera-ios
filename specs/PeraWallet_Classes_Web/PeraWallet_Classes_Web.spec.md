---
module: PeraWallet_Classes_Web
version: 1
status: active
files:
  - PeraWallet/Classes/Web/Cryptor.swift
  - PeraWallet/Classes/Web/Import/Account/ImportAccountScreen.swift
  - PeraWallet/Classes/Web/Import/Account/ImportAccountScreenTheme.swift
  - PeraWallet/Classes/Web/Import/AccountImportFlowCoordinator.swift
  - PeraWallet/Classes/Web/Import/AccountImportParameters.swift
  - PeraWallet/Classes/Web/Import/Error/Views/WebImportErrorResultViewTheme.swift
  - PeraWallet/Classes/Web/Import/Error/Views/WebImportErrorViewModel.swift
  - PeraWallet/Classes/Web/Import/Error/WebImportErrorScreen.swift
  - PeraWallet/Classes/Web/Import/Error/WebImportErrorScreenTheme.swift
  - PeraWallet/Classes/Web/Import/Introduction/Views/WebImportGoToPeraWebWalletInstructionItemViewModel.swift
  - PeraWallet/Classes/Web/Import/Introduction/Views/WebImportGoToTransferAccountsInstructionViewModel.swift
  - PeraWallet/Classes/Web/Import/Introduction/Views/WebImportSelectAccountsAndGenerateQRInstructionItemViewModel.swift
  - PeraWallet/Classes/Web/Import/Introduction/Views/WebImportTapStartToScanQRInstructionItemViewModel.swift
  - PeraWallet/Classes/Web/Import/Introduction/WebImportInstructionScreen.swift
  - PeraWallet/Classes/Web/Import/Introduction/WebImportInstructionScreenTheme.swift
  - PeraWallet/Classes/Web/Import/QRScanner/ImportQRScannerScreen.swift
  - PeraWallet/Classes/Web/Import/Success/Data/WebImportSuccessScreenDataController.swift
  - PeraWallet/Classes/Web/Import/Success/Data/WebImportSuccessScreenDataSource.swift
  - PeraWallet/Classes/Web/Import/Success/Data/WebImportSuccessScreenLocalDataController.swift
  - PeraWallet/Classes/Web/Import/Success/View/WebImportSuccessHeaderView.swift
  - PeraWallet/Classes/Web/Import/Success/View/WebImportSuccessHeaderViewModel.swift
  - PeraWallet/Classes/Web/Import/Success/View/WebImportSuccessHeaderViewTheme.swift
  - PeraWallet/Classes/Web/Import/Success/View/WebImportSuccessInfoBoxCell.swift
  - PeraWallet/Classes/Web/Import/Success/View/WebImportSuccessInfoBoxTheme.swift
  - PeraWallet/Classes/Web/Import/Success/View/WebImportSuccessInfoBoxViewModel.swift
  - PeraWallet/Classes/Web/Import/Success/WebImportSuccessScreen.swift
  - PeraWallet/Classes/Web/Import/Success/WebImportSuccessScreenListLayout.swift
  - PeraWallet/Classes/Web/Import/Success/WebImportSuccessScreenTheme.swift
  - PeraWallet/Classes/Web/QRBackupParameters.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Web

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Web`) that implements the
**Pera Web Wallet account import** flow: moving accounts from the browser-based
Pera Web Wallet into the iOS app by scanning a QR code.

The flow, driven by `AccountImportFlowCoordinator`, is:

1. **Instruction** (`WebImportInstructionScreen`) — a four-step onboarding
   screen telling the user to open Pera Web Wallet, go to "Transfer Accounts",
   select accounts and generate a QR, then tap Start to scan it.
2. **QR scan** (`ImportQRScannerScreen`) — an `AVCaptureSession`-based scanner
   that decodes a JSON `QRBackupParameters` payload (`backupId`, `encryptionKey`,
   `version`, `action`).
3. **Import** (`ImportAccountScreen`) — fetches the encrypted `Backup` blob from
   the API by `backupId`, decrypts it with `Cryptor` using the QR's
   `encryptionKey`, deserializes `[AccountImportParameters]`, saves importable
   private keys to the session keychain, and registers the accounts.
4. **Result** — either `WebImportSuccessScreen` (a list of imported accounts plus
   a "missing accounts" summary for already-present/unsupported entries) or
   `WebImportErrorScreen` (generic or unsupported-version messaging).

The coordinator can also be launched directly with already-decoded
`QRBackupParameters` (deep-link / pre-scanned entry), skipping the instruction
and scanner screens. `ImportAccountScreen` additionally hosts an HD-wallet
recovery path (`recoverHDWallet(mnemonic)`), but the web-import coordinator does
not use it (`didCompleteHDWalletImport` is `fatalError`-guarded as unreachable here).

Ownership boundary: this module owns the web-import UI, the QR backup parameter
models, and the `Cryptor` wrapper over the AlgoSDK encrypt/decrypt primitives. It
delegates account/session persistence, networking, and shared account state to
PeraWalletCore and the app's `Session`/`SharedDataController`/`ALGAPI`.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. Only QR payloads with `version == "1"` and `action == .import` proceed to
   import; any other version routes to `WebImportErrorScreen` with
   `unsupportedVersion`, and any non-import action routes to `unsupportedAction`
   (`QRBackupParameters.isSupported()` / `AccountImportFlowCoordinator`).
3. The backup payload is never imported in cleartext: `ImportAccountScreen`
   decrypts the fetched `Backup.encryptedContent` with `Cryptor` keyed by the
   QR's `encryptionKey`; a `nil` decryption result aborts with `.decryption`.
4. An account is imported only if it is not already in
   `sharedDataController.accountCollection`; duplicates become "unimported"
   entries shown in the success-screen missing-accounts summary instead of being
   re-saved. Private keys are persisted via `session.savePrivate(_:for:)` and the
   account is marked `isBackedUp: true`.
5. If decryption/deserialization succeeds but zero accounts are importable, the
   flow shows `WebImportErrorScreen(.notImportableAccountFound)` rather than an
   empty success screen.
6. The QR scanner stops the capture session on first decoded object and only
   accepts payloads that decode to `QRBackupParameters`; camera capture is
   torn down on background and view-disappear, and gated on camera authorization.

## Behavioral Examples

### Scenario: Successful web import via QR
- **Given** the user is on `WebImportInstructionScreen` and has generated a
  transfer QR in Pera Web Wallet
- **When** the user taps Start, the scanner decodes a `version "1"` /
  `action import` `QRBackupParameters`, and the backup decrypts to one or more
  not-yet-present standard accounts
- **Then** `ImportAccountScreen` saves the private keys to the session, registers
  the accounts (`isBackedUp: true`), sends updated device details, and pushes
  `WebImportSuccessScreen` listing the imported accounts

### Scenario: Some accounts already present
- **Given** the decrypted backup contains accounts, some of whose addresses are
  already in `sharedDataController.accountCollection`
- **When** import completes
- **Then** the existing addresses are collected as `unimportedAccounts` and the
  success screen renders a missing-accounts row summarizing
  unimported + unsupported counts alongside the newly imported accounts

### Scenario: Unsupported QR version
- **Given** the scanner decodes a `QRBackupParameters` whose `version` is not `"1"`
- **When** the coordinator validates it
- **Then** it skips import and pushes `WebImportErrorScreen(.unsupportedVersion)`,
  whose body interpolates the offending version string

## Error Cases

| Condition | Behavior |
|-----------|----------|
| QR `version != "1"` | Coordinator routes to `WebImportErrorScreen(.unsupportedVersion)`; view model shows version-specific body |
| QR `action != import` (and version supported) | `WebImportErrorScreen(.unsupportedAction)` with generic body |
| Backup fetch API failure | `ImportAccountScreen` emits `.didFailToImport(.networkFailed(HIPAPIError?))` → error screen |
| `Cryptor.decrypt` returns nil data | `.didFailToImport(.decryption)` → error screen (`EncryptionError` codes: invalidSecretKey/invalidEncryptedData/decryptionError) |
| Decrypted payload fails `[AccountImportParameters.APIModel].decoded` | `.didFailToImport(.serialization(error))` → error screen |
| No importable accounts after filtering | `.notImportableAccountFound` → error screen |
| Private-key → transfer-account conversion throws | `.didFailToImport(.invalidPrivateKey)` → error screen |
| HD-wallet recovery (`recoverHDWallet`) seed invalid | `.didFailToImport(.invalidSeed)` (not reachable from the web-import coordinator) |
| Camera access denied | Scanner shows go-to-settings alert; capture session not started |
| Camera input/output cannot be added | `handleFailedState()` clears session and shows `qr-scan-error` alert |
| QR string not decodable to `QRBackupParameters` | Scanner ignores the frame (no event emitted) |

## Dependencies

| Module | Usage |
|--------|-------|
| PeraWalletCore (`pera_wallet_core`) | `Account`, `AccountInformation`, `User`, `Session`, `SharedDataController`, `ALGAPI`/`fetchBackupDetail`, `Backup`, `ALGAPIModel`/`ALGEntityModel`, `AccountAuthorization` |
| AlgoSDK / AlgorandSDK | `AlgoSdkEncrypt` / `AlgoSdkDecrypt` (via `Cryptor`); `isValidAddress` / `addressFrom` for importability checks |
| CryptoSwift, CommonCrypto | Imported by `Cryptor` for crypto support |
| MacaroonUIKit / MacaroonUtils | Base screens (`BaseViewController`, `ScrollScreen`), `ResultView`, theming, `InstructionItemView`, async helpers |
| Magpie (Core/Hipo/Exceptions) | Networking primitives and `HIPAPIError` for backup fetch failures |
| AVFoundation | QR camera capture in `ImportQRScannerScreen` |
| PushNotificationController | `sendDeviceDetails()` after new accounts are saved |
| Lottie (`LottieImageView`) | Loading animation on `ImportAccountScreen` |
| App `Screen` router / navigation | Screen construction (`Screen.importAccount*`) and `open(_:by:)` push/present navigation |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
