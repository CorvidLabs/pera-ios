# PeraWallet_Views — Context

## Overview

`PeraWallet/Views` is the app target's SwiftUI view library. It contains
reusable presentation components plus the self-contained **Passkeys** Settings
feature. The authoritative contract is `PeraWallet_Views.spec.md`; the source
files it covers are listed in that spec's `files:` frontmatter.

## Key files

### Reusable components (presentation-only)
- `Buttons/RoundedButton.swift` — primary/secondary/destructive button with
  text or spinner content; tap is suppressed when disabled or spinning.
- `Buttons/AccountRowWithAddButton.swift`, `Buttons/AccountRowWithEditButton.swift`,
  `Buttons/SquareIconButton.swift` — account-row affordances and icon button.
- `Text Fields/PeraTextField.swift`, `RoundedTextField.swift`,
  `LabeledUnderlinedTextField.swift` — text input variants.
- `Rows/CoreAccountRow.swift` — generic account row with trailing `@ViewBuilder`
  slot; `Rows/AccountRowWithValues.swift` composes it with primary/secondary
  value labels.
- `Labels/FormTitleLabel.swift`, `Labels/RelativeDateTextView.swift` (live
  relative time via `TimelineView`).
- `Image Views/RoundedIconView.swift`, `Misc/CounterView.swift`,
  `Misc/OnboardingTitleView.swift`, `Misc/OverlayView.swift`,
  `Misc/SearchFieldWithButtons.swift` (QR-scan + paste buttons),
  `Misc/SelfSizingScrollView.swift`, `Misc/TitleSectionHeader.swift`.
- `Misc/ShareSheet.swift` (`UIActivityViewController`), `WebView.swift`
  (`SFSafariViewController`) — UIKit bridges via `UIViewControllerRepresentable`.
- `Styles/NavigationBarStyle.swift`, `View Modifiers/BackButtonModifier.swift`
  (`.withPeraBackButton(navigationPath:)`).

### Passkeys feature (MVVM)
- `Passkeys/PasskeyListView.swift` — screen; renders disabled / empty / list.
- `Passkeys/PasskeyListModel.swift` — contains `PasskeyListViewModel`
  (`ObservableObject`), `PasskeyListModel`/`PasskeyListModelable`, and the
  `PassKeyModel` display struct.
- `Passkeys/PasskeyListCell.swift` + `PasskeyListCellViewModel.swift` — per-row
  cell with delete-confirmation sheet (medium detent).
- `Passkeys/PasskeyEmptyView.swift`, `Passkeys/PasskeyDisabledView.swift` — states.

## Architectural decisions

- **Mixed paradigm:** most files are stateless SwiftUI components; only the
  Passkeys area uses MVVM. The view model is vended through a `Modelable`
  protocol (`PasskeyListModelable`) to allow test substitution.
- **Navigation:** SwiftUI `NavigationPath`-based; back navigation is provided by
  `BackButtonModifier` / `PasskeyListView`'s custom toolbar leading item rather
  than the system back button (`navigationBarBackButtonHidden`).
- **Service access stays out of views:** `PasskeyListViewModel` builds
  `PassKeyService` lazily from `AppDelegate.shared?.appConfiguration` and tolerates
  a nil configuration by degrading to an empty list.
- **Design tokens only:** components reference semantic `Color.*` tokens and the
  `DMSans` font scale; `PasskeyListCell` deliberately uses filled `Rectangle`s as
  separators because `Divider` did not render correctly.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
`PasskeyListCell` carries a TODO noting it is a temporary placeholder pending
final designs.
