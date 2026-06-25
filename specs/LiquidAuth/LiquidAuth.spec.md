---
module: LiquidAuth
version: 1
status: active
files:
  - PeraWalletCore/LiquidAuth/Data/LiquidAuthError.swift
  - PeraWalletCore/LiquidAuth/Data/LiquidAuthRequest.swift
  - PeraWalletCore/LiquidAuth/Data/LiquidAuthResponse.swift
  - PeraWalletCore/LiquidAuth/Data/PassKeyAuthenticationRequest.swift
  - PeraWalletCore/LiquidAuth/Data/PassKeyAuthenticationResponse.swift
  - PeraWalletCore/LiquidAuth/Data/PassKeyCreationRequest.swift
  - PeraWalletCore/LiquidAuth/Data/PassKeyCreationResponse.swift
  - PeraWalletCore/LiquidAuth/LiquidAuthSDKAPI.swift
  - PeraWalletCore/LiquidAuth/LiquidAuthService.swift
  - PeraWalletCore/LiquidAuth/PassKeyService.swift
db_tables: []
depends_on:
  - specs/API/API.spec.md
  - specs/Data/Data.spec.md
  - specs/Models/Models.spec.md
  - specs/Utils/Utils.spec.md
---

# LiquidAuth

## Purpose

Implements the Liquid Auth flow: passkey-backed (WebAuthn/FIDO2) registration and
assertion against a relying party, with the resulting challenges signed by the
user's Algorand HD wallet key. The module owns the WebRTC signaling handshake,
the attestation/assertion option exchange, and the bridge between Pera's passkey
storage and the Liquid Auth SDK. Inputs are deep-linked `liquid://` auth requests;
outputs are signed credential responses posted back to the relying party.

## Public API

| Export | Description |
|--------|-------------|
| `LiquidAuthError` | Typed error enum for every failure mode in the auth flow (not implemented, missing signing account, general error with optional cause). |
| `errorDescription` | `LocalizedError` conformance providing a human-readable string for each `LiquidAuthError` case. |
| `LiquidAuthRequest` | Value type describing an inbound auth request: the relying-party `origin` and the signaling `requestId`. |
| `origin` | Relying-party origin (host) the request/passkey is scoped to. |
| `requestId` | Identifier correlating the request with the WebRTC signaling session. |
| `LiquidAuthResponse` | Result of a completed auth flow, carrying the resolved `credentialId`. |
| `credentialId` | Base64URL credential identifier produced during registration/assertion. |
| `PassKeyAuthenticationRequest` | Input for generating assertion data: `origin` and `username`. |
| `username` | Account address acting as the WebAuthn username for the passkey. |
| `init` | Public initializers for the request/response value types and services. |
| `PassKeyAuthenticationResponse` | Assertion material: `credentialId`, `address`, and signing `keyPair`. |
| `address` | Algorand account address bound to the passkey credential. |
| `keyPair` | P-256 signing private key backing the passkey credential. |
| `PassKeyCreationRequest` | Input for creating a passkey: origin, username, user handle, display name, optional address. |
| `userHandle` | Opaque WebAuthn user-handle bytes for the credential. |
| `displayName` | Human-readable credential name shown to the user. |
| `PassKeyCreationResponse` | Result of passkey creation: `credentialId`, `address`, and `keyPair`. |
| `LiquidAuthSDKAPI` | Protocol abstracting the Liquid Auth SDK (attestation/assertion options & results, object builders, base64url decoding). |
| `LiquidAuthServicing` | Protocol for the high-level service: handle an auth request and start signaling, exposing a `message` publisher. |
| `message` | Read-only publisher emitting signaling status/messages to observers. |
| `PassKeyServicing` | Protocol for passkey lifecycle: find signing accounts, create/find/delete passkeys, build signing SDK and assertion data. |

## Invariants

1. Auth and signaling are gated by the `liquidAuthEnabled` feature flag; when off, every entry point throws `LiquidAuthError.notImplemented`.
2. A request only proceeds when at least one signing account exists; otherwise `signingAccountNotFound` is thrown.
3. Challenges are signed with the account's HD wallet P-256 key — never with a static or shared secret.
4. On any attestation/assertion failure, passkeys created for the origin+username are deleted to avoid orphaned credentials.
5. Only `liquid://` URLs with a `requestId` query item are parsed into a `LiquidAuthRequest`.

## Behavioral Examples

### Scenario: Existing passkey → authenticate

- **Given** a valid request whose origin+username already has a passkey
- **When** `handleAuthRequest` is called
- **Then** the assertion challenge is signed and a `LiquidAuthResponse` is returned

### Scenario: No passkey → register

- **Given** a valid request with no existing passkey
- **When** `handleAuthRequest` is called
- **Then** a passkey is created, the attestation challenge is signed, and a `LiquidAuthResponse` is returned

### Scenario: Feature disabled

- **Given** the `liquidAuthEnabled` flag is off
- **When** `handleAuthRequest` or `startSignaling` is called
- **Then** `LiquidAuthError.notImplemented` is thrown

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Feature flag disabled | Throws `LiquidAuthError.notImplemented` |
| No signing account available | Throws `LiquidAuthError.signingAccountNotFound` |
| Challenge decode / signing / network failure | Throws `LiquidAuthError.generalError`, deletes any created passkey |
| Relying-party response contains `error` | Throws `LiquidAuthError.generalError` |

## Dependencies

| Module | Usage |
|--------|-------|
| FeatureFlagServicing | Gates the flow on `liquidAuthEnabled` |
| HDWalletStorable / HDWalletSDK | Resolves signing accounts and raw-signs challenges |
| Liquid Auth SDK (SignalService) | WebRTC signaling, attestation/assertion option & result exchange |
| WebRTC | ICE servers and peer connection for signaling |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
