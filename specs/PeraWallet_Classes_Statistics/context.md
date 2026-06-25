# PeraWallet_Classes_Statistics — Context

## Overview

Architectural context for the `PeraWallet_Classes_Statistics` module. The
authoritative contract is `PeraWallet_Classes_Statistics.spec.md`; the source
files it covers are listed in that spec's `files:` frontmatter.

This is a thin, legacy slice of the old ALGO price/statistics screen. Only
three files remain in `PeraWallet/Classes/Statistics`: a `Theme` extension and
a loading-skeleton view plus its theme.

## Key files

- `Screens/AlgoStatisticsViewController+Theme.swift` — MacaroonUIKit
  `LayoutSheet`/`StyleSheet` `Theme` on `AlgoStatisticsViewController`
  (background color, date-selection modal size, `0.8×` screen-height modal).
- `Views/Loading/AlgoStatisticsLoadingView.swift` — `final` `View` +
  `ListReusable` shimmer skeleton built from `GradientView` blocks and a
  `chart-loading-bg` image; non-interactive.
- `Views/Loading/AlgoStatisticsLoadingViewTheme.swift` — layout/style metrics
  (corners, margins, sizes, separators) for the loading view.

## Architectural decisions

- UI follows the Pera/Macaroon convention: a `View` subclass with a `customize(_:)`
  method that consumes an external `*Theme` struct conforming to
  `LayoutSheet`/`StyleSheet`. Layout is done with SnapKit.
- No MVVM view model, data controller, or coordinator lives in this module —
  data binding for the loading state is intentionally absent (static skeleton).
- The owning `AlgoStatisticsViewController` class is no longer present in the
  repository; modern charting is implemented in `PeraWallet/Classes/Charts`
  (`HomeChartsCell`, `AccountChartsCell`, `ChartViewData`, `TendenciesViewModel`)
  and `AssetStatisticsSectionView` under ASA detail.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI. The
covered files are effectively orphaned legacy scaffolding — see Tasks for the
recommended follow-up (verify removal vs. retention).
