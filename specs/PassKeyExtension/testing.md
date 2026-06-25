# PassKeyExtension — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- No dedicated unit tests for the `PassKeyExtension` target were located. The crypto/storage it delegates to lives in `pera_wallet_core` (`PassKeyService`, `LiquidAuthSDK`); cover request orchestration and `LiquidAuthError` mapping there or add an extension-target test bundle.
- Note: app-extension flows are driven by the system AutoFill UI, so most validation here is manual on-device.

## Manual QA checklist

Pera Wallet must be enabled as a passkey/AutoFill provider (Settings → Passwords → Password Options → enable Pera Wallet), and a wallet session must exist.

- [ ] **Register:** from a WebAuthn site, create a passkey and choose Pera Wallet. Spinner shows, Face ID/passcode prompts, registration completes, passkey appears in storage.
- [ ] **Authenticate:** sign in on the same site with the saved passkey via Pera Wallet; assertion completes and the site logs in.
- [ ] **Allowed credentials filter:** when the site sends `allowedCredentials`, only the matching credential id is used.
- [ ] **Biometric cancel:** cancel Face ID/passcode → error screen shows; tapping Dismiss cancels the request (no crash, system reports user-cancel).
- [ ] **Duplicate registration:** attempting to register a second passkey for the same site/username surfaces the "already exists" error and leaves no orphaned passkey.
- [ ] **No passkey on auth:** authenticate for a site with no stored passkey → "no passkey found" error.
- [ ] **Analytics:** `webAuthNPassKeyAdded` fires on register, `webAuthNPassKeyUsed` fires on auth.

## Edge cases

- Extension foregrounding race: confirm UI renders and Face ID succeeds across cold-launch and warm-launch of the extension (the 0.1s delay + reentrant `setupUI()` exist for this).
- Invalid request type passed to registration → `liquid-auth-invalid-passkey-found` shown, no service call.
- Missing `CoreAppConfiguration`/`session`/`hdWalletStorage` → general error (e.g. before wallet setup).
- Device without biometrics/passcode enrolled → `canEvaluatePolicy` false → authentication fails gracefully.
- Relying party / user handle that fails UTF-8 or base64 decoding → general error.
- `prepareInterfaceForExtensionConfiguration` invoked from system settings → completes immediately without UI.
