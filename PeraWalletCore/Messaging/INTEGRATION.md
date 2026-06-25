# Messaging — Integration Guide

An AlgoChat-style end-to-end encrypted, on-chain messaging feature. This slice is
**feature-flagged off** (`enable_messaging`) and **not build-verified** — the SDK
adapter and SPM wiring need an Xcode build. Three steps remain to ship it.

## 1. Add the swift-algochat package (Xcode — do NOT hand-edit project.pbxproj)

In Xcode: **File ▸ Add Package Dependencies…**, enter
`https://github.com/CorvidLabs/swift-algochat`, then add the **`AlgoChat`**
product to the **`pera`** app target and the **`pera-wallet-core`** framework
target (and the beta/staging variants). This regenerates the
`XCRemoteSwiftPackageReference` / `XCSwiftPackageProductDependency` /
`packageProductDependencies` entries safely.

Until this is done, `AlgoChatTransport.swift` (the only file that
`import AlgoChat`) will not compile — that is expected.

## 2. Implement the account/key bridge

`AlgoChatTransport.ClientResolver` must build an `AlgoChat` client from a Pera
HD-wallet account. Pera signs via `XHDWalletAPI.rawSign` and never exposes a raw
private key, while AlgoChat needs key access for X25519 agreement + tx signing.
Resolve via either:
- swift-algochat accepting an external signer that calls `HDWalletSDK.rawSign`, or
- deriving a dedicated messaging key from the wallet seed (see
  `PassKeyService.makeSigningSDK`, which already obtains the seed).

Verify every `// VERIFY:` line in `AlgoChatTransport.swift` against the resolved SDK API.

## 3. Launch from the Menu

`MessagingFlowCoordinator` is self-contained (pushes directly, no shared `Router`
edits). Hook it up where the Menu options are handled:

```swift
// In the menu's didSelect handler, for a new `.messaging` option:
let service = MessagingFlowCoordinator.makeService(featureFlagService: featureFlagService)
guard service.isAvailable, let account = session.authenticatedUser?.accounts.first(where: {
    $0.hdWalletAddressDetail != nil && $0.type == .standard
}) else { return }
let coordinator = MessagingFlowCoordinator(
    configuration: configuration,
    presentingScreen: self,
    account: account,
    messagingService: service
)
coordinator.launch()
```

## Status

| Piece | State |
|-------|-------|
| Feature flag `enable_messaging` | ✅ added (default off) |
| Core service + models + transport seam | ✅ written, spec-covered, spec-sync green |
| `AlgoChatTransport` SDK adapter | ⚠️ written, NOT build-verified (`VERIFY:` markers) |
| UI (list + chat + coordinator) | ✅ written (plain UIKit), NOT build-verified |
| SPM package wiring | ⬜ Xcode step above |
| Account/key bridge | ⬜ step 2 above |
| Menu hook | ⬜ step 3 above |
