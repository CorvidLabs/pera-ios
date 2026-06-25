---
module: Discover
version: 1
status: active
files:
  - PeraWalletCore/Discover/DiscoverAssetParameters.swift
  - PeraWalletCore/Discover/DiscoverDappParamaters.swift
  - PeraWalletCore/Discover/DiscoverDeviceIDDetails.swift
  - PeraWalletCore/Discover/DiscoverFavouriteDappDetails.swift
  - PeraWalletCore/Discover/DiscoverGenericParameters.swift
  - PeraWalletCore/Discover/DiscoverSwapParameters.swift
db_tables: []
depends_on:
  - specs/Models/Models.spec.md
---

# Discover

## Purpose

Defines the JSON-serializable parameter models exchanged between the native app and the embedded Discover web view (the dApp browser). Each model encodes a specific interaction — opening an asset detail page, loading a dApp URL, reporting the device id, toggling a favorite dApp, or initiating a swap — into the shape the web layer expects. These are pure data-transfer types with no behavior beyond construction and JSON coding.

## Public API

| Export | Description |
|--------|-------------|
| `DiscoverAssetParameters` | JSON model identifying an asset to open in the Discover web view. |
| `assetID` | Asset identifier string (`"ALGO"` for Algo, otherwise the numeric id); encoded as `tokenId`. |
| `poolID` | Optional liquidity pool identifier; encoded as `poolId`, always `nil` from the provided initializers. |
| `init` | Initializers that build a model from a raw `assetID` string or from an `Asset` (mapping Algo to `"ALGO"`). |
| `DiscoverDappParamaters` | JSON model carrying a dApp URL plus optional name and favorites list to load in the web view. |
| `name` | Optional human-readable name of the dApp. |
| `url` | The dApp URL to load. |
| `favorites` | Optional list of the user's favorite dApps to seed the web view. |
| `FavoriteDapp` | Nested JSON model describing a single favorite dApp (name, url, optional logo). |
| `logo` | Optional logo URL string for a favorite dApp. |
| `DiscoverDeviceIDDetails` | JSON message reporting the push-notification device id to the web view. |
| `action` | Fixed action discriminator string identifying the message type for the web layer. |
| `payload` | The message payload — a raw value or nested model depending on the message. |
| `DiscoverFavouriteDappDetails` | JSON message sent when the user toggles a dApp's favorite button in the browser. |
| `Payload` | Nested model holding the favorited dApp's name, url, and logo. |
| `DiscoverGenericParameters` | JSON model wrapping a single URL for generic navigation in the web view. |
| `DiscoverSwapParameters` | JSON model describing a swap/buy action with optional in/out assets. |
| `assetIn` | Optional source asset id for the swap; encoded as `asset_in`. |
| `assetOut` | Optional destination asset id for the swap; encoded as `asset_out`. |
| `Action` | Enum of supported swap actions (buy-algo, swap-from-algo, swap-to-token, swap-from-token). |
| `hash` | Hashable conformance for `Action`, combining the raw string value into the hasher. |

## Invariants

1. `DiscoverAssetParameters.assetID` is `"ALGO"` when constructed from an Algo `Asset`, otherwise the asset's numeric id as a string.
2. `poolID` is always `nil` for instances created via the provided initializers.
3. `DiscoverDeviceIDDetails.action` is always the constant `"getDeviceId"`.
4. `DiscoverFavouriteDappDetails.action` is always the constant `"handleBrowserFavoriteButtonClick"`, and its payload's `logo` is always `nil`.
5. Coding keys map Swift property names to the web contract: `tokenId`/`poolId` for assets and `asset_in`/`asset_out` for swaps.
6. `Action.rawValue` is the exact wire string the web layer expects (e.g. `"buy-algo"`).

## Behavioral Examples

### Scenario: Build asset parameters from an Algo asset
- **Given** an `Asset` whose `isAlgo` is `true`
- **When** `DiscoverAssetParameters(asset:)` is called
- **Then** `assetID` is `"ALGO"` and `poolID` is `nil`

### Scenario: Report the device id
- **Given** a device id string
- **When** `DiscoverDeviceIDDetails(deviceId:)` is called
- **Then** `action` is `"getDeviceId"` and `payload` is the supplied device id

### Scenario: Favorite a dApp
- **Given** a dApp name and url
- **When** `DiscoverFavouriteDappDetails(name:url:)` is called
- **Then** `action` is `"handleBrowserFavoriteButtonClick"` and the payload carries the name and url with a `nil` logo

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Decoding JSON missing a required key (e.g. `url`) | `JSONModel`/`Decodable` decoding throws a `DecodingError` |
| `assetID` constructed from a non-Algo asset | Uses the asset's numeric id as a string; no error |
| Optional fields (`poolID`, `name`, `favorites`, `logo`, `assetIn`, `assetOut`) absent | Decode as `nil`; no error |
| Unknown swap `Action` raw string | `Action` decoding throws a `DecodingError` |

## Dependencies

| Module | Usage |
|--------|-------|
| Foundation | `URL`, `String`, JSON coding primitives |
| MacaroonUtils | `JSONModel` protocol providing JSON encode/decode conformance |
| Asset / AssetID | Source type for asset-based initializers and swap in/out identifiers |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
