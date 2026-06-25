---
module: Demo
version: 1
status: active
files:
  - PeraWalletCore/Demo/ALGAppAuthChecker.swift
  - PeraWalletCore/Demo/ALGBlockCycle.swift
  - PeraWalletCore/Demo/ALGBlockOperationQueue.swift
  - PeraWalletCore/Demo/ALGBlockProcessor.swift
  - PeraWalletCore/Demo/ALGBlockRequest.swift
  - PeraWalletCore/Demo/AccountAuthorizationDeterminer.swift
  - PeraWalletCore/Demo/AccountCollection.swift
  - PeraWalletCore/Demo/AccountDetailFetchOperation.swift
  - PeraWalletCore/Demo/AccountHandle.swift
  - PeraWalletCore/Demo/AccountPortfolioItem.swift
  - PeraWalletCore/Demo/AlgoAssetItem.swift
  - PeraWalletCore/Demo/AlgoLocalCurrency.swift
  - PeraWalletCore/Demo/AlgoRemoteCurrency.swift
  - PeraWalletCore/Demo/AppAuthChecker.swift
  - PeraWalletCore/Demo/AssetDetailCollection.swift
  - PeraWalletCore/Demo/AssetDetailGroupFetchOperation.swift
  - PeraWalletCore/Demo/AssetItem.swift
  - PeraWalletCore/Demo/BlockCycle.swift
  - PeraWalletCore/Demo/BlockEvent.swift
  - PeraWalletCore/Demo/BlockProcessor.swift
  - PeraWalletCore/Demo/Blockchain/BlockchainAccountUpdatesMonitor.swift
  - PeraWalletCore/Demo/Blockchain/BlockchainBatchRequest.swift
  - PeraWalletCore/Demo/Blockchain/BlockchainBatchUpdates.swift
  - PeraWalletCore/Demo/Blockchain/BlockchainRequest.swift
  - PeraWalletCore/Demo/Blockchain/BlockchainUpdate.swift
  - PeraWalletCore/Demo/Blockchain/BlockchainUpdatesMonitor.swift
  - PeraWalletCore/Demo/Blockchain/OptInBlockchainRequest.swift
  - PeraWalletCore/Demo/Blockchain/OptInBlockchainUpdate.swift
  - PeraWalletCore/Demo/Blockchain/OptOutBlockchainRequest.swift
  - PeraWalletCore/Demo/Blockchain/OptOutBlockchainUpdate.swift
  - PeraWalletCore/Demo/Blockchain/SendPureCollectibleAssetBlockchainRequest.swift
  - PeraWalletCore/Demo/Blockchain/SendPureCollectibleAssetBlockchainUpdate.swift
  - PeraWalletCore/Demo/CollectibleAssetItem.swift
  - PeraWalletCore/Demo/Currency/CurrencyAPIProvider.swift
  - PeraWalletCore/Demo/Currency/CurrencyExchanger.swift
  - PeraWalletCore/Demo/Currency/CurrencyID.swift
  - PeraWalletCore/Demo/Currency/CurrencyProvider.swift
  - PeraWalletCore/Demo/Currency/CurrencyRefreshOperation.swift
  - PeraWalletCore/Demo/FiatCurrency.swift
  - PeraWalletCore/Demo/LocalCurrency.swift
  - PeraWalletCore/Demo/NameServiceAPIStatus.swift
  - PeraWalletCore/Demo/Portfolio.swift
  - PeraWalletCore/Demo/PortfolioValue.swift
  - PeraWalletCore/Demo/RemoteCurrency.swift
  - PeraWalletCore/Demo/RemoteCurrencyValue.swift
  - PeraWalletCore/Demo/SharedAPIDataController.swift
  - PeraWalletCore/Demo/SharedDataController.swift
db_tables: []
depends_on:
  - specs/Algorithms/Algorithms.spec.md
  - specs/API/API.spec.md
  - specs/Application/Application.spec.md
  - specs/Data/Data.spec.md
  - specs/Models/Models.spec.md
  - specs/Swap/Swap.spec.md
  - specs/Utils/Utils.spec.md
---

# Demo

## Purpose

The Demo module is Pera Wallet's shared-data layer. It maintains the in-memory account and asset-detail collections, polls the chain for new blocks, and keeps account balances current. It converts holdings into the user's preferred fiat or Algo currency, tracks pending opt-in / opt-out / pure-collectible-send blockchain operations until they confirm, determines each account's authorization kind, and gates the app behind authentication / authorization checks.

## Public API

| Export | Description |
|--------|-------------|
| `launch` | `AppAuthChecker` entry point that resolves the initial auth status from the session state. |
| `authorize` | Marks the app as authorized (`ready`) and clears the inactivity timer. |
| `becomeActive` | On foreground, re-requires authorization if the inactive session has expired. |
| `resignActive` | On background, records the timestamp used to detect session expiration. |
| `init` | Initializer for the enclosing type. |
| `AccountCollection` | Atomic, address-keyed `Collection` of `AccountHandle`s. |
| `Key` | Associated key type of the collection (account address / asset ID). |
| `Index` | Associated index type wrapping the backing dictionary index. |
| `Element` | Associated element type stored in the collection. |
| `startIndex` | Start index of the backing table. |
| `endIndex` | End index of the backing table. |
| `debugDescription` | Debug string of the backing table. |
| `account` | Returns the `Account` value stored for a given address key, if any. |
| `rekeyedAccounts` | Returns the handles whose auth address matches the given key. |
| `index` | Returns the index following the given one. |
| `sorted` | Returns handles sorted by the supplied account sorting algorithm. |
| `AccountCollectionIndex` | Comparable wrapper around the account collection's dictionary index. |
| `AccountHandle` | A fetched account paired with its readiness `Status`. |
| `isAvailable` | True when the handle's status is `.ready` / the value is fully fetched. |
| `value` | The wrapped underlying value (e.g. the `Account`). |
| `status` | The current readiness / lifecycle status. |
| `Status` | Lifecycle enum (idle, inProgress, failed, ready / update states). |
| `accountValue` | The `AccountHandle` backing a portfolio item. |
| `portfolioValue` | The derived `PortfolioValue` for the item's account(s). |
| `currency` | The `CurrencyProvider` used for value conversion. |
| `currencyFormatter` | The formatter used to render monetary values. |
| `minimumBalance` | Optional minimum required balance for the account. |
| `isAmountHidden` | Whether monetary amounts should be masked in the UI. |
| `asset` | The asset (Algo / ASA / collectible) wrapped by the item. |
| `amount` | The displayable amount, nil when the account is not yet available. |
| `currencyFormattingContext` | Optional formatting context applied to the value. |
| `AlgoLocalCurrency` | `LocalCurrency` describing Algo with its name and symbol. |
| `id` | The `CurrencyID` of the currency. |
| `name` | Human-readable currency / asset name. |
| `symbol` | Currency symbol glyph. |
| `isFault` | True when the remote currency lacks a usable exchange value. |
| `algoValue` | Fiat value of one Algo, or Algo exchange value. |
| `usdValue` | Fiat value of one US dollar. |
| `lastUpdateDate` | Timestamp of the currency's last refresh. |
| `AppAuthChecker` | Protocol defining the app's authentication lifecycle. |
| `inactiveSessionExpirationDuration` | Default 60-second inactivity window before re-auth is required. |
| `AppAuthStatus` | Auth state enum: requiresAuthentication, requiresAuthorization, ready. |
| `AssetDetailCollection` | Atomic, asset-ID-keyed `Collection` of `AssetDecoration`s. |
| `AssetDetailCollectionIndex` | Comparable wrapper around the asset-detail collection's index. |
| `BlockchainBatchRequest` | Typealias mapping account address to `BlockchainAccountBatchRequest`. |
| `BlockchainAccountBatchRequest` | Per-account sets of pending opt-in / opt-out / send asset IDs. |
| `optInAssets` | Pending opt-in asset IDs in the batch request. |
| `optOutAssets` | Pending opt-out asset IDs in the batch request. |
| `sendPureCollectibleAssets` | Pending pure-collectible-send asset IDs in the batch request. |
| `BlockchainUpdatesMonitor` | Atomic registry of per-account pending blockchain updates. |
| `AccountAddress` | String typealias used as the monitor's account key. |
| `filterPendingOptInAssetUpdates` | Returns opt-in updates still in the pending state. |
| `filterOptedInAssetUpdates` | Returns opt-in updates past the pending state. |
| `filterOptedInAssetUpdatesForNotification` | Returns opt-in updates awaiting a user notification. |
| `hasAnyPendingOptInRequest` | True if the account has any pending opt-in request. |
| `hasPendingOptInRequest` | True if a specific asset has a pending opt-in request. |
| `startMonitoringOptInUpdates` | Registers a new pending opt-in update from a request. |
| `markOptInUpdatesForNotification` | Moves an opt-in update to waiting-for-notification. |
| `stopMonitoringOptInUpdates` | Marks an opt-in update completed. |
| `cancelMonitoringOptInUpdates` | Removes a tracked opt-in update for an asset. |
| `filterPendingOptOutAssetUpdates` | Returns opt-out updates still in the pending state. |
| `filterOptedOutAssetUpdates` | Returns opt-out updates past the pending state. |
| `filterOptedOutAssetUpdatesForNotification` | Returns opt-out updates awaiting a user notification. |
| `hasAnyPendingOptOutRequest` | True if the account has any pending opt-out request. |
| `hasPendingOptOutRequest` | True if a specific asset has a pending opt-out request. |
| `startMonitoringOptOutUpdates` | Registers a new pending opt-out update from a request. |
| `markOptOutUpdatesForNotification` | Moves an opt-out update to waiting-for-notification. |
| `stopMonitoringOptOutUpdates` | Marks an opt-out update completed. |
| `cancelMonitoringOptOutUpdates` | Removes a tracked opt-out update for an asset. |
| `filterPendingSendPureCollectibleAssetUpdates` | Returns pending pure-collectible-send updates. |
| `filterSentPureCollectibleAssetUpdates` | Returns pure-collectible-send updates past pending. |
| `filterSentPureCollectibleAssetUpdatesForNotification` | Returns sends awaiting a user notification. |
| `hasPendingSendPureCollectibleAssetRequest` | True if a specific asset has a pending send request. |
| `startMonitoringSendPureCollectibleAssetUpdates` | Registers a new pending collectible-send update. |
| `markSendPureCollectibleAssetUpdatesForNotification` | Moves a send update to waiting-for-notification. |
| `stopMonitoringSendPureCollectibleAssetUpdates` | Marks a collectible-send update completed. |
| `removeCompletedUpdates` | Prunes completed updates and drops empty per-account monitors. |
| `makeBatchRequest` | Builds a `BlockchainBatchRequest` from all pending updates. |
| `OptInBlockchainRequest` | Request describing an asset opt-in for an account. |
| `accountAddress` | Address of the account the request / update applies to. |
| `assetID` | Identifier of the asset involved. |
| `assetName` | Asset name, if known. |
| `assetUnitName` | Asset unit name, if known. |
| `assetVerificationTier` | Verification tier of the asset. |
| `isAssetDestroyed` | Whether the asset has been destroyed on chain. |
| `isCollectibleAsset` | Whether the asset is a collectible (NFT). |
| `collectibleAssetTitle` | Collectible title, if the asset is a collectible. |
| `collectibleAssetThumbnailImage` | Collectible thumbnail URL, if available. |
| `collectibleAssetCollectionName` | Collectible collection name, if available. |
| `OptInBlockchainUpdate` | Tracked opt-in update with status and notification message. |
| `notificationMessage` | Localized success message shown when the update confirms. |
| `OptOutBlockchainRequest` | Request describing an asset opt-out for an account. |
| `OptOutBlockchainUpdate` | Tracked opt-out update with status and notification message. |
| `SendPureCollectibleAssetBlockchainRequest` | Request describing a pure-collectible send. |
| `assetTitle` | Collectible title for a send request / update. |
| `assetThumbnailImage` | Collectible thumbnail URL for a send request / update. |
| `assetCollectionName` | Collectible collection name for a send request / update. |
| `SendPureCollectibleAssetBlockchainUpdate` | Tracked pure-collectible-send update with status. |
| `amountFormatter` | Formatter for collectible amounts in a collectible item. |
| `showForIncomingASA` | Whether the collectible item represents an incoming ASA. |
| `totalAmount` | Optional total collectible amount held. |
| `isExpired` | True when the cached currency value has expired and needs refresh. |
| `refresh` | Refreshes the preferred currency value from the API on a queue. |
| `setAsPrimaryCurrency` | Switches the preferred currency and triggers a refresh. |
| `addObserver` | Registers a currency-event observer, returning its UUID key. |
| `removeObserver` | Removes a previously registered observer. |
| `CurrencyExchanger` | Converts portfolios, assets, and amounts using a remote currency. |
| `exchange` | Converts a portfolio / asset / amount into the target currency value. |
| `exchangeAlgo` | Converts an Algo amount into the target currency value. |
| `exchangeFiat` | Converts a fiat amount into Algos. |
| `exchangeAlgoToUSD` | Converts an Algo amount into its USD value. |
| `CurrencyExchangeError` | Error thrown when the currency lacks a usable exchange value. |
| `CurrencyID` | Identifier encoding local / remote / pair currency values. |
| `isAlgo` | True when the currency identifier represents Algo. |
| `isUSD` | True when the currency identifier represents USD. |
| `cacheValue` | Serialized cache string for the currency identifier. |
| `localValue` | Local component of the currency identifier. |
| `remoteValue` | Remote (API) component of the currency identifier. |
| `pairValue` | Pairing component of the currency identifier. |
| `algo` | Factory building an Algo `CurrencyID` for an optional pair. |
| `fiat` | Factory building a fiat `CurrencyID` for an optional pair. |
| `CurrencyProvider` | Protocol exposing the primary / secondary currency values and refresh. |
| `fiatValue` | The currently resolved fiat-side `RemoteCurrencyValue`. |
| `calculateExpirationDate` | Returns the cache expiration date (start + 1 minute). |
| `CurrencyEvent` | Event emitted when the currency value updates. |
| `encode` | Encodes the fiat currency back into its transport API model. |
| `APIModel` | Codable transport model for a fiat currency. |
| `encodingStrategy` | JSON encoding strategy (snake_case keys). |
| `decodingStrategy` | JSON decoding strategy (snake_case keys). |
| `LocalCurrency` | Protocol describing a currency by id, name, and symbol. |
| `NameServiceAPIStatus` | Status enum for name-service lookups (idle, searching, finished). |
| `Portfolio` | Aggregated total Algo value and total USD value of assets. |
| `PortfolioValue` | Availability-aware wrapper around a `Portfolio`. |
| `unwrap` | Returns the wrapped value or throws the associated failure. |
| `PortfolioError` | Error type for portfolios with unavailable accounts. |
| `RemoteCurrency` | `LocalCurrency` extended with exchange values and update date. |
| `usdToAlgoValue` | Algo value corresponding to one US dollar. |
| `algoToUSDValue` | USD value corresponding to one Algo. |
| `RemoteCurrencyValue` | Result enum: available currency or a `CurrencyError`. |
| `CurrencyError` | Currency failure enum (network failure, corrupted data). |
| `observations` | Weak-observer registry of the shared data controller. |
| `assetDetailCollection` | The controller's shared asset-detail collection. |
| `currentInboxRequestCount` | Count of pending inbox (incoming) requests. |
| `selectedAccountSortingAlgorithm` | Currently selected account sorting algorithm. |
| `selectedCollectibleSortingAlgorithm` | Currently selected collectible sorting algorithm. |
| `selectedAccountAssetSortingAlgorithm` | Currently selected account-asset sorting algorithm. |
| `isPollingAvailable` | True when at least one local account exists to poll for. |
| `getTransactionParams` | Fetches current transaction params, optionally from cache. |
| `startPolling` | Starts the block-polling cycle. |
| `stopPolling` | Stops the block-polling cycle. |
| `resetPolling` | Stops then restarts polling from a clean state. |
| `resetPollingAfterRemoving` | Resets polling after an account is removed. |
| `resetPollingAfterPreferredCurrencyWasChanged` | Resets polling after the preferred currency changes. |
| `getPreferredOrderForNewAccount` | Returns the display order index for a newly added account. |
| `hasOptedIn` | Returns the opt-in status of an asset for an account. |
| `hasOptedOut` | Returns the opt-out status of an asset for an account. |
| `authAccount` | Returns the auth (rekey) account handle for an account, if any. |
| `add` | Registers a `SharedDataControllerObserver`. |
| `determineAccountAuthorization` | Resolves an account's `AccountAuthorization` kind. |
| `SharedDataController` | Protocol owning shared account / asset data and polling. |
| `sortedAccounts` | Returns account handles sorted by the selected / address order. |
| `sortedAccountsForDisplay` | Sorted accounts filtered for display (e.g. excluding joint accounts). |
| `SharedDataControllerObserver` | Observer notified of shared-data lifecycle events on the main thread. |
| `SharedDataControllerEvent` | Lifecycle event enum (idle, started running, finished running). |
| `OptInStatus` | Opt-in result enum (pending, optedIn, rejected). |
| `OptOutStatus` | Opt-out result enum (pending, optedOut, rejected). |

## Invariants

1. `AccountCollection` and `AssetDetailCollection` mutate their backing table only through the `@Atomic` wrapper, so concurrent access stays consistent.
2. An `AccountHandle.isAvailable` is true exactly when its `status` is `.ready`.
3. Polling only proceeds when `isPollingAvailable` is true (at least one local account exists).
4. A blockchain update progresses monotonically through `pending` -> `waitingForNotification` -> `completed`; `removeCompletedUpdates` only drops updates in the `completed` state.
5. `BlockchainUpdatesMonitor` keys all updates by account address and asset ID; an account with no tracked updates is removed from the registry.
6. A cached currency value is considered expired once `calculateExpirationDate` (last update + 1 minute) has passed.
7. `SharedDataControllerObserver`s are notified on the main thread.

## Behavioral Examples

### Scenario: Start a pending opt-in
- **Given** an account with no tracked updates
- **When** `startMonitoringOptInUpdates` is called with an `OptInBlockchainRequest`
- **Then** a pending `OptInBlockchainUpdate` keyed by the asset ID is registered and `hasPendingOptInRequest` returns true for that asset

### Scenario: Re-auth after inactivity
- **Given** a session with a passcode that called `resignActive` more than the inactive session expiration duration ago
- **When** `becomeActive` is called
- **Then** the status transitions back to `.requiresAuthorization`

### Scenario: Exchange a portfolio
- **Given** a `CurrencyExchanger` built from a remote currency that exposes both `algoValue` and `usdValue`
- **When** `exchange(_:)` is called with a `Portfolio`
- **Then** it returns the summed Algo and asset USD value converted into the target currency

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `CurrencyExchanger.exchange` called while the currency has no `usdValue` / `algoValue` | Throws `CurrencyExchangeError.currencyFailed` |
| `RemoteCurrencyValue.unwrap` on a `.failure` | Throws the wrapped `CurrencyError` |
| Currency refresh receives a fault / corrupted fiat currency | Stores `RemoteCurrencyValue.failure(.corrupted)` when no cached value exists |
| Currency refresh network call fails | Stores `RemoteCurrencyValue.failure(.networkFailed)` when no cached value exists |
| `PortfolioValue.unwrap` on a `.failure` | Throws `PortfolioError.unavailableAccountsFound` |
| `PortfolioValue` built from a mix of available and unavailable accounts | Resolves to `.partialFailure` (or `.failure` when all are unavailable) |

## Dependencies

| Module | Usage |
|--------|-------|
| Foundation | Core value types, `Date`, `Decimal`, `UUID`, dispatch queues |
| MacaroonUtils | `@Atomic` property wrapper and `Printable` for thread-safe collections |
| MagpieCore / MagpieHipo / MagpieExceptions | API client, endpoint operations, and `HIPNetworkError` modeling |
| SwiftDate | Date arithmetic for session expiration and currency cache expiry |
| Session | Authentication state, preferred currency, and private-key checks |
| ALGAPI | Fetches currency values and transaction params from the backend |
| Account / Asset / AssetDecoration / CollectibleAsset | Domain models the collections and requests wrap |
| FeatureFlagService | Gates joint-account behavior in sorting and authorization |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
