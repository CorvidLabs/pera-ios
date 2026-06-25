# PeraWallet_Classes_Utils — Design

This is shared UI infrastructure, not a single screen. It provides reusable presentation components consumed by feature modules.

## Components

### Banners (`Banner/`)
- `BannerView` + `BannerViewTheme` + `Banner*ViewModel` (error / success / info / in-app-notification).
- `BannerController` (subclass of `MacaroonBanner.BannerController`) enqueues banners from a top inset of `safeAreaInsets.top + 12`, horizontal padding `(24, 24)`.
- `ActionableBanner/` — `ActionableBannerView` + `ActionableBannerViewModel` + `ActionableBannerViewTheme`, driven by `BottomActionableBannerController` and `FetchErrorActionableBannerViewModel` for retry-style bottom banners.

### Navigation bar (`NavigationBar/`)
- `NavigationBarLargeTitleController` + `NavigationBarLargeTitleView` for collapsing large titles.
- `ALGBarButtonItem` / `BarButton` / `BarButtonItem` custom bar items; `NavigationBarTitleView`; `NavigationBarConfigurable` / `NavigationBarLargeTitleConfigurable` protocols.

### Tooltip (`Tooltip/`)
- `TooltipView` + `TooltipViewModel` + `TooltipViewTheme`, presented via `TooltipUIController`.

### Transitions (`Transition/BottomSheet/`)
- `BottomSheetTransition` wraps `BottomSheetTransitionController`; supports `.present` and `.presentWithoutNavigationController`, both `coverVertical` with a custom presentation style and optional interactivity.

## Navigation hierarchy

- Screens are opened via `UIViewController+Flow` `open(_:by:)` using the app's `Screen` enum (e.g. `.wcAlgosTransaction`, `.wcAssetTransaction`, `.wcKeyRegTransaction`) and `Screen.Transition.Open` styles (`push`, `customPresent`, …).
- `WalletConnectSingleTransactionRequestPresentable` maps a `WCTransaction` type to the matching `wc*Transaction` screen and pushes it.
- `KeyboardController` and `UIView+SafeArea` / `UIViewController+Layout` handle keyboard avoidance and safe-area layout.

## Design tokens

- Theming flows through Macaroon `*ViewTheme` structs: `customize(theme)` applies appearance, `bindData(viewModel)` binds content. Variants are produced by mutating the theme (`configureForSuccess()`, `configureForInfo()`, `configureForInAppNotification()`).
- Typography helpers live in `Extensions/Foundation/Text/` (`Typography.swift`, `String+Typography.swift`); spacing/layout in `Extensions/UIKit/Layout/`.
- Localized strings via `String(localized:)` (e.g. `ble-error-connection-title`, `ble-error-transaction-cancelled-title`).

## Assets

- Image helpers: `String+Image`, `ImageSource+Size`, `UIImage+UIPasteboard`. Remote images cached via Kingfisher (cleared by `MediaCleaner`).
