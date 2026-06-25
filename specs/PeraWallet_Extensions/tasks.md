# PeraWallet_Extensions — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Add unit tests for the kebab-case round-trip (`JSONEncoder`/`JSONDecoder` strategies)
      to lock the `assetId` ↔ `asset-id` contract against regressions.
- [ ] Add a unit test for `Int.fromMicroToValue()` covering zero, exact, and large values.
- [ ] Add coverage for `NSDiffableDataSourceSnapshot.replaceItem(matching:with:)`,
      including the no-match (no-op) path and first/last position handling.
- [ ] Consider generalizing `fromMicroToValue()` or documenting that the divisor is the
      fixed Algorand micro-unit factor (1,000,000), not a configurable decimals value.
- [ ] Audit `defaultShadow()` / `defaultPeraRowStyle()` against the design system to
      confirm the hardcoded opacity/radius values match current Pera tokens.

## Done
- [x] Spec and companion files scaffolded.
- [x] Spec enriched with source-grounded Purpose, Invariants, Behavioral Examples,
      Error Cases, and Dependencies.
