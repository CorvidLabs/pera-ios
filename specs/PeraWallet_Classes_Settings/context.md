# PeraWallet_Classes_Settings — Context

## Overview

Architectural context for the `PeraWallet_Classes_Settings` module. The authoritative
contract is `PeraWallet_Classes_Settings.spec.md`; the source files it covers are listed
in that spec's `files:` frontmatter. This module holds the Settings detail screens
reached from the app's Settings tab.

## Key files

- `Appearance/AppearanceSelectionViewController.swift` — theme (system/light/dark) picker;
  defines the `UserInterfaceStyle` enum.
- `Currency/Screens/CurrencySelectionViewController.swift` — searchable currency list;
  data flows via `Currency/DataSource/CurrencySelectionListAPIDataController.swift`
  (`CurrencySelectionDataController` protocol) + `CurrencySelectionListDataSource` +
  `CurrencySelectionListLayout`.
- `Security/Screens/SecuritySettingsViewController.swift` — PIN / biometrics / rekey toggles
  (drives `SettingsToggleCell` + `SettingsDetailCell` from `List/`).
- `Node/Screens/NodeSettingsViewController.swift` — MainNet/TestNet switch.
- `Developer/Screens/DeveloperSettingsViewController.swift` and
  `DeveloperMenu/Screens/DeveloperMenuViewController.swift` (SwiftUI hosting) — dev tools.
- `List/Screens/WalletRating/WalletRatingViewController.swift` — App Store review bottom sheet.
- `Common/Selection/...` and `List/Views/...` — reusable selection list, toggle, and
  detail cells/view models shared across the screens above.

## Architectural decisions

- **MVVM + custom view + Theme per screen.** Each screen is a `BaseViewController`
  subclass that owns a hand-built UIKit view and a `Theme` struct (the `+Theme.swift`
  files); view models (`SingleSelectionViewModel`, `SettingsToggleViewModel`,
  `SettingsDetailViewModel`, `CurrencySelectionViewModel`) bind data into cells.
- **Data controller pattern for Currency.** `CurrencySelectionDataController` is a protocol;
  `CurrencySelectionListAPIDataController` performs the API fetch, throttled search
  (`Throttler`), and publishes diffable-data-source snapshots (loading / content /
  no-content / error) via an `eventHandler` on a dedicated serial queue, hopping to main
  to publish.
- **Cross-screen side effects via NotificationCenter.** Currency change posts
  `didChangePreferredCurrency`; node change posts `didUpdateNetwork` (observed by
  `DeveloperSettingsViewController` to refresh its rows).
- **Navigation via the app's routing enum** (`open(.choosePassword(...), by: .push)` etc.);
  this module does not own those routes.
- **DeveloperMenu is SwiftUI** embedded through `UIHostingController` — the newest screen;
  the rest are UIKit.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI. Known modernization
debt: Currency selection is flagged for a base-list-screen rewrite, and several screens
use `fatalError`/force-unwraps that should be hardened (see tasks.md).
