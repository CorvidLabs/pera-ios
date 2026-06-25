# PassKeyExtension — Context

## Overview

`PassKeyExtension` is Pera Wallet's **AutoFill Credential Provider app extension** (separate iOS extension target). It answers system passkey requests — registration and authentication — without launching the host app, delegating all crypto/storage to `pera_wallet_core`. iOS 17+ only. The authoritative contract is `PassKeyExtension.spec.md`.

## Key files

- `PassKeyExtension/CredentialProviderViewController.swift` — `ASCredentialProviderViewController` subclass. System entry points: `prepareInterface(forPasskeyRegistration:)`, `prepareCredentialList(for:requestParameters:)`, `prepareInterfaceForExtensionConfiguration()`. Hosts the SwiftUI view in a `UIHostingController` and completes/cancels the extension request.
- `PassKeyExtension/CredentialProviderViewModel.swift` — `@Observable` view model. Calls `FirebaseApp.configure()` on init, forwards requests to the service, converts thrown errors into `error: String?` for the UI, and exposes `onDismissed`.
- `PassKeyExtension/CredentialProviderService.swift` — request orchestration. Initializes `CoreAppConfiguration` + `PassKeyService`, runs the biometric gate, creates/finds passkeys, and builds WebAuthn attestation/assertion credentials via `LiquidAuthSDK`.
- `PassKeyExtension/PassKeyCredentialView.swift` — minimal SwiftUI status screen (spinner during signing; error icon + message + dismiss button on failure). Uses `DMMono-Medium` font and app design-system colors.

## Architecture

- **Pattern:** View (SwiftUI) → ViewModel (`@Observable`) → Service. The view controller is a thin `ASCredentialProviderViewController` adapter between the system request and the view model.
- **No coordinators / no navigation stack** — the extension shows a single status screen; the system owns presentation.
- **Delegation:** all key material, persistence (CoreData via `PassKeyService` + `hdWalletStorage`), and WebAuthn object construction live in `pera_wallet_core` / `LiquidAuthSDK`; this module only orchestrates.
- **Error model:** typed throws of `LiquidAuthError`; non-typed errors wrapped as `generalError(cause:)`.

## Known quirks / decisions

- `setupUI()` is intentionally called from `prepareInterface`/`prepareCredentialList` (not `viewDidLoad`) and made reentrant — a documented race condition where the UI otherwise does not render.
- A 0.1s delay precedes request handling so Face ID succeeds only once the extension is fully foregrounded.
- `prepareInterfaceForExtensionConfiguration()` is a no-op that immediately completes (future settings UI placeholder).

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
