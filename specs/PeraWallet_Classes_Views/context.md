# PeraWallet_Classes_Views — Context

## Overview

Architectural context for the `PeraWallet_Classes_Views` module. The authoritative
contract is `PeraWallet_Classes_Views.spec.md`. As scoped by that spec's `files:`
list, this module currently covers a single view:
`PeraWallet/Classes/Views/Authentication/SignUp/Passphrase/Screenshot/ScreenshotWarningView.swift`.

## Key files

- `Classes/Views/.../Screenshot/ScreenshotWarningView.swift` — the warning view
  (icon + title + description + "Close" button) and its `ScreenshotWarningViewDelegate`.
- Closely related (NOT owned by this spec, lives under `Classes/Authentication/`):
  - `Classes/Authentication/Create/Passphrase/Screenshot/ScreenshotWarningViewController.swift`
    — `BaseViewController` host; sets `delegate = self`, customizes the view from theme,
    lays it out full-screen, and `dismissScreen()` on close.
  - `Classes/Authentication/Create/Passphrase/Screenshot/ScreenshotWarningViewController+Theme.swift`
    — `Theme` (wraps `ScreenShotWarningViewTheme`, background from
    `AppColors.Shared.System.background`).

## Architecture

- **Pattern:** MacaroonUIKit View + ViewController (MVC-style with theme structs).
  No view model — the view is static/presentational and emits one delegate callback.
- **Theming:** Layout and styling are injected via `ScreenShotWarningViewTheme`
  (`LayoutSheet`/`StyleSheet`). The view contains no hard-coded colors/fonts.
- **Communication:** view → controller via a `weak` delegate
  (`screenshotWarningViewDidCloseScreen(_:)`). Controller → dismissal via
  `dismissScreen()`.

## Architectural notes

- Screenshot *detection* is not in this view. Detection happens in the passphrase
  screens that observe `UIApplication.userDidTakeScreenshotNotification`
  (`PassphraseDisplayViewController`, `PassphraseBackUpViewController`).
- Those live passphrase screens currently present a `BottomWarningViewConfigurator`
  bottom sheet (with a vibrate via `AudioServicesPlaySystemSound`) for the screenshot
  alert. `ScreenshotWarningView` / `ScreenshotWarningViewController` is the
  full-screen variant of the same warning; treat it as the alternative/legacy
  presentation when reconciling flows.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
