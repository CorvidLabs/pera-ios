---
module: Models
version: 1
status: active
files:
  - PeraWalletCore/Models/ALGAPIModel.swift
  - PeraWalletCore/Models/ALGEntityModel.swift
  - PeraWalletCore/Models/Accounts/Account/AccountInformation.swift
  - PeraWalletCore/Models/Accounts/Account/LedgerDetail.swift
  - PeraWalletCore/Models/Accounts/Account/Rekey/RekeyedAccountsResponse.swift
  - PeraWalletCore/Models/Accounts/Account/Response/Account+FastLookup.swift
  - PeraWalletCore/Models/Accounts/Account/Response/Account+Helpers.swift
  - PeraWalletCore/Models/Accounts/Account/Response/Account+Name.swift
  - PeraWalletCore/Models/Accounts/Account/Response/Account+Signature.swift
  - PeraWalletCore/Models/Accounts/Account/Response/Account.swift
  - PeraWalletCore/Models/Accounts/Account/Response/AccountResponse.swift
  - PeraWalletCore/Models/Accounts/Account/Response/AccountStatus.swift
  - PeraWalletCore/Models/Accounts/Account/Response/Application/AlgorandApplication.swift
  - PeraWalletCore/Models/Accounts/Account/Response/Application/ApplicationLocalState.swift
  - PeraWalletCore/Models/Accounts/Account/Response/Application/ApplicationStateSchema.swift
  - PeraWalletCore/Models/Accounts/Algos/AlgoPriceHistory.swift
  - PeraWalletCore/Models/Accounts/Algos/AlgoUSDPrice.swift
  - PeraWalletCore/Models/Accounts/Asset/ALGAsset.swift
  - PeraWalletCore/Models/Accounts/Asset/Algo.swift
  - PeraWalletCore/Models/Accounts/Asset/Asset.swift
  - PeraWalletCore/Models/Accounts/Asset/AssetDetail.swift
  - PeraWalletCore/Models/Accounts/Asset/AssetToogleStatus.swift
  - PeraWalletCore/Models/Accounts/Asset/AssetType.swift
  - PeraWalletCore/Models/Accounts/Asset/AssetVerificationTier.swift
  - PeraWalletCore/Models/Accounts/Asset/Collectibles/Collectible.swift
  - PeraWalletCore/Models/Accounts/Asset/Collectibles/CollectibleAsset.swift
  - PeraWalletCore/Models/Accounts/Asset/Collectibles/CollectibleCollection.swift
  - PeraWalletCore/Models/Accounts/Asset/Collectibles/CollectibleExternalSource.swift
  - PeraWalletCore/Models/Accounts/Asset/Collectibles/CollectibleTrait.swift
  - PeraWalletCore/Models/Accounts/Asset/Collectibles/Media.swift
  - PeraWalletCore/Models/Accounts/Asset/Draft/AssetAlertDraft.swift
  - PeraWalletCore/Models/Accounts/Asset/Inbox/AssetInboxSendSummary.swift
  - PeraWalletCore/Models/Accounts/Asset/Inbox/AssetInboxSendSummaryWarningMessage.swift
  - PeraWalletCore/Models/Accounts/Asset/List/AccountAssetInformation.swift
  - PeraWalletCore/Models/Accounts/Asset/List/AssetCreator.swift
  - PeraWalletCore/Models/Accounts/Asset/List/AssetDecoration.swift
  - PeraWalletCore/Models/Accounts/Asset/StandardAsset.swift
  - PeraWalletCore/Models/Accounts/Asset/Verified/VerifiedAsset.swift
  - PeraWalletCore/Models/Accounts/Asset/Verified/VerifiedAssetList.swift
  - PeraWalletCore/Models/Accounts/Details/Participation.swift
  - PeraWalletCore/Models/Accounts/HDWallet/HDWalletAddress.swift
  - PeraWalletCore/Models/Accounts/HDWallet/HDWalletAddressDetail.swift
  - PeraWalletCore/Models/Accounts/HDWallet/HDWalletSeed.swift
  - PeraWalletCore/Models/Accounts/Transaction/Details/AppCall/AppCallTransaction.swift
  - PeraWalletCore/Models/Accounts/Transaction/Details/Asset/AssetConfigTransactionType.swift
  - PeraWalletCore/Models/Accounts/Transaction/Details/Asset/AssetFreezeTransactionType.swift
  - PeraWalletCore/Models/Accounts/Transaction/Details/Asset/AssetTransferTransactionType.swift
  - PeraWalletCore/Models/Accounts/Transaction/Details/Asset/KeyRegTransaction.swift
  - PeraWalletCore/Models/Accounts/Transaction/Details/Payment.swift
  - PeraWalletCore/Models/Accounts/Transaction/Details/TransactionID.swift
  - PeraWalletCore/Models/Accounts/Transaction/Details/TransactionParams.swift
  - PeraWalletCore/Models/Accounts/Transaction/List/TransactionList.swift
  - PeraWalletCore/Models/Accounts/Transaction/List/TransactionListV2.swift
  - PeraWalletCore/Models/Accounts/Transaction/Models/SDKTransaction.swift
  - PeraWalletCore/Models/Accounts/Transaction/Models/Transaction.swift
  - PeraWalletCore/Models/Accounts/Transaction/Models/TransactionItem.swift
  - PeraWalletCore/Models/Accounts/Transaction/Models/TransactionSignature.swift
  - PeraWalletCore/Models/Accounts/Transaction/Models/TransactionType.swift
  - PeraWalletCore/Models/Accounts/Transaction/Models/TransactionV2.swift
  - PeraWalletCore/Models/Accounts/Transaction/Pending/PendingTransactionList.swift
  - PeraWalletCore/Models/Accounts/Transaction/Pending/PendingTransactions.swift
  - PeraWalletCore/Models/Accounts/Transaction/Round/RoundDetail.swift
  - PeraWalletCore/Models/Accounts/Transaction/Send/AlgosTransactionSendDraft.swift
  - PeraWalletCore/Models/Accounts/Transaction/Send/AssetTransactionARC59SendDraft.swift
  - PeraWalletCore/Models/Accounts/Transaction/Send/AssetTransactionSendDraft.swift
  - PeraWalletCore/Models/Accounts/Transaction/Send/KeyRegTransactionSendDraft.swift
  - PeraWalletCore/Models/Accounts/Transaction/Send/TransactionSendDraft.swift
  - PeraWalletCore/Models/Application/ApplicationConfiguration.swift
  - PeraWalletCore/Models/Application/User/User.swift
  - PeraWalletCore/Models/Banner/Announcement.swift
  - PeraWalletCore/Models/Banner/SpotBannerListItem.swift
  - PeraWalletCore/Models/BuyAlgo/MoonPaySignedResponse.swift
  - PeraWalletCore/Models/Cards/CardsCountryAvailability.swift
  - PeraWalletCore/Models/Cards/CardsFundAddressesList.swift
  - PeraWalletCore/Models/Charts/AssetChartDataDTO.swift
  - PeraWalletCore/Models/Charts/AssetPriceChartDataDTO.swift
  - PeraWalletCore/Models/Charts/ChartDataDTO.swift
  - PeraWalletCore/Models/Charts/HomeChartDataDTO.swift
  - PeraWalletCore/Models/Contacts/Contact.swift
  - PeraWalletCore/Models/Contacts/QR/CoinbaseQR.swift
  - PeraWalletCore/Models/Contacts/QR/QRText.swift
  - PeraWalletCore/Models/Core/CSVFile.swift
  - PeraWalletCore/Models/Core/PaginatedList.swift
  - PeraWalletCore/Models/Core/QR/QRCreationDraft.swift
  - PeraWalletCore/Models/Core/QR/QRSendTransactionDraft.swift
  - PeraWalletCore/Models/Core/TitledInformation.swift
  - PeraWalletCore/Models/Error/AlgorandError.swift
  - PeraWalletCore/Models/Error/IndexerError.swift
  - PeraWalletCore/Models/IncomingASA/Detail/IncomingASAsRequestDetail.swift
  - PeraWalletCore/Models/IncomingASA/Detail/IncomingASAsRequestDetailList.swift
  - PeraWalletCore/Models/IncomingASA/List/IncomingASAsRequestList.swift
  - PeraWalletCore/Models/IncomingASA/List/IncomingASAsRequestsResult.swift
  - PeraWalletCore/Models/Ledger/Rekey/RekeyTransactionSendDraft.swift
  - PeraWalletCore/Models/Ledger/Troubleshoot/LedgerTroubleshootOption.swift
  - PeraWalletCore/Models/NameService/NameServiceAPIModel.swift
  - PeraWalletCore/Models/Node/AlgorandNode.swift
  - PeraWalletCore/Models/Node/Node.swift
  - PeraWalletCore/Models/Notification/AlgorandNotification.swift
  - PeraWalletCore/Models/Notification/AlgorandNotificationDetail.swift
  - PeraWalletCore/Models/Notification/Device.swift
  - PeraWalletCore/Models/Notification/Filter/NotificationFilterResponse.swift
  - PeraWalletCore/Models/Notification/LastSeenNotificationStatus.swift
  - PeraWalletCore/Models/Notification/NotificationMessage.swift
  - PeraWalletCore/Models/Notification/NotificationStatus.swift
  - PeraWalletCore/Models/Passkey/PassKey.swift
  - PeraWalletCore/Models/RecoveredAddress.swift
  - PeraWalletCore/Models/Settings/DeveloperSettings.swift
  - PeraWalletCore/Models/Settings/SecretDeveloperSettings.swift
  - PeraWalletCore/Models/Settings/SecuritySettings.swift
  - PeraWalletCore/Models/Settings/Settings.swift
  - PeraWalletCore/Models/Swap/ParsedSwapTransaction.swift
  - PeraWalletCore/Models/Swap/PeraSwapAmount.swift
  - PeraWalletCore/Models/Swap/PeraSwapFee.swift
  - PeraWalletCore/Models/Swap/PeraSwapV2Fee.swift
  - PeraWalletCore/Models/Swap/SwapAsset.swift
  - PeraWalletCore/Models/Swap/SwapHistory.swift
  - PeraWalletCore/Models/Swap/SwapHistoryList.swift
  - PeraWalletCore/Models/Swap/SwapProvider.swift
  - PeraWalletCore/Models/Swap/SwapProviderV2.swift
  - PeraWalletCore/Models/Swap/SwapProviderV2List.swift
  - PeraWalletCore/Models/Swap/SwapQuote.swift
  - PeraWalletCore/Models/Swap/SwapQuoteList.swift
  - PeraWalletCore/Models/Swap/SwapTopPair.swift
  - PeraWalletCore/Models/Swap/SwapTopPairsList.swift
  - PeraWalletCore/Models/Swap/SwapTransactionGroup.swift
  - PeraWalletCore/Models/Swap/SwapTransactionPreparation.swift
  - PeraWalletCore/Models/Swap/SwapTransactionPurpose.swift
  - PeraWalletCore/Models/Swap/SwapType.swift
  - PeraWalletCore/Models/WalletConnect/ScammerControl/ScammerControlResult.swift
  - PeraWalletCore/Models/WalletConnect/Session/WCPeerMeta.swift
  - PeraWalletCore/Models/WalletConnect/Session/WCSession.swift
  - PeraWalletCore/Models/WalletConnect/Session/WCSessionHistory.swift
  - PeraWalletCore/Models/WalletConnect/Session/WCSessionList.swift
  - PeraWalletCore/Models/WalletConnect/Session/WCURLMeta.swift
  - PeraWalletCore/Models/WalletConnect/Session/WCWalletMeta.swift
  - PeraWalletCore/Models/WalletConnect/Session/WCv2SessionList.swift
  - PeraWalletCore/Models/WalletConnect/Transaction/Response/Error/WCTransactionErrorResponse.swift
  - PeraWalletCore/Models/WalletConnect/Transaction/WCArbitraryData.swift
  - PeraWalletCore/Models/WalletConnect/Transaction/WCAssetConfigParameters.swift
  - PeraWalletCore/Models/WalletConnect/Transaction/WCMultisigMetadata.swift
  - PeraWalletCore/Models/WalletConnect/Transaction/WCTransaction.swift
  - PeraWalletCore/Models/WalletConnect/Transaction/WCTransactionDetail.swift
  - PeraWalletCore/Models/WalletConnect/Transaction/WCTransactionOption.swift
  - PeraWalletCore/Models/WalletConnect/Transaction/WCTransactionRequestedSigner.swift
  - PeraWalletCore/Models/Web/Backup.swift
db_tables: []
depends_on:
  - specs/Algorithms/Algorithms.spec.md
  - specs/API/API.spec.md
  - specs/Application/Application.spec.md
  - specs/Data/Data.spec.md
  - specs/Demo/Demo.spec.md
  - specs/Utils/Utils.spec.md
---

# Models

## Purpose

Defines the domain data layer for Pera Wallet: the Swift value/entity types representing Algorand accounts, assets, collectibles, transactions, swaps, WalletConnect sessions and requests, contacts, notifications, settings, and supporting drafts. Most types are `ALGEntityModel`/`ALGAPIModel` pairs that bridge between API JSON payloads (`APIModel`) and rich app-facing domain models, plus computed helpers used across the app for display, balance/min-balance math, rekey/authorization state, and transaction classification. The module owns serialization (Codable/Magpie encode-decode) and pure derived properties; it performs no networking or persistence itself.

## Public API

| Export | Description |
|--------|-------------|
| `ALGAPIModel` | Protocol marking an API DTO with a no-arg init and Pera's shared JSON encode/decode strategies. |
| `encodingStrategy` | Shared JSON encoding strategy (default keys, fullNumeric date, base64 data) for API models. |
| `decodingStrategy` | Shared JSON decoding strategy matching `encodingStrategy`. |
| `ALGEntityModel` | Protocol for domain entities whose `APIModel` conforms to `ALGAPIModel`. |
| `PublicKey` | Type alias for an Algorand address represented as a `String`. |
| `RekeyDetail` | Type alias mapping a rekeyed auth address to its `LedgerDetail`. |
| `address` | The account/asset/entity Algorand address or identifier string. |
| `name` | The display or stored name of the entity. |
| `ledgerDetail` | Ledger device pairing detail for a hardware-backed account. |
| `receivesNotification` | Whether the account is subscribed to push notifications. |
| `rekeyDetail` | Map of rekey auth addresses to their ledger details. |
| `preferredOrder` | User-defined sort order for the account (defaults to invalid/-1). |
| `isBackedUp` | Whether the account's recovery material has been backed up. |
| `hdWalletAddressDetail` | HD wallet derivation detail for the account, if HD-derived. |
| `jointAccountParticipants` | Participant addresses of a joint (multisig-style) account. |
| `jointAccountThreshold` | Signature threshold required for a joint account. |
| `jointAccountVersion` | Version identifier of the joint account scheme. |
| `nfDomain` | Cached NFDomain (.algo name service) name for the account. |
| `isWatchAccount` | Whether the account is watch-only; setter switches the account type. |
| `updateName` | Mutates the stored account name. |
| `addRekeyDetail` | Records a ledger/rekey detail keyed by an auth address. |
| `AccountType` | Codable enum of stored account kinds (standard, watch, ledger, joint, rekeyed). |
| `hash` | Hashes the value into the given hasher. |
| `CodingKeys` | Codable key mapping for the enclosing type. |
| `init` | Initializer for the enclosing type. |
| `id` | The unique identifier of the entity (asset id, message id, record id, etc.). |
| `indexInLedger` | The account's derivation index on its Ledger device. |
| `accounts` | Collection of accounts returned in a response or wallet. |
| `currentRound` | Algorand ledger round at which the response was produced. |
| `nextToken` | Pagination cursor for the next page of results. |
| `encode` | Converts the entity into its API DTO (or Codable encoding). |
| `APIModel` | Nested API DTO type used for JSON (de)serialization of the entity. |
| `algoValue` | Account/asset value expressed in ALGO. |
| `usdValue` | Account/asset value expressed in USD. |
| `calculationType` | Strategy label describing how a fast-lookup value was computed. |
| `accountExists` | Whether the looked-up account exists on chain. |
| `isSameAccount` | Whether another account or address refers to the same account. |
| `hasParticipationKey` | Whether the account has registered participation keys. |
| `hasAnyAssets` | Whether the account holds any opted-in assets. |
| `hasDifferentAssets` | Whether the account's assets differ from another account's. |
| `hasDifferentApps` | Whether the account's apps differ from another account's. |
| `hasDifferentMinBalance` | Whether minimum-balance-affecting state has changed. |
| `isCreated` | Whether the account has been created on chain. |
| `signerAddress` | Address that must sign on behalf of the account (auth or self). |
| `isRekeyedToSelf` | Whether the account is rekeyed back to its own address. |
| `hasAuthAccount` | Whether the account has a distinct auth (rekey) address. |
| `hasLedgerDetail` | Whether the account has associated ledger pairing detail. |
| `hasJointAccountDetails` | Whether joint-account participant data is present. |
| `requiresLedgerConnection` | Whether signing requires a connected Ledger device. |
| `currentLedgerDetail` | Effective ledger detail for the current auth address. |
| `calculateMinBalance` | Computes the account's minimum required ALGO balance. |
| `isOptedIn` | Whether the account is opted in to a given asset id. |
| `isOwner` | Whether the account owns (holds a positive balance of) an asset. |
| `isCreator` | Whether the account is the creator of an asset. |
| `typeTitle` | Localized title describing the account's authorization type. |
| `underlyingTypeImage` | Image representing the underlying account type. |
| `rawTypeImage` | Raw image asset name for the account type badge. |
| `typeImage` | UIImage badge for the account type. |
| `results` | Array of items contained in a list/paginated response. |
| `nameResult` | Resolved name-service lookup result for an address. |
| `source` | Origin/provider of the resolved name or media. |
| `image` | Image URL or asset associated with the entity. |
| `SignatureType` | Account signature scheme enum (sig, msig, lsig). |
| `StandardAssetIndexer` | Type alias mapping asset id to index in the standard-asset array. |
| `CollectibleAssetIndexer` | Type alias mapping asset id to index in the collectible-asset array. |
| `authorization` | The account's computed `AccountAuthorization` state. |
| `canSignTransaction` | Whether the account can locally sign transactions. |
| `primaryDisplayName` | Primary human-readable account name for UI. |
| `secondaryDisplayName` | Secondary account name (e.g. short address) for UI. |
| `isHDAccount` | Whether the account was derived from an HD wallet. |
| `isJointAccount` | Whether the account is a joint account. |
| `hasBalance` | Whether the account has a non-zero ALGO balance. |
| `authType` | String describing the account's authentication/auth type. |
| `allAssets` | Combined list of the account's standard and collectible assets. |
| `setAlgo` | Sets the account's ALGO holding model. |
| `setStandardAssets` | Replaces the account's standard assets and rebuilds the index. |
| `setCollectibleAssets` | Replaces the account's collectible assets and rebuilds the index. |
| `append` | Appends standard or collectible assets to the account. |
| `removeAllAssets` | Clears all assets and their indexes from the account. |
| `containsStandardAsset` | Whether the account holds a given standard asset id. |
| `containsCollectibleAsset` | Whether the account holds a given collectible asset id. |
| `containsAsset` | Whether the account holds a given asset id of either kind. |
| `sorted` | Returns the assets in sorted order. |
| `usdc` | Convenience reference to the USDC asset. |
| `usdt` | Convenience reference to the USDT asset. |
| `update` | Updates a model's mutable fields from another instance. |
| `AccountAuthorization` | Enum modeling the account's authorization/rekey state. |
| `rawValue` | Raw backing value of the enum case. |
| `isStandard` | Whether the authorization is a plain standard account. |
| `isLedger` | Whether the authorization is a Ledger-backed account. |
| `isWatch` | Whether the authorization is watch-only. |
| `isNoAuthInLocal` | Whether private signing data is missing locally and not rekeyed. |
| `isUnknown` | Whether the authorization state is indeterminate. |
| `isStandardToLedgerRekeyed` | Standard account rekeyed to a Ledger auth address. |
| `isStandardToStandardRekeyed` | Standard account rekeyed to another standard address. |
| `isStandardToNoAuthInLocalRekeyed` | Standard account rekeyed to an address absent locally. |
| `isLedgerToLedgerRekeyed` | Ledger account rekeyed to another Ledger address. |
| `isLedgerToStandardRekeyed` | Ledger account rekeyed to a standard address. |
| `isLedgerToNoAuthInLocalRekeyed` | Ledger account rekeyed to an address absent locally. |
| `isUnknownToLedgerRekeyed` | Unknown-origin account rekeyed to a Ledger address. |
| `isUnknownToStandardRekeyed` | Unknown-origin account rekeyed to a standard address. |
| `isUnknownToNoAuthInLocalRekeyed` | Unknown-origin account rekeyed to an address absent locally. |
| `isJointAccountRekeyed` | Whether the joint account has been rekeyed. |
| `isNoAuth` | Whether signing data is missing or rekeyed to a non-local account. |
| `isAuthorized` | Whether the account can authorize/sign in its current state. |
| `isRekeyed` | Whether the account is rekeyed to a different auth address. |
| `isRekeyedToLedger` | Whether the account is rekeyed to a Ledger auth address. |
| `isRekeyedToStandard` | Whether the account is rekeyed to a standard auth address. |
| `isRekeyedToNoAuthInLocal` | Whether the account is rekeyed to a locally-absent address. |
| `supportLink` | Support/help URL associated with the model. |
| `account` | The associated `Account` (or account handle) for the entity. |
| `AccountStatus` | Enum of on-chain account participation status (Offline/Online/NotParticipating). |
| `intValue` | Integer value of the schema/state field. |
| `byteSliceCount` | Count of byte-slice slots in an application state schema. |
| `creator` | Address (or model) of the asset's creator. |
| `amount` | Raw integer amount/balance of the asset or transaction. |
| `isFrozen` | Whether the asset holding is frozen. |
| `isFavorited` | Whether the user favorited the asset. |
| `isPriceAlertEnabled` | Whether a price alert is enabled for the asset. |
| `optedInAtRound` | Ledger round at which the account opted into the asset. |
| `category` | Asset category classifier code. |
| `usdcAssetID` | Returns the USDC asset id for a given network. |
| `isDestroyed` | Whether the asset has been destroyed on chain. |
| `decimals` | Number of decimal places for the asset. |
| `decimalAmount` | Asset amount scaled by its decimals. |
| `total` | Total raw supply of the asset. |
| `totalSupply` | Total supply of the asset scaled by decimals. |
| `totalUSDValue` | Total USD value of the holding. |
| `state` | Asset management state (ready or pending add/remove). |
| `url` | URL associated with the asset or entity. |
| `verificationTier` | The asset's verification tier (trusted/verified/unverified/suspicious). |
| `projectURL` | Project/website URL for the asset. |
| `explorerURL` | Block-explorer URL for the asset. |
| `logoURL` | Logo image URL for the asset. |
| `description` | Free-text description of the asset/entity. |
| `discordURL` | Discord community URL for the asset. |
| `telegramURL` | Telegram community URL for the asset. |
| `twitterURL` | Twitter/X URL for the asset. |
| `algoPriceChangePercentage` | Percentage change of the ALGO price for the asset context. |
| `isAvailableOnDiscover` | Whether the asset is surfaced in the Discover section. |
| `naming` | `AssetNaming` value holding the asset's name/unit-name display logic. |
| `amountWithFraction` | Asset amount including its fractional (decimal) part. |
| `isAlgo` | Whether the asset is native ALGO. |
| `isUSDC` | Whether the asset is USDC for the given network. |
| `isFault` | Whether the asset model is a placeholder/fault (failed to fully load). |
| `updateStatus` | Updates the asset's favorite and price-alert flags. |
| `Asset` | Protocol defining the common surface for all asset types. |
| `isEmpty` | Whether the asset's fractional amount is zero. |
| `AssetState` | Enum of asset operation state (ready or pending). |
| `isPending` | Whether the asset is in a pending add/remove operation. |
| `AssetOperation` | Enum of pending asset operations (add/remove). |
| `AssetNaming` | Value type computing primary/secondary display names from name and unit name. |
| `unitName` | The asset's unit (ticker) name. |
| `displayNames` | Tuple of primary and optional secondary display names. |
| `hasOnlyAssetName` | Whether only the asset name (no unit name) is present. |
| `hasOnlyUnitName` | Whether only the unit name (no asset name) is present. |
| `hasBothDisplayName` | Whether both asset name and unit name are present. |
| `hasDisplayName` | Whether any display name is present. |
| `isEnabled` | Whether the toggle/asset status is enabled. |
| `AssetType` | Enum distinguishing standard assets from collectibles. |
| `AssetVerificationTier` | Enum of asset verification tiers from the asset registry. |
| `isTrusted` | Whether the asset is in the trusted tier. |
| `isVerified` | Whether the asset is in the verified tier. |
| `isUnverified` | Whether the asset is unverified. |
| `isSuspicious` | Whether the asset is flagged as suspicious. |
| `standard` | The collectible/asset standard (e.g. ARC token standard). |
| `mediaType` | Media kind of the collectible (image, video, audio, etc.). |
| `thumbnailImage` | Thumbnail image URL for the collectible. |
| `title` | Display title of the collectible/entity. |
| `collection` | Collection the collectible belongs to. |
| `media` | Array of media items for the collectible. |
| `properties` | Trait/property list of the collectible. |
| `MediaType` | Enum of supported collectible media types. |
| `allCases` | All cases of the enum. |
| `isSupported` | Whether the media type/value is supported by the app. |
| `CollectibleStandard` | Enum of supported collectible token standards. |
| `MediaExtension` | Enum of media file extensions for collectibles. |
| `optedInAddress` | Address that opted into the collectible asset. |
| `isOwned` | Whether the collectible is owned (held with positive amount). |
| `containsUnsupportedMedia` | Whether any of the collectible's media is unsupported. |
| `isPure` | Whether the collectible is a pure NFT (total supply of 1, zero decimals). |
| `CollectibleExternalSource` | Protocol for external explorer sources of a collectible. |
| `PeraExplorerExternalSource` | Pera Explorer external source link for an asset or address. |
| `displayName` | Human-readable name/label for display. |
| `displayValue` | Human-readable value for display. |
| `type` | Type discriminator of the media/transaction/entity. |
| `previewURL` | Preview media URL. |
| `downloadURL` | Full-resolution download media URL. |
| `mediaExtension` | File extension of the media item. |
| `isGIF` | Whether the media item is a GIF. |
| `AssetAlertDraft` | Draft describing an asset opt-in/removal confirmation alert. |
| `assetId` | Asset id referenced by the draft/transaction. |
| `asset` | The asset (or decoration) referenced by the draft/transaction. |
| `transactionFee` | Fee associated with the drafted transaction. |
| `detail` | Detail/body text of the model. |
| `actionTitle` | Primary action button title for the alert. |
| `cancelTitle` | Cancel button title for the alert. |
| `hasValidAsset` | Whether the draft references a valid (non-empty) asset. |
| `isOptedInToProtocol` | Whether the account is opted in to the inbox/ARC-59 protocol. |
| `minBalanceAmount` | Minimum ALGO balance required for the inbox send. |
| `innerTransactionCount` | Number of inner transactions in the grouped operation. |
| `totalProtocolFee` | Total protocol fee for the inbox/ARC-59 send. |
| `inboxAddress` | Address of the asset inbox account. |
| `algoFundAmount` | ALGO amount needed to fund the inbox operation. |
| `warningMessage` | Optional warning message accompanying the inbox summary. |
| `link` | Associated link URL string. |
| `readMore` | "Read more" link for the warning message. |
| `assetHolding` | Asset holding (id + amount) record for an account. |
| `AssetHolding` | Nested DTO of an account's asset id and amount. |
| `collectible` | Collectible metadata attached to an asset decoration. |
| `isCollectible` | Whether the asset decoration represents a collectible. |
| `count` | Total count of items in a paginated list. |
| `next` | URL of the next page of results. |
| `previous` | Cursor/URL of the previous page of results. |
| `AssetID` | Type alias for an asset identifier (`Int64`). |
| `stringWithHashtag` | Asset id formatted with a leading hashtag for display. |
| `assetNameRepresentation` | Resolved asset name string for display. |
| `unitNameRepresentation` | Resolved unit-name string for display. |
| `HDWalletAddress` | Derived HD wallet address with its public/private key material. |
| `walletId` | Identifier of the owning HD wallet. |
| `publicKey` | Public key bytes of the derived address. |
| `privateKey` | Private key bytes of the derived address. |
| `HDWalletAddressDetail` | Derivation path detail (account/change/index/type) for an HD address. |
| `change` | BIP-derivation change index. |
| `keyIndex` | BIP-derivation key index. |
| `derivationType` | HD wallet derivation scheme used. |
| `HDWalletSeed` | HD wallet seed identified by id with its raw entropy. |
| `entropy` | Raw entropy bytes of the HD wallet seed. |
| `appID` | Application id targeted by an app-call transaction. |
| `onCompletion` | Application call on-completion action. |
| `foreignAssets` | Foreign asset ids referenced by an app call. |
| `al` | App-call argument list (raw `AppCallArgument` array). |
| `aprv` | Approval-program reference value for an app call. |
| `OnCompletion` | Enum of application-call on-completion actions. |
| `uiRepresentation` | Localized string representation for UI display. |
| `AppCallArgument` | Resource/argument entry referenced by an app-call transaction. |
| `d` | App-call resource field (asset/app/holding identifier). |
| `s` | App-call resource field (secondary identifier). |
| `p` | App-call resource field (app identifier). |
| `h` | App-call holding resource reference. |
| `l` | App-call locals resource reference. |
| `b` | App-call box resource reference. |
| `HoldingResource` | App-call holding resource (asset + account indices). |
| `LocalsResource` | App-call local-state resource (app + account indices). |
| `BoxResource` | App-call box resource (app index + box name). |
| `i` | Box resource app index. |
| `n` | Box resource name. |
| `isFreeze` | Whether the asset freeze transaction freezes (vs unfreezes). |
| `closeAmount` | Amount transferred as part of a close-out. |
| `closeToAddress` | Address the asset is closed out to. |
| `receiverAddress` | Recipient address of an asset transfer. |
| `senderAddress` | Sender address of an asset transfer. |
| `KeyRegTransaction` | Key registration transaction DTO for participation keys. |
| `voteParticipationKey` | Voting participation key for key registration. |
| `selectionParticipationKey` | Selection participation key for key registration. |
| `stateProofKey` | State-proof key for key registration. |
| `voteFirstValid` | First valid round of the voting key. |
| `voteLastValid` | Last valid round of the voting key. |
| `voteKeyDilution` | Key dilution parameter for the voting key. |
| `nonParticipation` | Whether the registration marks the account as non-participating. |
| `isOnlineKeyRegTransaction` | Whether the key-reg transaction brings the account online. |
| `receiver` | Recipient address of a payment/transfer. |
| `closeAddress` | Address a payment is closed out to. |
| `amountForTransaction` | Amount used for the transaction, optionally including close amount. |
| `closeAmountForTransaction` | Close-out amount for the transaction, if any. |
| `identifier` | Transaction or draft identifier string. |
| `getProjectedTransactionFee` | Computes the projected fee from suggested params and data size. |
| `transactions` | List of transactions in a response/group. |
| `fee` | Transaction fee in microAlgos. |
| `firstValidRound` | First valid round of the SDK transaction. |
| `lastValidRound` | Last valid round of the SDK transaction. |
| `genesisHashData` | Genesis hash bytes of the network for the transaction. |
| `genesisId` | Genesis id string of the network. |
| `note` | Note field bytes attached to the transaction. |
| `transferAddress` | Resolved transfer/receiver address of an SDK transaction. |
| `closeRewards` | Rewards paid out during a close-out. |
| `confirmedRound` | Round in which the transaction was confirmed. |
| `firstRound` | First valid round of the transaction. |
| `lastRound` | Last valid round of the transaction. |
| `payment` | Payment sub-detail of a transaction. |
| `receiverRewards` | Rewards accrued to the receiver. |
| `sender` | Sender address of the transaction. |
| `senderRewards` | Rewards accrued to the sender. |
| `assetFreeze` | Asset-freeze sub-detail of a transaction. |
| `assetConfig` | Asset-config sub-detail of a transaction. |
| `assetTransfer` | Asset-transfer sub-detail of a transaction. |
| `applicationCall` | Application-call sub-detail of a transaction. |
| `keyRegTransaction` | Key-registration sub-detail of a transaction. |
| `date` | Timestamp of the transaction/entity. |
| `transactionSignature` | Signature container for the transaction. |
| `groupKey` | Atomic group key the transaction belongs to. |
| `innerTransactions` | Inner transactions produced by an app call. |
| `parentID` | Parent transaction id for an inner transaction. |
| `status` | Status of the transaction or account. |
| `contact` | Resolved contact for a counterparty address. |
| `isSelfTransaction` | Whether sender and receiver are the same account. |
| `appId` | Application id involved in the transaction. |
| `isAssetAdditionTransaction` | Whether the transaction opts the account into an asset. |
| `getAmount` | Returns the transaction's amount. |
| `getRewards` | Returns rewards accrued for a given account. |
| `getReceiver` | Returns the transaction's receiver address. |
| `getCloseAmount` | Returns the transaction's close-out amount. |
| `getCloseAddress` | Returns the transaction's close-out address. |
| `noteRepresentation` | Decoded human-readable note string. |
| `isAssetCreationTransaction` | Whether the transaction creates an asset for the account. |
| `allInnerTransactionsCount` | Total count of inner transactions, recursively. |
| `isInner` | Whether the transaction is an inner transaction. |
| `setAllParentID` | Recursively assigns the parent id to inner transactions. |
| `completeAll` | Recursively completes inner-transaction wiring. |
| `Constant` | Namespace of transaction-related constants. |
| `minimumFee` | Minimum transaction fee constant (1000 microAlgos). |
| `TransactionItem` | Protocol abstracting transaction list items. |
| `TransactionStatus` | Enum of transaction status (pending/completed/failed). |
| `signature` | Signature string of the transaction. |
| `TransactionType` | Enum of Algorand transaction types (pay, axfer, acfg, etc.). |
| `random` | Returns a random transaction type (used for previews/tests). |
| `swapGroupDetail` | Swap group summary attached to a v2 transaction. |
| `interpretedMeaning` | Human-interpreted meaning fields of a v2 transaction. |
| `groupId` | Atomic group id of the transaction. |
| `closeTo` | Close-to address of a v2 transaction. |
| `applicationId` | Application id string of a v2 transaction. |
| `applicationTransactionDetail` | Application-call detail of a v2 transaction. |
| `assetTransferTransactionDetail` | Asset-transfer detail of a v2 transaction. |
| `paymentTransactionDetail` | Payment detail of a v2 transaction. |
| `parentId` | Parent transaction id (v2). |
| `swapDetail` | Formatted swap summary string for a v2 transaction. |
| `amountValue` | Decimal amount derived from a v2 transaction. |
| `paymentValue` | Decimal payment amount given asset fraction decimals. |
| `fractionDecimals` | Fraction decimals of the v2 transaction asset. |
| `swapId` | Identifier of the swap. |
| `provider` | Swap provider for the swap/quote. |
| `assetIn` | Input asset of the swap. |
| `assetOut` | Output asset of the swap. |
| `amountInWithSlippage` | Input amount including slippage tolerance. |
| `amountOutWithSlippage` | Output amount including slippage tolerance. |
| `transactionCount` | Number of transactions in the swap group. |
| `roundTime` | Round timestamp of the swap group detail. |
| `property1` | First interpreted-meaning property of a v2 transaction. |
| `property2` | Second interpreted-meaning property of a v2 transaction. |
| `applicationArgs` | Application arguments of a v2 app-call transaction. |
| `foreignApps` | Foreign application ids referenced by the transaction. |
| `clawbackAddress` | Clawback address for an asset-transfer transaction. |
| `closeRemainderTo` | Close-remainder-to address of a payment. |
| `pendingTransactions` | List of pending transactions awaiting confirmation. |
| `fv` | First-valid round of a pending transaction. |
| `gh` | Genesis hash of a pending transaction. |
| `lv` | Last-valid round of a pending transaction. |
| `assetID` | Asset id of a pending/verified asset. |
| `poolError` | Transaction-pool error message for a pending transaction. |
| `getTransactionStatus` | Returns the derived status of a pending transaction. |
| `Status` | Enum of pending-transaction status outcomes. |
| `AlgosTransactionSendDraft` | Draft describing an ALGO send transaction. |
| `from` | Source account of a send draft. |
| `toAccount` | Destination account of a send draft. |
| `isMaxTransaction` | Whether the draft sends the maximum available amount. |
| `lockedNote` | Non-editable note enforced on the transaction. |
| `toContact` | Destination contact of a send draft. |
| `toNameService` | Destination resolved via the name service. |
| `isMaxTransactionFromRekeyedAccount` | Whether a max send originates from a rekeyed account. |
| `AssetTransactionARC59SendDraft` | Draft for an ARC-59 asset inbox send transaction. |
| `assetIndex` | Asset id being sent in the draft. |
| `assetCreator` | Creator address of the drafted asset. |
| `assetDecimalFraction` | Decimal fraction (decimals) of the drafted asset. |
| `isVerifiedAsset` | Whether the drafted asset is verified. |
| `appAddress` | Address of the ARC-59 inbox application. |
| `inboxAccount` | Receiver's inbox account address. |
| `minBalance` | Minimum balance required for the inbox send. |
| `extraAlgoAmount` | Extra ALGO needed to fund the inbox operation. |
| `AssetTransactionSendDraft` | Draft describing an asset (ASA) send transaction. |
| `isReceiverOptingInToAsset` | Whether the receiver is opting into the asset as part of the send. |
| `KeyRegTransactionSendDraft` | Draft describing a key-registration transaction. |
| `voteKey` | Voting key for the key-registration draft. |
| `selectionKey` | Selection key for the key-registration draft. |
| `voteFirst` | First valid round for the voting key. |
| `voteLast` | Last valid round for the voting key. |
| `mock` | Mock instance for previews/tests. |
| `TransactionSendDraft` | Protocol for transaction send drafts shared fields. |
| `password` | Stored app passcode (Core Data managed). |
| `authenticatedUserData` | Encoded authenticated user blob (Core Data managed). |
| `isDefaultNodeActive` | Whether the default node configuration is active. |
| `DBKeys` | Enum of Core Data attribute key names. |
| `encoded` | Returns the model encoded to `Data`. |
| `HDWalletInfoViewModel` | View model summarizing an HD wallet's id and name. |
| `walletName` | Display name of the HD wallet. |
| `walletOrderNumber` | Sequential order number of the HD wallet. |
| `hasReachedTotalAccountLimit` | Whether the wallet hit the maximum account count. |
| `hdWalletsAccounts` | Accounts that belong to HD wallets. |
| `hasHDWalletsAccounts` | Whether any HD wallet accounts exist. |
| `hdWallets` | List of HD wallet info view models. |
| `addAccount` | Adds an account to the user's account list. |
| `addAccounts` | Adds multiple accounts to the user's account list. |
| `removeAccount` | Removes an account and cleans up wallet storage. |
| `index` | Returns the index of a given account. |
| `indexOfAccount` | Returns the index of an account by address. |
| `logAccounts` | Logs the user's accounts (diagnostics). |
| `updateAccount` | Updates a stored account entry. |
| `updateLocalAccount` | Updates a local account's editable fields. |
| `syncronize` | Persists the user's current account state. |
| `setDefaultNode` | Sets the user's default Algorand node. |
| `preferredAlgorandNetwork` | Returns the user's preferred network. |
| `addresses` | Number of derived addresses for a wallet id. |
| `setWalletName` | Assigns a generated name to a wallet id. |
| `removeWalletName` | Removes the stored name for a wallet id. |
| `nextAccountIndex` | Returns the next derivation index for a wallet. |
| `getDeviceId` | Returns the registered device id for a network. |
| `setDeviceID` | Stores the device id for a network. |
| `subtitle` | Secondary descriptive text of the model. |
| `buttonLabel` | Call-to-action button label of an announcement. |
| `buttonUrl` | Call-to-action button URL of an announcement. |
| `AnnouncementType` | Enum of announcement banner types. |
| `text` | Display text of the banner/item. |
| `buttonUrlIsExternal` | Whether the banner button URL opens externally. |
| `isWaitlisted` | Whether the user is waitlisted for cards availability. |
| `CardsFundAddressesListResult` | Single card-fund address mapping (owner + card fund address). |
| `ownerAddress` | Owner account address of the card fund. |
| `cardFundAddress` | Card fund account address. |
| `nftRewardState` | NFT reward state label for the card fund. |
| `datetime` | Timestamp string of a chart data point. |
| `valueInCurrency` | Value of a chart point in the user's currency. |
| `price` | Price value of a chart data point. |
| `round` | Ledger round of a chart data point. |
| `entityName` | Core Data entity name constant. |
| `CoinbaseQR` | Helper for detecting and parsing Coinbase QR URLs. |
| `isCoinbaseQR` | Whether a URL is a Coinbase QR code. |
| `parseQRText` | Parses a Coinbase URL into a `QRText`. |
| `mode` | QR payload mode/intent. |
| `version` | Version string of the QR payload. |
| `mnemonic` | Mnemonic carried by an account QR. |
| `label` | Label/name carried by the QR payload. |
| `keyRegTransactionQRData` | Embedded key-registration data in a QR payload. |
| `walletConnectUrl` | WalletConnect URI carried by the QR payload. |
| `path` | Deep-link path carried by the QR payload. |
| `backupId` | Backup identifier carried by the QR payload. |
| `encryptionKey` | Encryption key carried by the backup QR payload. |
| `action` | Action intent carried by the QR payload. |
| `assetInId` | Input asset id carried by a swap QR payload. |
| `assetOutId` | Output asset id carried by a swap QR payload. |
| `deepLink` | Deep link carried by the QR payload. |
| `build` | Builds a `QRText` from an address and query parameters. |
| `qrText` | Serializes the payload to its canonical QR string. |
| `qrTextAppFormat` | Serializes the payload to the Pera app QR format. |
| `qrTextLegacyFormat` | Serializes the payload to the legacy QR format. |
| `universalLinkAppFormat` | Serializes the payload to a universal-link URL. |
| `KeyRegTransactionQRData` | Key-registration parameters embedded in a QR payload. |
| `votingKey` | Voting key carried in the key-reg QR data. |
| `QRMode` | Enum of QR payload modes. |
| `CSVFile` | File model wrapping an exported CSV at a URL. |
| `PaginatedList` | Generic paginated list with cursor and results. |
| `nextCursor` | Cursor extracted from the next-page URL. |
| `hasMore` | Whether more pages remain. |
| `Pagination` | Concrete pagination metadata (count/next/previous). |
| `PaginationComponents` | Protocol describing pagination metadata fields. |
| `QRCreationDraft` | Draft describing a QR code to render for an address. |
| `isSelectable` | Whether the generated QR/address is selectable. |
| `QRSendTransactionDraft` | Draft describing a send transaction parsed from a QR. |
| `transactionMode` | Mode (algos/asset) of a QR send transaction. |
| `TitledInformation` | Simple title/detail pair for display rows. |
| `APIErrorType` | Enum classifying Algorand API error types. |
| `message` | Error or transaction message text. |
| `containsAccount` | Whether an indexer error message references an address. |
| `totalAmount` | Total amount aggregated across incoming-ASA senders. |
| `senders` | Senders summary for an incoming-ASA request. |
| `algoGainOnClaim` | Net ALGO gained when claiming an incoming ASA. |
| `algoGainOnReject` | Net ALGO gained when rejecting an incoming ASA. |
| `shouldUseFundsBeforeClaiming` | Whether existing funds must be used before claiming. |
| `hasInsufficientAlgoForClaiming` | Whether the account lacks ALGO to claim. |
| `shouldUseFundsBeforeRejecting` | Whether existing funds must be used before rejecting. |
| `hasInsufficientAlgoForRejecting` | Whether the account lacks ALGO to reject. |
| `requestCount` | Number of incoming-ASA requests for the account. |
| `RekeyTransactionSendDraft` | Draft describing a rekey transaction. |
| `service` | Name-service provider for a resolved name. |
| `logo` | Logo image URL/string for the provider or asset. |
| `AlgorandNode` | Configuration of an Algorand node (algod/indexer addresses, tokens, network). |
| `algodAddress` | algod endpoint URL of the node. |
| `indexerAddress` | indexer endpoint URL of the node. |
| `algodToken` | API token for the algod endpoint. |
| `indexerToken` | API token for the indexer endpoint. |
| `network` | Network the node targets (mainnet/testnet). |
| `mainNetNode` | Predefined mainnet node configuration. |
| `testNetNode` | Predefined testnet node configuration. |
| `token` | API token for a Core Data managed node. |
| `isActive` | Whether the node is the active configuration. |
| `creationDate` | Creation timestamp of the node record. |
| `badge` | Badge count carried by a push notification. |
| `alert` | Alert text of a push notification. |
| `sound` | Sound name of a push notification. |
| `pushToken` | APNs push token for the device. |
| `platform` | Device platform identifier. |
| `model` | Device model identifier. |
| `locale` | Device locale identifier. |
| `icon` | Notification icon model. |
| `shape` | Shape of the notification icon. |
| `NotificationIconShape` | Enum of notification icon shapes. |
| `convertToImageShape` | Maps the icon shape to an `ImageShape`. |
| `hasNewNotification` | Whether there are unseen notifications. |
| `origin` | Origin/relying-party of a passkey. |
| `username` | Username associated with a passkey. |
| `userHandle` | User handle associated with a passkey. |
| `credentialId` | Credential id of the passkey. |
| `lastUsed` | Timestamp the passkey was last used. |
| `RecoveredAddress` | Address recovered during HD wallet import, with balances and import state. |
| `accountIndex` | HD account index of a recovered address. |
| `addressIndex` | HD address index of a recovered address. |
| `mainCurrency` | Primary-currency balance of a recovered address. |
| `secondaryCurrency` | Secondary-currency balance of a recovered address. |
| `alreadyImported` | Whether the recovered address is already imported. |
| `DeveloperSettings` | Enum of developer settings menu entries. |
| `SecuritySettings` | Enum of security settings menu entries. |
| `Settings` | Protocol for settings menu items (image, name, subtitle). |
| `ParsedSwapTransaction` | Parsed swap group split into paid/received/other transactions. |
| `purpose` | Purpose classification of a swap transaction. |
| `groupID` | Atomic group id of the parsed swap. |
| `paidTransactions` | Transactions the user pays in the swap. |
| `receivedTransactions` | Transactions the user receives in the swap. |
| `otherTransactions` | Remaining transactions in the swap group. |
| `allFees` | Sum of all fees across the parsed swap transactions. |
| `peraFee` | Pera platform fee for the swap. |
| `peraFeeAsset` | Asset in which the Pera fee is charged. |
| `peraFeeAmountInFeeAsset` | Pera fee amount denominated in the fee asset. |
| `peraFeeAssetId` | Asset id of the Pera fee asset. |
| `historyId` | Identifier of a swap history record. |
| `providerId` | Identifier of the swap provider. |
| `dateTime` | Date-time string of the swap history record. |
| `transactionGroupId` | Group id of the swap history transaction. |
| `amountIn` | Input amount of the swap. |
| `amountOut` | Output amount of the swap. |
| `amountInUSDValue` | Input amount in USD. |
| `amountOutUSDValue` | Output amount in USD. |
| `swappedText` | Formatted "swapped" summary string. |
| `resultText` | Formatted result summary string. |
| `dateText` | Formatted date string for the swap history. |
| `SwapProvider` | Enum/type identifying a swap provider. |
| `iconUrl` | Icon URL for the swap provider. |
| `feePadding` | Extra fee padding applied to a swap. |
| `swapperAddress` | Address performing the swap. |
| `deviceID` | Device id associated with the swap quote. |
| `slippage` | Slippage tolerance for the swap. |
| `priceImpact` | Estimated price impact of the swap. |
| `exchangeFee` | Exchange fee charged by the provider. |
| `assetA` | First asset of a top swap pair. |
| `assetB` | Second asset of a top swap pair. |
| `volume24hUSD` | 24-hour USD volume of the swap pair. |
| `volumeText` | Formatted 24-hour volume string. |
| `signedTransactions` | Signed transactions ready for submission. |
| `transactionsToSign` | Transactions requiring signatures. |
| `transactionGroupID` | Group id of a swap transaction group. |
| `transactionGroups` | Groups of transactions in a swap preparation. |
| `swapVersion` | Version label of the swap protocol. |
| `SwapTransactionPurpose` | Enum of swap transaction purposes. |
| `SwapType` | Enum of swap types (fixed-input/fixed-output). |
| `isScammer` | Whether the WalletConnect dapp is flagged as a scammer. |
| `icons` | Icon URLs of the WalletConnect peer. |
| `dappInfo` | WalletConnect DApp info derived from peer meta. |
| `clientMeta` | WalletConnect client meta derived from peer meta. |
| `urlMeta` | URL/bridge meta of a WalletConnect session. |
| `peerMeta` | Peer (dapp) meta of a WalletConnect session. |
| `walletMeta` | Wallet-side meta of a WalletConnect session. |
| `sessionBridgeValue` | Bridge-layer `WalletConnectSession` value of the session. |
| `sessionHistory` | Historical record of a WalletConnect session. |
| `sessions` | Stored WalletConnect sessions. |
| `topic` | WalletConnect session topic. |
| `bridge` | WalletConnect bridge URL. |
| `key` | WalletConnect session symmetric key. |
| `wcURL` | Reconstructed `WalletConnectURL` from URL meta. |
| `chainId` | Chain id of the WalletConnect session (optional Int). |
| `peerId` | Peer id of the WalletConnect session. |
| `walletInfo` | Wallet info derived for a WalletConnect session. |
| `WCTransactionErrorResponse` | Error enum for WalletConnect transaction request failures. |
| `RawValue` | Raw backing value type alias for the error code. |
| `Rejection` | Namespace of rejection error reason constants. |
| `Authorization` | Namespace of authorization error reason constants. |
| `Support` | Namespace of unsupported-operation error constants. |
| `Invalid` | Namespace of invalid-input error constants. |
| `chainID` | Chain id of WalletConnect arbitrary data (optional Int). |
| `data` | Raw arbitrary data bytes to sign. |
| `signer` | Requested signer address for arbitrary data. |
| `findSignerAccount` | Resolves the signer account for a WalletConnect request. |
| `decimal` | Decimal count of an asset-config parameter set. |
| `metadataHash` | Asset metadata hash bytes. |
| `managerAddress` | Asset manager address. |
| `reserveAddress` | Asset reserve address. |
| `frozenAddress` | Default-frozen account address for the asset. |
| `signers` | Requested signer addresses for the WalletConnect transaction. |
| `multisigMetadata` | Multisig metadata for the WalletConnect transaction. |
| `authAddress` | Auth (rekey) address for the WalletConnect transaction. |
| `hasValidAuthAddressForSigner` | Whether the auth address is valid for the resolved signer. |
| `hasValidSignerAddress` | Whether the request carries a valid signer address. |
| `isMultisig` | Whether the WalletConnect transaction is multisig. |
| `validationAddresses` | Addresses to validate against for the transaction. |
| `isInTheSameNetwork` | Whether the transaction targets the current network params. |
| `isFutureTransaction` | Whether the transaction is dated for a future round window. |
| `Signer` | Enum describing the required signer for a WalletConnect transaction. |
| `appCallArguments` | Application call arguments of a WC transaction detail. |
| `appCallOnComplete` | On-completion action of a WC app-call transaction. |
| `appCallId` | Application id of a WC app-call transaction. |
| `appGlobalSchema` | Global state schema of a WC app-call transaction. |
| `appLocalSchema` | Local state schema of a WC app-call transaction. |
| `appExtraPages` | Extra program pages of a WC app-call transaction. |
| `approvalHash` | Approval-program hash of a WC app-call transaction. |
| `stateHash` | Clear-state-program hash of a WC app-call transaction. |
| `assetIdBeingConfigured` | Asset id being configured by a WC transaction. |
| `assetConfigParams` | Asset configuration parameters of a WC transaction. |
| `votePublicKey` | Voting public key of a WC key-reg transaction. |
| `selectionPublicKey` | Selection public key of a WC key-reg transaction. |
| `stateProofPublicKey` | State-proof public key of a WC key-reg transaction. |
| `voteFirstValidRound` | First valid round of the WC key-reg voting key. |
| `voteLastValidRound` | Last valid round of the WC key-reg voting key. |
| `transactionType` | Resolves the WC transaction type for an account. |
| `isAlgosTransaction` | Whether the WC transaction is an ALGO payment. |
| `isAssetTransaction` | Whether the WC transaction is an asset transfer. |
| `isAppCallTransaction` | Whether the WC transaction is an application call. |
| `isAssetConfigTransaction` | Whether the WC transaction is an asset config. |
| `isAssetReconfigurationTransaction` | Whether the WC transaction reconfigures an existing asset. |
| `isAssetDeletionTransaction` | Whether the WC transaction deletes an asset. |
| `isKeyregTransaction` | Whether the WC transaction is a key registration. |
| `hasRekeyOrCloseAddress` | Whether the WC transaction rekeys or closes an account. |
| `isRekeyTransaction` | Whether the WC transaction performs a rekey. |
| `isCloseTransaction` | Whether the WC transaction closes an account. |
| `isAppCreateTransaction` | Whether the WC transaction creates an application. |
| `hasHighFee` | Whether the WC transaction fee exceeds the high-fee threshold. |
| `currentAssetId` | Asset id relevant to the current WC transaction. |
| `warningCount` | Number of warnings flagged for the WC transaction. |
| `AppCallOnComplete` | Enum of WalletConnect app-call on-completion actions. |
| `representation` | Localized string representation of the value. |
| `numberOfBytes` | Byte-slice slot count of a WC app schema. |
| `numberofInts` | Integer slot count of a WC app schema. |
| `containsSignerInTheWallet` | Whether a requested signer exists in the local wallet. |
| `Backup` | Encrypted cloud backup record (id + encrypted content). |
| `encryptedContent` | Encrypted payload of the backup. |

## Invariants

1. Every `ALGEntityModel` exposes an `APIModel` conforming to `ALGAPIModel`, and `encode()` round-trips the entity back to that DTO.
2. All API models (de)serialize using the shared `encodingStrategy`/`decodingStrategy` (default keys, fullNumeric dates, base64 data), so on-chain byte fields are consistently base64-encoded.
3. `AssetID` is `Int64` and native ALGO is always asset id `0` (`Algo.id == 0`); `Algo.decimals == 6` and `Algo.verificationTier == .trusted`.
4. An `Account`'s asset indexers (`StandardAssetIndexer`/`CollectibleAssetIndexer`) stay in sync with `standardAssets`/`collectibleAssets`; mutating the asset arrays only happens through `setAlgo`/`setStandardAssets`/`setCollectibleAssets`/`append`/`removeAllAssets`.
5. `AccountInformation` and `Account` equality/hash are defined solely by `address`, so two instances with the same address are interchangeable in sets/dictionaries.
6. `AccountAuthorization` is exhaustive and mutually exclusive: an account resolves to exactly one case, and the `is…` helpers return true only for that case (with `isJointAccount`/`isNoAuth` aggregating related cases).
7. A joint account (`jointAccountParticipants != nil`) is always treated as backed up (`isBackedUp == true`).
8. `Asset.isEmpty` is true exactly when `amountWithFraction` is zero.

## Behavioral Examples

### Scenario: Decode an account, then re-encode it
- **Given** an algod `Account.APIModel` JSON payload
- **When** the `Account` entity is initialized from it and `encode()` is called
- **Then** an equivalent `APIModel` is produced using the shared decoding/encoding strategies

### Scenario: Resolve authorization for a rekeyed account
- **Given** a standard account whose `authAddress` points to a Ledger account present locally
- **When** `authorization` is read
- **Then** it returns `.standardToLedgerRekeyed` and `isRekeyedToLedger` is `true`

### Scenario: Look up an opted-in asset on an account
- **Given** an `Account` whose `standardAssets` include asset id `31566704`
- **When** `account[31566704]` (subscript) or `containsStandardAsset(31566704)` is evaluated
- **Then** the matching `StandardAsset` is returned / `true` is returned via the asset indexer

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Missing optional field while decoding `AccountInformation` | Falls back to defaults (e.g. `type = .standard`, `receivesNotification = true`, `preferredOrder = -1`) |
| Unknown `AccountAuthorization` raw value | Resolves to `.unknown` |
| Unrecognized raw value for `TransactionType` / `AnnouncementType` / `MediaType` enums | Failable/`init()` initializers fall back to a default case rather than crashing |
| WalletConnect transaction request fails validation | A `WCTransactionErrorResponse` case (rejection/authorization/support/invalid) is produced with a localized `message` |
| Indexer returns an error referencing an account | `IndexerError.containsAccount(_:)` reports whether the message names the address |
| Collectible includes media the app cannot render | `containsUnsupportedMedia` is `true` and unsupported `MediaType` is marked not `isSupported` |

## Dependencies

| Module | Usage |
|--------|-------|
| Foundation / UIKit | Base value types, `URL`, `Data`, `Decimal`, and `UIImage` for type badges/icons |
| CoreData | `NSManagedObject` persistence for `Contact`, `Node`, `PassKey`, `WCSession*`, `ApplicationConfiguration` |
| MagpieCore | `APIModel`/`EntityModel`/`JSONModel` protocols and JSON encode/decode strategy types |
| MacaroonUtils | Date formatting and utility helpers used by API model strategies |
| ALGAPI / Network | `ALGAPI.Network` enum used for USDC detection and node/network selection |
| WalletConnectSwift (bridge) | `WalletConnectSession`/`WalletConnectURL` types bridged from session meta models |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
