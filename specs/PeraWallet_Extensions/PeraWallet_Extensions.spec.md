---
module: PeraWallet_Extensions
version: 1
status: active
files:
  - PeraWallet/Extensions/AttributedString+Utils.swift
  - PeraWallet/Extensions/Bundle+Utils.swift
  - PeraWallet/Extensions/Font+CustomFonts.swift
  - PeraWallet/Extensions/Int+Extensions.swift
  - PeraWallet/Extensions/JSONDecoder+Utils.swift
  - PeraWallet/Extensions/JSONEncoder+Utils.swift
  - PeraWallet/Extensions/NSDiffableDataSourceSnapshot+Replace.swift
  - PeraWallet/Extensions/View+Styles.swift
  - PeraWallet/Extensions/Views/AnyTransition+Extensions.swift
  - PeraWallet/Extensions/Views/View+Extensions.swift
db_tables: []
depends_on: []
---

# PeraWallet_Extensions

## Purpose

App-target utility module (`PeraWallet/Extensions`). It is a small collection of
cross-cutting extensions on Foundation, SwiftUI, and UIKit types — there are no
screens, view controllers, view models, or coordinators here. The helpers are
consumed throughout the app's scenes and managers:

- **Encoding/decoding (Algorand API JSON):** `JSONDecoder.KeyDecodingStrategy.kebabCase`
  and `JSONEncoder.KeyEncodingStrategy.kebabCase` convert between kebab-case API
  keys (e.g. `asset-id`) and Swift camelCase properties (e.g. `assetId`), producing
  an `APICodingKey` per key. Used by the Algod/Indexer API managers and core services.
- **Numeric formatting:** `Int.fromMicroToValue()` converts an Algorand microAlgo /
  micro-unit integer amount into its decimal `Double` value (÷ 1,000,000).
- **Typography:** `Font.DMMono` / `Font.DMSans` enumerate the bundled custom font
  weights/styles; the `PeraFont` protocol resolves a weight to a sized `Font` via
  `.size(_:)`, mapping cases to font names like `DMMono-Regular`, `DMSans-Bold`.
- **SwiftUI view styling:** `View.defaultPeraRowStyle()` (clears list-row insets,
  background, and separator) and `View.defaultShadow()` (layered Pera shadow);
  `AnyTransition.moveFromPointToCenter(point:)` for offset-based transitions.
- **Localized markdown:** `AttributedString(localizedMarkdown:)` builds an attributed
  string from a `LocalizedStringResource`, parsing markdown.
- **App metadata:** `Bundle.appVersion` reads `CFBundleShortVersionString`.
- **Diffable data sources:** `NSDiffableDataSourceSnapshot.replaceItem(matching:with:)`
  swaps a snapshot item in place, preserving its position.

Ownership boundary: this module owns only generic, reusable type extensions. It does
not own feature flows, business logic, or persistence; consumers in `Scenes/`,
`Classes/`, and `Managers/` depend on these helpers.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. All declarations here are pure, stateless extensions on existing system types
   (Foundation/SwiftUI/UIKit) — no stored global state and no side effects beyond the
   value/view they return.
3. The kebab-case decode and encode strategies are inverses for round-trippable keys:
   `assetId` ↔ `asset-id`. Both emit an `APICodingKey` and never throw; an unmappable
   key resolves to an empty-string `APICodingKey`.
4. `Int.fromMicroToValue()` always divides by exactly 1,000,000 (the Algorand micro-unit
   factor) and returns a `Double`; it performs no rounding or currency formatting.
5. Each `PeraFont` case maps to a deterministic bundled font name
   (`DMMono-<RawValue>` / `DMSans-<RawValue>`); `.size(_:)` returns `.custom(name:size:)`
   and assumes the font is registered in the app's `Info.plist` / asset bundle.

## Behavioral Examples

### Scenario: Decoding an Algorand API response with kebab-case keys
- **Given** an API JSON payload containing keys such as `asset-id` and `is-frozen`
- **When** a `JSONDecoder` configured with `.keyDecodingStrategy = .kebabCase` decodes it
- **Then** each key's segments are camelCased after the first (`assetId`, `isFrozen`) and
  wrapped in an `APICodingKey`, so a Swift model with camelCase properties decodes cleanly.

### Scenario: Displaying a micro-unit balance
- **Given** an integer amount of `1500000` micro-units from the Algod API
- **When** `amount.fromMicroToValue()` is called
- **Then** it returns `1.5` as a `Double` for downstream currency/asset formatting.

### Scenario: Replacing a row in a diffable list snapshot
- **Given** an `NSDiffableDataSourceSnapshot` whose items include a row matching a predicate
- **When** `replaceItem(matching:with:)` is called with a new item
- **Then** the matched item is deleted and the new item is inserted at the same position
  (before/after the neighbor, or appended) and reloaded; if no item matches, the snapshot
  is left unchanged.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `AttributedString(localizedMarkdown:)` given invalid markdown | Throws the underlying `AttributedString(markdown:)` error to the caller. |
| Kebab-case coding key cannot be mapped (nil intermediate result) | Falls back to an `APICodingKey(stringValue: "")` rather than crashing. |
| `replaceItem(matching:)` finds no matching item | Returns early; snapshot is unmodified. |
| `Bundle.appVersion` when `CFBundleShortVersionString` is absent | Returns `nil` (optional). |
| `Font` weight whose bundled font file is not registered | `.custom(name:size:)` falls back to the system font (SwiftUI behavior); no crash. |

## Dependencies

| Module | Usage |
|--------|-------|
| Foundation | `AttributedString`, `Bundle`, `JSONDecoder`/`JSONEncoder` key strategies, `Int`. |
| SwiftUI | `Font`/`PeraFont` typography, `View` styling modifiers, `AnyTransition`. |
| UIKit | `NSDiffableDataSourceSnapshot.replaceItem(matching:with:)`. |
| APICodingKey (`Managers/API/Data Types`) | Concrete `CodingKey` produced by both kebab-case strategies. |
| Consumers (Scenes/, Classes/, Managers/) | API managers (Algod/Indexer), core services, and many SwiftUI scenes (Settings, Inbox, Add Account, etc.) call these helpers. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
