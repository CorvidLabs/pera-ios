---
module: PeraWallet_Classes_Styling
version: 1
status: active
files:
  - PeraWallet/Classes/Styling/ButtonStyles.swift
  - PeraWallet/Classes/Styling/Core/Layout/AdaptiveLayout.swift
  - PeraWallet/Classes/Styling/Core/Layout/AdaptiveLayoutConstants.swift
  - PeraWallet/Classes/Styling/Resources/Colors/AppColors.swift
  - PeraWallet/Classes/Styling/Resources/Colors/Colors.swift
  - PeraWallet/Classes/Styling/Resources/Fonts/Fonts.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Styling

## Purpose

App-target styling / design-system foundation (`PeraWallet/Classes/Styling`). This
is not a screen or navigation flow — it is the centralized set of design tokens and
style helpers that every other UI module in the app draws from. It owns:

- **Color tokens** — two namespaced token catalogs, `Colors` (`Resources/Colors/Colors.swift`)
  and the newer `AppColors` (`Resources/Colors/AppColors.swift`). Each leaf is a
  `String`-backed enum conforming to MacaroonUIKit's `Color`, whose raw value is the
  asset name resolved out of `AppColors.xcassets` (e.g. `Colors.Button.Primary.background`
  → `"ButtonPrimary/bg"`). Tokens are grouped by component/role (Button, Text, Banner,
  Helpers, Layer, Shadows, Wallet, ASATiers, TabBar, etc.).
- **Font tokens** — `Fonts` (`Resources/Fonts/Fonts.swift`) exposes the bundled type
  families `DMSans` and `DMMono` as `FontMaker` enums. `make(_:_:)` builds a sized
  `CustomFont`, e.g. `Fonts.DMSans.medium.make(15)`.
- **Button styling** — `ButtonStyles` (`ButtonStyles.swift`) is a small factory that
  assembles MacaroonUIKit `ButtonStyle` arrays (title, title colors, font, background)
  for the primary/secondary button variants from the color + font tokens above. It is
  flagged for removal (`<todo>`) in favor of per-theme styling.
- **Adaptive layout primitives** — `Core/Layout/AdaptiveLayout.swift` and
  `AdaptiveLayoutConstants.swift` define a protocol family (`AdaptiveLayout`,
  `AdaptiveLayoutConstants`, the generic `Layout<Constants>` struct, and
  `LayoutOrientation`) that lets a screen supply device/orientation-specific layout
  constants, selected at access time from `UIApplication.shared` device and orientation.

Ownership boundary: this module defines tokens and style helpers only. It renders no
screens and performs no navigation. It is consumed read-only by the rest of the app
target (~700 Swift files reference `Colors`/`AppColors`/`Fonts`).

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
   It defines tokens/helpers only and never owns screens or navigation.
2. Every color-token enum's raw `String` value is a valid asset name in
   `AppColors.xcassets`. A token whose raw value has no matching asset resolves to a
   missing/clear color rather than a hard failure (it is not validated at compile time).
3. Color tokens are grouped by component/role and (per the `<note>` in `Colors.swift`)
   maintained in alphabetical order; `Colors` and `AppColors` are two parallel catalogs
   (the latter introduced to migrate off the former, per its `<note>`).
4. `Fonts` only references type families bundled with the app (`DMSans-*`, `DMMono-*`);
   the enum case maps to the font face suffix and `make(_:_:)` produces a `CustomFont`
   for the requested point size/style.
5. `Layout<Constants>.current` resolves constants for the active device class and
   orientation on each access by reading `UIApplication.shared`; the same `Layout`
   value therefore yields phone- vs pad- and portrait- vs landscape-specific constants
   without being recreated.

## Behavioral Examples

### Scenario: Resolving a component color token
- **Given** a view theme references `Colors.Button.Primary.background`
- **When** the token's `uiColor` is read at render time
- **Then** MacaroonUIKit resolves the raw value `"ButtonPrimary/bg"` against
  `AppColors.xcassets` and returns the catalog color, automatically honoring the
  current light/dark appearance defined for that asset.

### Scenario: Building a primary button style
- **Given** code calls `ButtonStyles.primaryButton(title: "Send").create()`
- **When** the style is assembled
- **Then** it returns a `ButtonStyle` carrying the title, normal/disabled title colors
  (`Colors.Button.Primary.text` / `.disabledText`), the `Fonts.DMSans.medium.make(15)`
  font, and the `Colors.Button.Primary.background` background.

### Scenario: Selecting adaptive layout constants
- **Given** a screen exposes a `Layout<MyConstants>` and reads `current`
- **When** the device is an iPad in landscape
- **Then** `current` copies the constants, computes `LayoutOrientation.landscape`, and
  calls `prepareForPad(orientation: .landscape)` so pad/landscape-specific values are
  applied; on an iPhone the `prepareForPhone(...)` path is taken instead.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Color token raw value has no matching asset in `AppColors.xcassets` | Not caught at compile time; resolves to a missing/clear color at runtime — the assigned asset name must exist in the catalog. |
| `Fonts` case references a face not bundled in the app | `CustomFont` falls back per MacaroonUIKit/UIKit font loading; the registered `DMSans-*` / `DMMono-*` faces must be present in the app bundle's fonts. |
| `AdaptiveLayoutConstants.unknownConstant` used as a layout value | Returns `CGFloat.greatestFiniteMagnitude` and is documented to break the layout system — a deliberate sentinel for "must be set per device," not a usable constant. |
| Orientation is neither portrait nor landscape (transitional state) | `Layout.current` falls through to `LayoutOrientation.undefined`, still invoking the phone/pad prepare hook with that orientation. |
| `ButtonStyles` used for new UI | Type is flagged `<todo>` for removal; new code should style buttons via per-screen themes/tokens rather than this factory. |

## Dependencies

| Module | Usage |
|--------|-------|
| MacaroonUIKit | Provides the `Color` protocol (asset-backed token resolution), `ButtonStyle` / `ButtonStyling` types, and `CustomFont` consumed by `Fonts`/`FontMaker`. |
| UIKit | `UIApplication.shared` device/orientation queries in `AdaptiveLayout`; `CGFloat` constants; base appearance handling. |
| `AppColors.xcassets` (in-module asset catalog) | Backing store for all `Colors` / `AppColors` raw values; defines each token's light/dark color. |
| Foundation | Base types for the font/color enums. |
| App target UI modules (~700 files) | Downstream consumers — read `Colors`, `AppColors`, and `Fonts` tokens (and `Layout`) when building view themes; none are dependencies of this module. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
