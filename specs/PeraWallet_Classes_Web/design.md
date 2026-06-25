# PeraWallet_Classes_Web — Design

## Screens & navigation hierarchy

```
AccountImportFlowCoordinator
├─ WebImportInstructionScreen        (push)   — 4-step onboarding + Start
│   └─ ImportQRScannerScreen         (push)   — AVFoundation QR scanner
│       └─ ImportAccountScreen       (push)   — loading/decrypt/import
│           ├─ WebImportSuccessScreen (push)  — imported-account list
│           └─ WebImportErrorScreen   (push)  — failure result
└─ ImportAccountScreen               (present)— direct entry with pre-scanned params
```

Cancel/exit: the scanner overlay pops or dismisses based on whether it can go
back; success and error screens both expose a "Go to Home" action that dismisses
the flow and emits `didFinish`.

## Components

- **WebImportInstructionScreen** — large-title `ScrollScreen` with a title, four
  `InstructionItemView`s (one per `WebImport*InstructionItemViewModel`), and a
  footer Start button. Footer uses a bottom gradient effect.
- **ImportQRScannerScreen** — full-screen camera preview
  (`AVCaptureVideoPreviewLayer`) under a `QRScannerOverlayView` (connected-apps
  button hidden), title from `web-import-qr-scanner-title`. Vibrates on decode.
- **ImportAccountScreen** — centered loading state: an image + Lottie animation
  (`light-dots` / `dark-dots`) and a title; navigation bar hidden.
- **WebImportSuccessScreen** — `UICollectionView` list with a header
  (`WebImportSuccessHeaderView`), an optional missing-accounts info-box cell
  (`WebImportSuccessInfoBoxCell`), and per-account rows; footer "Go to Home"
  button over a bottom gradient that hides when content is short.
- **WebImportErrorScreen** — `ScrollScreen` with a `ResultView`
  (`icon-error-close`, generic title, error-specific body) and a footer
  "Go to Home" button.

## Design tokens

- Each screen pairs with a `*Theme` struct (e.g. `ImportAccountScreenTheme`,
  `WebImportInstructionScreenTheme`, `WebImportSuccessScreenTheme`,
  `WebImportErrorScreenTheme`, `WebImportSuccessInfoBoxTheme`,
  `WebImportErrorResultViewTheme`, `WebImportSuccessHeaderViewTheme`) that owns
  colors, typography, paddings, and edge insets.
- Background uses `Colors.Defaults.background`; footers layer a
  `LinearGradientEffect` fading from transparent to background.
- Text styles use shared helpers (`.titleMedium()`, `.bodyRegular()`); copy is
  localized (`account-type-selection-import-web`, `web-import-qr-scanner-title`,
  `web-import-error-body`, `web-import-error-unsupported-version-body`,
  `title-generic-error`, `qr-scan-*`).

## Assets

- Lottie loading animations: `light-dots`, `dark-dots`.
- Result/error icon: `icon-error-close`.
- QR scanner overlay assets via `QRScannerOverlayView`/`QRScannerOverlayViewTheme`.
