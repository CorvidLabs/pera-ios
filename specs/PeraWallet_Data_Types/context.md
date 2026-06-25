# PeraWallet_Data_Types — Context

## Overview

Architectural context for the `PeraWallet_Data_Types` module. The authoritative contract
is `PeraWallet_Data_Types.spec.md`; the source files it covers are listed in that spec's
`files:` frontmatter.

This module defines `ImageType`, a `Hashable` enum that view models use to declare an
image *source* (raw `Data`, a tinted asset `icon`, or a ready `UIImage`) without owning
how it is drawn. It is a small "value type" leaf used pervasively by account, contact,
inbox, and joint-account UI.

## Key files

- `PeraWallet/Data Types/ImageType.swift` — the `ImageType` enum, nested `IconData`
  struct, and static factories (`placeholderUserIconData`, `placeholderGroupIconData`,
  `accountTypeIcon(for:)`). *This is the only file in the spec's `files:` list.*

### Closely related (consumers / collaborators, outside this spec's `files:`)
- `PeraWallet/Views/Image Views/RoundedIconView.swift` — canonical renderer; exhaustive
  `switch` over the three cases, applies circular clipping and icon tint/background.
- `PeraWallet/Data Providers/AccountIconProvider.swift` — builds `ImageType.IconData`
  from a `PeraAccount`, mapping account type + rekey/invalid state to glyph + color tokens.
- Many view models hold an `ImageType` avatar/image field, e.g. under
  `Scenes/Joint Account`, `Scenes/Create Joint Account`, `Scenes/Inbox`,
  `Classes/IncomingASA`, and `Views/Rows` / `Views/Buttons`.

## Architectural decisions

- **MVVM**: `ImageType` lives in the view-model layer; rendering is delegated entirely to
  the SwiftUI view (`RoundedIconView`). Construction-time styling (tint/background) keeps
  the renderer dumb and color decisions centralized in `AccountIconProvider`.
- **Three-source abstraction**: one enum unifies network bytes, design-system icons, and
  generated account images, so list rows can diff on a single `Hashable` field.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
