# PeraWallet_Classes_Web — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see
  `BUILDING.md`). No web-import-specific unit tests are currently colocated with
  this module's source.
- Good candidates for unit coverage that need no UI/camera:
  - `QRBackupParameters.isSupported()` (version gating) and JSON decoding with the
    `backupId`/`encryptionKey`/`version`/`action` coding keys.
  - `QRBackupAction(rawValue:)` mapping (`import` vs `.unsupported`).
  - `AccountImportParameters.isImportable(using:)` for single / watch / unsupported
    and key↔address mismatch cases.
  - `Cryptor` round-trip encrypt→decrypt and `EncryptionError` code mapping.

## Manual QA checklist

Happy path
- [ ] Instruction screen shows all four steps and a working Start button.
- [ ] Scanning a valid Pera Web Wallet transfer QR imports the selected accounts.
- [ ] Imported accounts appear on the success screen and on Home after "Go to Home".
- [ ] Imported accounts are marked backed up and their private keys are usable
      (can sign / send).

Partial / duplicate
- [ ] Importing accounts that already exist shows the missing-accounts summary
      with correct unimported + unsupported counts and does not duplicate them.
- [ ] A backup mixing supported and unsupported account types imports only the
      supported ones and counts the rest as unsupported.

Error paths
- [ ] A QR with an unsupported version shows the error screen with the version in
      the body text.
- [ ] A QR with a non-import action shows the unsupported-action error.
- [ ] Network failure fetching the backup shows the generic error screen.
- [ ] A corrupted/wrong-key backup (decryption failure) shows the error screen.
- [ ] "Go to Home" from the error screen dismisses the flow cleanly.

Camera / scanner
- [ ] First launch prompts for camera permission; denying shows the
      go-to-settings alert.
- [ ] Backgrounding and returning to the scanner resumes capture correctly.
- [ ] Cancel from the scanner overlay pops (push) or dismisses (present) as
      appropriate.

## Edge cases

- Decryption succeeds but yields zero importable accounts → `notImportableAccountFound`
  error, not an empty success list.
- Base64 vs comma-separated byte-array encoded `encryptedContent` (both handled by
  `extractEncryptedData`).
- Coordinator launched with pre-decoded `QRBackupParameters` (deep-link path) skips
  the instruction and scanner screens and presents import modally.
- Light/dark mode swaps the Lottie loading animation (`light-dots` / `dark-dots`).
- HD-wallet recovery branch must not be triggered through this coordinator
  (guarded by `fatalError`).
