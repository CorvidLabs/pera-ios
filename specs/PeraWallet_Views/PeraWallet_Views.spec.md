---
module: PeraWallet_Views
version: 1
status: active
files:
  - PeraWallet/Views/Buttons/AccountRowWithAddButton.swift
  - PeraWallet/Views/Buttons/AccountRowWithEditButton.swift
  - PeraWallet/Views/Buttons/RoundedButton.swift
  - PeraWallet/Views/Buttons/SquareIconButton.swift
  - PeraWallet/Views/Image Views/RoundedIconView.swift
  - PeraWallet/Views/Labels/FormTitleLabel.swift
  - PeraWallet/Views/Labels/RelativeDateTextView.swift
  - PeraWallet/Views/Misc/CounterView.swift
  - PeraWallet/Views/Misc/OnboardingTitleView.swift
  - PeraWallet/Views/Misc/OverlayView.swift
  - PeraWallet/Views/Misc/SearchFieldWithButtons.swift
  - PeraWallet/Views/Misc/SelfSizingScrollView.swift
  - PeraWallet/Views/Misc/ShareSheet.swift
  - PeraWallet/Views/Misc/TitleSectionHeader.swift
  - PeraWallet/Views/Passkeys/PasskeyDisabledView.swift
  - PeraWallet/Views/Passkeys/PasskeyEmptyView.swift
  - PeraWallet/Views/Passkeys/PasskeyListCell.swift
  - PeraWallet/Views/Passkeys/PasskeyListCellViewModel.swift
  - PeraWallet/Views/Passkeys/PasskeyListModel.swift
  - PeraWallet/Views/Passkeys/PasskeyListView.swift
  - PeraWallet/Views/Rows/AccountRowWithValues.swift
  - PeraWallet/Views/Rows/CoreAccountRow.swift
  - PeraWallet/Views/Styles/NavigationBarStyle.swift
  - PeraWallet/Views/Text Fields/LabeledUnderlinedTextField.swift
  - PeraWallet/Views/Text Fields/PeraTextField.swift
  - PeraWallet/Views/Text Fields/RoundedTextField.swift
  - PeraWallet/Views/View Modifiers/BackButtonModifier.swift
  - PeraWallet/Views/WebView.swift
db_tables: []
depends_on: []
---

# PeraWallet_Views

## Purpose

App-target SwiftUI view library (`PeraWallet/Views`). It holds the reusable
SwiftUI building blocks shared across the newer SwiftUI screens of the app —
buttons, text fields, rows, labels, image views, navigation styling, and view
modifiers — plus one self-contained feature: **Passkey management** under
Settings.

Two kinds of content live here:

- **Reusable components** (`Buttons/`, `Text Fields/`, `Rows/`, `Labels/`,
  `Image Views/`, `Misc/`, `Styles/`, `View Modifiers/`). These are presentation-only
  SwiftUI views (e.g. `RoundedButton`, `PeraTextField`, `RoundedTextField`,
  `CoreAccountRow`, `AccountRowWithValues`, `SearchFieldWithButtons`,
  `OnboardingTitleView`, `RelativeDateTextView`, `RoundedIconView`,
  `CounterView`, `OverlayView`, `TitleSectionHeader`). They take values and
  bindings as input and emit design-system styling (`Color.*`, `Font.DMSans.*`),
  carrying no business logic. `ShareSheet` and `WebView` wrap UIKit
  (`UIActivityViewController`, `SFSafariViewController`) via
  `UIViewControllerRepresentable`. `BackButtonModifier` provides the
  `.withPeraBackButton(navigationPath:)` modifier driving `NavigationPath`-based
  back navigation.

- **Passkeys feature** (`Passkeys/`). The Settings > Passkeys screen
  (`PasskeyListView`) lists WebAuthn passkeys stored on the device, lets the user
  delete a passkey with a confirmation sheet, shows an empty state
  (`PasskeyEmptyView`) when none exist, and a disabled state
  (`PasskeyDisabledView`) prompting the user to enable the AutoFill credential
  provider in iOS Settings. It follows MVVM: `PasskeyListView` observes
  `PasskeyListViewModel` (vended through `PasskeyListModel`/`PasskeyListModelable`),
  which reads/deletes passkeys via `PassKeyService` and tracks analytics.

Ownership boundary: this module owns presentation only. Passkey persistence,
session, and HD-wallet storage are owned by `pera_wallet_core`
(`PassKeyService`, `PassKey`, `CoreAppConfiguration`); these views consume those
services but do not own the data model.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. Reusable components are presentation-only: they receive their data via
   properties and `@Binding`/closure inputs and never reach into services or
   persistence. The Passkeys feature is the only sub-area that talks to a service
   (`PassKeyService`), and it does so through `PasskeyListViewModel`, never from
   the `View`.
3. The Passkeys screen renders exactly one of three mutually exclusive states:
   disabled (`settingNotEnabled == true`), empty (`passkeys.isEmpty`), or the
   passkey list — checked in that priority order.
4. All `@Published` state on `PasskeyListViewModel` is mutated only via
   `fileprivate(set)` setters and updated on the main actor; the AutoFill enabled
   check (`ASCredentialIdentityStore`) hops back to `@MainActor` before touching
   `settingNotEnabled`.
5. Styling comes only from the app design system. Components reference semantic
   color tokens (`Color.Text.*`, `Color.ButtonPrimary.*`, `Color.Layer.*`,
   `Color.Helpers.*`) and the `DMSans` font scale rather than literal colors or
   system fonts.

## Behavioral Examples

### Scenario: Viewing stored passkeys
- **Given** AutoFill passkey support is enabled in iOS Settings and the user has saved at least one passkey
- **When** the user opens Settings > Passkeys (`PasskeyListView`)
- **Then** `PasskeyListViewModel` loads passkeys from `PassKeyService.allPassKeys`
  and the view renders a `List` of `PasskeyListCell`s, each showing display name,
  origin, last-used date (or "Never"), and username.

### Scenario: Deleting a passkey
- **Given** the passkey list is shown
- **When** the user taps the trash icon on a cell and confirms "Remove" in the presented medium-detent sheet
- **Then** `PasskeyListCellViewModel.deletePasskey()` calls back into
  `PasskeyListViewModel.passKeyDeleted(_:)`, which removes the matching
  `PassKey` entity (matched by `origin` + `username`), tracks
  `webAuthNPassKeyDeleted`, reloads the list, and the cell disappears.

### Scenario: AutoFill provider disabled
- **Given** the user has not enabled Pera as an AutoFill credential provider
- **When** the user opens Settings > Passkeys
- **Then** `ASCredentialIdentityStore` reports `isEnabled == false`,
  `settingNotEnabled` becomes `true`, and `PasskeyDisabledView` is shown with an
  "Open Settings" button that deep-links to `UIApplication.openSettingsURLString`.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `AppDelegate.shared?.appConfiguration` is nil when building `PassKeyService` | `passKeyManager` is `nil`; `reloadPasskeys()` falls back to an empty array, so the screen shows the empty state instead of crashing. |
| No passkeys stored on device | `passkeys.isEmpty` is true; `PasskeyEmptyView` is rendered. |
| AutoFill credential provider not enabled in iOS Settings | `settingNotEnabled` is true; `PasskeyDisabledView` is shown with an "Open Settings" deep link. |
| Open Settings deep link cannot be built / opened | `PasskeyDisabledView.openSettingsAction()` guards on a valid URL and `canOpenURL`; if either fails it no-ops (no navigation). |
| Passkey has never been used (`lastUsed == nil`) | `PassKeyModel.lastUsedDisplay` shows the localized "Never" string. |
| `RoundedButton` tapped while `isEnabled == false` or while showing a spinner | The tap gesture is ignored; `onTap` is only invoked for an enabled `.text` button. |
| `WebView` / Safari sheet finished by the user | `WebViewCoordinator.safariViewControllerDidFinish` calls the SwiftUI `dismiss` environment action to close the presentation. |

## Dependencies

| Module | Usage |
|--------|-------|
| `pera_wallet_core` | `PassKeyService` (load/remove passkeys), `PassKey` Core Data entity, `CoreAppConfiguration` (analytics), `hdWalletStorage`/`session` from app configuration. |
| SwiftUI | All component views, `NavigationPath`-based navigation, `@ObservedObject`/`@Published` MVVM, `TimelineView`. |
| AuthenticationServices | `ASCredentialIdentityStore` to detect whether the AutoFill passkey provider is enabled. |
| SafariServices (`SFSafariViewController`) | Backing for `WebView` in-app browser. |
| UIKit (`UIActivityViewController`, `UIApplication`) | `ShareSheet` system share UI; opening iOS Settings deep links. |
| App design system (`Color.*`, `Font.DMSans.*`, `Image(...)` asset catalog) | Semantic colors, DMSans typography, and icon assets used throughout the components. |
| `AppDelegate` | Source of `appConfiguration` used to construct `PassKeyService`. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
