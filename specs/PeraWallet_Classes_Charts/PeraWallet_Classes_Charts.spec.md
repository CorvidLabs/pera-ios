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

App-target UI/feature module (`PeraWallet/Classes/Charts`). Internal-by-default; see Public API for any cross-module-public surface.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.

## Behavioral Examples

### Scenario: Placeholder
- **Given** the app is running
- **When** this module's flow is entered
- **Then** it behaves per its screens/controllers

## Error Cases

| Condition | Behavior |
|-----------|----------|
| N/A | Documented per screen |

## Dependencies

| Module | Usage |
|--------|-------|
| PeraWalletCore | Shared models/services |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
