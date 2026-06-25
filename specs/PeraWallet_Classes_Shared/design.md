# PeraWallet_Classes_Shared — Design

This is the app's shared UI / design-system layer, so "design" here means the reusable components and the few shared screens it ships.

## Screens & sheets

- **AlertScreen** — bottom sheet (`ScrollScreen`, `.compressed` height): optional image, optional "new" badge, title, body, and a vertical stack of action buttons.
- **BottomWarningViewController** — warning sheet driven by `BottomWarningViewConfigurator` (image + title + description + primary/secondary actions).
- **TutorialViewController** — scrollable onboarding/tutorial step (passphrase verified, local/biometric auth, ledger connected, etc.); hides the close button for certain tutorials.
- **ChoosePasswordViewController** — 6-digit PIN: numpad + a row of `PasswordInputCircleView` dots; title varies by `Mode`.
- **QRCreationViewController** — renders a QR code (`QRView`) with an address label.
- **QRScannerViewController / QRScanOptionsViewController** — full-screen camera capture with `QRScannerOverlayView`; options sheet for add-contact / add-watch-account / send.
- **TransactionOptionsScreen** — action list of transaction options.

## Reusable components

- **Buttons:** `Button`, `BadgeButton`, `AlignedButton`, `FloatingActionItemButton` with `ButtonPrimaryTheme` / `ButtonSecondaryTheme`.
- **Inputs:** `FloatingTextInputFieldView`, `MultilineTextInputFieldView`, `SearchInputView`, `FormInputFieldAssistiveView`, `NumpadView`/`NumpadButton`, `Toggle`.
- **List / preview cells:** `AssetListItemCell`, `PendingAssetListItemCell`, `CollectibleListItemCell` (+ loading/pending variants), `AccountListItemCell`/`TableCell`, `AccountSelectionViewCell`, `AssetPreviewCell`/`AssetPreviewActionCell`, `PrimaryListItemView`, `GroupedListItemButton`, `SingleLineIconTitleView`, `SecondaryListItemView`.
- **Quick actions:** `HomeQuickActionsView`, `AccountQuickActionsView`, `WatchAccountQuickActionsView`, `CollectibleDetailQuickActionsView`.
- **States:** `NoContentView` / `NoContentWithActionView`, `LoadingView`, `PreviewLoadingView`, `TransactionHistoryLoadingView`, `ErrorView`, `ResultView` / `ResultWithHyperlinkView`, shimmer (`ShimmerView`, `ShimmerSUIView`).
- **Misc:** `InfoBoxView`, `InstructionItemView`, `LineSeparatorView`, `GradientView`, `TripleShadowView`, `PrimaryImageView`, `TransactionAmountView` / `VerticalTransactionAmountView`, `LottieImageView`.
- **Base classes:** `BaseView`, `BaseControl`, `BaseCollectionViewCell`, `BaseSupplementaryView`, `TouchDetectingScrollView`.

## Navigation hierarchy

- Screens are presented via the app-wide `Screen` routing enum and `BottomSheetTransition` (most shared sheets present without a navigation controller). The scanner observes `PeraConnect` and emits results back through `QRScannerViewControllerDelegate`. `OptOutAssetCoordinator` presents confirmation / transfer-balance / Ledger sheets in sequence from a host `presenter`.
- `PageContainer` + `PageBar` provide a paged tab container for screens that host multiple sub-pages.

## Design tokens

- Components do not hard-code styling; they read from the app design system via `Colors` (e.g. `Colors.Defaults.background`, `Colors.Button.Primary.*`), `Fonts` (e.g. `Fonts.DMSans.medium.make(15)`), and Macaroon layout primitives (`Corner(radius:)`, `LayoutPaddings`, `TextStyle`, `ImageStyle`). Each component pairs with a `*Theme` struct conforming to a Macaroon `LayoutSheet`/`StyleSheet`.
- Light/dark adaptation is handled by the `Colors` token set; views apply colors through `customizeAppearance` / `customizeBaseAppearance`.

## Assets

- Image/icon names referenced by string (asset catalog), e.g. `"icon-info-green"`, `"button-loading-indicator"`. Lottie animations are loaded via `LottieImageView`.
