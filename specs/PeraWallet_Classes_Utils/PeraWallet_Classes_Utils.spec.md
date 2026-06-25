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

App-target UI/feature module (`PeraWallet/Classes/Utils`). Internal-by-default; see Public API for any cross-module-public surface.

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

1. Module is part of the app target (internal access); not a public library boundary.

## Behavioral Examples

### Scenario: Placeholder
- **Given** the app is running
- **When** this module's flow is entered
- **Then** it behaves per its screens/controllers

## Error Cases

| Condition | Behavior |
|-----------|----------|
| N/A | Documented per screen |

## Dependencies

| Module | Usage |
|--------|-------|
| PeraWalletCore | Shared models/services |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
