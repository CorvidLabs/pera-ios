# PeraWallet_Classes_Styling — Design

This module *is* the app's design-token layer. It renders no screens of its own; instead
it provides the tokens that every other screen's view theme consumes.

## Layout & components

- **No screens.** Outputs are reusable style primitives:
  - `ButtonStyles` → MacaroonUIKit `ButtonStyle` for primary/secondary buttons
    (title + normal/disabled title colors + font + background).
  - `Layout<Constants>` (adaptive layout) → device/orientation-specific layout constants
    via `AdaptiveLayout` / `AdaptiveLayoutConstants` and the `LayoutOrientation` enum.
- Consumed across the app target's view-theme files (`*+Theme.swift`, `*ViewTheme.swift`).

## Design tokens

- **Colors** — asset-backed `Color` enums. Two catalogs:
  - `Colors` (legacy): grouped by role/component — `Alert`, `AlgoIcon`, `ASATiers`,
    `ASABanners`, `Backdrop`, `Banner`, `BottomSheet`, `Button` (`Float`/`Ghost`/`Helper`/
    `Primary`/`Secondary`/`Square`), `Dapp`, `Defaults`, `Helpers`, `Keyboard`, `Layer`,
    `Link`, `Modality`, `NFTIcon`, `QRScanner`, `Shadows` (`Cards`/`Tab`/`TextField`),
    `Separator`, `Switches`, `TabBar`, `Testnet`, `Text`, `Toast`, `Wallet`.
  - `AppColors` (newer, migration target): `Shared` (`Global`/`System`/`Layer`/`Helpers`/
    `Modality`), `Components` (`Text`/`Button`/`Switch`/`Link`/`TextField`/`QR`/`Banner`/
    `ASABanner`/`Toast`/`Shadow`), `SendTransaction` (`Shadow`).
  - Each token's raw value (e.g. `"ButtonPrimary/bg"`, `"Components/Text/main"`) is the
    asset name; light/dark values live in the catalog.
- **Typography** — `Fonts.DMSans` and `Fonts.DMMono` (`FontMaker`). `make(size, style)`
  builds a `CustomFont`; faces map to `DMSans-*` / `DMMono-*` (Regular, Medium, Bold,
  Italic, etc.).
- **Spacing/layout** — supplied per-screen through `AdaptiveLayoutConstants`
  implementations; this module provides the protocol family, not concrete spacing values.

## Assets

- `AppColors.xcassets` — the in-module asset catalog backing every color-token raw value.
- Bundled fonts — the `DMSans` / `DMMono` family files registered with the app, referenced
  by `Fonts`.
