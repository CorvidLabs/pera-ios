---
module: PeraWallet_Classes_Charts
version: 1
status: active
files:
  - PeraWallet/Classes/Charts/Cells/Account/AccountChartsCell.swift
  - PeraWallet/Classes/Charts/Cells/Account/AccountChartsViewTheme.swift
  - PeraWallet/Classes/Charts/Cells/Home/HomeChartsCell.swift
  - PeraWallet/Classes/Charts/Cells/Home/HomeChartsViewTheme.swift
  - PeraWallet/Classes/Charts/Data/ChartAPIDataController.swift
  - PeraWallet/Classes/Charts/Data/ChartDataPoint.swift
  - PeraWallet/Classes/Charts/Handlers/ChartSelectedPointHandler.swift
  - PeraWallet/Classes/Charts/Home/HomeChartsCell.swift
  - PeraWallet/Classes/Charts/Home/HomeChartsViewTheme.swift
  - PeraWallet/Classes/Charts/Models/ChartDataModel.swift
  - PeraWallet/Classes/Charts/Models/ChartSelectedPointViewModel.swift
  - PeraWallet/Classes/Charts/Models/ChartViewData.swift
  - PeraWallet/Classes/Charts/Models/ChartViewModel.swift
  - PeraWallet/Classes/Charts/Models/TendenciesViewModel.swift
  - PeraWallet/Classes/Charts/Views/ChartSegmentedControlView.swift
  - PeraWallet/Classes/Charts/Views/ChartTendencyView.swift
  - PeraWallet/Classes/Charts/Views/ChartView.swift
  - PeraWallet/Classes/Charts/Views/LineChartOverlayView.swift
  - PeraWallet/Classes/Charts/Views/LineChartView.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Charts

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Charts`) that renders portfolio
and asset balance/price line charts. It owns the full chart vertical: fetching
time-series data from the API, transforming it into view models, drawing an
interactive SwiftUI `Charts` line chart, and reporting the user's selected period
and touched data point back to the host screen.

The module does not own its own screen. Instead it exposes two
`UICollectionViewCell` wrappers — `HomeChartsCell` and `AccountChartsCell` — that
embed a SwiftUI `ChartView` via `UIHostingController`. These cells are consumed by
the Home portfolio screen (`HomeViewController`), the Account Detail screen, and the
ASA (asset) Detail screen.

Key flows:
- **Data fetch:** `ChartAPIDataController` resolves the user's display currency from
  `SharedDataController` and loads time-series points for one of four scopes
  (`home` aggregate wealth across non-watch accounts, single `account` wealth, an
  `asset` balance, or an `assetPrice` series) via `ALGAPI`.
- **Rendering:** `ChartViewData` maps fetched DTOs into a `ChartDataModel`;
  `ChartViewModel` (Combine `ObservableObject`) binds that model and drives the
  SwiftUI `ChartView` → `LineChartView` (line + gradient area mark).
- **Interaction:** `ChartSegmentedControlView` switches the period; a long-press +
  drag over `LineChartOverlayView` selects the nearest point; `TendenciesViewModel`
  and `ChartTendencyView` show the gain/loss delta and percentage for the series.

Ownership boundary: this module owns chart presentation and chart data fetching
only. The host screens own placement of the cell, the headline balance label, and
what to do with the selected point / period-change callbacks.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. Home chart data is fetched only for `authenticatedUser` accounts that are **not**
   watch accounts; `loadHomeData` returns early when no such addresses exist.
3. Fetched balance points are sorted ascending by `round` before they reach the view
   model, so the x-axis (`day` index) renders chronologically.
4. The selected point exists only during an active touch: `LineChartOverlayView`
   sets `selectedPoint` on long-press/drag and clears it to `nil` on `onEnded`, so a
   released chart shows no rule/point marker.
5. Every fetch resolves a display currency (defaulting to `"USD"`) from
   `SharedDataController`; on API failure the callbacks are invoked with the error
   description and an **empty** data array rather than a partial dataset.

## Behavioral Examples

### Scenario: Viewing portfolio chart on Home
- **Given** the user has at least one non-watch account
- **When** the Home screen displays the `HomeChartsCell`
- **Then** `ChartAPIDataController.loadData(screen: .home, period: .oneWeek)` fetches
  aggregate wealth across those accounts, the points are sorted by round, and
  `LineChartView` renders the line + gradient area for the default one-week period.

### Scenario: Scrubbing to inspect a data point
- **Given** a rendered chart with loaded data
- **When** the user long-presses and drags across the chart
- **Then** `LineChartOverlayView` maps the touch x-position to the nearest
  `ChartDataPointViewModel`, sets it as `selectedPoint` (showing a dashed rule mark
  and a circle), and on release clears the selection back to `nil`.

### Scenario: Changing the period
- **Given** the chart is showing the one-week period
- **When** the user taps a different segment in `ChartSegmentedControlView`
- **Then** `ChartViewModel` sets `isLoading = true`, updates the data model period,
  and fires `onSelectedPeriodChanged`, which the host cell forwards via
  `onPeriodChange` to refetch data for the new period.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| API request fails (any scope) | Callback invoked with `apiError.localizedDescription` and an empty `[]` results array; chart shows no data |
| Home scope with no non-watch accounts | `loadHomeData` returns early; no fetch is made, no callback fired |
| Currency cannot be resolved/unwrapped | Falls back to default `"USD"` currency for the request |
| Chart data has 0 or 1 points, or first == last value | `TendenciesViewModel.configure` returns early; no difference/percentage/arrow shown |
| First value is 0 | Percentage delta is skipped (avoids divide-by-zero); absolute difference still shown |
| Touch maps to no resolvable day/nearest point | `selectedPoint` is set to `nil` (no marker drawn) |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core (PeraWalletCore) | `ALGAPI` chart endpoints, `ChartDataPeriod`, `ChartDataDTO`/`AssetChartDataDTO`/`AssetPriceChartItemDTO`, `Session`, `SharedDataController`, `AppConfiguration`, `CurrencyProvider`/`RemoteCurrencyValue`, `CurrencyFormatter`, `AssetID` |
| Charts (Apple SwiftUI) | `LineMark`/`AreaMark`/`RuleMark`/`PointMark`, `ChartProxy` for touch hit-testing |
| SwiftUI / UIKit interop | `UIHostingController` embeds `ChartView` inside the `UICollectionViewCell` wrappers |
| MacaroonUIKit | `StyleSheet`/`LayoutSheet` themes, `TextProvider`/`ImageProvider`, `Typography`, layout constraints (SnapKit) |
| Combine | `ObservableObject` bindings between `ChartDataModel` and `ChartViewModel` |
| Host UI modules (Home / Account Detail / ASA Detail) | Consume the cells and react to `onPeriodChange` / `onPointSelected` callbacks |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
