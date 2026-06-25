---
module: Application
version: 1
status: active
files:
  - PeraWalletCore/Application/Environment/AppEnvironment.swift
  - PeraWalletCore/Application/Environment/Target/ALGAppTarget.swift
  - PeraWalletCore/Application/Environment/Target/DeeplinkConfig/ALGDeeplinkConfig.swift
  - PeraWalletCore/Application/Environment/Target/DeeplinkConfig/DeeplinkConfig.swift
  - PeraWalletCore/Application/Environment/Target/UniversalLinkConfig/ALGUniversalLinkConfig.swift
  - PeraWalletCore/Application/Environment/Target/UniversalLinkConfig/UniversalLinkConfig.swift
  - PeraWalletCore/Application/Environment/Target/WalletConnectConfig/ALGWalletConnectConfig.swift
  - PeraWalletCore/Application/Environment/Target/WalletConnectConfig/WalletConnectConfig.swift
db_tables: []
depends_on:
  - specs/API/API.spec.md
  - specs/Models/Models.spec.md
---

# Application

## Purpose

Defines the app's runtime environment and build-target configuration. `AppEnvironment` resolves network endpoints (Algod, Indexer, Mobile API), feature base URLs (cards, staking, discover, fund), and well-known Algorand/Pera web links based on whether the active target is staging or production. `ALGAppTarget` loads the per-build `Config` resource and exposes identity (bundle id, app group, version) plus deeplink, universal-link, and WalletConnect configs that drive how the app accepts incoming links and identifies itself to WalletConnect peers.

## Public API

| Export | Description |
|--------|-------------|
| `AppEnvironment` | Singleton holding all environment-derived endpoints, tokens, and base URLs for the active staging/production target. |
| `current` | Static accessor returning the shared singleton instance (`AppEnvironment.current` / `ALGAppTarget.current`). |
| `appID` | App Store identifier string for Pera Wallet. |
| `testNetARC59AppID` | ARC-59 inbox application ID used on TestNet. |
| `mainNetARC59AppID` | ARC-59 inbox application ID used on MainNet. |
| `testNetARC59AppAddress` | ARC-59 inbox application account address on TestNet. |
| `mainNetARC59AppAddress` | ARC-59 inbox application account address on MainNet. |
| `cardsBaseUrl` | Returns the cards web base URL for the given `ALGAPI.Network`. |
| `isCardsFeatureEnabled` | Returns whether the cards feature is enabled for the given network (disabled on TestNet in production). |
| `AlgorandWeb` | String-backed enum of well-known Algorand and Pera web/support URLs. |
| `presentation` | User-facing display string for an `AlgorandWeb` case (shortened for select cases). |
| `hash` | Hashable conformance hashing the case's raw value. |
| `PeraExplorer` | Nested enum building Pera Explorer URLs for an address, asset, or transaction group. |
| `link` | Resolved `URL?` for an `AlgorandWeb` case or a `PeraExplorer` case. |
| `app` | The `App` flavor (beta or store) for the current target. |
| `deeplinkConfig` | Deeplink source configuration loaded for the current target. |
| `walletConnectConfig` | WalletConnect configuration loaded for the current target. |
| `universalLinkConfig` | Universal-link configuration loaded for the current target. |
| `isProduction` | Whether the current target is a production/store build. |
| `appGroupIdentifier` | App group identifier used for shared container access. |
| `bundleIdentifier` | The running app's bundle identifier. |
| `displayName` | The running app's display name. |
| `version` | The running app's version string. |
| `setup` | Loads `ALGAppTarget.current` from the bundled `Config` resource. |
| `App` | Enum of build flavors (`beta`, `store`) decoded from configuration. |
| `rawValue` | Raw string backing an `App` flavor or `AlgorandWeb` case. |
| `allCases` | All `App` flavor cases. |
| `qr` | QR-source deeplink/universal-link group config. |
| `walletConnect` | WalletConnect-source deeplink/universal-link group config. |
| `moonpay` | MoonPay deeplink source config. |
| `acceptedSchemes` | URL schemes a deeplink source group accepts. |
| `preferredScheme` | The preferred scheme for a deeplink source group. |
| `scheme` | The scheme for a single deeplink source config. |
| `init` | Memberwise and `Decodable` initializers for the config value types. |
| `DeeplinkConfig` | Protocol grouping deeplink source configs (qr, walletConnect, moonpay). |
| `DeeplinkSourceGroupConfig` | Protocol for a deeplink source group exposing accepted/preferred schemes. |
| `canAcceptScheme` | Returns whether a deeplink source group accepts a given scheme. |
| `DeeplinkSourceConfig` | Protocol for a single deeplink source exposing its scheme. |
| `url` | Base URL for a universal-link config or WalletConnect meta config. |
| `acceptedPaths` | Accepted URL paths for a universal-link group config. |
| `UniversalLinkConfig` | Protocol describing universal-link acceptance (qr, walletConnect, url). |
| `canAccept` | Returns whether a URL is accepted as either a QR or WalletConnect universal link. |
| `canAcceptQR` | Returns whether a URL matches the accepted QR universal-link paths. |
| `canAcceptWalletConnect` | Returns whether a URL matches the accepted WalletConnect universal-link paths. |
| `UniversalLinkGroupConfig` | Protocol for a universal-link group exposing accepted paths. |
| `meta` | WalletConnect metadata config (name, description, icons, url). |
| `name` | App name advertised in WalletConnect metadata. |
| `description` | App description advertised in WalletConnect metadata. |
| `icons` | Icon URLs advertised in WalletConnect metadata. |
| `WalletConnectConfig` | Protocol exposing WalletConnect metadata config. |
| `WalletConnectMetaConfig` | Protocol describing WalletConnect peer metadata fields. |

## Invariants

1. `AppEnvironment.current` and `ALGAppTarget.current` are process-wide singletons; all callers observe the same instance.
2. The active target is derived solely from `ALGAppTarget.current.isProduction`: production maps to `.prod`, otherwise `.staging`.
3. `isTestNet` is the inverse of the current target's `isProduction`.
4. All network/feature URLs are constructed with the `https` schema.
5. ARC-59 app IDs and addresses are fixed constants per network and never vary by build target.
6. `ALGAppTarget.setup()` must be called before `ALGAppTarget.current` is read; otherwise the implicitly-unwrapped `current` is nil.
7. A universal link is accepted by `canAccept` only when it matches the QR or WalletConnect accepted-path prefixes for the configured base `url`.

## Behavioral Examples

### Scenario: Cards feature gated on TestNet in production
- **Given** a production target build
- **When** `isCardsFeatureEnabled(for: .testnet)` is called
- **Then** it returns `false`, while `.mainnet` returns `true`

### Scenario: Resolving an explorer link for a MainNet address
- **Given** `AlgorandWeb.PeraExplorer.address(isMainnet: true, param: someAddress)`
- **When** `link` is accessed
- **Then** a `https://explorer.perawallet.app/address/<address>/` URL is returned

### Scenario: Loading the app target configuration
- **Given** a bundled `Config` resource for the build
- **When** `ALGAppTarget.setup()` is called
- **Then** `ALGAppTarget.current` is populated with the decoded app flavor, deeplink, universal-link, and WalletConnect configs

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Missing Info.plist key (e.g. `ALGOD_TOKEN`, host) | Falls back to an empty string instead of crashing |
| `App.init(rawValue:)` given an unknown raw value | Defaults to `.store` rather than returning nil |
| `Config` resource missing or malformed during `setup()` | Decoding fails and `ALGAppTarget.current` is not set |
| `ALGAppTarget.current` read before `setup()` | Force-unwrap of the implicitly-unwrapped static traps |
| Invalid URL string in `AlgorandWeb.link` / `PeraExplorer.link` | Returns `nil` |

## Dependencies

| Module | Usage |
|--------|-------|
| Foundation | URL, Bundle, Decodable, Hasher primitives |
| UIKit | Imported by `AppEnvironment` |
| MacaroonApplication | `AppTarget` base type and resource loading for `ALGAppTarget` |
| MacaroonUtils | Collection/utility helpers (e.g. `first(matching:)`) |
| ALGAPI | `ALGAPI.Network` enum used to select cards URLs and feature gating |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
