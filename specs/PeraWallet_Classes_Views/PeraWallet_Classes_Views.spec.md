---
module: PeraWallet_Classes_Views
version: 1
status: active
files:
  - PeraWallet/Classes/Views/Authentication/SignUp/Passphrase/Screenshot/ScreenshotWarningView.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Views

## Purpose

App-target UI module (`PeraWallet/Classes/Views`). As covered by this spec, it
contains the `ScreenshotWarningView` — the full-screen warning view shown in the
account sign-up / passphrase (recovery phrase) flow to alert the user when a
screenshot of sensitive material (the mnemonic passphrase) is taken or is being
captured.

`ScreenshotWarningView` is a `MacaroonUIKit.View` subclass. It lays out a warning
icon, a title, a description, and a single "Close" button, all driven by a
`ScreenShotWarningViewTheme` (image, title/description styles, and spacing insets).
It owns no business logic and no navigation: it exposes a `delegate`
(`ScreenshotWarningViewDelegate`) and forwards a single user intent —
`screenshotWarningViewDidCloseScreen(_:)` — when the close button is tapped. Its
host, `ScreenshotWarningViewController` (in `Classes/Authentication/...`), owns the
view, wires the delegate, applies the theme, and dismisses the screen in response.

Ownership boundary: this view is presentation-only. It does not detect screenshots,
does not read the passphrase, and does not perform navigation; the controller and
the passphrase screens own screenshot detection (via
`UIApplication.userDidTakeScreenshotNotification`) and presentation.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. `ScreenshotWarningView` is `final` and `internal` (app-target only); it is not a
   public cross-module boundary.
2. The view is purely presentational: it holds no passphrase/mnemonic data and
   performs no navigation. The only outbound signal is
   `screenshotWarningViewDidCloseScreen(_:)` via the weak `delegate`.
3. The `delegate` is held `weak` to avoid a retain cycle with the owning
   `ScreenshotWarningViewController`.
4. The close button always carries the localized `"title-close"` title, and its
   tap is the single action wired in `setListeners()` (close → notify delegate).
5. Layout and appearance are fully driven by the injected `ScreenShotWarningViewTheme`
   (image, title, description, close-button theme, and insets); the view hard-codes
   no colors or fonts beyond what the theme supplies.

## Behavioral Examples

### Scenario: User dismisses the screenshot warning
- **Given** the screenshot warning screen is presented (the user took a screenshot
  while viewing their recovery passphrase)
- **When** the user taps the "Close" button
- **Then** `ScreenshotWarningView` calls
  `delegate?.screenshotWarningViewDidCloseScreen(self)`, and the owning
  `ScreenshotWarningViewController` responds by calling `dismissScreen()`.

### Scenario: View is built from theme
- **Given** `ScreenshotWarningViewController.prepareLayout()` runs
- **When** it calls `screenshotWarningView.customize(theme.screenshotWarningViewTheme)`
- **Then** the warning image, title, description, and close button are added and
  constrained per the `ScreenShotWarningViewTheme` insets, and the view background
  is set from `theme.backgroundColor`.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `delegate` is `nil` when close is tapped | `delegate?.screenshotWarningViewDidCloseScreen` is a no-op (safe optional call); no crash, but the screen will not dismiss. |
| Close button tapped multiple times rapidly | Each tap re-invokes the delegate; the controller's `dismissScreen()` is idempotent for an already-dismissing screen. |
| Long localized title/description text | Labels are `centerX`-pinned with horizontal insets; the close button uses a `greaterThanOrEqualTo` top constraint so it floats to the bottom and content does not overlap. |

## Dependencies

| Module | Usage |
|--------|-------|
| MacaroonUIKit | `View` base class, theming (`LayoutSheet`/`StyleSheet`), `Button`, appearance customization, and `snp` (SnapKit) layout. |
| UIKit / Foundation | `UILabel`, `UIImageView`, `safeAreaBottom`, target/action wiring. |
| App theme layer (`ScreenShotWarningViewTheme`, `AppColors`) | Supplies image/text styles, close-button theme, insets, and background color. |
| `ScreenshotWarningViewController` (app target) | Owns and presents the view, wires the delegate, and dismisses on close. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
