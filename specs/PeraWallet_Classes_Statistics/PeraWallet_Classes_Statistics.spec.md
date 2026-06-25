---
module: PeraWallet_Classes_Statistics
version: 1
status: active
files:
  - PeraWallet/Classes/Statistics/Screens/AlgoStatisticsViewController+Theme.swift
  - PeraWallet/Classes/Statistics/Views/Loading/AlgoStatisticsLoadingView.swift
  - PeraWallet/Classes/Statistics/Views/Loading/AlgoStatisticsLoadingViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Statistics

## Purpose

App-target UI module (`PeraWallet/Classes/Statistics`) holding the residual
pieces of the legacy ALGO price/statistics screen. The covered files are:

- `Screens/AlgoStatisticsViewController+Theme.swift` — a `Theme` struct
  (conforming to MacaroonUIKit `LayoutSheet`/`StyleSheet`) declared as an
  extension on `AlgoStatisticsViewController`. It defines the screen
  background color, the date-selection modal size (`screen width × 434`),
  and a presentation modal height of `80%` of the screen height.
- `Views/Loading/AlgoStatisticsLoadingView.swift` — a `View`/`ListReusable`
  skeleton/shimmer placeholder shown while statistics load. It composes
  `GradientView` blocks (price, price subtitle, control bar, header, and a
  loop of three list-item rows) plus a `chart-loading-bg` image to mimic the
  shape of the loaded statistics screen. User interaction is disabled.
- `Views/Loading/AlgoStatisticsLoadingViewTheme.swift` — the layout/style
  sheet (corner radius, margins, sizes, separators, image style) consumed by
  the loading view's `customize(_:)`.

Ownership boundary: this module owns only the *theme* and *loading skeleton*
for the historical statistics screen. The owning `AlgoStatisticsViewController`
class itself is no longer present in the codebase, and ALGO/asset price
charting has been superseded by the `PeraWallet/Classes/Charts` module
(`HomeChartsCell`, `AccountChartsCell`, `ChartViewData`) and the
`AssetStatisticsSectionView` in ASA detail. These two view files are
effectively orphaned legacy scaffolding retained for reference.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal/`final` access); not a public
   library boundary. No symbol is declared `public`.
2. `AlgoStatisticsLoadingView` is purely presentational: it sets
   `isUserInteractionEnabled = false` in `linkInteractors()` and exposes no
   data-binding API — it shows fixed shimmer geometry only.
3. The `Theme` extension derives its modal sizes from `UIScreen.main.bounds`
   at init time (date-selection modal width = screen width, height `434`;
   `modalHeight` = `0.8 × screen height`), so sizing is screen-relative.
4. All colors/styles route through the app design system (`AppColors.Shared.*`,
   `MacaroonUIKit` style/layout sheets); no raw `UIColor` literals are used.

## Behavioral Examples

### Scenario: Statistics screen renders its loading skeleton
- **Given** a host screen presents `AlgoStatisticsLoadingView` while data loads
- **When** `customize(_:)` runs with `AlgoStatisticsLoadingViewTheme`
- **Then** it lays out gradient placeholders for the price (`109×44`), price
  subtitle (`59×20`), a `180`pt chart image (`chart-loading-bg`), and a
  `30`pt control bar, all with `4`pt corner radius and interaction disabled.

### Scenario: Modal sizing follows the device screen
- **Given** the legacy statistics screen applies its `Theme`
- **When** the date-selection modal or main modal is presented
- **Then** the date-selection modal is `screen-width × 434` and the main
  modal height is `80%` of the screen height.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Statistics data not yet loaded | `AlgoStatisticsLoadingView` displays a static shimmer skeleton; no spinner, no error text. |
| Owning `AlgoStatisticsViewController` class absent | The `+Theme` extension and loading view are orphaned scaffolding; they compile but are not instantiated by any live flow (charting now lives in `Classes/Charts`). |
| User taps inside the loading view | No effect — `isUserInteractionEnabled` is `false`. |

## Dependencies

| Module | Usage |
|--------|-------|
| MacaroonUIKit | `View`, `ListReusable`, `LayoutSheet`/`StyleSheet`, `GradientView`, `ImageView`, `Corner`, `Separator`, layout primitives. |
| SnapKit | Auto Layout constraints (`snp.makeConstraints`) for the skeleton subviews. |
| UIKit | `UIScreen`, `UIView`, `CGSize` for screen-relative theme metrics. |
| AppColors (app design system) | `AppColors.Shared.System.background` and `AppColors.Shared.Layer.gray*` gradient/separator colors. |
| Asset catalog | `chart-loading-bg` image used by the skeleton chart placeholder. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
