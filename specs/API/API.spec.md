---
module: API
version: 1
status: active
files:
  - PeraWalletCore/API/ALGAPI/ALGAPI+Account.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+Assets.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+Banners.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+Block.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+Cards.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+Charts.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+Currency.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+Device.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+Favorites.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+IncominASA.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+MoonPay.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+NameService.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+Notification.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+PriceAlert.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+Swap.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+Transaction.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI+WalletConnect.swift
  - PeraWalletCore/API/ALGAPI/ALGAPI.swift
  - PeraWalletCore/API/ALGAPI/Main/Base/ALGAPIBase.swift
  - PeraWalletCore/API/ALGAPI/Main/Interceptor/ALGAPIInterceptor.swift
  - PeraWalletCore/API/ALGAPI/Main/Keys/APIParamKey.swift
  - PeraWalletCore/API/ALGAPI/Main/Path/ALGAPIPath.swift
  - PeraWalletCore/API/Drafts/Account/AccountAssetFetchDraft.swift
  - PeraWalletCore/API/Drafts/Account/AccountFetchDraft.swift
  - PeraWalletCore/API/Drafts/Account/AccountNameFetchDraft.swift
  - PeraWalletCore/API/Drafts/Account/Asset/AssetFetchDraft.swift
  - PeraWalletCore/API/Drafts/Account/Asset/AssetInboxSendDraft.swift
  - PeraWalletCore/API/Drafts/Account/Asset/AssetSupportDraft.swift
  - PeraWalletCore/API/Drafts/Account/Round/WaitRoundDraft.swift
  - PeraWalletCore/API/Drafts/Account/Transaction/TransactionFetchDraft.swift
  - PeraWalletCore/API/Drafts/Account/Transaction/TransactionTrackDraft.swift
  - PeraWalletCore/API/Drafts/Account/Transaction/TransactionV2FetchDetailDraft.swift
  - PeraWalletCore/API/Drafts/Account/Transaction/TransactionV2FetchDraft.swift
  - PeraWalletCore/API/Drafts/Account/Transaction/TransactionViewModelDraft.swift
  - PeraWalletCore/API/Drafts/Announcement/AnnouncementFetchDraft.swift
  - PeraWalletCore/API/Drafts/Assets/AssetDetailFetchDraft.swift
  - PeraWalletCore/API/Drafts/Assets/AssetListFechDraft.swift
  - PeraWalletCore/API/Drafts/Assets/AssetToogleStatusDraft.swift
  - PeraWalletCore/API/Drafts/Cards/CardsCountryAvailabilityDraft.swift
  - PeraWalletCore/API/Drafts/Cards/CardsFundAddressesListDraft.swift
  - PeraWalletCore/API/Drafts/Charts/AddressWealthBalanceChartDataDraft.swift
  - PeraWalletCore/API/Drafts/Charts/AssetBalanceChartDataDraft.swift
  - PeraWalletCore/API/Drafts/Charts/AssetPriceChartDataDraft.swift
  - PeraWalletCore/API/Drafts/Charts/WalletWealthBalanceChartDataDraft.swift
  - PeraWalletCore/API/Drafts/Collectibles/SendCollectibleDraft.swift
  - PeraWalletCore/API/Drafts/Device/DeviceDeletionDraft.swift
  - PeraWalletCore/API/Drafts/Device/DeviceRegistrationDraft.swift
  - PeraWalletCore/API/Drafts/Device/DeviceUpdateDraft.swift
  - PeraWalletCore/API/Drafts/Device/NotificationFilter/NotificationFilterDraft.swift
  - PeraWalletCore/API/Drafts/Discover/SearchAssetsForDiscoverDraft.swift
  - PeraWalletCore/API/Drafts/MoonPay/MoonPaySignDraft.swift
  - PeraWalletCore/API/Drafts/Notifications/NotificationStatusFetchDraft.swift
  - PeraWalletCore/API/Drafts/Notifications/NotificationStatusUpdateDraft.swift
  - PeraWalletCore/API/Drafts/SDK/ARC59/ARC59ClaimAssetTransactionDraft.swift
  - PeraWalletCore/API/Drafts/SDK/ARC59/ARC59RejectAssetTransactionDraft.swift
  - PeraWalletCore/API/Drafts/SDK/ARC59/ARC59SendAssetTransactionDraft.swift
  - PeraWalletCore/API/Drafts/SDK/AlgosTransactionDraft.swift
  - PeraWalletCore/API/Drafts/SDK/AssetAdditionDraft.swift
  - PeraWalletCore/API/Drafts/SDK/AssetOptInAndSendTransactionDraft.swift
  - PeraWalletCore/API/Drafts/SDK/AssetRemovalDraft.swift
  - PeraWalletCore/API/Drafts/SDK/AssetTransactionsDraft.swift
  - PeraWalletCore/API/Drafts/SDK/KeyRegTransactionDraft.swift
  - PeraWalletCore/API/Drafts/SDK/RekeyTransactionDraft.swift
  - PeraWalletCore/API/Drafts/SDK/SDKTransactionSignerItem.swift
  - PeraWalletCore/API/Drafts/SDK/TransactionDraft.swift
  - PeraWalletCore/API/Drafts/Settings/Node/NodeTestDraft.swift
  - PeraWalletCore/API/Drafts/Swap/PeraSwapAmountDraft.swift
  - PeraWalletCore/API/Drafts/Swap/PeraSwapFeeDraft.swift
  - PeraWalletCore/API/Drafts/Swap/SwapQuoteDraft.swift
  - PeraWalletCore/API/Drafts/Swap/SwapTransactionPreparationDraft.swift
  - PeraWalletCore/API/Drafts/Swap/UpdateSwapQuoteDraft.swift
  - PeraWalletCore/API/Drafts/Transactions/ExportTransactionsDraft.swift
  - PeraWalletCore/API/Drafts/Transactions/SendTransactionDraft.swift
  - PeraWalletCore/API/Drafts/WalletConnect/WCSessionConnectionDraft.swift
  - PeraWalletCore/API/Drafts/WalletConnect/WCSessionDraft.swift
  - PeraWalletCore/API/Drafts/WalletConnect/WCTransactionType.swift
  - PeraWalletCore/API/Drafts/WalletConnect/WalletConnectRequestDraft.swift
  - PeraWalletCore/API/Query/Accounts/Assets/AssetFetchQuery.swift
  - PeraWalletCore/API/Query/Accounts/Assets/AssetSearchQuery.swift
  - PeraWalletCore/API/Query/Accounts/Assets/LimitQuery.swift
  - PeraWalletCore/API/Query/Accounts/Assets/TransactionSearchQuery.swift
  - PeraWalletCore/API/Query/Accounts/Rekey/RekeyedAccountQuery.swift
  - PeraWalletCore/API/Query/Accounts/Transaction/TransactionsQuery.swift
  - PeraWalletCore/API/Query/Accounts/Transaction/TransactionsV2Query.swift
  - PeraWalletCore/API/Query/IncomingASAsRequestDetailQuery.swift
  - PeraWalletCore/API/Query/IncomingASAsRequestsQuery.swift
  - PeraWalletCore/API/Query/NameService/NameServiceQuery.swift
  - PeraWalletCore/API/Query/Notifications/CursorQuery.swift
  - PeraWalletCore/API/Query/Swap/AvailablePoolAssetsQuery.swift
  - PeraWalletCore/API/Query/Swap/SwapHistoryQuery.swift
  - PeraWalletCore/API/Query/Swap/SwapStatusUpdateDraft.swift
  - PeraWalletCore/API/Query/Swap/SwapTopPairsQuery.swift
  - PeraWalletCore/API/Query/WalletConnect/ScammerControl/ScammerControlQuery.swift
db_tables: []
depends_on:
  - specs/Analytics/Analytics.spec.md
  - specs/Application/Application.spec.md
  - specs/Demo/Demo.spec.md
  - specs/Models/Models.spec.md
  - specs/Utils/Utils.spec.md
---

# API

## Purpose

Defines the network layer for Pera Wallet. `ALGAPI` is the central API client (built on Magpie/Alamofire) whose extensions expose typed endpoint calls for accounts, assets, transactions, swaps, notifications, charts, cards, banners, and WalletConnect against the Algorand node (algod), indexer, and Pera mobile backends. The module also owns the request `Draft`/`Query` value types that encode endpoint bodies and query parameters, the network/environment routing (`Network`, `ALGAPIBase`), and the `ALGAPIInterceptor` that injects headers and selects mainnet/testnet bases.

## Public API

| Export | Description |
|--------|-------------|
| `fetchAccount` | Fetches full account detail (with assets) from the indexer; can include closed accounts. |
| `fetchAccountFromNode` | Fetches account state directly from the algod node, excluding sub-collections. |
| `fetchRekeyedAccounts` | Lists accounts rekeyed to the given auth address via the indexer. |
| `fetchBackupDetail` | Retrieves cloud backup detail for a backup ID from the mobile backend. |
| `fetchAccountAssetFromNode` | Fetches a single account/asset holding from the algod node. |
| `fetchAccountFastLookup` | Performs a lightweight fast-lookup of an account address on the mobile backend. |
| `fetchAccountName` | Bulk-resolves display names for account addresses. |
| `searchAssets` | Searches the asset catalog on the mobile backend. |
| `searchAssetsForDiscover` | Searches assets for the Discover surface with a query/cursor draft. |
| `fetchAssetList` | Fetches metadata for a list of asset IDs via a POST body. |
| `fetchAssetDetail` | Fetches decoration/detail for a single asset from the mobile backend. |
| `fetchAssetDetailFromNode` | Fetches asset detail from algod and maps it into an `AssetDecoration`. |
| `sendAssetSupportRequest` | Submits an asset-support/listing request to the backend. |
| `getVerifiedAssets` | Retrieves the list of verified assets. |
| `getTrendingAssets` | Retrieves the list of trending assets for Discover. |
| `fetchSpotBannersList` | Fetches the device's spot banner list. |
| `updateSpotBannerClose` | Marks a spot banner as closed for the device. |
| `ChartDataPeriod` | Enum of chart time windows (one week/month/year) used by chart endpoints. |
| `title` | Localized display title for a `ChartDataPeriod`. |
| `hash` | Hashable conformance combining the raw value (`ChartDataPeriod`/`Network`). |
| `fetchAssetBalanceChartData` | Fetches per-asset balance history chart data for an account. |
| `fetchAddressWealthBalanceChartData` | Fetches wealth-balance chart data for a single address. |
| `fetchWalletWealthBalanceChartData` | Fetches aggregated wealth-balance chart data across multiple addresses. |
| `fetchAssetPriceChartData` | Fetches price-history chart data for an asset. |
| `getCurrencies` | Retrieves the list of supported fiat currencies. |
| `getCurrencyValue` | Retrieves conversion values for a specific currency. |
| `getAnnouncements` | Fetches in-app announcement banners for the device. |
| `tooggleFavoriteStatus` | Toggles an asset's favorite status for the device. |
| `fetchIncomingASAsRequest` | Fetches paged incoming ASA inbox requests for an address. |
| `getSignedMoonPayURL` | Requests a signed MoonPay buy/sell URL for the wallet. |
| `fetchNameServices` | Searches name-service (NFD-style) records by name. |
| `registerDevice` | Registers a device for push notifications. |
| `unregisterDevice` | Unregisters/deletes a device's push registration. |
| `updateDevice` | Updates a registered device's push token and account list. |
| `revokeDevice` | Revokes a device's notification association for an account. |
| `getNotifications` | Fetches the device's notification feed with cursor paging. |
| `updateNotificationFilter` | Updates per-account notification filter settings. |
| `fetchNotificationStatus` | Fetches the device's notification read/seen status. |
| `updateNotificationStatus` | Updates the last-seen notification status for the device. |
| `toogglePriceAlertStatus` | Toggles an asset's price-alert status for the device. |
| `getAvailablePoolAssets` | Fetches assets available for swapping in DEX pools. |
| `calculatePeraSwapFee` | Calculates the Pera swap fee (v1) for an amount. |
| `calculatePeraSwapV2Fee` | Calculates the Pera swap fee (v2) for an amount. |
| `calculateSwapAmount` | Calculates the resulting swap amount for given inputs. |
| `prepareSwapTransactions` | Prepares the unsigned transaction group for a swap quote. |
| `getSwapQuote` | Requests a swap quote (v1). |
| `getSwapV2Quote` | Requests a swap quote (v2). |
| `updateSwapQuote` | Updates a swap quote, typically with an exception/error reason. |
| `getProviders` | Fetches available swap providers. |
| `getSwapHistory` | Fetches paged swap history for an address. |
| `swapTopPairs` | Fetches the top swap trading pairs. |
| `updateSwapStatus` | Reports the final status of a submitted swap. |
| `fetchTransactions` | Fetches account transaction history (v1) with date/asset/limit filters. |
| `fetchTransactionsV2` | Fetches account transaction history (v2) with cursor paging. |
| `fetchTransactionDetailV2` | Fetches detail for a single transaction (v2). |
| `sendTransaction` | Broadcasts a signed transaction to the node. |
| `getTransactionParams` | Fetches current suggested transaction parameters from algod. |
| `trackTransaction` | Reports a submitted transaction to the backend for tracking. |
| `fetchPendingTransactions` | Fetches pending transactions for an account from algod. |
| `getPendingTransaction` | Fetches a single pending transaction by ID from algod. |
| `exportTransactions` | Requests an exported transaction history file for an account. |
| `fetchASASendInboxSummary` | Fetches the ASA inbox send-flow summary for an account/asset. |
| `date` | Shared UTC date formatter used for transaction date query parameters. |
| `checkWCScammerDomain` | Checks whether a WalletConnect dApp domain is flagged as a scammer. |
| `session` | The user `Session` backing the API client (auth user, device IDs). |
| `analytics` | The `ALGAnalytics` instance used for event reporting. |
| `_interceptor` | The concrete `ALGAPIInterceptor` driving header injection and base routing. |
| `network` | The currently selected `ALGAPI.Network` (mainnet/testnet). |
| `isTestNet` | Whether the client is currently pointed at testnet. |
| `deviceId` | The authenticated user's device ID for the current network, if any. |
| `setupNetworkBase` | Switches the client's base URL to the given network. |
| `Network` | Enum of supported networks (mainnet/testnet) with WalletConnect chain helpers. |
| `allowedChainIDs` | WalletConnect v1 chain IDs allowed for the network. |
| `allowedChainReference` | WalletConnect v2 chain reference allowed for the network. |
| `isMainnet` | Whether the network is mainnet. |
| `isTestnet` | Whether the network is testnet. |
| `init` | Initializer (e.g. `ALGAPI`, header, and draft/query value types). |
| `intercept` | Interceptor hook that injects headers on requests and inspects responses. |
| `APIKeyHeader` | Header supplying the Pera backend API key. |
| `key` | Header field name. |
| `value` | Header field value. |
| `ModificationHeader` | Header carrying app modification/build metadata. |
| `UserAgentHeader` | Header supplying the app's user-agent string. |
| `APIQueryParam` | Type alias for an object query parameter keyed by `APIParamKey`. |
| `APIBodyParam` | Type alias for a JSON body parameter keyed by `APIParamKey`. |
| `APIParamKey` | Coding-key enum mapping Swift fields to backend query/body parameter names. |
| `AccountAssetFetchDraft` | Draft identifying an account/asset holding to fetch. |
| `publicKey` | Account public key/address carried by the draft. |
| `assetID` | Asset identifier carried by the draft. |
| `AccountFetchDraft` | Draft wrapping an account public key for account fetches. |
| `AccountNameFetchDraft` | Body draft for bulk account-name resolution. |
| `bodyParams` | JSON body parameters encoded by a draft. |
| `AssetInboxSendDraft` | Draft identifying an account/asset for ASA inbox send summary. |
| `account` | Account address/model carried by the draft. |
| `AssetSupportDraft` | Body draft for an asset-support request (sender, receiver, asset). |
| `TransactionFetchDraft` | Draft of filters for v1 transaction history fetches. |
| `dates` | Optional from/to date range filter. |
| `nextToken` | Pagination token for the next page. |
| `assetId` | Asset filter identifier. |
| `limit` | Page-size limit. |
| `transactionType` | Optional transaction-type filter. |
| `TransactionTrackDraft` | Body draft carrying a transaction ID to track. |
| `transactionId` | Transaction identifier carried by the draft. |
| `TransactionV2FetchDetailDraft` | Draft identifying an account/transaction for v2 detail fetch. |
| `TransactionV2FetchDraft` | Draft of filters for v2 transaction history fetches. |
| `ordering` | Result ordering parameter. |
| `cursor` | Pagination cursor. |
| `TransactionViewModelDraft` | Draft bundling data needed to build a transaction view model. |
| `asset` | Associated asset for the draft/view model. |
| `transaction` | The transaction item carried by the draft. |
| `contact` | Optional matched contact for the counterparty. |
| `localAccounts` | Locally stored accounts used for resolution. |
| `localAssets` | Locally stored asset collection used for resolution. |
| `AnnouncementFetchDraft` | Draft wrapping a device ID for announcement fetches. |
| `AssetDetailFetchDraft` | Body draft identifying an asset (and device) for detail fetch. |
| `AssetListFechDraft` | Body draft listing asset IDs to fetch in bulk. |
| `AssetToogleStatusDraft` | Body draft toggling favorite/price-alert status for a device. |
| `SendCollectibleDraft` | Draft describing a collectible (NFT) send operation. |
| `fromAccount` | Sending account. |
| `collectibleAsset` | Collectible asset being sent. |
| `image` | Optional collectible image. |
| `toAccount` | Destination account. |
| `toContact` | Destination contact. |
| `toNameService` | Destination name-service record. |
| `fee` | Optional explicit transaction fee. |
| `isReceiverOptingInToCollectible` | Whether the receiver must opt in to the collectible. |
| `receiverAddress` | Resolved destination address from account/contact/name service. |
| `DeviceDeletionDraft` | Body draft for device unregistration (push token, platform). |
| `pushToken` | APNs push token. |
| `platform` | Device platform identifier (always `ios`). |
| `DeviceRegistrationDraft` | Body draft for device registration (token, app, accounts). |
| `app` | Target app variant. |
| `model` | Device model string. |
| `locale` | Device locale. |
| `accounts` | Account addresses associated with the device. |
| `DeviceUpdateDraft` | Body draft for updating an existing device registration. |
| `id` | Identifier (device ID / quote ID, depending on draft). |
| `NotificationFilterDraft` | Body draft for per-account notification filter settings. |
| `accountAddress` | Account address the filter applies to. |
| `receivesNotifications` | Whether the account receives notifications. |
| `SearchAssetsForDiscoverDraft` | Query draft for Discover asset search (query, cursor). |
| `query` | Free-text search string. |
| `queryParams` | Query parameters encoded by a query/draft. |
| `MoonPaySignDraft` | Body draft for a MoonPay URL signing request. |
| `walletAddress` | Wallet address for the MoonPay flow. |
| `redirectUrl` | Redirect URL for the MoonPay flow. |
| `NotificationStatusFetchDraft` | Draft wrapping a device ID for notification-status fetch. |
| `NotificationStatusUpdateDraft` | Body draft updating last-seen notification status. |
| `notificationId` | Last-seen notification identifier. |
| `ARC59ClaimAssetTransactionDraft` | Draft for an ARC-59 inbox asset-claim transaction. |
| `ARC59RejectAssetTransactionDraft` | Draft for an ARC-59 inbox asset-reject transaction. |
| `ARC59SendAssetTransactionDraft` | Draft for an ARC-59 inbox asset-send transaction. |
| `from` | Sending account for a transaction draft. |
| `transactionParams` | Suggested network transaction parameters. |
| `receiver` | Receiver address. |
| `appAddress` | ARC-59 inbox application address. |
| `inboxAccount` | ARC-59 inbox account address, if any. |
| `amount` | Transfer amount in base units. |
| `minBalance` | Minimum balance requirement. |
| `innerTransactionCount` | Number of inner transactions in the group. |
| `appID` | Application ID for the ARC-59 protocol. |
| `extraAlgoAmount` | Extra ALGO funding required. |
| `isOptedInToProtocol` | Whether the account is opted into the ARC-59 protocol. |
| `AlgosTransactionDraft` | Draft for a plain ALGO payment transaction. |
| `isMaxTransaction` | Whether the transaction sends the maximum spendable amount. |
| `note` | Optional transaction note data. |
| `AssetAdditionDraft` | Draft for an asset opt-in transaction. |
| `assetIndex` | Asset index for the transaction. |
| `AssetOptInAndSendTransactionDraft` | Draft combining receiver opt-in and asset send. |
| `AssetRemovalDraft` | Draft for an asset opt-out/removal transaction. |
| `assetCreatorAddress` | Creator address used as close-to target for asset removal. |
| `AssetTransactionDraft` | Draft for an asset transfer transaction. |
| `closeTo` | Optional close-to address for the transaction. |
| `KeyRegTransactionDraft` | Draft for a participation key-registration transaction. |
| `voteKey` | Participation vote key. |
| `selectionKey` | Participation selection key. |
| `stateProofKey` | Participation state-proof key. |
| `voteFirst` | First valid round for voting keys. |
| `voteLast` | Last valid round for voting keys. |
| `voteKeyDilution` | Vote key dilution factor. |
| `RekeyTransactionDraft` | Draft for a rekey transaction. |
| `rekeyedAccount` | Address the account is being rekeyed to. |
| `SDKTransactionSignerItem` | Pairing of a signer address with its signing data for the SDK. |
| `signer` | Signer address. |
| `data` | Associated raw data (signing data / signer data). |
| `PeraSwapAmountDraft` | Body draft for a Pera swap amount calculation. |
| `address` | Account/wallet address for the request. |
| `assetOut` | Output asset identifier. |
| `percentage` | Optional percentage of balance to swap. |
| `PeraSwapFeeDraft` | Body draft for a Pera swap fee calculation. |
| `SwapQuoteDraft` | Body draft requesting a swap quote (assets, amount, slippage). |
| `providers` | Optional list of swap providers to use. |
| `swapperAddress` | Address performing the swap. |
| `type` | Swap/transaction type discriminator. |
| `deviceID` | Device identifier for the request. |
| `assetInID` | Input asset identifier. |
| `assetOutID` | Output asset identifier. |
| `slippage` | Optional slippage tolerance. |
| `SwapTransactionPreparationDraft` | Body draft requesting prepared transactions for a swap quote. |
| `quoteID` | Swap quote identifier. |
| `UpdateSwapQuoteDraft` | Body draft updating a swap quote with an exception. |
| `exception` | Exception/error string reported for the quote. |
| `ExportTransactionsDraft` | Query draft for exporting transaction history. |
| `startDate` | Export range start date. |
| `endDate` | Export range end date. |
| `fileURL` | Local file URL for the exported transactions file. |
| `SendTransactionDraft` | Draft describing a user-initiated send (ALGO or asset). |
| `identifier` | Optional client-side identifier for the send. |
| `transactionMode` | Whether the send is ALGO or a specific asset. |
| `fractionCount` | Fraction/decimal count for the sent amount. |
| `lockedNote` | Locked (non-editable) note text. |
| `hasReceiver` | Whether a receiver has been resolved. |
| `isOptingOut` | Whether the send opts the sender out of the asset. |
| `isReceiverOptingInToAsset` | Whether the receiver must opt into the asset. |
| `TransactionMode` | Enum distinguishing ALGO sends from asset sends. |
| `WCSessionSupportedMethod` | Type alias for a WalletConnect supported method string. |
| `WCSessionSupportedEvent` | Type alias for a WalletConnect supported event string. |
| `WCSessionConnectionDraft` | Draft describing a WalletConnect session connection proposal. |
| `dappName` | Connecting dApp's display name. |
| `dappURL` | Connecting dApp's URL. |
| `isApproved` | Whether the session is approved. |
| `supportedMethods` | WalletConnect methods supported by the session. |
| `supportedEvents` | WalletConnect events supported by the session. |
| `requestedChains` | Networks/chains requested by the session. |
| `WalletConnectNamespaceKey` | Namespace constants for WalletConnect (e.g. `algorand`). |
| `algorand` | The `algorand` WalletConnect namespace key. |
| `WCSessionDraft` | Draft wrapping a WalletConnect v1 or v2 session. |
| `wcV1Session` | The wrapped WalletConnect v1 session, if any. |
| `wcV2Session` | The wrapped WalletConnect v2 session, if any. |
| `isWCv1Session` | Whether the draft holds a v1 session. |
| `isWCv2Session` | Whether the draft holds a v2 session. |
| `WCTransactionType` | Enum classifying a WalletConnect transaction request. |
| `AssetConfigType` | Sub-classification of asset-config transactions (create/delete/reconfig). |
| `WalletConnectRequestDraft` | Draft wrapping a WalletConnect v1 or v2 request. |
| `wcV1Request` | The wrapped WalletConnect v1 request, if any. |
| `wcV2Request` | The wrapped WalletConnect v2 request, if any. |
| `AssetFetchQuery` | Query for bulk asset metadata fetch by IDs. |
| `AssetSearchQuery` | Query for asset search (query, cursor, type). |
| `AccountQueryOptions` | Option set controlling which account sub-collections are returned. |
| `rawValue` | Backing raw value for an option set / enum. |
| `includeAll` | Option to include all account sub-collections. |
| `excludeAll` | Option to exclude all account sub-collections. |
| `createdAssets` | Option to include created assets. |
| `createdApps` | Option to include created applications. |
| `assets` | Option to include held assets. |
| `AccountQuery` | Query encoding account fetch options into request parameters. |
| `options` | The selected account query options. |
| `IncomingASAsRequestDetailQuery` | Query for paged incoming ASA request details. |
| `hasMore` | Whether more pages are available. |
| `NameServiceQuery` | Query for name-service search by name. |
| `name` | Name search term / identifier. |
| `CursorQuery` | Generic cursor-based pagination query. |
| `AvailablePoolAssetsQuery` | Query for available swap pool assets. |
| `SwapHistoryQuery` | Query for paged swap history by address. |
| `statuses` | Comma-joined status filter for swap history. |
| `SwapStatus` | Enum of swap lifecycle statuses (pending/in-progress/completed/failed). |
| `SwapStatusUpdateError` | Enum of swap failure reasons reported to the backend. |
| `SwapStatusUpdateDraft` | Body draft reporting a swap's final status. |
| `swapId` | Swap identifier. |
| `swapVersion` | Swap API version. |
| `status` | Reported swap status. |
| `submittedTransactionIds` | IDs of transactions submitted for the swap. |
| `reason` | Failure reason for the swap, if any. |
| `appVersion` | App version reported with the swap status. |
| `countryCode` | Country code reported with the swap status. |
| `SwapTopPairsQuery` | Query for the top swap pairs list with an optional limit. |

## Invariants

1. All endpoint base URLs are resolved through the current `ALGAPI.Network` (mainnet/testnet); switching networks via `setupNetworkBase` re-routes every subsequent request.
2. Each backend tier (algod, indexer, mobileV1, mobileV2) is selected per-endpoint and never mixed for a single call.
3. `_interceptor` always injects the API key, modification, and user-agent headers before a request is dispatched.
4. Endpoint methods return an `EndpointOperatable` so callers can cancel in-flight requests; results are delivered via the supplied completion handler, never thrown synchronously.
5. `Draft`/`Query` value types only encode request parameters and never perform I/O.
6. `deviceId` is derived from the authenticated user for the active network and is `nil` when no user is authenticated.

## Behavioral Examples

### Scenario: Fetch account detail with assets
- **Given** an `AccountFetchDraft` holding a valid public key
- **When** `fetchAccount` is called against the indexer base
- **Then** an `AccountApiResponse` is delivered to the completion handler with the account's asset holdings.

### Scenario: Switch to testnet
- **Given** the client is configured for mainnet
- **When** `setupNetworkBase(.testnet)` is called
- **Then** `network` reports `.testnet`, `isTestNet` is `true`, and later endpoints target testnet bases.

### Scenario: Report a failed swap
- **Given** a `SwapStatusUpdateDraft` with `status == .failed` and a `reason`
- **When** `updateSwapStatus` is called
- **Then** the failure reason and submitted transaction IDs are posted to the swap-update endpoint.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Network/transport failure | Completion handler receives `Response.Result/.ModelResult` `.failure` with the underlying API error. |
| Backend returns a HIP error payload | Failure is surfaced as a typed `HIPAPIError` alongside the raw API model. |
| Request cancelled while `ignoreResponseOnCancelled` is true | The response is dropped and the handler is not invoked. |
| Unknown WalletConnect chain reference | `WCSessionConnectionDraft` failable initializer returns `nil`. |
| No authenticated user | `deviceId` evaluates to `nil`, and device-scoped endpoints must supply an explicit ID. |

## Dependencies

| Module | Usage |
|--------|-------|
| MagpieCore | Endpoint building, request dispatch, and `Response` result types. |
| MagpieAlamofire | Alamofire-backed networking transport for the API client. |
| MagpieHipo / MagpieExceptions | Typed HIP API error decoding (`HIPAPIError`). |
| MacaroonApplication / MacaroonUtils | App environment, session, and utility helpers. |
| Session | Authenticated user and device-ID resolution for requests. |
| ALGAnalytics | Analytics event reporting passed to the client. |
| AppEnvironment | Provides the server API base URL and build configuration. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
