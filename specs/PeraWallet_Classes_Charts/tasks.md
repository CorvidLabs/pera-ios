# PeraWallet_Classes_Charts — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Consolidate duplicate `HomeChartsCell`/`HomeChartsViewTheme`: both `Charts/Cells/Home/` and `Charts/Home/` define these types — confirm which is live and remove the dead copy.
- [ ] Surface API/load errors to the user. `ChartAPIDataController` callbacks receive `apiError.localizedDescription` but the chart only falls back to an empty dataset; add a visible error/empty state in `ChartView`.
- [ ] Distinguish "loading" from "no data": `ChartView` shows a spinner only while `isLoading`; an empty (but loaded) series renders a blank `LineChartView`.
- [ ] `LineChartView` defaults `maxValue`/`minValue` to `100`/`0` when data is empty, producing a misleading axis domain — guard against the empty case.
- [ ] Localize hardcoded axis labels `"Date"` / `"Value"` and the default `"USD"` currency string in `ChartAPIDataController`.
- [ ] Add unit tests for `TendenciesViewModel` (sign, percentage, divide-by-zero guard) and `ChartSelectedPointHandler.resolveValues` (algo vs. fiat ordering).

## Done
- [x] Spec and companion files scaffolded.
- [x] Interactive scrubbing via `LineChartOverlayView` (long-press + drag, clears on release).
- [x] Period switching wired through `ChartSegmentedControlView` → `ChartViewModel.onSelectedPeriodChanged` → cell `onPeriodChange`.
- [x] Four fetch scopes implemented in `ChartAPIDataController`: home, account, asset, assetPrice.
