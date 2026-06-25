# PassKeyExtension — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Replace the `setupUI()` / `prepareInterface` race-condition workaround. Two source comments note the UI does not appear when set up in `viewDidLoad`, and a 0.1s `DispatchQueue.main.asyncAfter` delay is needed so Face ID works once the extension is foregrounded. Investigate a deterministic foreground signal instead of a fixed delay.
- [ ] Implement `prepareInterfaceForExtensionConfiguration()` — currently it immediately calls `completeExtensionConfigurationRequest()` (the comment says a settings/configuration UI may be shown "in future").
- [ ] Confirm `signCount: 0` in `makeAssertionObject` is acceptable for all relying parties (no signature counter is currently incremented per use).
- [ ] Audit `backupEligible: true` / `backupState: true` flags hard-coded in the assertion path.
- [ ] Add automated/unit coverage for `CredentialProviderService` request handling and error mapping (see testing.md — none currently located for this target).

## Done
- [x] Spec and companion files scaffolded.
- [x] Registration flow: create + persist passkey, build attestation, return `ASPasskeyRegistrationCredential`, track `webAuthNPassKeyAdded`.
- [x] Authentication flow: match stored passkey, sign challenge, return `ASPasskeyAssertionCredential`, track `webAuthNPassKeyUsed`.
- [x] Biometric/passcode gate (`deviceOwnerAuthentication`) before key use.
- [x] Orphan cleanup: delete partially-created passkey on registration failure.
- [x] Minimal SwiftUI status UI (spinner + error/dismiss) via `PassKeyCredentialView`.
