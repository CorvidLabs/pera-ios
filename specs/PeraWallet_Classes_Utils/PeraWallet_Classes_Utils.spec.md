---
module: PeraWallet_Classes_Utils
version: 1
status: active
files:
  - PeraWallet/Classes/Utils/AppStoreReview/AlgorandAppStoreReviewer.swift
  - PeraWallet/Classes/Utils/AppStoreReview/Main/AppStoreReviewer.swift
  - PeraWallet/Classes/Utils/ARC59/ARC59SendTransactionDataBuilder.swift
  - PeraWallet/Classes/Utils/ARC59/ARC59SendTransactionSigner.swift
  - PeraWallet/Classes/Utils/ARC59/ARC59TransactionSendController.swift
  - PeraWallet/Classes/Utils/Assets/AssetCachable.swift
  - PeraWallet/Classes/Utils/Banner/ActionableBanner/ActionableBannerDraft.swift
  - PeraWallet/Classes/Utils/Banner/ActionableBanner/ActionableBannerView.swift
  - PeraWallet/Classes/Utils/Banner/ActionableBanner/ActionableBannerViewModel.swift
  - PeraWallet/Classes/Utils/Banner/ActionableBanner/ActionableBannerViewTheme.swift
  - PeraWallet/Classes/Utils/Banner/ActionableBanner/BottomActionableBannerController.swift
  - PeraWallet/Classes/Utils/Banner/ActionableBanner/BottomActionableBannerControllerConfiguration.swift
  - PeraWallet/Classes/Utils/Banner/ActionableBanner/FetchErrorActionableBannerViewModel.swift
  - PeraWallet/Classes/Utils/Banner/BannerController.swift
  - PeraWallet/Classes/Utils/Banner/BannerDraft.swift
  - PeraWallet/Classes/Utils/Banner/BannerErrorViewModel.swift
  - PeraWallet/Classes/Utils/Banner/BannerInAppNotificationViewModel.swift
  - PeraWallet/Classes/Utils/Banner/BannerInfoViewModel.swift
  - PeraWallet/Classes/Utils/Banner/BannerSuccessViewModel.swift
  - PeraWallet/Classes/Utils/Banner/BannerView.swift
  - PeraWallet/Classes/Utils/Banner/BannerViewCommonLayoutSheet.swift
  - PeraWallet/Classes/Utils/Banner/BannerViewLayoutSheet.swift
  - PeraWallet/Classes/Utils/Banner/BannerViewModel.swift
  - PeraWallet/Classes/Utils/Banner/BannerViewStyleSheet.swift
  - PeraWallet/Classes/Utils/Banner/BannerViewTheme.swift
  - PeraWallet/Classes/Utils/Configuration/AppConfiguration.swift
  - PeraWallet/Classes/Utils/Configuration/ViewControllerConfiguration.swift
  - PeraWallet/Classes/Utils/Extensions/Core/Session+UI.swift
  - PeraWallet/Classes/Utils/Extensions/Flow/UIViewController+Additions.swift
  - PeraWallet/Classes/Utils/Extensions/Flow/UIViewController+Flow.swift
  - PeraWallet/Classes/Utils/Extensions/Foundation/Text/String+Image.swift
  - PeraWallet/Classes/Utils/Extensions/Foundation/Text/String+Typography.swift
  - PeraWallet/Classes/Utils/Extensions/Foundation/Text/Typography.swift
  - PeraWallet/Classes/Utils/Extensions/Foundation/URL/URL+Extensions.swift
  - PeraWallet/Classes/Utils/Extensions/Foundation/URL/URL+Link.swift
  - PeraWallet/Classes/Utils/Extensions/Macaroon/ImageSource+Size.swift
  - PeraWallet/Classes/Utils/Extensions/Macaroon/JSONModel+Extensions.swift
  - PeraWallet/Classes/Utils/Extensions/Macaroon/RegexValidator+Extensions.swift
  - PeraWallet/Classes/Utils/Extensions/Macaroon/UIButton+Extensions.swift
  - PeraWallet/Classes/Utils/Extensions/Macaroon/UICollectionView+Extensions.swift
  - PeraWallet/Classes/Utils/Extensions/Macaroon/UILabel+Extensions.swift
  - PeraWallet/Classes/Utils/Extensions/UIImage/UIImage+UIPasteboard.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/Application/UIApplication+Additions.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/Core/UIView+Additions.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/Factory/UIButton+Factory.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/Factory/UILabel+Factory.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/Factory/ViewFactory.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/Gesture/UIPanGestureRecognizer+Additions.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/Gesture/UITapGestureRecognizer+LabelRange.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/Layout/UIEdgeInsets+Additions.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/Layout/UIView+Animation.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/Layout/UIView+Layout.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/Layout/UIView+SafeArea.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/Layout/UIViewController+Layout.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/List/UICollectionView+Additions.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/List/UICollectionViewDiffableDataSource+Additions.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/List/UIStackView+Additions.swift
  - PeraWallet/Classes/Utils/Extensions/UIKit/TextView/UITextView+Additions.swift
  - PeraWallet/Classes/Utils/Extensions/Webview/WKScriptMessage/WKScriptMessage+JSON.swift
  - PeraWallet/Classes/Utils/Extensions/Webview/WKScriptMessage/WKScriptMessage+Validation.swift
  - PeraWallet/Classes/Utils/Extensions/Webview/WKWebView/WKWebView+Message.swift
  - PeraWallet/Classes/Utils/ImagePicker/ImagePicker.swift
  - PeraWallet/Classes/Utils/MediaCleaner/MediaCleaner.swift
  - PeraWallet/Classes/Utils/NavigationBar/ALGBarButtonItem.swift
  - PeraWallet/Classes/Utils/NavigationBar/BarButton.swift
  - PeraWallet/Classes/Utils/NavigationBar/BarButtonItem.swift
  - PeraWallet/Classes/Utils/NavigationBar/NavigationBarConfigurable.swift
  - PeraWallet/Classes/Utils/NavigationBar/NavigationBarLargeTitleConfigurable.swift
  - PeraWallet/Classes/Utils/NavigationBar/NavigationBarLargeTitleController.swift
  - PeraWallet/Classes/Utils/NavigationBar/NavigationBarLargeTitleView.swift
  - PeraWallet/Classes/Utils/NavigationBar/NavigationBarTitleView.swift
  - PeraWallet/Classes/Utils/StatusBar/StatusBarConfigurable.swift
  - PeraWallet/Classes/Utils/Tooltip/TooltipUIController.swift
  - PeraWallet/Classes/Utils/Tooltip/TooltipView.swift
  - PeraWallet/Classes/Utils/Tooltip/TooltipViewModel.swift
  - PeraWallet/Classes/Utils/Tooltip/TooltipViewTheme.swift
  - PeraWallet/Classes/Utils/Transaction/DataBuilder/AlgoTransactionDataBuilder.swift
  - PeraWallet/Classes/Utils/Transaction/DataBuilder/AssetTransactionDataBuilder.swift
  - PeraWallet/Classes/Utils/Transaction/DataBuilder/KeyRegTransactionDataBuilder.swift
  - PeraWallet/Classes/Utils/Transaction/DataBuilder/OptInAndSendTransactionDataBuilder.swift
  - PeraWallet/Classes/Utils/Transaction/DataBuilder/OptInTransactionDataBuilder.swift
  - PeraWallet/Classes/Utils/Transaction/DataBuilder/OptOutTransactionDataBuilder.swift
  - PeraWallet/Classes/Utils/Transaction/DataBuilder/RekeyTransactionDataBuilder.swift
  - PeraWallet/Classes/Utils/Transaction/DataBuilder/TransactionDataBuildable.swift
  - PeraWallet/Classes/Utils/Transaction/DataBuilder/TransactionDataItem.swift
  - PeraWallet/Classes/Utils/Transaction/Fee/TransactionFeeCalculator.swift
  - PeraWallet/Classes/Utils/Transaction/TransactionController.swift
  - PeraWallet/Classes/Utils/Transaction/TransactionControllerDelegate.swift
  - PeraWallet/Classes/Utils/Transition/BottomSheet/BottomSheetTransition.swift
  - PeraWallet/Classes/Utils/Transition/BottomSheet/BottomSheetTransitionController.swift
  - PeraWallet/Classes/Utils/UI/Interface/DarkMode/UserInterfaceChangable.swift
  - PeraWallet/Classes/Utils/UI/Keyboard/KeyboardController.swift
  - PeraWallet/Classes/Utils/UI/Pasteboard/UIPasteboard+Address.swift
  - PeraWallet/Classes/Utils/Validators/NoteSizeValidator.swift
  - PeraWallet/Classes/Utils/Validators/Rekeying/RekeyingValidator.swift
  - PeraWallet/Classes/Utils/Validators/SlippageToleranceValidator.swift
  - PeraWallet/Classes/Utils/Validators/TransactionSignature/TransactionSignatureValidation.swift
  - PeraWallet/Classes/Utils/Validators/TransactionSignature/TransactionSignatureValidator.swift
  - PeraWallet/Classes/Utils/WalletConnect/Management/Action/WCSingleTransactionViewControllerActionable.swift
  - PeraWallet/Classes/Utils/WalletConnect/Management/Action/WCSingleTransactionViewControllerAssetActionable.swift
  - PeraWallet/Classes/Utils/WalletConnect/Management/Asset/WCSingleTransactionViewControllerAssetManagable.swift
  - PeraWallet/Classes/Utils/WalletConnect/Present/WalletConnectSingleTransactionRequestPresentable.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Utils

## Purpose

App-target shared utility layer (`PeraWallet/Classes/Utils`) for the Pera Wallet iOS app. It is not a screen/feature flow of its own; instead it provides the cross-cutting building blocks that almost every feature screen depends on. The major areas are:

- **Transaction composing & signing** — `TransactionController` orchestrates building unsigned transactions (via the per-type `*TransactionDataBuilder`s: algo, asset, opt-in, opt-out, opt-in-and-send, rekey, keyreg), routing each to the correct signer (Algo25 private-key, HD wallet seed, or Ledger BLE), calculating fees with `TransactionFeeCalculator`, uploading via `TransactionAPIConnector`, and reporting progress through `TransactionControllerDelegate`. `ARC59TransactionSendController` / `ARC59SendTransactionSigner` / `ARC59SendTransactionDataBuilder` handle the ARC-59 "send to a not-yet-opted-in account" inbox flow with grouped, sequentially-uploaded transactions.
- **In-app messaging** — `BannerController` (built on `MacaroonBanner`) enqueues error / success / info / in-app-notification banners; `BottomActionableBannerController` shows actionable bottom banners (e.g. a fetch-error retry).
- **Navigation & presentation infrastructure** — `BottomSheetTransition` / `BottomSheetTransitionController` for interactive bottom-sheet presentation, the `NavigationBar*` family (large-title controller, custom bar-button items, title views), `UIViewController+Flow`/`+Additions` open/dismiss helpers, and `KeyboardController`.
- **Dependency injection** — `ViewControllerConfiguration` is the bag of app-wide services (API, session, `SharedDataController`, banner/loading controllers, `PeraConnect`, analytics, feature flags, HD wallet services) handed to every `BaseViewController`; `AppConfiguration` holds the app-level singletons.
- **Validators & helpers** — `RekeyingValidator`, `TransactionSignatureValidator`, `NoteSizeValidator`, `SlippageToleranceValidator`; WalletConnect single-transaction presentation/routing protocols; `Tooltip*`, `ImagePicker`, `MediaCleaner`, `AlgorandAppStoreReviewer`, and a large set of UIKit/Foundation/Macaroon/WebKit extensions.

Ownership boundary: this module owns app-side UI plumbing and transaction-flow orchestration on the device. The domain models, networking (`ALGAPI`), `SharedDataController`, account/asset models, SDK signing primitives, and Ledger/HD-wallet operations live in `pera_wallet_core` (the `PeraWalletCore` framework); Utils composes and drives them. Almost all types are `internal`; only a handful (e.g. `MediaCleaner`) are `public`.

## Public API

| Export | Description |
|--------|-------------|
| `openInBrowser` | Opens the given URL in the system browser, no-op if the URL is malformed or not openable. |
| `prepareForReuse` | Resets a reusable view's content (e.g. clears a `UILabel`'s text) before reuse in a list/collection. |
| `customizeAppearance` | Applies the given style sheet to a `ViewComposable` view's appearance. |
| `prepareLayout` | Builds a `ViewComposable` view's layout from the given layout sheet. |
| `dequeueHeader` | Dequeues and type-casts a reusable section-header supplementary view for the given index path. |
| `dequeueFooter` | Dequeues and type-casts a reusable section-footer supplementary view for the given index path. |
| `copyToClipboard` | Copies the image to the general system pasteboard. |
| `MediaCleaner` | One-time cleanup utility that removes stale temporary media files and clears the image cache. |

## Invariants

1. **No upload of unsigned transactions.** `TransactionController.uploadTransaction` only appends a transaction's `signedTransaction` data; a transaction is considered complete only when `transactions.allSatisfy { $0.signedTransaction != nil }`. Signing must finish for every member of the group before upload.
2. **Signing routes by account capability.** For each signer account the controller picks exactly one path: Ledger BLE (`hasLedgerDetail()` / `requiresLedgerConnection()`), HD-wallet seed (`isHDAccount`), or Algo25 private key — never more than one. Rekeyed accounts have their auth account's ledger/HD detail substituted before signing.
3. **Signature pre-validation gates the flow.** `canSignTransaction(for:)` runs `TransactionSignatureValidator` (and `RekeyingValidator` for rekey) before composing; on failure it presents an error banner via `BannerController` and returns `false`, so unsignable accounts never reach composing/upload. Joint accounts bypass this gate (their participants are validated individually).
4. **Ledger timeout is bounded.** When a Ledger connection is required, a 20-second timer fires `didFailedComposing(.inapp(.ledgerConnection))` and presents a BLE error banner if no signature arrives, preventing an indefinitely hung sign flow.
5. **ARC-59 group uploads are ordered and atomic-on-failure.** `ARC59TransactionSendController` chains `TransactionUploadAndWaitOperation`s with `addDependency` so groups upload sequentially; any failure/cancel cancels all remaining operations on the queue.
6. **WalletConnect requests must map to a known type.** `WalletConnectSingleTransactionRequestPresentable` rejects the WC v1/v2 request with `.unsupported(.unknownTransaction)` and dismisses if `transactionType(for:)` is `nil`; otherwise it pushes the matching `wc*Transaction` screen.

## Behavioral Examples

### Scenario: Sending Algos from a standard (non-Ledger) account
- **Given** a `TransactionController` with an `AlgosTransactionSendDraft` set via `setTransactionDraft`
- **When** `getTransactionParamsAndComposeTransactionData(for: .algo)` is called
- **Then** it fetches `TransactionParams`, builds the unsigned txn with `AlgoTransactionDataBuilder`, signs it with the account's private data, calculates the fee, re-composes once if the projected fee differs from the calculated fee, and calls `delegate.transactionController(_:didComposedTransactionDataFor:)` with the algos draft.

### Scenario: Ledger connection times out
- **Given** a transaction whose signer account `requiresLedgerConnection()`
- **When** scanning starts but no signature is received within 20 seconds
- **Then** the timer stops the BLE scan, presents an error banner (`ble-error-connection-title`), and notifies the delegate with `didFailedComposing(.inapp(.ledgerConnection))`.

### Scenario: WalletConnect single transaction of an unknown type
- **Given** a `WCTransaction` whose `transactionType(for: account)` resolves to `nil`
- **When** `presentSingleWCTransaction` is called on a `BaseViewController` adopting the presentable
- **Then** the WC v1 or v2 request is rejected with `.unsupported(.unknownTransaction)` via `peraConnect.rejectTransactionRequest` and the screen is dismissed.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `getTransactionParams` network failure | Resets Ledger op, clears transactions, delegate `didFailedComposing(.network(.connection(...)))`. |
| Account fails signature validation | `BannerController.present(error)` shown; `canSignTransaction` returns `false`; flow aborts. |
| Algos minimum-balance not met | `AlgoTransactionDataBuilder` returns no items; delegate `didFailedComposing(.inapp(.minimumAmount(amount:)))`. |
| Fee calculation below minimum | `TransactionFeeCalculator` delegate fires; `handleTransactionComposingError(.inapp(.minimumAmount...))`, transactions cleared. |
| HD-wallet seed missing / SDK error | Delegate `didFailedComposing(.inapp(.sdkError(error:)))` or `.inapp(.other)`; nothing uploaded. |
| Ledger cancelled / closed app / unmatched address / fetch failure / BLE error | Matching localized error banner via `BannerController.presentErrorBanner`; some cases also reset the Ledger operation. |
| Transaction upload returns no id | Resets Ledger op, logs `nonAcceptanceLedgerTransaction` analytics, delegate `didFailedTransaction(.network(.unexpected(error)))`. |
| ARC-59 group operation fails / cancels | `cancelAllOperations()` on the queue; event published (`didFailTransaction` / `didFailNetwork` / `didCancelTransaction`). |
| WC transaction type unresolved | WC request rejected `.unsupported(.unknownTransaction)`, screen dismissed. |
| Media cleanup directory read fails | `MediaCleaner` records `mediaCleanUpError()` analytics and exits silently. |

## Dependencies

| Module | Usage |
|--------|-------|
| `pera_wallet_core` (PeraWalletCore) | `ALGAPI`, `Session`, `SharedDataController`, `Account`/asset models, `TransactionParams`, all `*TransactionSendDraft`s, `LedgerTransactionOperation`, `HDWalletTransactionSigner`/`HDWalletStorable`, `SDKTransactionSigner`, `AlgorandSDK`, `PeraConnect`, `WCTransaction`/`WCSessionDraft`, feature-flag & analytics (`ALGAnalytics`) services. |
| `AlgorandSDK` / `MessagePack` | Raw transaction construction, signing, and msgpack unpacking of signed transactions. |
| `MacaroonBanner` | Base `BannerController` queueing/presentation. |
| `MacaroonUIKit` / `MacaroonBottomSheet` / `MacaroonUtils` | View theming/composition, bottom-sheet presentation, `asyncMain`, regex helpers. |
| `MagpieHipo` / `MagpieCore` / `MagpieExceptions` | `HIPTransactionError`, `HIPNetworkError`, indexer error types. |
| `Kingfisher` | Image cache clearing in `MediaCleaner`. |
| `WebKit` (WKWebView/WKScriptMessage) | Webview message JSON parsing/validation extensions. |
| `StoreKit` (via `AppStoreReviewer`) | App Store review prompt. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
