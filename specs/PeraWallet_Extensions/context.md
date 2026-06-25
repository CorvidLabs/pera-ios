# PeraWallet_Extensions — Context

## Overview

`PeraWallet_Extensions` is a small, foundational utility module under
`PeraWallet/Extensions`. It contains only cross-cutting extensions on system types
(Foundation, SwiftUI, UIKit) — no MVVM stack, no coordinators, no screens. It is a
dependency of many feature scenes and managers rather than a feature itself. The
authoritative contract is `PeraWallet_Extensions.spec.md`; covered source files are
in that spec's `files:` frontmatter.

## Key files

- `JSONDecoder+Utils.swift` / `JSONEncoder+Utils.swift` — `.kebabCase` key strategies
  bridging Algorand kebab-case API keys and Swift camelCase via `APICodingKey`.
- `Int+Extensions.swift` — `fromMicroToValue()` micro-unit → `Double` conversion.
- `Font+CustomFonts.swift` — `DMMono` / `DMSans` weight enums + `PeraFont` protocol
  for resolving bundled custom fonts to sized SwiftUI `Font`s.
- `View+Styles.swift` / `Views/View+Extensions.swift` — `defaultPeraRowStyle()` and
  `defaultShadow()` SwiftUI view modifiers.
- `Views/AnyTransition+Extensions.swift` — `moveFromPointToCenter(point:)` transition.
- `AttributedString+Utils.swift` — localized-markdown initializer.
- `Bundle+Utils.swift` — `appVersion` accessor.
- `NSDiffableDataSourceSnapshot+Replace.swift` — in-place item replacement for
  UIKit diffable data sources.

## Architectural decisions

- Pure, stateless extensions only; no shared mutable state lives here.
- API JSON key casing is centralized in the two `kebabCase` strategies so models can
  use idiomatic Swift property names. They depend on `APICodingKey`
  (`Managers/API/Data Types/APICodingKey.swift`).
- Typography is encoded as enums conforming to `PeraFont`, keeping font-name strings
  in one place rather than scattered string literals.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
