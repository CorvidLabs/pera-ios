# PeraWallet_Classes_Charts — Context

## Overview

Architectural context for the `PeraWallet_Classes_Charts` module. The authoritative
contract is `PeraWallet_Classes_Charts.spec.md`; the source files it covers are
listed in that spec's `files:` frontmatter.

This module renders interactive line charts for portfolio wealth and asset
balance/price over time. It is not a standalone screen — it ships
`UICollectionViewCell` wrappers that embed a SwiftUI chart and is mounted by the
Home, Account Detail, and ASA Detail screens.

## Architecture

Hybrid UIKit + SwiftUI, MVVM with Combine:

- **Data layer** — `ChartAPIDataController` (`Data/`): wraps `ALGAPI`, resolves the
  display currency from `SharedDataController`, and loads one of four scopes
  (`ChartDataScreen`: `home` / `account` / `asset` / `assetPrice`). Exposes
  closure callbacks (`onFetch` / `onAssetFetch` / `onAssetPriceFetch`) carrying an
  optional error string, the period, and sorted DTO results.
- **Models** — `ChartViewData` (host-facing input struct) builds a `ChartDataModel`
  (`ObservableObject`) of `ChartDataPointViewModel`s. `ChartViewModel`
  (`ObservableObject`) binds the model and publishes `isLoading`, `data`,
  `selectedPeriod`, `selectedPoint`, plus `onSelectedPeriodChanged` /
  `onPointSelected` callbacks. `ChartDataPoint` is the host-side point type
  (algo/fiat/usd values + timestamp). `TendenciesViewModel` computes the
  gain/loss delta, percentage, and up/down arrow.
- **Views (SwiftUI)** — `ChartView` (spinner vs. chart), `LineChartView`
  (`LineMark` + gradient `AreaMark`, dashed `RuleMark` + `PointMark` on selection),
  `LineChartOverlayView` (long-press + drag hit-testing via `ChartProxy`),
  `ChartSegmentedControlView` (period selector).
- **Cells (UIKit)** — `HomeChartsCell` and `AccountChartsCell` host `ChartView`
  through `UIHostingController` and re-expose `onPeriodChange` / `onPointSelected`.
  `ChartTendencyView` is the UIKit delta label row driven by `TendenciesViewModel`.
- **Handlers** — `ChartSelectedPointHandler.resolveValues` orders primary/secondary
  values depending on whether the selected currency is ALGO or fiat.

## Key files

- `Data/ChartAPIDataController.swift` — scope routing + API calls.
- `Models/ChartViewModel.swift` / `Models/ChartDataModel.swift` — Combine binding core.
- `Models/ChartViewData.swift` — host input → data model bridge.
- `Views/LineChartView.swift` / `Views/LineChartOverlayView.swift` — chart + scrub.
- `Cells/Home/HomeChartsCell.swift` / `Cells/Account/AccountChartsCell.swift` — embed points.
- See the spec `files:` list for the full set.

## Consumers (outside this module)

- `Accounts/List/Screens/HomeViewController.swift` (Home portfolio chart)
- `Accounts/Detail/...` (account balance chart)
- `Assets/Detail/ASADetailViewController/...` (asset price/balance chart)
- `Demo/Home/Data/HomeAPIDataController.swift`, `Routing/Router.swift`

## Architectural notes / decisions

- Note: two parallel copies of `HomeChartsCell` / `HomeChartsViewTheme` exist under
  `Charts/Cells/Home/` and `Charts/Home/`. Treat as a cleanup item (see tasks.md).
- Currency defaults to `"USD"` when `SharedDataController.currency` cannot be unwrapped.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
