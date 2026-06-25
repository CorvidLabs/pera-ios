# PeraWallet_Extensions — Design

This module ships no screens of its own; it provides the shared design primitives and
view modifiers that the app's SwiftUI scenes compose. There is no navigation hierarchy.

## Layout & components

- **Row style** — `View.defaultPeraRowStyle()`: clears `listRowInsets` to `EdgeInsets()`,
  sets `listRowBackground(Color.clear)`, and hides the row separator. Applied to list
  rows across scenes (Settings, Inbox, Add Account, Create Joint Account, etc.) for a
  consistent edge-to-edge, separatorless look.
- **Shadow** — `View.defaultShadow()`: a layered shadow stack (black at 8% / radius 2 /
  y 2, 4% / radius 2 / y 2, 5% / radius 0) used on cards and elevated rows.
- **Transition** — `AnyTransition.moveFromPointToCenter(point:)`: offset-driven transition
  via a private `MoveFromOffsetModifier`, animating a view in from an arbitrary point to
  its identity position.

## Design tokens

- **Typography:** Custom fonts are defined as `Font.DMMono` and `Font.DMSans` weight enums
  (regular, light, italic, medium, bold, and italic variants). The `PeraFont` protocol's
  `.size(_:)` resolves a weight to `.custom("DMMono-<Weight>" / "DMSans-<Weight>", size:)`.
  This is the single source of truth for the app's font names.
- **Color/elevation:** `defaultShadow()` encodes the standard elevation token via fixed
  opacity/radius values (candidates to align with named design-system tokens).
- **Spacing:** `defaultPeraRowStyle()` normalizes list-row spacing/insets to zero.

## Assets

- Bundled font families **DM Mono** and **DM Sans** (registered in the app's `Info.plist`
  / font assets), referenced by name through the `PeraFont` enums. No asset-catalog image
  references originate in this module.
