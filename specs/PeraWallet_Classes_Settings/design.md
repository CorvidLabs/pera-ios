# PeraWallet_Classes_Settings — Design

## Screens & components

| Screen | Root view | Layout | Cells / components |
|--------|-----------|--------|--------------------|
| Appearance selection | `SingleSelectionListView` | `UICollectionViewFlowLayout` | `SingleSelectionCell` (title + selected checkmark) |
| Currency selection | `CurrencySelectionView` (search input + collection) | `CurrencySelectionListLayout` + diffable data source | `CurrencySelectionCell`, loading skeleton (`CurrencySelectionItemLoadingView` / `CurrencySelectionLoadingView`), `NoContentWithActionCell` reload, no-content view |
| Security settings | `SecuritySettingsView` | flow layout, multi-section | `SettingsToggleCell` (PIN/biometrics/rekey), `SettingsDetailCell` (change PIN), `SingleGrayTitleHeaderSuplementaryView`, `SecuritySettingsFooterView` |
| Node settings | `SingleSelectionListView` | flow layout | `SingleSelectionCell` (MainNet/TestNet) |
| Developer settings | `DeveloperSettingsView` | flow layout | `SettingsDetailCell` (disclosure rows) |
| Developer menu | SwiftUI `DeveloperMenuListView` via `UIHostingController` | SwiftUI list | feature-flag toggles |
| Wallet rating | `WalletRatingView` | bottom sheet (`.compressed`) | title/illustration + CTA button |

## Navigation hierarchy

Settings tab landing list (outside this module) -> pushes one of:
Appearance / Currency / Security / Node (also reachable from Developer) /
Developer (-> Developer menu) screens. Wallet rating is presented as a
`MacaroonBottomSheet` modal rather than pushed. Security toggles and Developer
actions push further into shared routes (`choosePassword`, `accountNameSetup`,
`accountRecoverySearch`, `externalInAppBrowser`).

## Design tokens

- Each screen defines a `Theme` struct in a `+Theme.swift` companion (e.g.
  `*ViewController+Theme.swift`, `*ViewTheme.swift`) holding `backgroundColor`,
  cell/header sizes, padding, fonts, and colors sourced from the shared Macaroon-based
  design system (`view.customizeBaseAppearance(backgroundColor:)`).
- Selection rows use a gray section-title header style (`SingleGrayTitleHeaderViewTheme`)
  with explicit padding (e.g. `topPadding = 32.0` in Security).
- Footer text height is measured against the design system font
  (`SecuritySettingsFooterView.usedFont`) for dynamic sizing.

## Assets

- App Store review uses `AppEnvironment.current.appID` (no local image asset).
- Cell iconography/checkmarks come from the shared app asset catalog via the per-screen
  `Theme` structs rather than module-local assets.
