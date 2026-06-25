# PeraWallet_Views — Design

## Screens & components

### Passkeys feature
- **`PasskeyListView`** — Settings > Passkeys screen. Inline navigation title
  (`settings-passkeys-title`), custom leading toolbar back button (`iconBack`),
  system back button hidden. Renders one of three states:
  - **Disabled** (`PasskeyDisabledView`): warning header image, description, an
    info card on `Color.Layer.grayLighter` (12pt corner radius) with an
    "Open Settings" primary button (`Color.ButtonPrimary.bg`, 4pt radius) and
    external-link icon.
  - **Empty** (`PasskeyEmptyView`): empty-state illustration + copy.
  - **List**: plain `List` of `PasskeyListCell`s with hidden row separators and
    hidden scroll background.
- **`PasskeyListCell`** — bordered card (16pt radius, `Color.Layer.grayLight`
  stroke): header row (passkey icon, display name, origin, trash button) plus
  last-used and username rows. Filled `Rectangle`s act as separators (a
  deliberate workaround for `Divider` rendering). Trash opens a medium-detent
  confirmation sheet with a destructive trash glyph and Remove/Keep
  `RoundedButton`s.

### Reusable components
- **Buttons:** `RoundedButton` (full-width, 52pt tall, 4pt radius, text or
  spinner; primary/secondary/destructive), `SquareIconButton`,
  `AccountRowWithAddButton`, `AccountRowWithEditButton`.
- **Rows:** `CoreAccountRow` (40pt `RoundedIconView` + title/subtitle +
  trailing `@ViewBuilder` slot, default Pera row style) and
  `AccountRowWithValues` (adds right-aligned primary/secondary value labels).
- **Text fields:** `PeraTextField`, `RoundedTextField`,
  `LabeledUnderlinedTextField`.
- **Labels / misc:** `FormTitleLabel`, `RelativeDateTextView` (live updating via
  `TimelineView`), `TitleSectionHeader`, `OnboardingTitleView` (32pt title + 15pt
  description), `CounterView`, `OverlayView`, `SelfSizingScrollView`,
  `RoundedIconView`, `SearchFieldWithButtons` (leading search glyph, trailing
  QR-scan + paste buttons hidden while focused).
- **System bridges:** `ShareSheet` (`UIActivityViewController`), `WebView`
  (`SFSafariViewController`).

## Navigation hierarchy

- SwiftUI `NavigationPath`-driven. Back navigation is handled by
  `BackButtonModifier` exposed as `.withPeraBackButton(navigationPath:)` (rotates
  the arrow icon 180°, hides the system back button, pops via
  `navigationPath.removeLast()`), or by a screen-local leading toolbar item as in
  `PasskeyListView`.
- `NavigationBarStyle` (`Styles/`) centralizes nav-bar appearance.

## Design tokens

- **Colors (semantic):** `Color.Text.{main, gray, grayLighter}`,
  `Color.ButtonPrimary.{bg, text, disabledBg, disabledText}`,
  `Color.ButtonSecondary.*`, `Color.Layer.{grayLight, grayLighter}`,
  `Color.Helpers.{negative, negativeLighter}`. No literal colors.
- **Typography:** `Font.DMSans.{regular, medium}.size(...)` — common sizes 13
  (caption/secondary), 15 (body/button), 19 (sheet title), 32 (onboarding title).
- **Spacing & shape:** 24pt screen padding, 12pt/16pt card radii, 4pt button
  radius, recurring 8/12/16/24 spacing steps.

## Assets

- Asset catalog references used by this module include `Passkeys.*`
  (`passkeysWarningHeader`, `iconInfo`, `iconExternalLink`, `iconTrash`),
  `Settings.Icon.passkeys`, `Icons.{arrow, search, paste}`, `iconBack`,
  `iconQrScan`, all addressed via the generated `Image(.…)` initializers.
