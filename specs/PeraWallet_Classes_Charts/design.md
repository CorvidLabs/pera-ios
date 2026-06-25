# PeraWallet_Classes_Charts — Design

## Layout & components

This is a UI module that renders an interactive line chart embedded as a collection
view cell. It has no screen of its own; the host screens place the cell.

- **Cells (UIKit host):**
  - `HomeChartsCell` — embeds `ChartView` via `UIHostingController`, pinned to all
    edges with `chartViewLeadingInset` (`-2`). Used on the Home portfolio screen.
  - `AccountChartsCell` — same embed, plus a fixed `contentHeight` and bottom inset;
    maps the selected point's `day` index back to a `ChartDataPoint` for the host.
- **SwiftUI chart stack:**
  - `ChartView` — switches between a centered `ProgressView` (loading) and the chart.
  - `LineChartView` — `LineMark` + gradient `AreaMark` (monotone interpolation),
    hidden X/Y axes, dynamic Y domain (`min * 0.99 ... max * 1.01`); on selection
    adds a dashed `RuleMark` and a bordered `PointMark` circle.
  - `LineChartOverlayView` — transparent gesture layer; long-press (0.1s) + drag
    resolves the nearest point via `ChartProxy`; clears on release.
  - `ChartSegmentedControlView` — horizontal row of period chips
    (`ChartDataPeriod.allCases`); selected chip uses a filled rounded background.
- **Tendency (UIKit):**
  - `ChartTendencyView` — row of `diffLabel`, up/down `iconView`, and `percentLabel`,
    driven by `TendenciesViewModel`.

## Navigation hierarchy

- Home / Account Detail / ASA Detail screen
  - collection view → `HomeChartsCell` / `AccountChartsCell`
    - `UIHostingController` → `ChartView`
      - `LineChartView` (+ `LineChartOverlayView` overlay)
      - `ChartSegmentedControlView`

No push/present navigation originates here; interaction is in-place (scrub, period
switch) with callbacks bubbling to the host.

## Design tokens

- **Colors:** `Color.Chart.line` (series), `Color.Chart.gradient` (area fill at 0.4 → 0
  opacity), `Color.Defaults.bg` (background + point border), `Color.Text.grayLighter`
  (rule mark / unselected period), `Color.Text.main` (selected period),
  `Color.ButtonGhost.focusBg` (selected period chip background),
  `Colors.Helpers.positive` / `Colors.Helpers.negative` (tendency delta).
- **Typography:** `Typography.bodyMedium()` for period chips and tendency labels.
- **Spacing/layout:** period chips `spacing: 16`, chip padding `8`/`16`, chip corner
  radius `8`; chart trailing padding `16`, vertical padding `5`; point circle `12×12`
  with `2pt` border; theme metrics (`contentHeight 172`, insets) via MacaroonUIKit
  `StyleSheet`/`LayoutSheet`.

## Assets

- `icon-market-increase` / `icon-market-decrease` — up/down arrow images for the
  tendency row (selected by sign of the series delta).
