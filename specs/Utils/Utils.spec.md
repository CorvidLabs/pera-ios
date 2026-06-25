---
module: Utils
version: 1
status: active
files:
  - PeraWalletCore/Utils/Auxiliaries/ScrollVerticalDirection.swift
  - PeraWalletCore/Utils/BLE/BLEConnectionManager.swift
  - PeraWalletCore/Utils/BLE/LedgerBLEController.swift
  - PeraWalletCore/Utils/BLE/LedgerMessage.swift
  - PeraWalletCore/Utils/Banner/ErrorDisplayable.swift
  - PeraWalletCore/Utils/Configuration/CoreAppConfiguration.swift
  - PeraWalletCore/Utils/Extensions/Bundle/Bundle+Extension.swift
  - PeraWalletCore/Utils/Extensions/Bundle/Bundle+JSON.swift
  - PeraWalletCore/Utils/Extensions/CharacterSet/CharacterSet+Extension.swift
  - PeraWalletCore/Utils/Extensions/CoreBluetooth/CBManagerState+Error.swift
  - PeraWalletCore/Utils/Extensions/CoreGraphics/CGFloat+Additions.swift
  - PeraWalletCore/Utils/Extensions/CoreGraphics/CGSize+Additions.swift
  - PeraWalletCore/Utils/Extensions/CoreGraphics/UIBezierPath+Extensions.swift
  - PeraWalletCore/Utils/Extensions/CoreImage/CIImage+Additions.swift
  - PeraWalletCore/Utils/Extensions/Data/Codable+CoreData.swift
  - PeraWalletCore/Utils/Extensions/Data/Data+BinaryString.swift
  - PeraWalletCore/Utils/Extensions/Data/Data+Hex.swift
  - PeraWalletCore/Utils/Extensions/Data/Data+String.swift
  - PeraWalletCore/Utils/Extensions/Data/Keychain+Additions.swift
  - PeraWalletCore/Utils/Extensions/Data/NSPersistentContainer+Create.swift
  - PeraWalletCore/Utils/Extensions/Data/UserDefaults+Additions.swift
  - PeraWalletCore/Utils/Extensions/External/Snapkit+SafeArea.swift
  - PeraWalletCore/Utils/Extensions/External/SwiftDate+Region.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Array/Array+Additions.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Array/Array+View.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Bool/Bool+Additions.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Btye/Int+Byte.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Btye/Int16+Byte.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Codable/Codable+JSON.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Date/Date+Additions.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Dictionary/Dictionary+Additions.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Enums/RawRepresentable+Extensions.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Formatter/Formatter+Additions.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Notification/Notification+Keyboard.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Notification/Notification.Name+Additions.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Notification/NotificationCenter+Additions.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Numbers/Decimal+Additions.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Numbers/Double.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Numbers/Int.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Optional/Optional+Nil.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Sequence/Sequence+Additions.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Text/NSAttributedString+Additions.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Text/String+Additions.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Text/String+Address.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Text/String+Attributes.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Text/String+Data.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Text/String+Empty.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Text/String+Number.swift
  - PeraWalletCore/Utils/Extensions/Foundation/Text/String+Shortening.swift
  - PeraWalletCore/Utils/Extensions/Foundation/URL/URL+Link.swift
  - PeraWalletCore/Utils/Extensions/Magpie/HIPNetworkError+Extensions.swift
  - PeraWalletCore/Utils/Extensions/Publishers/CurrentValueSubject+Utils.swift
  - PeraWalletCore/Utils/Extensions/String/String+Mnemonics.swift
  - PeraWalletCore/Utils/Extensions/String/String+Padding.swift
  - PeraWalletCore/Utils/Extensions/Style/Font/UIFont+Additions.swift
  - PeraWalletCore/Utils/Extensions/UI/Helpers/Utils.swift
  - PeraWalletCore/Utils/Extensions/UIKit/Image/UIImage+Size.swift
  - PeraWalletCore/Utils/Extensions/URL/URL+SocialMedia.swift
  - PeraWalletCore/Utils/FeatureFlag/FeatureFlag.swift
  - PeraWalletCore/Utils/FeatureFlag/FeatureFlagService.swift
  - PeraWalletCore/Utils/FeatureFlag/RemoteConfigOverride.swift
  - PeraWalletCore/Utils/FeatureFlag/RemoteConfigValue.swift
  - PeraWalletCore/Utils/Formatters/CollectibleAmount/CollectibleAmountFormatter.swift
  - PeraWalletCore/Utils/Formatters/CollectibleAmount/CollectibleAmountFormattingContext.swift
  - PeraWalletCore/Utils/Formatters/CollectibleAmount/CollectibleAmountFormattingContextHandling.swift
  - PeraWalletCore/Utils/Formatters/CollectibleAmount/CollectibleAmountFormattingHandler.swift
  - PeraWalletCore/Utils/Formatters/CollectibleAmount/CollectibleAmountFormattingStandaloneContextHandler.swift
  - PeraWalletCore/Utils/Formatters/Currency/CurrencyFormatter.swift
  - PeraWalletCore/Utils/Formatters/Currency/CurrencyFormattingContext.swift
  - PeraWalletCore/Utils/Formatters/Currency/CurrencyFormattingContextHandling.swift
  - PeraWalletCore/Utils/Formatters/Currency/CurrencyFormattingListItemContextHandler.swift
  - PeraWalletCore/Utils/Formatters/Currency/CurrencyFormattingStandaloneContextHandler.swift
  - PeraWalletCore/Utils/Formatters/Currency/NumberRounder.swift
  - PeraWalletCore/Utils/Formatters/Inputs/DecimalInputFormatter.swift
  - PeraWalletCore/Utils/Formatters/Inputs/PercentageInputFormatter.swift
  - PeraWalletCore/Utils/Formatters/TextFormatter.swift
  - PeraWalletCore/Utils/HDWalletService/HDWalletService.swift
  - PeraWalletCore/Utils/HDWalletService/HDWalletServicing.swift
  - PeraWalletCore/Utils/HDWalletService/HDWalletUtils.swift
  - PeraWalletCore/Utils/InAppBrowser/Configuration/InAppBrowserUserContentController.swift
  - PeraWalletCore/Utils/Ledger/LedgerAccountFetchOperation.swift
  - PeraWalletCore/Utils/Ledger/LedgerAccountVerifyOperation.swift
  - PeraWalletCore/Utils/Ledger/LedgerOperation.swift
  - PeraWalletCore/Utils/Ledger/LedgerTransactionOperation.swift
  - PeraWalletCore/Utils/LocalAuthentication/LocalAuthenticator.swift
  - PeraWalletCore/Utils/MnemonicsParser.swift
  - PeraWalletCore/Utils/Notifications/DeviceRegistrationController.swift
  - PeraWalletCore/Utils/Notifications/PushNotificationController.swift
  - PeraWalletCore/Utils/Operations/AsyncOperation.swift
  - PeraWalletCore/Utils/Operations/Constants.swift
  - PeraWalletCore/Utils/Operations/Once.swift
  - PeraWalletCore/Utils/Operations/PollingOperation.swift
  - PeraWalletCore/Utils/Passphrase/PassphraseUtils.swift
  - PeraWalletCore/Utils/Publishers/ReadOnlyPublisher.swift
  - PeraWalletCore/Utils/Reusable/Reusable.swift
  - PeraWalletCore/Utils/SDK/AlgorandSDK.swift
  - PeraWalletCore/Utils/SDK/HDWallet/Drafts/HDWalletDrafts.swift
  - PeraWalletCore/Utils/SDK/HDWallet/HDWalletSDK.swift
  - PeraWalletCore/Utils/SDK/HDWallet/HDWalletSDKError.swift
  - PeraWalletCore/Utils/SDK/HDWallet/HDWalletSDKImp.swift
  - PeraWalletCore/Utils/SDK/HDWallet/Model/HDWalletDerivationType.swift
  - PeraWalletCore/Utils/SDK/HDWallet/Model/HDWalletKeyContext.swift
  - PeraWalletCore/Utils/Session/Session+Announcement.swift
  - PeraWalletCore/Utils/Session/Session+Crypto.swift
  - PeraWalletCore/Utils/Session/Session.swift
  - PeraWalletCore/Utils/Storable/Storable.swift
  - PeraWalletCore/Utils/Tracking/UTMCampaingnHandler.swift
  - PeraWalletCore/Utils/Transaction/API/TransactionAPIConnector.swift
  - PeraWalletCore/Utils/Transaction/Data/TransactionData.swift
  - PeraWalletCore/Utils/Transaction/HDWallet/HDWalletTransactionSignable.swift
  - PeraWalletCore/Utils/Transaction/HDWallet/HDWalletTransactionSigner.swift
  - PeraWalletCore/Utils/Transaction/Signer/LedgerTransactionSigner.swift
  - PeraWalletCore/Utils/Transaction/Signer/SDKArbitraryDataSigner.swift
  - PeraWalletCore/Utils/Transaction/Signer/SDKTransactionSigner.swift
  - PeraWalletCore/Utils/Transaction/Signer/TransactionSignable.swift
  - PeraWalletCore/Utils/Transaction/TransactionError.swift
  - PeraWalletCore/Utils/Transaction/TransactionSendController.swift
  - PeraWalletCore/Utils/TypeAliases/TypeAliases.swift
  - PeraWalletCore/Utils/User Defaults/ObservableUserDefaults.swift
  - PeraWalletCore/Utils/User Defaults/PeraUserDefaults.swift
  - PeraWalletCore/Utils/User Defaults/UserDefault.swift
  - PeraWalletCore/Utils/WalletConnect/Data/WalletConnectSessionCreationPreferences.swift
  - PeraWalletCore/Utils/WalletConnect/Data/WalletConnectSessionSource.swift
  - PeraWalletCore/Utils/WalletConnect/Data/WalletConnectV2SessionSource.swift
  - PeraWalletCore/Utils/WalletConnect/Extensions/WalletConnectResponse.swift
  - PeraWalletCore/Utils/WalletConnect/Extensions/WalletConnectSession+Helpers.swift
  - PeraWalletCore/Utils/WalletConnect/Handlers/WalletConnectRequestHandler.swift
  - PeraWalletCore/Utils/WalletConnect/Handlers/WalletConnectV2RequestHandler.swift
  - PeraWalletCore/Utils/WalletConnect/Transaction/ArbitraryData/WCArbitraryDataSigner.swift
  - PeraWalletCore/Utils/WalletConnect/Transaction/ArbitraryData/WCArbitraryDataValidator.swift
  - PeraWalletCore/Utils/WalletConnect/Transaction/WCTransactionSigner.swift
  - PeraWalletCore/Utils/WalletConnect/Transaction/WCTransactionValidator.swift
  - PeraWalletCore/Utils/WalletConnect/V2/PeraConnect/ALGPeraConnect.swift
  - PeraWalletCore/Utils/WalletConnect/V2/PeraConnect/PeraConnect.swift
  - PeraWalletCore/Utils/WalletConnect/V2/SessionValidator/WalletConnectSessionValidator.swift
  - PeraWalletCore/Utils/WalletConnect/V2/SessionValidator/WalletConnectV1SessionValidator.swift
  - PeraWalletCore/Utils/WalletConnect/V2/SessionValidator/WalletConnectV2SessionValidator.swift
  - PeraWalletCore/Utils/WalletConnect/V2/Socket/DefaultSocketFactory.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectCoordinator/ALGWalletConnectCoordinator.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectCoordinator/Params/WalletConnectApproveSessionConnectionParams.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectCoordinator/Params/WalletConnectApproveTransactionRequestParams.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectCoordinator/Params/WalletConnectExtendSessionConnectionParams.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectCoordinator/Params/WalletConnectRejectSessionConnectionParams.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectCoordinator/Params/WalletConnectRejectTransactionRequestParams.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectCoordinator/Params/WalletConnectSessionDisconnectionParams.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectCoordinator/Params/WalletConnectSessionReconnectionParams.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectCoordinator/Params/WalletConnectUpdateSessionConnectionParams.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectCoordinator/WalletConnectCoordinator.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectProtocol/WalletConnectEvent.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectProtocol/WalletConnectMethod.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectProtocol/WalletConnectProtocol.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectProtocol/WalletConnectV1Protocol.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectProtocol/WalletConnectV2Protocol.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectProtocolResolver/ALGWalletConnectProtocolResolver.swift
  - PeraWalletCore/Utils/WalletConnect/V2/WalletConnectProtocolResolver/WalletConnectProtocolResolver.swift
db_tables: []
depends_on:
  - specs/AlgorandSecureBackup/AlgorandSecureBackup.spec.md
  - specs/Analytics/Analytics.spec.md
  - specs/API/API.spec.md
  - specs/Application/Application.spec.md
  - specs/Data/Data.spec.md
  - specs/Demo/Demo.spec.md
  - specs/Models/Models.spec.md
  - specs/Swap/Swap.spec.md
---

# Utils

## Purpose

Utils is the shared foundation layer of PeraWalletCore. It bundles cross-cutting helpers and infrastructure: Foundation/UIKit/CoreGraphics extensions, currency and collectible amount formatters, the Algorand SDK bridge and HD-wallet key derivation, transaction signing (SDK, Ledger BLE, HD wallet, WalletConnect), session/keychain/UserDefaults persistence, local (biometric) authentication, feature flags backed by remote config, and the WalletConnect v1/v2 coordinator stack. It owns the low-level primitives that higher-level feature modules compose, rather than any single user-facing flow.

## Public API

| Export | Description |
|--------|-------------|
| `state` | Current `CBManagerState` of the underlying central manager. |
| `startScanForPeripherals` | Begins scanning for Ledger BLE peripherals advertising the service UUID. |
| `stopScan` | Stops any in-progress BLE peripheral scan. |
| `connectToDevice` | Initiates a connection to the given discovered peripheral. |
| `disconnect` | Cancels the connection to the supplied (or current) peripheral. |
| `sendDataToPeripheral` | Writes a data payload to the connected peripheral's write characteristic. |
| `centralManagerDidUpdateState` | CoreBluetooth callback reacting to central manager power/state changes. |
| `centralManager` | CoreBluetooth central-manager delegate callbacks (discover/connect/disconnect). |
| `peripheral` | CoreBluetooth peripheral delegate callbacks (services/characteristics/value updates). |
| `isMatchingWithTheReadCharacteristic` | Returns true if the characteristic is the Ledger read/notify characteristic. |
| `isMatchingWithTheWriteCharacteristic` | Returns true if the characteristic is the Ledger write characteristic. |
| `BLEError` | Error enum for BLE failures (powered off, unauthorized, unsupported, etc.). |
| `BLEConnectionManagerDelegate` | Delegate protocol receiving BLE discovery, connection, read, and error events. |
| `Byte` | Type alias for `UInt8` used in Ledger APDU framing. |
| `Short` | Type alias for `UInt16` used in Ledger APDU framing. |
| `LedgerBLEController` | Encodes Ledger APDU commands and reassembles chunked BLE responses. |
| `readIncomingData` | Feeds an incoming BLE hex chunk into the response reassembly buffer. |
| `fetchAddress` | Builds the APDU command to fetch the Ledger address at the given index. |
| `verifyAddress` | Builds the APDU command to display/verify the address at the given index on-device. |
| `signTransaction` | Builds the APDU command to sign transaction data with the indexed Ledger account. |
| `LedgerBLEControllerDelegate` | Delegate protocol for APDU write requests and decoded Ledger responses. |
| `ErrorDisplayable` | Protocol for errors that can be surfaced to the user with a title/message. |
| `isValid` | Validity flag (validator result / displayable-error check, per conforming type). |
| `CoreAppConfiguration` | Root dependency container holding shared app services (API, session, etc.). |
| `api` | Shared `ALGAPI` client instance. |
| `session` | Shared `Session` instance for keychain/UserDefaults-backed state. |
| `sharedDataController` | Shared data controller coordinating account/asset state. |
| `walletConnector` | WalletConnect v1 protocol handler. |
| `analytics` | Shared analytics service. |
| `peraConnect` | PeraConnect facade over the WalletConnect coordinator. |
| `featureFlagService` | Remote-config-backed feature flag service. |
| `hdWalletService` | HD wallet derivation/account service. |
| `hdWalletStorage` | Persistent store for HD wallet seeds/metadata. |
| `persistentContainer` | Optional CoreData persistent container. |
| `wcDelegate` | Delegate for WalletConnect request handling. |
| `shared` | Singleton accessor (CoreAppConfiguration / CurrencyFormatter / ObservableUserDefaults). |
| `initialize` | Bootstraps and assigns the shared configuration, throwing on failure. |
| `init` | Designated initializer for the enclosing type. |
| `version` | Read-only accessor for a current value (bundle version / publisher value / remote-config value). |
| `buildInfo` | Build number string from the app bundle. |
| `peraVersion` | Composed user-facing app version string. |
| `decode` | Decodes a bundled JSON resource into a Decodable type. |
| `whitespacesAndDashes` | Character set combining whitespace and dash characters. |
| `errorDescription` | Localized error title/subtitle describing a failure condition. |
| `isIntrinsicMetric` | True when the value equals the intrinsic content-size sentinel. |
| `upper` | Ceiling of the CGFloat. |
| `lower` | Floor of the CGFloat. |
| `nearest` | Rounded-to-nearest value of the CGFloat. |
| `nonNegativeSize` | Size clamped so width and height are never negative. |
| `Point` | Tuple alias `(x, y)` for bezier path coordinates. |
| `move` | Moves the bezier path's current point to the given coordinate. |
| `addCurve` | Adds a cubic curve segment to the bezier path. |
| `Scale` | Tuple alias `(dx, dy)` describing an image scale factor. |
| `nonInterpolatedImage` | Renders the CIImage to a non-interpolated `UIImage` at the given scale (QR rendering). |
| `DEFAULT_CONTAINER_NAME` | Default CoreData container/model name ("algorand"). |
| `makePersistentContainer` | Creates a CoreData container in the shared app group, throwing on URL failure. |
| `DateFormat` | Enumeration of date format strings used across the app. |
| `isNonEmpty` | True when the array contains at least one element. |
| `containsSameElements` | True when two arrays contain the same elements regardless of order. |
| `firstIndex` | First index of the collection (or first matching a keyPath equality). |
| `sorted` | Sorts elements by a comparable keyPath. |
| `previousElement` | Element preceding the element at the given index, if any. |
| `nextElement` | Element following the element at the given index, if any. |
| `chunked` | Splits the array into fixed-size chunks. |
| `findEmptyElementIndexes` | Indexes of elements considered empty. |
| `previousView` | View preceding the given view in the array. |
| `nextView` | View following the given view in the array. |
| `isFirstView` | True if the given view is the first in the array. |
| `isLastView` | True if the given view is the last in the array. |
| `index` | Index of the given view in the array. |
| `algosInMicroAlgos` | Conversion constant: 1 Algo equals 1,000,000 microAlgos. |
| `minimumFee` | Minimum transaction fee in microAlgos (1000). |
| `totalNumIntConstantForMinimumAmount` | Per-uint constant used in minimum-balance calculation. |
| `byteSliceConstantForMinimumAmount` | Per-byte-slice constant used in minimum-balance calculation. |
| `minimumTransactionMicroAlgosLimit` | Minimum balance floor in microAlgos (100000). |
| `algosFraction` | Number of decimal places for Algos (6). |
| `dataSizeForMaxTransaction` | Max transaction byte size constant (270). |
| `isTestNet` | True when the optional value indicates the TestNet network. |
| `unwrap` | Returns the wrapped value or a supplied default / transform. |
| `unwrapIfPresent` | Applies a transform only when a value is present, else returns a fallback. |
| `unwrapConditionally` | Returns the wrapped value only if it satisfies the predicate. |
| `ifNil` | Returns the wrapped value, substituting a value when nil. |
| `emptyIfNil` | Returns the wrapped collection, or an empty collection when nil. |
| `fallback` | Returns the wrapped value or a chained fallback value. |
| `validatedAddressLength` | Canonical Algorand address length (58). |
| `defaultParticipationKey` | Default zero participation key placeholder. |
| `readOnlyPublisher` | Wraps the subject in a read-only publisher exposing value without mutation. |
| `englishMnemonics` | BIP39 English wordlist used for mnemonic validation. |
| `padLeft` | Left-pads the string to a length with the given pad string. |
| `FontType` | Enumeration of supported font families. |
| `hash` | Hashable conformance hashing the value's defining components. |
| `FontWeight` | Enumeration of supported font weights. |
| `font` | Resolved `UIFont`/SwiftUI `Font` for a weight and family. |
| `img` | Loads a named image asset, optionally as a template. |
| `color` | Loads a named color asset as a `UIColor`. |
| `rgb` | Builds an opaque `UIColor` from RGB components. |
| `rgba` | Builds a `UIColor` from RGBA components. |
| `verticalScale` | Screen-height-relative scale factor (capped at 1.0). |
| `horizontalScale` | Screen-width-relative scale factor (capped at 1.0). |
| `runIfDebug` | Runs the closure only in DEBUG builds. |
| `runIfRelease` | Runs the closure only in non-DEBUG (release) builds. |
| `convert` | Resizes the image to the target size. |
| `FeatureFlag` | Enumeration of supported remote feature flags. |
| `title` | Human-readable title for the enum case. |
| `FeatureFlagServicing` | Protocol for fetching and querying feature flag state. |
| `fetchAndActivate` | Fetches and activates the latest remote config values. |
| `isEnabled` | Returns whether a given feature flag is enabled. |
| `double` | Returns a Double-valued remote config parameter for a flag. |
| `RemoteConfigOverride` | Debug helper storing local boolean overrides for remote config keys. |
| `overrideValues` | Map of currently overridden remote config key to boolean. |
| `value` | Current value for a key/property (override / publisher / read-only publisher). |
| `set` | Sets a stored value for a key. |
| `remove` | Removes a stored value/key. |
| `clear` | Clears all stored values for the given scope. |
| `formattingContext` | Current formatting context (list item / standalone). |
| `format` | Formats input into a display string per the active context/rules. |
| `CollectibleAmountFormattingContext` | Enum selecting how collectible amounts are formatted. |
| `makeHandler` | Creates the context-specific formatting handler. |
| `CollectibleAmountFormattingContextHandling` | Protocol producing rounding/fraction rules for a context. |
| `CollectibleAmountFormattingRules` | Rounding mode and fraction-digit rules for collectible amounts. |
| `roundingMode` | Rounding mode applied during formatting. |
| `minimumFractionDigits` | Minimum fraction digits to display. |
| `maximumFractionDigits` | Maximum fraction digits to display. |
| `RoundingMode` | Alias for `NumberFormatter.RoundingMode`. |
| `currency` | Local currency used for formatting. |
| `isValueHidden` | When true, formats values as a masked placeholder. |
| `CurrencyConstanst` | Constants for currency formatting (unavailable / hidden value strings). |
| `unavailable` | Display string for unavailable currency values ("N/A"). |
| `hiddenValue` | Masked display string for hidden currency values ("*****"). |
| `CurrencyFormattingContext` | Enum selecting how currency amounts are formatted. |
| `CurrencyFormattingContextHandling` | Protocol producing rules for a currency formatting context. |
| `CurrencyFormattingContextRules` | Rounding/fraction rules for currency formatting. |
| `CurrencyFormattingContextInput` | Protocol describing the number/prefix/suffix inputs to formatting. |
| `number` | Decimal number to be formatted. |
| `prefix` | Optional prefix string for the formatted output. |
| `suffix` | Optional suffix string for the formatted output. |
| `FiatCurrencyMinimumNonZeroInput` | Input representing the smallest non-zero fiat amount with a `<` prefix. |
| `DecimalInputFormatter` | Normalizes user decimal input into a canonical numeric string. |
| `PercentageInputFormatter` | Formats/unformats percentage text and number inputs. |
| `unformat` | Strips formatting from a string back to a raw value/number. |
| `TextFormatterProtocol` | Protocol for one-directional text formatters. |
| `TextFormatter` | Namespace of reusable text formatters. |
| `AssetShortNameTextFormatter` | Formatter producing a shortened asset name string. |
| `bip44Purpose` | BIP44 purpose constant (44). |
| `algorandCoinType` | BIP44 Algorand coin type (283). |
| `accountIndex` | Default BIP44 account index / RecoverResult account index. |
| `changeIndex` | Default BIP44 change index (0). |
| `addressIndex` | Default BIP44 address index / RecoverResult address index. |
| `generateMnemonic` | Generates a new BIP39 mnemonic, throwing on SDK failure. |
| `createWallet` | Creates an HD wallet from a mnemonic/entropy. |
| `generateAddress` | Derives an address at a derivation path from the wallet. |
| `importAddress` | Imports an address into the HD wallet from external key material. |
| `saveHDWalletAndComposeHDWalletAddressDetail` | Persists the HD wallet and builds its address detail. |
| `createAddressDetail` | Builds an account address detail from derived key material. |
| `recoverAccounts` | Scans derivation paths to recover funded accounts. |
| `fastLookupAccount` | Performs an indexer fast-lookup for an address's account state. |
| `calculateDerivationPath` | Computes the BIP44 derivation path components. |
| `HDWalletError` | Error enum for HD wallet operations. |
| `RecoverResult` | Recovered account result (address, indexes, value). |
| `address` | Algorand address string. |
| `algoValue` | Account Algo balance value. |
| `usdValue` | Account USD-denominated value. |
| `HDWalletServicing` | Protocol abstracting HD wallet derivation and recovery. |
| `HDWalletUtils` | Static BIP39 mnemonic/seed/entropy helpers. |
| `generateSeed` | Derives a BIP39 seed from a mnemonic or entropy. |
| `generateEntropy` | Derives BIP39 entropy from a mnemonic. |
| `generate256BitEntropy` | Generates 256 bits of cryptographically secure entropy. |
| `add` | Registers a script message handler / adds an observer (per type). |
| `removeScriptMessageHandlers` | Removes script message handlers for the given messages. |
| `removeScriptMessageHandler` | Removes the script message handler for a single message. |
| `InAppBrowserScriptMessage` | Protocol describing an in-app-browser script message name. |
| `NoInAppBrowserScriptMessage` | Empty placeholder script-message type for browsers with no handlers. |
| `rawValue` | Raw backing value of the enum/wrapper case. |
| `allCases` | All cases of the conforming CaseIterable type. |
| `userContentController` | WKScriptMessage delivery callback bridging into typed handlers. |
| `bleConnectionManager` | BLE connection manager driving the Ledger operation. |
| `ledgerBleController` | Ledger APDU controller for the operation. |
| `connectedDevice` | Currently connected Ledger peripheral, if any. |
| `startOperation` | Starts the Ledger account-fetch/transaction operation. |
| `completeOperation` | Finalizes the operation with received data. |
| `handleDiscoveryResults` | Handles discovered Ledger peripherals during scanning. |
| `reset` | Resets operation/session state back to initial. |
| `returnError` | Propagates a Ledger operation error to the delegate. |
| `finishTimingOperation` | Stops the operation timeout timer. |
| `requestUserApproval` | Requests user approval to proceed with the Ledger operation. |
| `LedgerAccountFetchOperationDelegate` | Delegate for Ledger account-fetch operation events. |
| `LedgerAccountVerifyOperation` | Operation that verifies an account address on the Ledger device. |
| `setLedgerDetail` | Sets the Ledger detail context for the verify operation. |
| `LedgerAccountVerifyOperationDelegate` | Delegate for Ledger account-verify operation events. |
| `LedgerOperation` | Protocol shared by Ledger BLE operations (scan/connect/parse). |
| `startScan` | Starts scanning for Ledger devices. |
| `disconnectFromCurrentDevice` | Disconnects from the currently connected Ledger device. |
| `bleConnectionManagerEnabledToWrite` | BLE callback indicating the device is ready to receive writes. |
| `ledgerBLEController` | Ledger BLE controller delegate callback bridge. |
| `parseAddress` | Parses an Algorand address from raw Ledger response data. |
| `LedgerOperationError` | Error enum for Ledger operations (cancelled, failed, etc.). |
| `LedgerTransactionOperation` | Operation that signs a transaction via the Ledger device. |
| `setUnsignedTransactionData` | Sets the unsigned transaction payload to sign. |
| `setTransaction` | Sets the WalletConnect transaction context. |
| `setTransactionAccount` | Sets the signing account for the transaction. |
| `ledgerAccountFetchOperation` | Account-fetch operation delegate callbacks. |
| `ledgerAccountFetchOperationDidFinishTimingOperation` | Callback when the account-fetch operation's timer finishes. |
| `ledgerAccountFetchOperationDidResetOperation` | Callback when the account-fetch operation resets. |
| `LedgerTransactionOperationDelegate` | Delegate for Ledger transaction-signing operation events. |
| `ledgerTransactionOperationDidResetOperationOnSuccess` | Callback when the transaction operation resets after success. |
| `LocalAuthenticator` | Wraps biometric/passcode local authentication and password storage. |
| `hasAuthentication` | True if a biometric password has been stored. |
| `authenticate` | Performs local authentication, throwing on failure/cancel. |
| `setBiometricPassword` | Stores the password behind biometric protection. |
| `removeBiometricPassword` | Removes the stored biometric password. |
| `LAError` | Error enum for local-authentication failures. |
| `separators` | Character set treated as word separators when parsing mnemonics. |
| `wordCount` | Expected number of mnemonic words. |
| `parse` | Parses input text into mnemonic words, validating the count. |
| `Mnemonics` | Namespace for mnemonic constants and aliases. |
| `Word` | Type alias `String` for a single mnemonic word. |
| `MnemonicsError` | Error enum for mnemonic parsing failures. |
| `Constants` | Namespace of shared string constants (queues, notifications, cards). |
| `DispatchQueues` | Named dispatch-queue label constants. |
| `collectibleDetailSnapshot` | Queue label for collectible detail snapshot diffing. |
| `manageAssetListSnapshot` | Queue label for manage-asset list snapshot diffing. |
| `collectibleListSnapshot` | Queue label for collectible list snapshot diffing. |
| `swapPoolAssetSnapshot` | Queue label for swap pool asset snapshot diffing. |
| `swapLocalAssetSnapshot` | Queue label for swap local asset snapshot diffing. |
| `Notification` | Namespace of collectible-related notification name constants. |
| `collectibleListDidAddCollectible` | Notification name for a collectible being added. |
| `collectibleListDidRemoveCollectible` | Notification name for a collectible being removed. |
| `collectibleListDidSendCollectible` | Notification name for a collectible being sent. |
| `Cards` | Namespace of card-context constants. |
| `singleAccount` | Card context constant for a single account. |
| `selectedAccount` | Card context constant for the selected account. |
| `PollingOperation` | Timer-based operation that repeatedly invokes a handler at an interval. |
| `start` | Starts the polling timer. |
| `invalidate` | Stops and tears down the polling timer. |
| `PassphraseUtils` | Helpers for resolving an account's mnemonics and HD-wallet status. |
| `MnemonicsData` | Resolved mnemonics plus whether the account is an HD wallet. |
| `mnemonics` | Returns the account's mnemonic words (Session/PassphraseUtils). |
| `isHDWallet` | True if the account is backed by an HD wallet. |
| `publisher` | Erased publisher exposing value changes without mutation. |
| `Reusable` | Protocol giving cells/views a reuse identifier. |
| `reusableIdentifier` | Reuse identifier string derived from the type name. |
| `AlgorandSDK` | Swift bridge over the Algorand Go SDK for keys, signing, and transaction composition. |
| `roundTreshold` | Default validity-window round threshold (1000). |
| `generatePrivateKey` | Generates a new Algorand private key (SDK / Session). |
| `sign` | Signs data with a private key (TransactionSignable / SDK). |
| `getSignedTransaction` | Assembles a signed transaction from a signature and signer. |
| `mnemonicFrom` | Derives the 25-word mnemonic from a private key. |
| `privateKeyFrom` | Derives a private key from a mnemonic. |
| `addressFrom` | Derives an address from a private key. |
| `addressFromPublicKey` | Derives an address from a public key. |
| `generateBackupPrivateKey` | Generates a private key for encrypted backups. |
| `generateBackupCipherKey` | Derives the cipher key used to encrypt backups. |
| `backupMnemnoic` | Derives the backup mnemonic from a backup private key. |
| `backupPrivateKey` | Derives the backup private key from a backup mnemonic. |
| `sendAlgos` | Builds an unsigned Algo payment transaction. |
| `sendAsset` | Builds an unsigned asset transfer transaction. |
| `addAsset` | Builds an unsigned asset opt-in transaction. |
| `removeAsset` | Builds an unsigned asset opt-out/removal transaction. |
| `sendKeyRegTransaction` | Builds an unsigned key-registration (participation) transaction. |
| `composeOptInAndSendAssetTxn` | Builds a grouped opt-in plus asset-send transaction. |
| `rekeyAccount` | Builds an unsigned rekey transaction. |
| `isValidAddress` | Validates an Algorand address string. |
| `signBytes` | Signs arbitrary bytes with a private key. |
| `msgpackToJSON` | Converts msgpack transaction bytes to JSON. |
| `jsonToMsgpack` | Converts transaction JSON to msgpack bytes. |
| `findAndVerifyTransactionGroups` | Validates and returns the group boundaries of a transaction list. |
| `getTransactionID` | Computes the transaction ID for raw transaction bytes. |
| `getAddressfromProgram` | Derives the logic-sig escrow address from program bytes. |
| `rawTransactionToSign` | Extracts the canonical bytes-to-sign from a raw transaction. |
| `composeArc59SendAssetTxn` | Builds an ARC-59 inbox asset-send transaction group. |
| `composeArc59SendAssetTxnAndSign` | Builds and signs an ARC-59 asset-send transaction group. |
| `composeArc59ClaimAssetTxn` | Builds an ARC-59 inbox asset-claim transaction group. |
| `composeArc59ClaimAssetTxnAndSign` | Builds and signs an ARC-59 asset-claim transaction group. |
| `composeArc59RejectAssetTxn` | Builds an ARC-59 inbox asset-reject transaction group. |
| `composeArc59RejectAssetTxnAndSign` | Builds and signs an ARC-59 asset-reject transaction group. |
| `HDWalletDeriveChildNodeDraft` | Draft inputs for deriving a child node from an extended key. |
| `extendedKey` | Extended key bytes used to derive child nodes. |
| `derivationType` | HD wallet derivation scheme (BIP32 variant). |
| `HDWalletDeriveKeyDraft` | Draft inputs for deriving a key along a BIP44 path. |
| `rootKey` | Root key bytes for derivation. |
| `bip44Path` | BIP44 path components for derivation. |
| `isPrivate` | Whether to derive a private (vs public) key. |
| `HDWalletKeyGenDraft` | Draft inputs for generating a key at account/change/index. |
| `context` | HD wallet key context (address vs identity). |
| `account` | BIP44 account index. |
| `change` | BIP44 change index. |
| `keyIndex` | BIP44 address/key index. |
| `HDWalletSignAlgoTransactionDraft` | Draft inputs for signing an Algorand transaction with a derived key. |
| `prefixEncodedTx` | Prefix-encoded transaction bytes to sign. |
| `HDWalletSignDataDraft` | Draft inputs for signing arbitrary data with metadata. |
| `data` | Raw data payload (signing input / keychain read result). |
| `metadata` | Data-signing metadata (encoding and schema). |
| `HDWalletVerifySignatureDraft` | Draft inputs for verifying a signature over a message. |
| `signature` | Signature bytes (verification input / WC approval signatures). |
| `message` | Message bytes that were signed. |
| `publicKey` | Public key bytes used for verification. |
| `HDWalletECDHDraft` | Draft inputs for an ECDH shared-secret derivation. |
| `otherPartyPub` | Counterparty public key for ECDH. |
| `meFirst` | Ordering flag controlling ECDH key concatenation order. |
| `DataSigningMetadata` | Encoding and schema metadata describing data to sign. |
| `encoding` | Data encoding used for signing metadata. |
| `schema` | Schema identifier for the data being signed. |
| `HDWalletSDK` | Protocol bridging the native HD wallet SDK (derive/sign/verify/ECDH). |
| `HDWalletDerivationType` | Enum of HD derivation schemes (e.g. peikert, khovratovich). |
| `toBIP32DerivationType` | Maps the case to the SDK's `BIP32DerivationType`. |
| `from` | Builds the enum case from an SDK/source value. |
| `HDWalletKeyContext` | Enum of HD key contexts mapped to the SDK `KeyContext`. |
| `toKeyContext` | Maps the case to the SDK's `KeyContext`. |
| `setAnnouncementHidden` | Records whether an announcement is hidden for the user. |
| `isAnnouncementHidden` | Returns whether an announcement is hidden. |
| `AnnouncementMetadata` | Codable record of hidden-announcement state. |
| `privateKey` | Private key material / keychain key constant (per context). |
| `makeMnemonicsBIP39` | Returns BIP39 mnemonic words for an address. |
| `Session` | Keychain/UserDefaults-backed store of user, auth, and preference state. |
| `Object` | Type alias `Any` for generic Storable objects. |
| `biometricStorageKey` | Keychain key for biometric storage. |
| `privateStorageKey` | Keychain key for private token storage. |
| `tempMnemonicKey` | Keychain key for the temporary mnemonic. |
| `rewardsPrefenceKey` | UserDefaults key for the rewards preference. |
| `passwordKey` | Keychain key for the PIN code. |
| `termsAndServicesKey` | UserDefaults key for terms acceptance (v1). |
| `termsAndServicesKeyV2` | UserDefaults key for terms acceptance (v2). |
| `accountsQRTooltipKey` | UserDefaults key for the accounts QR tooltip flag. |
| `notificationLatestTimestamp` | UserDefaults key for the latest notification timestamp. |
| `currencyPreferenceKey` | UserDefaults key for the preferred currency. |
| `userInterfacePrefenceKey` | UserDefaults key for the UI appearance preference. |
| `announcementStateKey` | UserDefaults key for announcement state. |
| `backupsKey` | Keychain key for secure backups. |
| `lastSeenNotificationIDKey` | UserDefaults key for the last-seen notification ID. |
| `hasBiometricAuthenticationKey` | UserDefaults key for the biometric-enabled flag. |
| `authenticatedUser` | The currently authenticated user, persisted to keychain. |
| `applicationConfiguration` | Persisted application configuration object. |
| `preferredCurrencyID` | User's preferred currency identifier. |
| `notificationLatestFetchTimestamp` | Timestamp of the last notification fetch. |
| `lastSeenNotificationID` | ID of the last notification the user has seen. |
| `setAccountQRTooltipDisplayed` | Marks the account QR tooltip as displayed. |
| `isAccountQRTooltipDisplayed` | Returns whether the account QR tooltip has been displayed. |
| `clearConfigurationCache` | Clears the cached application configuration. |
| `backups` | Map of stored backup metadata keyed by identifier. |
| `Store` | Enum selecting the backing store (UserDefaults vs keychain). |
| `Storable` | Protocol providing save/read/remove over UserDefaults and keychain. |
| `userDefaults` | UserDefaults instance backing the store. |
| `keychain` | Keychain instance backing the store. |
| `save` | Persists a string/data/bool to the selected store. |
| `bool` | Reads a Bool from the selected store / remote-config bool value. |
| `object` | Reads a generic object from the store. |
| `string` | Reads a String from the selected store / remote-config string value. |
| `UTMCampaingnHandler` | Parses and records UTM campaign parameters from a URL. |
| `handle` | Processes a request/URL (UTM campaign / WC request handling). |
| `TransactionAPIConnector` | Fetches transaction params and uploads signed transactions via the API. |
| `getTransactionParams` | Fetches current suggested transaction parameters. |
| `uploadTransaction` | Submits a signed transaction and returns its ID or an API error. |
| `isUnsignedTransactionComposed` | True when the unsigned transaction has been built. |
| `isTransactionSigned` | True when the signed transaction is present. |
| `setUnsignedTransaction` | Stores the composed unsigned transaction bytes. |
| `setSignedTransaction` | Stores the signed transaction bytes. |
| `signData` | Signs arbitrary data (HD wallet / WC arbitrary data signer). |
| `signTransactions` | Signs a batch of transactions with the HD wallet key. |
| `verifySignature` | Verifies a signature against a message and public key. |
| `eventHandler` | Callback closure receiving signer lifecycle events. |
| `TransactionSignable` | Protocol for transaction signers emitting signing events. |
| `TransactionSignableEvent` | Enum of events emitted during transaction signing. |
| `TransactionError` | Error enum for transaction validation/build failures. |
| `isClosingToSameAccount` | True when the send closes the account to itself. |
| `draft` | The send-transaction draft being validated/sent. |
| `validate` | Validates the draft and notifies the delegate of results. |
| `TransactionSendControllerDelegate` | Delegate for send-controller validation outcomes. |
| `TransactionSendControllerError` | Top-level error enum for send validation. |
| `TransactionSendControllerAlgoError` | Algo-specific send validation error cases. |
| `TransactionSendControllerAssetError` | Asset-specific send validation error cases. |
| `EmptyHandler` | Alias `() -> Void` for a no-argument completion closure. |
| `BoolHandler` | Alias `(Bool) -> Void` for a boolean completion closure. |
| `TxnID` | Alias `String` for a transaction identifier. |
| `HIPTransactionError` | Alias for a HIPError wrapping a transaction error and printable detail. |
| `PrintableErrorDetail` | Debug-printable error detail payload. |
| `debugDescription` | Debug-printable description of the value. |
| `isPrivacyModeEnabled` | Whether privacy mode (value masking) is enabled. |
| `PeraUserDefaults` | Namespace of `@UserDefault`-backed app preference flags. |
| `wasPrivacyTooltipPresented` | Whether the privacy tooltip has been shown. |
| `shouldShowNewAccountAnimation` | Whether to play the new-account animation. |
| `shouldUseLocalCurrencyInSwap` | Whether swap UI uses the local currency. |
| `isMediaCleanupCompleted` | Whether one-time media cleanup has run. |
| `lastAddressUsedInSwapCompleted` | Last address used to complete a swap. |
| `isRekeySupported` | Whether rekey support is enabled. |
| `watchedJointAccountInvitations` | Joint-account invitation IDs already seen. |
| `watchedSignRequestMessage` | Sign-request message IDs already seen. |
| `hasJointAccountCreationPopupBeenShown` | Whether the joint-account creation popup has been shown. |
| `shouldShowDevMenu` | Whether the developer menu is visible. |
| `enableTestCards` | Whether test cards are enabled. |
| `overrideRemoteConfigValues` | Local overrides for remote config boolean values. |
| `enableTestXOSwapPage` | Whether the experimental XO swap page is enabled. |
| `UserDefault` | Property wrapper persisting a Codable optional in UserDefaults. |
| `wrappedValue` | Wrapped property value (UserDefault / RemoteConfigValue). |
| `WalletConnectSessionCreationPreferences` | Options governing a new WalletConnect session connection. |
| `prefersConnectionApproval` | Whether the connection requires explicit user approval. |
| `isAccountMultiselectionEnabled` | Whether multiple accounts may be selected for the session. |
| `mandotaryAccount` | Account that must be included in the session, if any. |
| `algorandWalletConnectV1ChainID` | WalletConnect v1 generic Algorand chain ID (4160). |
| `algorandWalletConnectV1MainNetChainID` | WalletConnect v1 MainNet chain ID (416001). |
| `algorandWalletConnectV1TestNetChainID` | WalletConnect v1 TestNet chain ID (416002). |
| `algorandWalletConnectV2MainNetChainReference` | WalletConnect v2 MainNet chain reference hash. |
| `algorandWalletConnectV2TestNetChainReference` | WalletConnect v2 TestNet chain reference hash. |
| `getClientMeta` | Builds the WalletConnect client metadata. |
| `getApprovedWalletConnectionInfo` | Builds approved-connection wallet info for accounts on a network. |
| `getDeclinedWalletConnectionInfo` | Builds declined-connection wallet info for a network. |
| `toWCSession` | Converts the value into a `WCSession`. |
| `chainId` | Returns the chain ID for the given network. |
| `canHandle` | Returns whether this handler can process the request. |
| `WalletConnectRequestHandlerDelegate` | Delegate for v1 request-handler outcomes. |
| `WalletConnectV2RequestHandlerDelegate` | Delegate for v2 request-handler outcomes. |
| `WCSignError` | Error enum for WalletConnect signing failures. |
| `WCArbitraryDataSignerDelegate` | Delegate for arbitrary-data signing events. |
| `WCArbitraryDataValidator` | Protocol validating WalletConnect arbitrary-data requests. |
| `validateArbitraryData` | Validates arbitrary-data sign requests, throwing on invalid input. |
| `disonnectFromLedger` | Disconnects the Ledger device used for WC signing. |
| `ledgerTransactionOperation` | Ledger transaction-operation delegate callbacks. |
| `ledgerTransactionOperationDidFinishTimingOperation` | Callback when the WC Ledger operation timer finishes. |
| `ledgerTransactionOperationDidResetOperation` | Callback when the WC Ledger operation resets. |
| `ledgerTransactionOperationDidRejected` | Callback when the user rejects the Ledger operation. |
| `WCTransactionSignerDelegate` | Delegate for WalletConnect transaction-signing events. |
| `WCTransactionValidator` | Protocol validating WalletConnect transaction requests. |
| `validateTransactions` | Validates WC transactions, throwing on invalid input. |
| `didReceiveSessionRequestNotification` | Notification name posted on a new WC session request. |
| `sessionRequestPreferencesKey` | Notification userInfo key for session-request preferences. |
| `observations` | Registered weak observers of PeraConnect events. |
| `coordinatorEventHandler` | Handler forwarding coordinator events to PeraConnect. |
| `isValidSession` | Validates a WalletConnect session URI/text. |
| `configureIfNeeded` | Lazily configures the WC coordinator/transactions. |
| `connectToSession` | Initiates a WalletConnect session connection. |
| `reconnectToSession` | Reconnects to an existing WalletConnect session. |
| `disconnectFromSession` | Disconnects a specific WalletConnect session. |
| `disconnectFromAllSessions` | Disconnects all WalletConnect sessions. |
| `updateSessionConnection` | Updates an active WalletConnect session's accounts/namespaces. |
| `extendSessionConnection` | Extends a WalletConnect session's expiry. |
| `updateSessionsWithRemovingAccount` | Updates sessions to drop a removed account. |
| `approveSessionConnection` | Approves a pending WalletConnect session proposal. |
| `rejectSessionConnection` | Rejects a pending WalletConnect session proposal. |
| `approveTransactionRequest` | Approves a WalletConnect transaction request with signatures. |
| `rejectTransactionRequest` | Rejects a WalletConnect transaction request with an error. |
| `PeraConnect` | Protocol facade over the WalletConnect coordinator stack. |
| `PeraConnectObserver` | Observer protocol for PeraConnect events. |
| `PeraConnectEvent` | Enum of events emitted by PeraConnect. |
| `WalletConnectSessionValidator` | Protocol validating a WalletConnect session URI prefix. |
| `sessionPrefix` | Expected URI scheme/prefix for valid sessions. |
| `WalletConnectSessionText` | Alias `String` for a WalletConnect session URI/text. |
| `WalletConnectV1SessionValidator` | Validator for WalletConnect v1 session URIs. |
| `WalletConnectV2SessionValidator` | Validator for WalletConnect v2 session URIs. |
| `isConnected` | Whether the underlying socket/session is connected. |
| `onConnect` | Callback invoked when the socket connects. |
| `onDisconnect` | Callback invoked when the socket disconnects. |
| `onText` | Callback invoked on inbound socket text. |
| `request` | URL request used to open the socket / inbound WC request value. |
| `connect` | Opens the socket / connects to a WalletConnect URL. |
| `write` | Writes a text frame to the socket. |
| `walletConnectProtocolResolver` | Resolver picking the v1/v2 protocol for a session. |
| `v2ProtocolEventHandler` | Handler forwarding v2 protocol events. |
| `walletConnectV1Protocol` | Resolved WalletConnect v1 protocol handler. |
| `walletConnectV2Protocol` | Resolved WalletConnect v2 protocol handler. |
| `setup` | Initializes the WalletConnect coordinator/protocol. |
| `getSessions` | Returns the current WalletConnect sessions. |
| `currentProtocol` | Resolves the active protocol from session text/params/ID. |
| `currentProtocolID` | Returns the active WalletConnect protocol identifier. |
| `WalletConnectApproveSessionConnectionParams` | Protocol for session-approval parameters. |
| `WalletConnectV1ApproveSessionConnectionParams` | v1 session-approval parameters. |
| `proposalId` | WalletConnect v2 session proposal identifier. |
| `namespaces` | Approved session namespaces. |
| `WalletConnectV2ApproveSessionConnectionParams` | v2 session-approval parameters. |
| `WalletConnectApproveTransactionRequestParams` | Protocol for transaction-approval parameters. |
| `WalletConnectV1ApproveTransactionRequestParams` | v1 transaction-approval parameters. |
| `v1Request` | Underlying WalletConnect v1 request. |
| `v2Request` | Underlying WalletConnect v2 request. |
| `response` | Encoded WalletConnect v2 result payload. |
| `WalletConnectV2ApproveTransactionRequestParams` | v2 transaction-approval parameters. |
| `WalletConnectExtendSessionConnectionParams` | Protocol for session-extension parameters. |
| `WalletConnectRejectSessionConnectionParams` | Protocol for session-rejection parameters. |
| `WalletConnectV1RejectSessionConnectionParams` | v1 session-rejection parameters. |
| `reason` | Rejection reason for the session/request. |
| `WalletConnectV2RejectSessionConnectionParams` | v2 session-rejection parameters. |
| `WalletConnectRejectTransactionRequestParams` | Protocol for transaction-rejection parameters. |
| `WalletConnectV1RejectTransactionRequestParams` | v1 transaction-rejection parameters. |
| `error` | Transaction error response payload. |
| `WalletConnectV2RejectTransactionRequestParams` | v2 transaction-rejection parameters. |
| `WalletConnectSessionDisconnectionParams` | Protocol for session-disconnection parameters. |
| `WalletConnectV1SessionDisconnectionParams` | v1 session-disconnection parameters. |
| `WalletConnectV2SessionDisconnectionParams` | v2 session-disconnection parameters. |
| `WalletConnectSessionReconnectionParams` | Protocol for session-reconnection parameters. |
| `WalletConnectParams` | Base protocol carrying the current protocol ID for params. |
| `WalletConnectUpdateSessionConnectionParams` | Protocol for session-update parameters. |
| `WalletConnectCoordinator` | Protocol coordinating WalletConnect connect/approve/reject flows. |
| `WalletConnectCoordinatorEvent` | Enum of events emitted by the WC coordinator. |
| `WalletConnectEvent` | Enum of WalletConnect session permission events. |
| `WalletConnectMethod` | Enum of supported WalletConnect RPC methods. |
| `WalletConnectProtocol` | Common protocol implemented by v1 and v2 handlers. |
| `allWalletConnectSessions` | All active WalletConnect v1 sessions. |
| `getWalletConnectSession` | Returns the v1 session for a topic, if any. |
| `resetAllSessions` | Clears all stored WalletConnect sessions. |
| `server` | WalletConnectSwift server delegate callbacks. |
| `clearExpiredSessionsIfNeeded` | Removes expired WalletConnect sessions. |
| `register` | Registers a request handler with the WC server. |
| `reconnect` | Reconnects to an existing WalletConnect session, throwing on failure. |
| `update` | Updates a session with new wallet info, throwing on failure. |
| `WCError` | Error enum for WalletConnect protocol failures. |
| `WalletConnectSession` | Alias for `WalletConnectSwift.Session`. |
| `WalletConnectURL` | Alias for `WCURL`. |
| `WalletConnectServer` | Alias for `WalletConnectSwift.Server`. |
| `WalletConnectRequest` | Alias for `WalletConnectSwift.Request`. |
| `WalletConnectResponse` | Alias for `WalletConnectSwift.Response`. |
| `WalletConnectSessionWalletInfo` | Alias for `WalletConnectSwift.Session.WalletInfo`. |
| `WalletConnectSessionConnectionCompletionHandler` | Completion closure delivering session wallet info. |
| `WalletConnectTopic` | Alias `String` for a WalletConnect topic. |
| `getConnectionDates` | Returns connection dates keyed by session topic. |
| `getPairing` | Returns the pairing for a topic, if any. |
| `configureTransactionsIfNeeded` | Configures v2 transaction handling once. |
| `approveSession` | Approves a v2 session proposal. |
| `rejectSession` | Rejects a v2 session proposal. |
| `extendSession` | Extends a v2 session's expiry. |
| `updateSession` | Updates a v2 session's namespaces. |
| `pingSession` | Pings a v2 session to verify liveness. |
| `WalletConnectV2Event` | Enum of WalletConnect v2 protocol events. |
| `SessionNamespaces` | Alias `[String: SessionNamespace]` of session namespaces. |
| `WalletConnectV2SessionNamespace` | Alias for a v2 `SessionNamespace`. |
| `WalletConnectV2SessionProposal` | Alias for a v2 session proposal. |
| `WalletConnectV2SessionRejectionReason` | Alias for a v2 session rejection reason. |
| `WalletConnectV2Session` | Alias for a v2 `Session`. |
| `WalletConnectV2Request` | Alias for a v2 `Request`. |
| `WalletConnectV2CodableResult` | Alias `AnyCodable` for a v2 result payload. |
| `WalletConnectV2Reason` | Alias for a v2 `Reason`. |
| `WalletConnectV2Account` | Alias for a v2 `Account`. |
| `WalletConnectV2URI` | Alias for a `WalletConnectURI`. |
| `getWalletConnectProtocol` | Resolves the v1/v2 protocol from a session URI or protocol ID. |
| `WalletConnectProtocolResolver` | Protocol resolving the WC protocol for a session. |
| `WalletConnectProtocolID` | Enum identifying the WalletConnect protocol version (v1/v2). |

## Invariants

1. Algorand addresses are exactly `validatedAddressLength` (58) characters; `AlgorandSDK.isValidAddress` is the authority for validity.
2. Amount conversions use fixed constants: 1 Algo equals `algosInMicroAlgos` (1,000,000) microAlgos and Algos use `algosFraction` (6) decimal places.
3. Secrets (mnemonics, private keys, biometric password, backups) are stored only in the keychain via `Session`/`Storable`; non-sensitive preferences live in UserDefaults.
4. `CoreAppConfiguration.shared` must be assigned via `initialize()` before dependent services are resolved.
5. HD wallet derivation always follows BIP44 with `bip44Purpose` 44 and `algorandCoinType` 283.
6. A WalletConnect session URI is acted upon only after the matching validator (`WalletConnectV1/V2SessionValidator`) confirms its prefix, and the resolver selects exactly one protocol (`.v1` or `.v2`) per session.
7. Ledger BLE operations are single-flight: an operation owns one connected peripheral at a time and must `reset()` before reuse.
8. When `CurrencyFormatter.isValueHidden` is true, formatted output is the masked `CurrencyConstanst.hiddenValue` rather than the real amount.

## Behavioral Examples

### Scenario: Format a currency amount with privacy mode on
- **Given** a `CurrencyFormatter` whose `isValueHidden` is true
- **When** `format(_:)` is called with a decimal amount
- **Then** it returns the masked string `*****` instead of the numeric value

### Scenario: Validate an incoming WalletConnect URI
- **Given** a scanned session URI string
- **When** `ALGWalletConnectCoordinator.isValidSession(session:)` is called
- **Then** the resolver picks the v1 or v2 protocol and only a valid URI proceeds to `connectToSession`

### Scenario: Recover HD wallet accounts
- **Given** a mnemonic-backed HD wallet
- **When** `HDWalletService.recoverAccounts` scans derivation paths
- **Then** funded accounts are returned as `RecoverResult` values with address and index metadata

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Bluetooth powered off / unauthorized | `BLEConnectionManager` reports `BLEError` to its delegate |
| Biometric authentication fails or is cancelled | `LocalAuthenticator.authenticate()` throws `LAError` |
| Mnemonic has the wrong word count | `MnemonicsParser.parse` throws `MnemonicsError` |
| HD wallet derivation/SDK failure | HD wallet APIs throw `HDWalletError` |
| Invalid transaction draft | `TransactionSendController.validate()` reports a `TransactionSendControllerError` (algo/asset) to its delegate |
| WalletConnect transaction/data fails validation | `WCTransactionValidator`/`WCArbitraryDataValidator` throw before signing |
| User rejects a Ledger request | The Ledger operation returns `LedgerOperationError` / fires the rejection delegate callback |
| App group container URL unavailable | `makePersistentContainer` throws `URL.AppGroupURLError` |

## Dependencies

| Module | Usage |
|--------|-------|
| Algorand Go SDK | Key generation, signing, and transaction composition via `AlgorandSDK` |
| CoreBluetooth | Ledger device discovery, connection, and APDU transport |
| LocalAuthentication / KeychainAccess | Biometric auth and secure secret storage |
| CoreData | Persistent container for app data (`makePersistentContainer`) |
| Firebase Remote Config | Backs `FeatureFlagService`/`RemoteConfigValue` |
| WalletConnectSwift / WalletConnectSign | v1/v2 session and request transport |
| Macaroon | UI helpers and number input formatting |
| ALGAPI / SharedDataController | Network access and shared account/asset state |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
