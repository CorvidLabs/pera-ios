# Discover — Requirements

## Overview

The Discover module supplies the typed, JSON-serializable parameter models that the native app and the embedded Discover web view (the in-app dApp browser) use to communicate. These models translate native intents into the message shapes the web layer expects.

## User Stories

### US-1: Open an asset in Discover
As a wallet user, I want to tap an asset and have the Discover browser open that asset's page, so that I can explore details and pools for it.

**Acceptance Criteria**
- Given a selected `Asset`, the app builds `DiscoverAssetParameters` whose `assetID` is `"ALGO"` for Algo or the numeric id otherwise.
- The model serializes `assetID` as `tokenId` and `poolID` as `poolId`.

### US-2: Favorite a dApp from the browser
As a wallet user, I want to favorite a dApp from the browser, so that it is saved to my favorites.

**Acceptance Criteria**
- Toggling the favorite button produces a `DiscoverFavouriteDappDetails` with action `"handleBrowserFavoriteButtonClick"`.
- The payload carries the dApp's name and url.

### US-3: Initiate a swap from Discover
As a wallet user, I want Discover to launch a swap with the correct direction and assets, so that buy/swap flows are pre-filled.

**Acceptance Criteria**
- `DiscoverSwapParameters` carries one of the supported `Action` values and optional `assetIn`/`assetOut`.
- Assets serialize as `asset_in` and `asset_out` to match the web contract.

## Non-Functional Requirements

- All models conform to `JSONModel` and decode resiliently, treating absent optional fields as `nil`.
- Action discriminator strings must exactly match the values the web view expects.
