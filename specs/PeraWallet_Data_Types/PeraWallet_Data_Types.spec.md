---
module: PeraWallet_Data_Types
version: 1
status: active
files:
  - PeraWallet/Data Types/ImageType.swift
db_tables: []
depends_on: []
---

# PeraWallet_Data_Types

## Purpose

App-target UI data-type module (`PeraWallet/Data Types`). It defines `ImageType`,
a small `Hashable` enum that abstracts the *source* of an image for view models so
that any avatar/icon-style surface can be described declaratively without committing
to a concrete rendering path.

`ImageType` models three mutually-exclusive image sources:

- `.data(Data)` — raw image bytes (e.g. a downloaded contact/profile image) that the
  view layer decodes into a `UIImage`.
- `.icon(IconData)` — a named asset-catalog `ImageResource` paired with a `tintColor`
  and a `backgroundColor` (a "chip" icon). `IconData` is the styled placeholder/icon
  variant used for account-type glyphs.
- `.uiImage(UIImage)` — an already-constructed `UIImage` (e.g. an account's generated
  type/identity image).

It also provides static conveniences used across account/joint-account/inbox UI:
`placeholderUserIconData`, `placeholderGroupIconData`, and
`accountTypeIcon(for: Account)`. The companion provider `AccountIconProvider` builds
`ImageType.IconData` from a `PeraAccount`, selecting glyph + tint + background by
account type (algo25, universalWallet, watch, ledger, joint, invalid) and rekey state.
The shared `RoundedIconView` is the canonical renderer that switches over the enum.

Ownership boundary: this module owns only the image-source *value type* and its
placeholder factories. Concrete rendering (decode, resize, corner-radius, background)
lives in the view layer (`RoundedIconView`), and color/glyph selection lives in
`AccountIconProvider` (under `Data Providers`). This module is internal to the app
target and exposes no public cross-module API.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. `ImageType` is exactly one of three sources at a time — `.data`, `.icon`, or
   `.uiImage` — never a combination; the renderer switches exhaustively over the case.
2. `ImageType` and its nested `IconData` are `Hashable`, so they can back `Equatable`
   SwiftUI view models and diff-driven list rows without custom comparison code.
3. `.icon` carries its own `tintColor` and `backgroundColor`; the renderer applies them
   rather than inferring colors, so icon styling is decided at construction time
   (typically by `AccountIconProvider`), not at render time.
4. Placeholder factories (`placeholderUserIconData`, `placeholderGroupIconData`) and
   `accountTypeIcon(for:)` are the only way callers should fabricate default/identity
   avatars, keeping glyph + token choices consistent across screens.

## Behavioral Examples

### Scenario: Rendering an icon-style avatar
- **Given** a view model exposes `image: ImageType` set to
  `.icon(IconData(image: .Icons.user, tintColor: .Wallet.wallet1, backgroundColor: .Wallet.wallet1Icon))`
- **When** `RoundedIconView` renders it
- **Then** it draws the asset-catalog icon tinted with `tintColor`, padded, on a
  `backgroundColor` fill, clipped to a circle of `size / 2.0` corner radius.

### Scenario: Rendering downloaded image bytes
- **Given** a view model holds `.data(data:)` with raw image bytes (e.g. a contact image)
- **When** `RoundedIconView` renders it
- **Then** it attempts `UIImage(data:)`; on success it shows a resizable circular image,
  and on failure it renders `EmptyView()` (no crash, no placeholder substitution here).

### Scenario: Account-type identity icon
- **Given** an `Account` whose `type` is `.joint`
- **When** UI requests `ImageType.accountTypeIcon(for: account)`
- **Then** it returns `.uiImage(account.typeImage)`, and `AccountIconProvider.iconData`
  would alternatively map the type to the `.Icons.group` glyph with the joint-account
  wallet color tokens.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `.data(data:)` bytes are not a decodable image | `UIImage(data:)` returns nil; `RoundedIconView` renders `EmptyView()` (blank, no crash) |
| `AccountIconProvider` receives a `nil` account | Falls back to `.Icons.question` glyph with neutral gray tint/background tokens |
| Account `type`/`authType` is `.invalid` | Provider uses the rekeyed/negative glyph and negative color tokens to flag the invalid state |
| Account is rekeyed (`authType != nil`) | Provider overrides the type glyph with `.Icons.rekeyedAccount` |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core (PeraWalletCore) | `Account` / `PeraAccount` models, `typeImage`, account type enums consumed by `accountTypeIcon` and `AccountIconProvider` |
| SwiftUI / UIKit | `Color`, `UIImage`, `Image`, `ImageResource` used by the enum and `RoundedIconView` |
| App design tokens (asset catalog) | `.Icons.*` glyphs and `.Wallet.* / .Text.* / .Layer.* / .Helpers.*` color tokens for icon styling |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
