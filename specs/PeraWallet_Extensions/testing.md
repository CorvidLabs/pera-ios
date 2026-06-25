# PeraWallet_Extensions — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Run via the Xcode test action (see `BUILDING.md`).
- These extensions are mostly untested in isolation today; they are exercised
  indirectly through API decoding and SwiftUI scenes. Good candidates for direct
  unit tests are the pure functions: the kebab-case strategies, `fromMicroToValue()`,
  and `replaceItem(matching:with:)`.

## Manual QA checklist

- [ ] API decoding: list/detail screens that hit Algod/Indexer render correctly,
      confirming kebab-case keys (`asset-id`, `is-frozen`, etc.) decode into models.
- [ ] Encoding round-trip: any request body using `.kebabCase` encoding produces
      kebab-case keys the backend accepts.
- [ ] Balance display: an account/asset balance from micro-units shows the correct
      decimal value (e.g. 1,500,000 micro → 1.5).
- [ ] Typography: custom DMMono / DMSans weights render with the bundled fonts (no
      system-font fallback) across light/dark mode.
- [ ] List styling: rows using `defaultPeraRowStyle()` have no extra insets,
      transparent background, and hidden separators.
- [ ] Shadows: components using `defaultShadow()` show the layered Pera shadow.
- [ ] Diffable lists: updating an item in a UIKit list (e.g. account/asset rows) keeps
      its position when `replaceItem(matching:with:)` is used.
- [ ] Localized markdown strings render bold/links correctly via
      `AttributedString(localizedMarkdown:)`.
- [ ] App version surfaces (e.g. Settings) display `Bundle.appVersion`.

## Edge cases

- Kebab-case decode of a single-segment key (`name` → `name`) and multi-segment key
  (`min-balance` → `minBalance`).
- Encode of an all-lowercase property (no hyphens inserted) vs. a camelCase property.
- `fromMicroToValue()` with `0` and with very large `Int` values (Double precision).
- `replaceItem(matching:)` when no item matches (must be a no-op) and when replacing
  the first or last item in the snapshot.
- `AttributedString(localizedMarkdown:)` with malformed markdown (throws).
- Custom font file missing/unregistered → SwiftUI system-font fallback, no crash.
