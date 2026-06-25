# PeraWallet_Classes_AlgorandSecureBackup — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] `BackupValidator.unauthorized` is defined but never produced by `validate(...)`; the
      file picker maps unauthorized access to `.uploadFailed(.unauthorized)` separately.
      Decide whether to fold both paths through the validator or remove the dead case.
- [ ] `AlgorandSecureBackupFlowCoordinator.choosePasswordViewController(_:didConfirmPassword:)`
      uses a force-cast (`as! AlgorandSecureBackupMnemonicsScreen`) when re-stacking after the
      password gate — harden against a nil/unexpected screen type.
- [ ] `generateMnemonics(from:)` silently returns `[]` on SDK error; consider surfacing a
      user-visible error instead of an empty passphrase grid.
- [ ] `Mnemonics` regenerate-key action throws away the previously generated key without
      confirming no prior backup file depends on it — document/verify the warning copy covers this.
- [ ] Recover screen error banner is generic for every decrypt failure; consider distinguishing
      "wrong passphrase" from "corrupt ciphertext".
- [ ] No automated tests cover `BackupValidator` / `BackupParameters` encoding round-trip; add unit tests.

## Done
- [x] Spec and companion files scaffolded.
- [x] Export flow implemented: Instructions → (password gate) → Mnemonics → Success/Error.
- [x] Import flow implemented: ImportBackup → RecoverMnemonic → ImportSuccess → relaunch main.
- [x] `BackupValidator` enforces version `1.0` and `HMAC-SHA256:sodium_secretbox_easy` suite.
- [x] Export success screen writes a transient `.txt` and deletes it on `deinit`.
- [x] `BackupMetadata` persisted to `session.backups` per exported account on success.
