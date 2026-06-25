---
module: Analytics
version: 1
status: active
files:
  - PeraWalletCore/Analytics/Core/ALGAnalytics.swift
  - PeraWalletCore/Analytics/Core/ALGAnalyticsCoordinator.swift
  - PeraWalletCore/Analytics/Core/ALGAnalyticsEvent.swift
  - PeraWalletCore/Analytics/Core/ALGAnalyticsLog.swift
  - PeraWalletCore/Analytics/Core/ALGAnalyticsMetadata.swift
  - PeraWalletCore/Analytics/Core/ALGAnalyticsParameterRegulator.swift
  - PeraWalletCore/Analytics/Core/ALGAnalyticsProvider.swift
  - PeraWalletCore/Analytics/Core/ALGAnalyticsScreen.swift
  - PeraWalletCore/Analytics/Events/BuyCryptoEvent.swift
  - PeraWalletCore/Analytics/Events/ChangeCurrencyEvent.swift
  - PeraWalletCore/Analytics/Events/ChangeNotificationFilterEvent.swift
  - PeraWalletCore/Analytics/Events/CompleteTransactionEvent.swift
  - PeraWalletCore/Analytics/Events/CreateNewWalletEvent.swift
  - PeraWalletCore/Analytics/Events/Discover/DiscoverAssetBuyEvent.swift
  - PeraWalletCore/Analytics/Events/Discover/DiscoverAssetSellEvent.swift
  - PeraWalletCore/Analytics/Events/Discover/DiscoverDappDetailEvent.swift
  - PeraWalletCore/Analytics/Events/Discover/DiscoverSearchEvent.swift
  - PeraWalletCore/Analytics/Events/ImportAccountEvent.swift
  - PeraWalletCore/Analytics/Events/JointAccountEvent.swift
  - PeraWalletCore/Analytics/Events/LiquidAuth/WebAuthNPassKeyEvent.swift
  - PeraWalletCore/Analytics/Events/MoonPayEvent.swift
  - PeraWalletCore/Analytics/Events/NameAccountEvent.swift
  - PeraWalletCore/Analytics/Events/OnboardCreateAccountEvent.swift
  - PeraWalletCore/Analytics/Events/OnboardCreateAccountPassphraseEvent.swift
  - PeraWalletCore/Analytics/Events/OnboardSetPinCodeEvent.swift
  - PeraWalletCore/Analytics/Events/OnboardWatchAccountEvent.swift
  - PeraWalletCore/Analytics/Events/OnboardWelcomeScreenEvent.swift
  - PeraWalletCore/Analytics/Events/OpenNotificationEvent.swift
  - PeraWalletCore/Analytics/Events/RecordAccountDetailScreenEvent.swift
  - PeraWalletCore/Analytics/Events/RecordHomeScreenEvent.swift
  - PeraWalletCore/Analytics/Events/RecordMenuScreenEvent.swift
  - PeraWalletCore/Analytics/Events/RegisterAccountEvent.swift
  - PeraWalletCore/Analytics/Events/RekeyAccountEvent.swift
  - PeraWalletCore/Analytics/Events/ShowAssetDetailEvent.swift
  - PeraWalletCore/Analytics/Events/ShowQRCopyEvent.swift
  - PeraWalletCore/Analytics/Events/ShowQRShareCompleteEvent.swift
  - PeraWalletCore/Analytics/Events/ShowQRShareEvent.swift
  - PeraWalletCore/Analytics/Events/SpotBannerEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapBannerLaterEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapBannerTryEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapCompletedEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapEnterNumbersEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapFailedEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapSelectTokenEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapStatusEventMapper.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapV2/SwapV2ConfirmEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapV2/SwapV2HistoryEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapV2/SwapV2ProviderEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapV2/SwapV2SelectAccountEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapV2/SwapV2SelectAssetEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapV2/SwapV2SettingsEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/SwapV2/SwapV2TopPairEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/TapConfirmSwapEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/TapSwapAssetEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/TapSwapInAccountDetailEvent.swift
  - PeraWalletCore/Analytics/Events/Swap/TapSwapInAlgoDetailEvent.swift
  - PeraWalletCore/Analytics/Events/TabBarPressedEvent.swift
  - PeraWalletCore/Analytics/Events/TapAlgoPriceTabEvent.swift
  - PeraWalletCore/Analytics/Events/TapBuyAlgoTabEvent.swift
  - PeraWalletCore/Analytics/Events/TapInQuickActionEvent.swift
  - PeraWalletCore/Analytics/Events/TapNFTReceiveEvent.swift
  - PeraWalletCore/Analytics/Events/TapPassKeyInSettingsEvent.swift
  - PeraWalletCore/Analytics/Events/TapReceiveAssetInDetailEvent.swift
  - PeraWalletCore/Analytics/Events/TapReceiveTabEvent.swift
  - PeraWalletCore/Analytics/Events/TapSendInDetailEvent.swift
  - PeraWalletCore/Analytics/Events/TapSendTabEvent.swift
  - PeraWalletCore/Analytics/Events/WCSessionApprovedEvent.swift
  - PeraWalletCore/Analytics/Events/WCSessionDisconnectedEvent.swift
  - PeraWalletCore/Analytics/Events/WCSessionRejectedEvent.swift
  - PeraWalletCore/Analytics/Events/WCTransactionConfirmedEvent.swift
  - PeraWalletCore/Analytics/Events/WCTransactionDeclinedEvent.swift
  - PeraWalletCore/Analytics/Events/WalletConnect/WCTransactionRequestDidAppearEvent.swift
  - PeraWalletCore/Analytics/Events/WalletConnect/WCTransactionRequestDidLoadEvent.swift
  - PeraWalletCore/Analytics/Events/WalletConnect/WCTransactionRequestReceivedEvent.swift
  - PeraWalletCore/Analytics/Events/WalletConnect/WCTransactionRequestValidatedEvent.swift
  - PeraWalletCore/Analytics/Firebase/FirebaseAnalyticsProvider.swift
  - PeraWalletCore/Analytics/Logs/AssetDetailV2Error.swift
  - PeraWalletCore/Analytics/Logs/AssetListV2Error.swift
  - PeraWalletCore/Analytics/Logs/LedgerAccountSelectionScreenFetchingRekeyingAccountsFailedLog.swift
  - PeraWalletCore/Analytics/Logs/LedgerTransactionErrorLog.swift
  - PeraWalletCore/Analytics/Logs/MediaCleanUpErrorLog.swift
  - PeraWalletCore/Analytics/Logs/MigrationFailureLog.swift
  - PeraWalletCore/Analytics/Logs/PersitentContainerCreationError.swift
  - PeraWalletCore/Analytics/Logs/RecoverAccountWithPassphraseScreenFetchingRekeyingAccountsFailedLog.swift
  - PeraWalletCore/Analytics/Logs/WCTransactionFailToApproveErrorLog.swift
  - PeraWalletCore/Analytics/Logs/WCTransactionFailToConnectErrorLog.swift
  - PeraWalletCore/Analytics/Logs/WCTransactionFailToRejectErrorLog.swift
  - PeraWalletCore/Analytics/Logs/WCTransactionRequestDidAppearLog.swift
  - PeraWalletCore/Analytics/Logs/WCTransactionRequestDidLoadLog.swift
  - PeraWalletCore/Analytics/Logs/WCTransactionRequestReceivedLog.swift
  - PeraWalletCore/Analytics/Logs/WCTransactionRequestSDKErrorLog.swift
  - PeraWalletCore/Analytics/Logs/WCTransactionRequestValidatedLog.swift
  - PeraWalletCore/Analytics/Logs/WCv2SessionConnectionApprovalFailedLog.swift
  - PeraWalletCore/Analytics/Logs/WCv2SessionConnectionFailedLog.swift
  - PeraWalletCore/Analytics/Logs/WCv2SessionConnectionRejectionFailedLog.swift
  - PeraWalletCore/Analytics/Logs/WCv2SessionDisconnectionFailedLog.swift
  - PeraWalletCore/Analytics/Logs/WCv2SessionUpdateFailedLog.swift
  - PeraWalletCore/Analytics/Logs/WCv2TransactionRequestApprovalFailedLog.swift
  - PeraWalletCore/Analytics/Logs/WCv2TransactionRequestRejectionFailedLog.swift
db_tables: []
depends_on:
  - specs/API/API.spec.md
  - specs/Demo/Demo.spec.md
  - specs/Discover/Discover.spec.md
  - specs/Models/Models.spec.md
  - specs/Swap/Swap.spec.md
  - specs/Utils/Utils.spec.md
---

# Analytics

## Purpose

Defines the app's analytics layer for Pera Wallet: a provider-agnostic facade (`ALGAnalytics`/`ALGAnalyticsCoordinator`) that fans out user-action events, screen views, and error logs to one or more analytics providers. The module owns the catalog of tracked event names, screen names, and metadata keys, plus the strongly-typed event and log value types that callers across the app emit. The default coordinator routes events and screen views to Firebase Analytics and routes error logs to Firebase Crashlytics. Event/log payloads carry a bounded metadata dictionary and are normalized (length-regulated, testnet-prefixed) before being sent downstream.

## Public API

| Export | Description |
|--------|-------------|
| `ALGAnalytics` | Facade protocol (refines `Analytics`) exposing `record(_:)`, `track(_:)`, and screen tracking; fans calls out to all configured `ALGAnalyticsProvider`s. |
| `record` | Sends an `ALGAnalyticsLog` to every provider whose `canRecord` returns true (error/crash reporting path). |
| `track` | Sends an event, screen, or raw event string with payload to every provider whose `canTrack` returns true. |
| `providers` | The ordered list of `AnalyticsProvider`s the coordinator dispatches to. |
| `init` | Builds an `ALGAnalyticsCoordinator`; default uses Firebase, or an explicit provider list can be supplied. |
| `ALGAnalyticsEvent` | Protocol for a strongly-typed user-action event with an `ALGAnalyticsEventName` and `ALGAnalyticsMetadata`. |
| `ALGAnalyticsEventName` | String-backed enum cataloging every tracked event; `rawValue` maps each case to its provider-facing key. |
| `rawValue` | Provider-facing key for an event name; prefixes `t_` on testnet to separate testnet traffic. |
| `webViewV2Log` | Passthrough helper returning a web-view event string unchanged for forwarding to providers. |
| `hash` | Hashes the name/key enums by their `rawValue` for use in sets and dictionaries. |
| `ALGAnalyticsLog` | Protocol for a strongly-typed error/diagnostic log with a `ALGAnalyticsLogName` and metadata, recorded as a crash report. |
| `ALGAnalyticsLogName` | String-backed enum cataloging every recordable error log name. |
| `code` | Stable integer code per log name, used as the `NSError` code when recording to Crashlytics. |
| `ALGAnalyticsMetadata` | Typealias for `[ALGAnalyticsMetadataKey: Any]`, the metadata dictionary attached to events and logs. |
| `ALGAnalyticsMetadataKey` | String-backed enum of all metadata parameter keys; `rawValue` is the provider-facing parameter name. |
| `ALGAnalyticsParameterRegulator` | Protocol providing `regulate(_:)` to bound parameter string lengths before sending. |
| `regulate` | Truncates a parameter string to its first 99 characters to satisfy provider limits. |
| `ALGAnalyticsScreen` | Value type representing a screen view with a name and metadata; constructible from `ALGAnalyticsScreenName` or a raw string. |
| `name` | The event/log/screen name carried by the value type. |
| `metadata` | The metadata dictionary carried by the event/log/screen value type. |
| `ALGAnalyticsScreenName` | String-backed enum of tracked screen identifiers (e.g. account list, asset detail, show QR). |
| `BuyCryptoEvent` | Event for selecting a buy-crypto provider (Meld or Bidali). |
| `buyCryptoSelected` | Factory building a `BuyCryptoEvent` for the chosen buy-crypto provider type. |
| `ChangeCurrencyEvent` | Event recording a change of the app's display currency. |
| `changeCurrency` | Factory building a `ChangeCurrencyEvent` with the selected currency. |
| `ChangeNotificationFilterEvent` | Event recording a change to the notification filter setting. |
| `changeNotificationFilter` | Factory building a `ChangeNotificationFilterEvent`. |
| `CompleteTransactionEvent` | Event recording a completed transaction with account type, asset, amount, max flag, and tx id. |
| `completeStandardTransaction` | Factory building a `CompleteTransactionEvent` from an Algo/asset send draft and transaction id. |
| `completeCollectibleTransaction` | Factory building a `CompleteTransactionEvent` for a collectible (NFT) send. |
| `CreateNewWalletEvent` | Event recording creation of a new wallet from the welcome flow. |
| `createNewWallet` | Factory building a `CreateNewWalletEvent`. |
| `DiscoverAssetBuyEvent` | Event recording a buy action initiated from the Discover asset detail. |
| `buyAssetFromDiscover` | Factory building a `DiscoverAssetBuyEvent`. |
| `DiscoverAssetSellEvent` | Event recording a sell action initiated from the Discover asset detail. |
| `sellAssetFromDiscover` | Factory building a `DiscoverAssetSellEvent`. |
| `DiscoverDappDetailEvent` | Event recording a dApp detail page visit from Discover. |
| `discoverDappDetail` | Factory building a `DiscoverDappDetailEvent` with dApp name/URL. |
| `DiscoverSearchEvent` | Event recording a search query in Discover markets. |
| `searchDiscover` | Factory building a `DiscoverSearchEvent` with the query. |
| `ImportAccountEvent` | Event recording an account import from the welcome flow. |
| `importAccount` | Factory building an `ImportAccountEvent`. |
| `JointAccountEvent` | Event covering the joint (multisig) account lifecycle actions, keyed by a `Type` case. |
| `jointAccount` | Factory building a `JointAccountEvent` for the given joint-account action type. |
| `WebAuthNPassKeyEvent` | Event for WebAuthn passkey lifecycle actions (added, used, deleted). |
| `webAuthNPassKeyAdded` | Factory building a `WebAuthNPassKeyEvent` for a passkey added. |
| `webAuthNPassKeyUsed` | Factory building a `WebAuthNPassKeyEvent` for a passkey used. |
| `webAuthNPassKeyDeleted` | Factory building a `WebAuthNPassKeyEvent` for a passkey deleted. |
| `MeldEvent` | Event recording a tap to buy Algo via the Meld provider. |
| `meld` | Factory building a `MeldEvent`. |
| `MoonPayEvent` | Event for MoonPay buy actions, keyed by a `Type` case (tap buy, completed, bottom-sheet buy). |
| `moonPay` | Factory building a `MoonPayEvent` for the given MoonPay action type. |
| `NameAccountEvent` | Event recording naming of an account during onboarding. |
| `nameAccount` | Factory building a `NameAccountEvent`. |
| `OnboardCreateAccountEvent` | Event for create-account onboarding steps. |
| `onboardCreateAccount` | Factory building an `OnboardCreateAccountEvent` for the given onboarding step. |
| `OnboardCreateAccountPassphraseEvent` | Event for the passphrase steps of create-account onboarding. |
| `onboardCreateAccountPassphrase` | Factory building an `OnboardCreateAccountPassphraseEvent` for the given passphrase step. |
| `OnboardSetPinCodeEvent` | Event for the set-PIN-code onboarding steps. |
| `onboardSetPinCode` | Factory building an `OnboardSetPinCodeEvent`. |
| `OnboardWatchAccountEvent` | Event for the watch-account creation onboarding steps. |
| `onboardWatchAccount` | Factory building an `OnboardWatchAccountEvent`. |
| `OnboardWelcomeScreenEvent` | Event for actions on the onboarding welcome screen (create vs. recover). |
| `onboardWelcomeScreen` | Factory building an `OnboardWelcomeScreenEvent`. |
| `OpenNotificationEvent` | Event recording the opening of a push notification, carrying its id/URL. |
| `openNotification` | Factory building an `OpenNotificationEvent`. |
| `RecordAccountDetailScreenEvent` | Event for taps within the account detail screen. |
| `recordAccountDetailScreen` | Factory building a `RecordAccountDetailScreenEvent` for the given action. |
| `RecordHomeScreenEvent` | Event for taps within the home screen. |
| `recordHomeScreen` | Factory building a `RecordHomeScreenEvent` for the given action. |
| `RecordMenuScreenEvent` | Event for taps within the menu screen. |
| `recordMenuScreen` | Factory building a `RecordMenuScreenEvent` for the given action. |
| `RegisterAccountEvent` | Event recording an account registration, tagged with its `RegistrationType`. |
| `registerAccount` | Factory building a `RegisterAccountEvent` for the given registration type. |
| `RegistrationType` | Enum of registration types (create, ledger, recover, rekeyed, watch). |
| `RekeyAccountEvent` | Event recording a rekey operation on an account. |
| `rekeyAccount` | Factory building a `RekeyAccountEvent`. |
| `ShowAssetDetailEvent` | Event recording opening of an asset detail screen. |
| `showAssetDetail` | Factory building a `ShowAssetDetailEvent` with the asset id. |
| `ShowQRCopyEvent` | Event recording a copy action on the show-QR screen. |
| `showQRCopy` | Factory building a `ShowQRCopyEvent`. |
| `ShowQRShareCompleteEvent` | Event recording completion of a QR share. |
| `showQRShareComplete` | Factory building a `ShowQRShareCompleteEvent`. |
| `ShowQRShareEvent` | Event recording a share action on the show-QR screen. |
| `showQRShare` | Factory building a `ShowQRShareEvent`. |
| `SpotBannerEvent` | Event recording interaction with a home-screen spot banner. |
| `spotBannerPressed` | Factory building a `SpotBannerEvent` for a banner press or close. |
| `SwapBannerLaterEvent` | Event recording dismissal ("later") of the swap promo banner. |
| `swapBannerLater` | Factory building a `SwapBannerLaterEvent`. |
| `SwapBannerTryEvent` | Event recording the "try swap" action on the swap promo banner. |
| `swapBannerTry` | Factory building a `SwapBannerTryEvent`. |
| `SwapCompletedEvent` | Event recording a completed swap with full in/out asset, amount, and fee metadata. |
| `swapCompleted` | Factory building a `SwapCompletedEvent` from a quote, parsed transactions, and currency. |
| `SwapEnterNumbersEvent` | Event recording entry of a swap amount. |
| `swapEnterNumbers` | Factory building a `SwapEnterNumbersEvent`. |
| `SwapFailedEvent` | Event recording a failed swap with in/out asset, amount, and fee metadata. |
| `swapFailed` | Factory building a `SwapFailedEvent` from a quote, parsed transactions, and currency. |
| `SwapSelectTokenEvent` | Event recording selection of the from/to swap token. |
| `swapSelectToken` | Factory building a `SwapSelectTokenEvent` for the selected side. |
| `SwapV2ConfirmEvent` | Swap V2 event recording a swap confirmation. |
| `swapV2ConfirmEvent` | Factory building a `SwapV2ConfirmEvent`. |
| `SwapV2HistoryEvent` | Swap V2 event for swap history interactions. |
| `swapV2HistoryEvent` | Factory building a `SwapV2HistoryEvent`. |
| `SwapV2ProviderEvent` | Swap V2 event for swap provider selection interactions. |
| `swapV2ProviderEvent` | Factory building a `SwapV2ProviderEvent`. |
| `SwapV2SelectAccountEvent` | Swap V2 event for opening the swap account selector. |
| `swapV2SelectAccountEvent` | Factory building a `SwapV2SelectAccountEvent`. |
| `SwapV2SelectAssetEvent` | Swap V2 event for selecting a swap asset. |
| `swapV2SelectAssetEvent` | Factory building a `SwapV2SelectAssetEvent`. |
| `SwapV2SettingsEvent` | Swap V2 event for swap settings interactions. |
| `swapV2SettingsEvent` | Factory building a `SwapV2SettingsEvent`. |
| `SwapV2TopPairEvent` | Swap V2 event for selecting a top trading pair. |
| `swapV2TopPairEvent` | Factory building a `SwapV2TopPairEvent`. |
| `TapConfirmSwapEvent` | Event recording the confirm-swap tap on the swap screen. |
| `tapConfirmSwap` | Factory building a `TapConfirmSwapEvent`. |
| `TapSwapAssetEvent` | Event recording a tap to swap a specific asset. |
| `tapSwapAsset` | Factory building a `TapSwapAssetEvent`. |
| `TapSwapInAlgoDetailEvent` | Event recording a swap tap from the Algo detail screen. |
| `tapSwapInAlgoDetail` | Factory building a `TapSwapInAlgoDetailEvent`. |
| `TabBarPressedEvent` | Event recording a tab-bar item press, keyed by the destination tab. |
| `tabBarPressed` | Factory building a `TabBarPressedEvent` for the pressed tab. |
| `TapAlgoPriceTabEvent` | Event recording a tap on the Algo price menu/tab. |
| `tapAlgoPrice` | Factory building a `TapAlgoPriceTabEvent`. |
| `TapBuyAlgoTabEvent` | Event recording a tap on the buy-Algo tab. |
| `tapBuyAlgoTab` | Factory building a `TapBuyAlgoTabEvent`. |
| `TapInQuickActionEvent` | Event recording a quick-action sheet tap (e.g. browse dApps, stake, swap). |
| `tapInQuickAction` | Factory building a `TapInQuickActionEvent` for the given quick action. |
| `TapNFTReceiveEvent` | Event recording a tap to receive an NFT. |
| `tapNFTReceive` | Factory building a `TapNFTReceiveEvent`. |
| `TapPassKeyInSettingsEvent` | Event recording a tap on the passkeys row in settings. |
| `tapPassKeyInSettings` | Factory building a `TapPassKeyInSettingsEvent`. |
| `TapReceiveAssetInDetailEvent` | Event recording a receive tap from the asset detail screen. |
| `tapReceiveAssetInDetail` | Factory building a `TapReceiveAssetInDetailEvent`. |
| `TapReceiveTabEvent` | Event recording a tap on the receive tab. |
| `tapReceiveTab` | Factory building a `TapReceiveTabEvent`. |
| `TapSendInDetailEvent` | Event recording a send tap from the asset detail screen. |
| `tapSendInDetail` | Factory building a `TapSendInDetailEvent`. |
| `TapSendTabEvent` | Event recording a tap on the send tab. |
| `tapSendTab` | Factory building a `TapSendTabEvent`. |
| `WCSessionApprovedEvent` | Event recording approval of a WalletConnect session. |
| `wcSessionApproved` | Factory building a `WCSessionApprovedEvent` with the dApp/session info. |
| `WCSessionDisconnectedEvent` | Event recording disconnection of a WalletConnect session. |
| `wcSessionDisconnected` | Factory building a `WCSessionDisconnectedEvent`. |
| `WCSessionRejectedEvent` | Event recording rejection of a WalletConnect session request. |
| `wcSessionRejected` | Factory building a `WCSessionRejectedEvent`. |
| `WCTransactionConfirmedEvent` | Event recording confirmation of a WalletConnect transaction request. |
| `wcTransactionConfirmed` | Factory building a `WCTransactionConfirmedEvent`. |
| `WCTransactionDeclinedEvent` | Event recording decline of a WalletConnect transaction request. |
| `wcTransactionDeclined` | Factory building a `WCTransactionDeclinedEvent`. |
| `WCTransactionRequestDidAppearEvent` | Event recording that a WalletConnect transaction request UI appeared. |
| `wcTransactionRequestDidAppear` | Factory building a `WCTransactionRequestDidAppearEvent`. |
| `WCTransactionRequestDidLoadEvent` | Event recording that a WalletConnect transaction request finished loading. |
| `wcTransactionRequestDidLoad` | Factory building a `WCTransactionRequestDidLoadEvent`. |
| `WCTransactionRequestReceivedEvent` | Event recording receipt of a WalletConnect transaction request. |
| `wcTransactionRequestReceived` | Factory building a `WCTransactionRequestReceivedEvent`. |
| `WCTransactionRequestValidatedEvent` | Event recording validation of a WalletConnect transaction request. |
| `wcTransactionRequestValidated` | Factory building a `WCTransactionRequestValidatedEvent`. |
| `AssetDetailV2Error` | Error log for failures in the V2 asset detail screen. |
| `assetDetailV2Error` | Factory building an `AssetDetailV2Error` log with an error description. |
| `AssetListV2Error` | Error log for failures in the V2 asset list screen. |
| `assetListV2Error` | Factory building an `AssetListV2Error` log with an error description. |
| `LedgerAccountSelectionScreenFetchingRekeyingAccountsFailedLog` | Error log for failure to fetch rekeying accounts on the Ledger account-selection screen. |
| `ledgerAccountSelectionScreenFetchingRekeyingAccountsFailed` | Factory building the Ledger account-selection rekeying-fetch-failure log. |
| `NonAcceptanceLedgerTransactionErrorLog` | Error log for a Ledger transaction non-acceptance/rejection failure. |
| `nonAcceptanceLedgerTransaction` | Factory building a `NonAcceptanceLedgerTransactionErrorLog`. |
| `MediaCleanUpErrorLog` | Error log for a media cache cleanup failure. |
| `mediaCleanUpError` | Factory building a `MediaCleanUpErrorLog`. |
| `MigrationFailureLog` | Error log for a data-migration failure. |
| `migrationFailure` | Factory building a `MigrationFailureLog` with failure details. |
| `PersitentContainerCreationError` | Error log for failure creating the Core Data persistent container. |
| `persistentContainerCreationError` | Factory building a `PersitentContainerCreationError` log. |
| `RecoverAccountWithPassphraseScreenFetchingRekeyingAccountsFailedLog` | Error log for failure to fetch rekeying accounts on the recover-with-passphrase screen. |
| `recoverAccountWithPassphraseScreenFetchingRekeyingAccountsFailed` | Factory building the recover-with-passphrase rekeying-fetch-failure log. |
| `WCTransactionRequestDidAppearLog` | Error/diagnostic log recording that a WalletConnect transaction request appeared. |
| `WCTransactionRequestDidLoadLog` | Error/diagnostic log recording that a WalletConnect transaction request loaded. |
| `WCTransactionRequestReceivedLog` | Error/diagnostic log recording receipt of a WalletConnect transaction request. |
| `WCTransactionRequestSDKErrorLog` | Error log for a WalletConnect SDK error during a transaction request. |
| `wcTransactionRequestSDKError` | Factory building a `WCTransactionRequestSDKErrorLog`. |
| `WCTransactionRequestValidatedLog` | Error/diagnostic log recording validation of a WalletConnect transaction request. |
| `WCv2SessionConnectionApprovalFailedLog` | Error log for a WalletConnect v2 session approval failure. |
| `wcV2SessionConnectionApprovalFailedLog` | Factory building a `WCv2SessionConnectionApprovalFailedLog`. |
| `WCv2SessionConnectionFailedLog` | Error log for a WalletConnect v2 session connection failure. |
| `wcV2SessionConnectionFailedLog` | Factory building a `WCv2SessionConnectionFailedLog`. |
| `WCv2SessionConnectionRejectionFailedLog` | Error log for a WalletConnect v2 session rejection failure. |
| `wcV2SessionConnectionRejectionFailedLog` | Factory building a `WCv2SessionConnectionRejectionFailedLog`. |
| `WCv2SessionDisconnectionFailedLog` | Error log for a WalletConnect v2 session disconnection failure. |
| `wcV2SessionDisconnectionFailedLog` | Factory building a `WCv2SessionDisconnectionFailedLog`. |
| `WCv2SessionUpdateFailedLog` | Error log for a WalletConnect v2 session update failure. |
| `wcV2SessionUpdateFailedLog` | Factory building a `WCv2SessionUpdateFailedLog`. |
| `WCv2TransactionRequestApprovalFailedLog` | Error log for a WalletConnect v2 transaction request approval failure. |
| `wcV2TransactionRequestApprovalFailedLog` | Factory building a `WCv2TransactionRequestApprovalFailedLog`. |
| `WCv2TransactionRequestRejectionFailedLog` | Error log for a WalletConnect v2 transaction request rejection failure. |
| `wcV2TransactionRequestRejectionFailedLog` | Factory building a `WCv2TransactionRequestRejectionFailedLog`. |

## Invariants

1. The default `ALGAnalyticsCoordinator()` always dispatches through the Firebase provider; supplying a custom provider list overrides the entire set.
2. `record(_:)` and `track(_:)` only dispatch to a provider when that provider's corresponding `canRecord`/`canTrack` returns true.
3. Every `ALGAnalyticsEventName` case has exactly one provider-facing `rawValue`, and on testnet that value is prefixed with `t_` so testnet traffic is separable.
4. Every `ALGAnalyticsLogName` case has a unique, stable integer `code` used as the recorded `NSError` code.
5. Parameter strings passed through `regulate(_:)` never exceed 99 characters when sent to providers.
6. Event and log value types are immutable: `name` and `metadata` are set at construction and never mutated afterward.
7. Metadata is keyed by `ALGAnalyticsMetadataKey`; only the key's `rawValue` is sent as the provider parameter name.

## Behavioral Examples

### Scenario: Tracking a completed transaction
- **Given** a configured `ALGAnalytics` instance and a standard Algo send draft with a transaction id
- **When** the caller does `analytics.track(.completeStandardTransaction(draft:transactionId:))`
- **Then** a `completeTransaction` event with account-type, asset, amount, isMax, and tx-id metadata is logged to every provider that can track it

### Scenario: Recording an error log
- **Given** the default coordinator (Firebase provider)
- **When** the caller does `analytics.record(.migrationFailure(...))`
- **Then** an `NSError` with domain `MigrationFailure` and the log name's `code` is recorded to Crashlytics with the regulated metadata as user info

### Scenario: Testnet event naming
- **Given** the API is configured for testnet
- **When** any event's `name.rawValue` is read
- **Then** the returned key is prefixed with `t_` (e.g. `t_transaction`) to isolate testnet analytics

## Error Cases

| Condition | Behavior |
|-----------|----------|
| No provider returns true from `canTrack`/`canRecord` | Event/log is silently dropped (no-op) |
| Swap quote missing required in/out assets or amounts | Swap event is built with empty metadata rather than throwing |
| Transaction draft type cannot be determined | A default `completeTransaction` event with standard account type and zeroed amount is emitted |
| Parameter string longer than 99 characters | Truncated to the first 99 characters by `regulate(_:)` |
| Optional metadata value (e.g. asset id, amount) absent | A safe default is substituted (e.g. `"algos"`, `0`) instead of omitting the key |

## Dependencies

| Module | Usage |
|--------|-------|
| MacaroonVendors | Base `Analytics`, `AnalyticsProvider`, `AnalyticsEvent`, `AnalyticsScreen`, `AnalyticsMetadata` abstractions the module refines |
| Firebase / FirebaseAnalytics | Default event and screen tracking backend via `FirebaseAnalyticsProvider` |
| Firebase Crashlytics | Backend for recording `ALGAnalyticsLog` error logs as `NSError`s |
| MacaroonUtils | `asyncMain` dispatch and utility helpers used by the Firebase provider |
| CoreAppConfiguration | Provides the testnet flag that toggles the `t_` event-name prefix |
| App transaction/swap models | Source draft, quote, and currency types consumed by event factories (e.g. `TransactionSendDraft`, `SwapQuote`, `CurrencyProvider`) |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
