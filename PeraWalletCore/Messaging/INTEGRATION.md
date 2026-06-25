# Messaging — Integration Guide

An AlgoChat-style end-to-end encrypted, on-chain messaging feature. This slice is
**feature-flagged off** (`enable_messaging`) and **not build-verified** — the SDK
adapter and SPM wiring need an Xcode build. Three steps remain to ship it.

## ⛔ Blocker: swift-crypto version conflict (must resolve first)

Adding `swift-algochat` to `algorand.xcodeproj` today **fails package
resolution**. Verified by wiring the package (AlgoChat + AlgoKit + Algorand) into
`pera-wallet-core` via the `xcodeproj` gem and running
`xcodebuild -resolvePackageDependencies`:

```
'swift-algorand' depends on 'swift-crypto' 3.0.0..<4.0.0
'mnemonicswift' (Pera dep) depends on 'swift-crypto' 2.1.0..<3.0.0
→ irreconcilable
```

MnemonicSwift's latest tag (2.2.5) still pins swift-crypto `<3.0.0`, so a version
bump alone won't fix it. Resolution options (each an upstream/fork change, not an
in-repo edit):
1. Fork MnemonicSwift and relax its swift-crypto upper bound to `<4.0.0`
   (Pera only uses its SHA/PBKDF paths, very likely 3.x-compatible), point Pera at the fork.
2. Have swift-algorand/swift-algochat support swift-crypto 2.x.
3. Replace MnemonicSwift with a swift-crypto-3.x-compatible mnemonic lib
   (swift-algorand already ships `Mnemonic.encode/decode`).

Until one of these lands, the feature stays flagged off and the package cannot be
added. Everything else (code, derivation, protocol) is verified independently.

**The option-1 fix is verified sound.** In an isolated SwiftPM package,
swift-algochat + a MnemonicSwift patched to `swift-crypto < 4.0` **build, link,
and run together** on swift-crypto 3.x, and MnemonicSwift's **own 24 crypto tests
pass** against swift-crypto 3.x (0 failures). So the conflict is resolved by a
single version-bound change with no cryptographic behavior change — the remaining
work is mechanical (apply the fork, wire the packages, build), gated only on the
human decision to change a crypto dependency.

## 1. Add the swift-algochat package (Xcode — do NOT hand-edit project.pbxproj)

In Xcode: **File ▸ Add Package Dependencies…**, enter
`https://github.com/CorvidLabs/swift-algochat`, then add the **`AlgoChat`**
product to the **`pera`** app target and the **`pera-wallet-core`** framework
target (and the beta/staging variants). This regenerates the
`XCRemoteSwiftPackageReference` / `XCSwiftPackageProductDependency` /
`packageProductDependencies` entries safely.

Until this is done, `AlgoChatTransport.swift` (the only file that
`import AlgoChat`) will not compile — that is expected.

## 2. Account/key bridge — IMPLEMENTED & LocalNet-verified

The bridge is `MessagingKeyDerivation` + `AlgoChatClientFactory`: derive a
dedicated 32-byte messaging key from the HD-wallet **seed** via CryptoKit
`HKDF<SHA256>`, build an `Account(privateKey:)`, and construct `AlgoChat`. The
spending key is never exposed. This exact derivation was proven end-to-end on an
AlgoKit LocalNet (two seed-derived identities exchanged an E2E-encrypted message
on-chain; addresses are deterministic per seed).

The only remaining unverified step is the `seedProvider` call itself, which
mirrors `PassKeyService.makeSigningSDK`'s existing seed path.

## 3. Compose at the root + launch from the Menu

Build the service where `hdWalletStorage` + network are available (the SDK import
stays in `pera_wallet_core`), then inject it into the self-contained coordinator:

```swift
let service = AlgoChatClientFactory.makeMessagingService(
    featureFlagService: featureFlagService,
    network: .mainnet,                       // map from the app's current network
    seedProvider: { address in
        // mirrors PassKeyService.makeSigningSDK's seed path
        guard let account = session.authenticatedUser?.accounts.first(where: { $0.address == address }),
              let walletId = account.hdWalletAddressDetail?.walletId,
              let wallet = try hdWalletStorage.wallet(id: walletId),
              let seed = HDWalletUtils.generateSeed(fromEntropy: wallet.entropy)
        else { throw MessagingError.signingAccountNotFound }
        return Data(seed.toHexString().utf8)
    }
)

guard service.isAvailable, let account = session.authenticatedUser?.accounts.first(where: {
    $0.hdWalletAddressDetail != nil && $0.type == .standard
}) else { return }

MessagingFlowCoordinator(
    configuration: configuration,
    presentingScreen: self,
    account: account,
    messagingService: service
).launch()
```

## Status

| Piece | State |
|-------|-------|
| Feature flag `enable_messaging` | ✅ added (default off) |
| Core service + models + transport seam | ✅ written, spec-covered, spec-sync green |
| `AlgoChatTransport` SDK adapter | ✅ API verified on LocalNet (see below); only the key bridge is open |
| UI (list + chat + coordinator) | ✅ written (plain UIKit), NOT build-verified |

## Compile verification

All eight core sources in this directory (`MessagingError`, `ChatMessage`,
`ConversationSummary`, `MessagingTransport`, `MessagingService`,
`AlgoChatTransport`, `AlgoChatClientFactory`, `MessagingKeyDerivation`) were
compiled against the **real swift-algochat package** in a SwiftPM harness with
minimal stand-ins for the Pera types — i.e. the same compilation the Xcode build
performs for these files. This caught and fixed two real issues (`AlgoChatTransport`
needed `import Algorand` for `Address`; `AlgoChatClientFactory.clientResolver()`
captured non-`Sendable` `self`). The UI files (UIKit/MacaroonUIKit) and the SPM
project wiring still need the Xcode build.

## LocalNet verification

The exact SDK API this adapter uses was proven end-to-end against a running
AlgoKit LocalNet with a headless Swift harness: two funded accounts, Bob
publishes his key on-chain, Alice discovers it via the indexer, sends an
end-to-end-encrypted message, and Bob decrypts the original plaintext. This
confirmed `conversations` / `conversation(with:)` / `refresh` / `send` /
`fetchPublicKey` / `publishKeyAndWait`, `Conversation.participant`, and
`Message.id/.content/.timestamp/.direction` — and surfaced the
`Conversation.peerAddress → .participant` fix now applied here. What remains
unverified is only the app build + the account/key bridge below.
| Core sources compile vs real SDK | ✅ SwiftPM-verified (2 bugs fixed) |
| Account/key bridge (derivation) | ✅ implemented + LocalNet-verified |
| SPM package wiring | ⛔ blocked — swift-crypto 2.x/3.x conflict (see top) |
| `seedProvider` + Menu hook | ⬜ step 3 (after the blocker is resolved) |
