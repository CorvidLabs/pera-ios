# PeraWallet_Classes_Styling — Context

## Overview

Architectural context for the `PeraWallet_Classes_Styling` module. The authoritative
contract is `PeraWallet_Classes_Styling.spec.md`; the source files it covers are listed
in that spec's `files:` frontmatter.

This module is the app's **design-system foundation**: centralized color tokens, font
tokens, a button-style factory, and adaptive-layout primitives. It defines no screens
and no navigation — it is consumed read-only by the rest of the app target.

## Key files

- `Resources/Colors/Colors.swift` — original `Colors` token catalog. Nested enums per
  component/role (Button, Text, Banner, Helpers, Layer, Shadows, Wallet, ASATiers,
  TabBar, …); each leaf is a `String`-backed `Color` whose raw value is an asset name.
- `Resources/Colors/AppColors.swift` — newer parallel `AppColors` catalog
  (`Shared` / `Components` / `SendTransaction` namespaces); introduced to migrate off
  `Colors` (see its `<note>`).
- `Resources/Colors/AppColors.xcassets` — asset catalog backing all token raw values.
- `Resources/Fonts/Fonts.swift` — `Fonts.DMSans` / `Fonts.DMMono` `FontMaker` enums;
  `make(_:_:)` → `CustomFont`.
- `ButtonStyles.swift` — `ButtonStyles` factory producing MacaroonUIKit `ButtonStyle`
  arrays for primary/secondary buttons. Flagged `<todo>` for removal.
- `Core/Layout/AdaptiveLayout.swift` — `AdaptiveLayout` protocol + generic
  `Layout<Constants>` struct whose `current` selects constants by device/orientation.
- `Core/Layout/AdaptiveLayoutConstants.swift` — `AdaptiveLayoutConstants` protocol,
  `LayoutOrientation` enum, and default `prepareForPhone` / `prepareForPad` hooks.

## Architectural decisions

- **Token-based theming via MacaroonUIKit.** Colors are asset-backed enums conforming to
  `Color`; fonts are `FontMaker` enums producing `CustomFont`. Consumers reference tokens
  in their view themes rather than hardcoding `UIColor`/`UIFont`. Light/dark variants live
  in the asset catalog, so tokens are appearance-agnostic.
- **Two color catalogs coexist.** `Colors` is the legacy catalog; `AppColors` is the
  newer one being migrated to. Both are live and partly overlap — an open consolidation.
- **Adaptive layout is opt-in.** Screens that need device/orientation-specific constants
  declare a `Layout<Constants>` and read `current` at access time; most styling does not.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI. Module is stable and
broadly depended on (~700 files reference `Colors`/`AppColors`/`Fonts`); the main churn is
the `ButtonStyles` removal and the `Colors`→`AppColors` migration.
