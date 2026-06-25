---
module: PassKeyExtension
version: 1
status: active
files:
  - PassKeyExtension/CredentialProviderService.swift
  - PassKeyExtension/CredentialProviderViewController.swift
  - PassKeyExtension/CredentialProviderViewModel.swift
  - PassKeyExtension/PassKeyCredentialView.swift
db_tables: []
depends_on: []
---

# PassKeyExtension

## Purpose

`PassKeyExtension` is Pera Wallet's iOS **AutoFill Credential Provider app extension** (`ASCredentialProviderViewController` host). It lets the system passkey/AutoFill UI delegate WebAuthn passkey **registration** and **authentication (assertion)** requests to Pera Wallet without launching the main app.

It covers two system-driven flows, both gated behind device biometrics/passcode:

- **Registration** (`prepareInterface(forPasskeyRegistration:)`): create a new P256 passkey for a relying party, persist it via `PassKeyService`, build an `ASPasskeyRegistrationCredential` (attestation object) and return it to the system.
- **Authentication** (`prepareCredentialList(for:requestParameters:)`): locate a stored passkey matching the relying party (and optionally an allowed credential id), sign the challenge, and return an `ASPasskeyAssertionCredential`.

While a request is in flight the extension shows a minimal SwiftUI screen (`PassKeyCredentialView`) — a spinner during signing, or an error message with a dismiss button on failure. The extension owns only the AutoFill UI and request orchestration; all key derivation, storage, and WebAuthn object construction are delegated to `PassKeyService` and `LiquidAuthSDK` from `pera_wallet_core`. Requires **iOS 17+** (all types are `@available(iOS 17, *)`).

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. **Biometric/passcode gate before key use.** Every registration and authentication request calls `ensureAuthenticated()` → `authenticateBiometrics()` (`LAPolicy.deviceOwnerAuthentication`) before any passkey is created, read, or signed. If authentication fails or the device cannot evaluate the policy, the request throws `LiquidAuthError.authenticationFailed()`.
2. **Extension must be initialized per request.** `initializeExtension()` runs `CoreAppConfiguration.initialize()` and builds a fresh `PassKeyService` (from `hdWalletStorage` + `session`) before each request; if shared config is unavailable the request fails with `generalError()`.
3. **No duplicate passkeys.** Registration throws `passKeyExists()` when a passkey for the same `(relyingPartyIdentifier, userName)` already exists; on any registration failure the partially-created passkey is removed via `deletePassKeyIfExists(identity:)`, so storage is never left with an orphaned credential.
4. **Authentication requires an existing matching passkey.** Assertion only succeeds for a stored passkey whose `origin` equals the relying party identifier (and whose `credentialId` matches when `allowedCredentials` is non-empty); otherwise `passKeyNotFound()` is thrown.
5. **All errors are surfaced as `LiquidAuthError`.** Service methods use typed throws (`throws(pera_wallet_core.LiquidAuthError)`); non-typed underlying errors are wrapped via `generalError(cause:)`. The view model converts the thrown error's `localizedDescription` into `viewModel.error` for display.
6. **iOS 17+ only.** All four types are `@available(iOS 17, *)`; the SwiftUI view is `@available(iOS 17.0, *)`.

## Behavioral Examples

### Scenario: Register a new passkey via AutoFill
- **Given** a relying party site triggers passkey creation and the system routes it to Pera Wallet's credential provider
- **When** `prepareInterface(forPasskeyRegistration:)` receives a valid `ASPasskeyCredentialRequest`, the spinner UI is shown, and the user passes Face ID / passcode
- **Then** `CredentialProviderService` creates and saves a P256 passkey via `PassKeyService`, builds the attestation object through `LiquidAuthSDK.makeAttestationObject`, tracks `webAuthNPassKeyAdded`, and completes the registration with an `ASPasskeyRegistrationCredential`.

### Scenario: Authenticate with an existing passkey
- **Given** the user has previously registered a passkey for `relyingPartyIdentifier` and a sign-in challenge arrives
- **When** `prepareCredentialList(for:requestParameters:)` runs, the user passes biometrics, and a stored passkey matches the relying party (and `allowedCredentials` if present)
- **Then** the service signs `authenticatorData + clientDataHash` with the passkey's key pair, tracks `webAuthNPassKeyUsed`, and completes the assertion with an `ASPasskeyAssertionCredential`.

### Scenario: Biometric authentication is cancelled
- **Given** a registration or authentication request is in flight
- **When** the user cancels or fails Face ID / passcode in `ensureAuthenticated()`
- **Then** the service throws `LiquidAuthError.authenticationFailed()`, the view model sets `error` to its localized description, and `PassKeyCredentialView` shows the error state with a dismiss button (which cancels the request with `ASExtensionError.userCanceled`).

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Request is not an `ASPasskeyCredentialRequest` (registration) | `viewModel.error` set to `liquid-auth-invalid-passkey-found`; no service call made |
| Credential identity is not an `ASPasskeyCredentialIdentity` | `generalError()` thrown |
| `CoreAppConfiguration` / `hdWalletStorage` / `session` unavailable | `generalError()` thrown during `initializeExtension()` |
| Biometrics/passcode fails or device cannot evaluate policy | `authenticationFailed()` thrown |
| Passkey already exists for `(origin, username)` on registration | `passKeyExists()` thrown; orphaned passkey deleted |
| No stored passkey matches the relying party (and allowed credential) on auth | `passKeyNotFound()` thrown |
| Relying party / origin / user handle data cannot be UTF-8 / base64 decoded | `generalError()` thrown |
| Any non-typed error during request handling | Wrapped as `generalError(cause:)` (and partial passkey deleted on registration) |
| Any error surfaced to UI | `viewModel.error` set to `error.localizedDescription`; `PassKeyCredentialView` shows error icon + message + `title-dismiss` button |
| User taps Dismiss on error | `onDismissed` cancels request with `ASExtensionError.userCanceled` |

## Dependencies

| Module / Service | Usage |
|------------------|-------|
| `pera_wallet_core` (PeraWalletCore) | `PassKeyService`, `PassKey`, request/response models (`PassKeyCreationRequest`, `PassKeyAuthenticationRequest`), `LiquidAuthError`, `CoreAppConfiguration` (init, `session`, `hdWalletStorage`, `analytics`), `Utility.hashSHA256` |
| `LiquidAuthSDK` | `LiquidAuthSDKAPIImpl` for building WebAuthn objects: `makeAttestationObject`, `makeAssertionObject` |
| `AuthenticationServices` | `ASCredentialProviderViewController`, passkey request/credential/identity types, `ASExtensionError` |
| `LocalAuthentication` | `LAContext` / `LAPolicy.deviceOwnerAuthentication` biometric/passcode gate |
| `CryptoKit` | `P256.Signing` key pairs and signatures |
| `SwiftCBOR` | CBOR encoding used in attestation building |
| `Firebase` | `FirebaseApp.configure()` and analytics event tracking (`webAuthNPassKeyAdded`, `webAuthNPassKeyUsed`) |
| `SwiftUI` / `UIKit` | `PassKeyCredentialView` hosted via `UIHostingController`; app design-system colors |
| `CoreData` | Backing store for persisted passkeys (via `PassKeyService`) |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
