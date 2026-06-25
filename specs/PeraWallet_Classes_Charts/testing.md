# PeraWallet_Classes_Charts — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- No dedicated chart unit tests exist yet. High-value targets:
  - `TendenciesViewModel` — sign (`+`/`-`), percentage formatting, divide-by-zero guard when `firstValue == 0`, and the early return when fewer than 2 points or `first == last`.
  - `ChartSelectedPointHandler.resolveValues` — primary/secondary ordering for ALGO vs. fiat currency, and the nil/unwrap-failure fallback.
  - `ChartViewData.model` — correct mapping of DTO points to `ChartDataPointViewModel` and period passthrough.
  - `ChartAPIDataController` — scope routing and empty-result-on-failure behavior (mock `ALGAPI`).

## Manual QA checklist

- [ ] Home: portfolio chart loads for a user with one or more non-watch accounts; line + gradient area render.
- [ ] Home: with only watch accounts (or no accounts), no chart data is fetched and the cell does not error.
- [ ] Account Detail: balance chart matches the account's wealth over the selected period.
- [ ] ASA Detail: asset price/balance chart renders for the selected asset.
- [ ] Period switch: tapping each segment in `ChartSegmentedControlView` shows the loading spinner, then refetches and redraws for that period (`.oneWeek` default).
- [ ] Scrub: long-press + drag shows the dashed rule mark and circle on the nearest point; the headline value/date updates; releasing clears the marker.
- [ ] Tendency row: positive series shows `+`/up arrow in positive color; negative shows `-`/down arrow in negative color.
- [ ] Currency: switching the app's display currency re-fetches the chart in the new currency (fiat vs. ALGO ordering correct).

## Edge cases

- Empty dataset after a successful load: `LineChartView` falls back to `100`/`0` axis bounds (misleading) and draws nothing — verify it does not crash.
- Single data point or flat series (`first == last`): no tendency delta is shown.
- API failure: callback returns the error string and an empty array; chart should not show stale data.
- Currency unwrap failure: request falls back to `"USD"`.
- Rapid period taps while a fetch is in flight: confirm only the latest period's data is rendered (no flicker/stale binding).
