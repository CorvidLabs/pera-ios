# AlgoChatKit (facade source)

Source for the vendored `Libraries/AlgoChatKit.framework` — a Foundation-only
facade over `swift-algochat` that **seals** the SDK and its swift-crypto inside
the framework binary (via `@_implementationOnly`) so the host app never imports
them (avoiding the swift-crypto 2.x/3.x conflict with MnemonicSwift).

## Rebuild (iphonesimulator, arm64)

```sh
xcodegen generate
xcodebuild -project AlgoChatKit.xcodeproj -scheme AlgoChatKit \
  -configuration Release -sdk iphonesimulator -arch arm64 \
  -derivedDataPath .build build
# then copy the built .framework over Libraries/AlgoChatKit.framework,
# preserving Info.plist.
```

Public API: `ACKClient`, `ACKMessage` (incl. `timestamp`), `ACKNetwork`,
and the `AlgoChatKit` namespace (`version`, `maxMessageBytes`, `messagingAddress`).
