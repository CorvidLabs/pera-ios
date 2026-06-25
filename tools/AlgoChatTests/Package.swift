// swift-tools-version:6.0
import PackageDescription

// Runnable integration + snapshot tests for the Messaging/AlgoChat feature.
// Standalone (not part of the Xcode app) so it can be run with `swift test`
// without the app build. The localnet test needs a running AlgoKit LocalNet.
let package = Package(
    name: "AlgoChatTests",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/CorvidLabs/swift-algochat", revision: "c5126b8309b32064c1a1bd826734f6e60e8aaf75"),
        .package(url: "https://github.com/CorvidLabs/swift-algokit", revision: "07abcab75a912b435cec2158a033c975039f7676"),
        .package(url: "https://github.com/CorvidLabs/swift-algorand", revision: "ca29c9ae8d355d556d2bd54ebee098ca6b8397f7"),
    ],
    targets: [
        // The real production derivation (symlinked) — tests exercise the actual code.
        .target(name: "MessagingCore"),
        .testTarget(
            name: "AlgoChatIntegrationTests",
            dependencies: [
                "MessagingCore",
                .product(name: "AlgoChat", package: "swift-algochat"),
                .product(name: "AlgoKit", package: "swift-algokit"),
                .product(name: "Algorand", package: "swift-algorand"),
            ]
        ),
    ]
)
