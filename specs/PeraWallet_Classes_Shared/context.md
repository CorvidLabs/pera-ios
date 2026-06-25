# PeraWallet_Classes_Shared — Context

## Overview

The shared UI / design-system layer of the Pera Wallet iOS app (`PeraWallet/Classes/Shared`). It supplies the reusable views, cells, themes, and view-models consumed by feature screens elsewhere in the app, plus a few self-contained shared flows (QR scan/resolution, PIN entry, tutorial, alerts/bottom warnings, asset opt-out). The authoritative contract is `PeraWallet_Classes_Shared.spec.md`; the full source list is in that spec's `files:` frontmatter.

## Architecture

- **MVVM + Theme triad.** The dominant pattern is `SomethingView` + `SomethingViewModel` + `SomethingViewTheme`. Views are `BaseView`/`BaseControl`/`BaseCollectionViewCell` subclasses (from `Views/Core/Base`). Layout and styling live in Macaroon `LayoutSheet`/`StyleSheet` theme structs (e.g. `ButtonPrimaryTheme`, `AlertScreenTheme`); data binding lives in view-models (e.g. `TutorialViewModel`, `AccountListItemViewModel`).
- **Screens** are `BaseViewController` / `BaseScrollViewController` subclasses (`QRScannerViewController`, `TutorialViewController`, `ChoosePasswordViewController`, `BottomWarningViewController`) or Macaroon `ScrollScreen` sheets (`AlertScreen`). Modal presentation uses `BottomSheetTransition` and the app-wide `Screen` routing enum.
- **QR pipeline** is a chain-of-responsibility: `QRResolver` protocol → `BaseQRResolver` (handles `next`) → concrete resolvers → `QRResolverManager` builds and owns the fixed-order chain and returns a `QRResolutionResult`.
- **Shared coordinator:** `OptOutAssetCoordinator` (under `View Coordinators/`) orchestrates the opt-out / transfer-balance flow, bridging to `TransactionController`, Ledger screens, and `JointAccountTransactionCoordinator` via Combine.
- **PageContainer** provides a paged container with a `PageBar` (page-bar buttons/items) for tabbed screens.

## Key files

- `QR/Resolver/QRResolverManager.swift`, `QR/Resolver/QRResolver.swift` — QR classification chain + result/context types.
- `QR/Screens/QRScanner/QRScannerViewController.swift` — camera capture, WalletConnect/PeraConnect observation, overlay.
- `PinCode/ViewModels/ChoosePasswordViewModel.swift` + `Screens/ChoosePasswordViewController.swift` — 6-digit PIN entry, mode-driven titles.
- `View Coordinators/OptOutAssetCoordinator.swift` — opt-out flow (standard / Ledger / joint account) + `TransactionControllerDelegate`.
- `Alert/AlertScreen.swift`, `BottomWarning/Screens/BottomWarningViewController.swift`, `Tutorial/Screens/TutorialViewController.swift` — shared sheet/onboarding screens.
- `Views/Common/**` and `Views/Core/Base/**` — the reusable component + base-class library.

## Dependencies

- `pera_wallet_core` for domain models/services; the Macaroon family (`MacaroonUIKit`, `MacaroonUtils`, `MacaroonStorySheet`) for UI primitives and theming; `AVFoundation` + `LiquidAuthSDK` for scanning; `Combine` for reactive flows.

## Current status

Spec status: `active`. Module is internal to the app target, so the Public API table is intentionally short. Enforced by `specsync check --strict` in CI.
