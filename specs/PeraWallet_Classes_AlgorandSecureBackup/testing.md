# PeraWallet_Classes_AlgorandSecureBackup — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- No dedicated ASB unit tests currently exist. Highest-value gaps to add:
  - `BackupValidator.validate(...)` for each `BackupValidationError` branch (empty, non-base64,
    bad JSON, missing version/suite/ciphertext, wrong version, unknown suite).
  - `BackupParameters` / `SecureBackup` encode → decode round-trip.

## Manual QA checklist

### Export flow (from Home → Algorand Secure Backup)
- [ ] Instructions screen shows the two steps + note; "Start" advances.
- [ ] With an app password set, the ChoosePassword (login) gate appears before the passphrase;
      cancelling does not reveal mnemonics.
- [ ] With no app password, the flow goes straight to the Mnemonics screen.
- [ ] Mnemonics grid shows 12 words; Copy copies the space-joined passphrase and toasts.
- [ ] Regenerate key shows the warning sheet and replaces the passphrase on confirm.
- [ ] "Store" → confirmation sheet → Success screen with the file info row.
- [ ] Save opens the share sheet with a `.txt`; Copy copies the base64 ciphertext.
- [ ] Done shows the confirmation sheet and dismisses back to the originating screen.
- [ ] Each exported account is now marked backed up (`session.backups`).
- [ ] Only single accounts are offered (no HD/Ledger accounts in the export set).

### Import flow (from Recover Account → Import from backup)
- [ ] Picking a valid backup file enables Next and shows the uploaded file name.
- [ ] Pasting a valid base64 backup shows a success banner and advances.
- [ ] Entering the correct 12-word passphrase decrypts and advances to the success list.
- [ ] Success list shows imported vs missing/unsupported account counts.
- [ ] Continuing relaunches the app into the main tab bar and sets the new-account animation flag.

## Edge cases

- [ ] Paste/select empty or whitespace string → empty-source error.
- [ ] Non-base64 / corrupt JSON backup → wrong-format error, no decrypt attempt.
- [ ] Backup missing `version`/`suite`/`ciphertext` → key-not-found error naming the field.
- [ ] Backup with `version != "1.0"` or unknown suite → matching error banner.
- [ ] File without security-scoped access → upload-failed state, Next disabled.
- [ ] Wrong passphrase on import → mnemonics error banner, stays on screen.
- [ ] Export with missing backup private/cipher key or encryption throw → Error screen → Try again.
- [ ] Backgrounding/dismissing the Success screen removes the transient `.txt` from documents.
- [ ] Import set containing watch accounts / accounts with auth account → those are filtered out.
