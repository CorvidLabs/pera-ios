---
module: Classes_SwapV2
version: 1
status: active
files:
  - Classes/SwapV2/Models/SwapConfirmViewModel.swift
  - Classes/SwapV2/Models/SwapSharedViewModel.swift
  - Classes/SwapV2/SwapViewController.swift
  - Classes/SwapV2/Views/AssetSelectionView.swift
  - Classes/SwapV2/Views/BottomSheets/ConfirmSwapInfoSheet.swift
  - Classes/SwapV2/Views/BottomSheets/ProviderSheet.swift
  - Classes/SwapV2/Views/BottomSheets/SheetTitleView.swift
  - Classes/SwapV2/Views/BottomSheets/SwapSettingsSheet.swift
  - Classes/SwapV2/Views/Buttons/AccountSelectionButton.swift
  - Classes/SwapV2/Views/Buttons/AssetSwapButton.swift
  - Classes/SwapV2/Views/Buttons/ConfirmSlideButton.swift
  - Classes/SwapV2/Views/Buttons/SettingsSwapButton.swift
  - Classes/SwapV2/Views/Buttons/SwapButton.swift
  - Classes/SwapV2/Views/Buttons/SwitchSwapButton.swift
  - Classes/SwapV2/Views/ConfirmSwapView.swift
  - Classes/SwapV2/Views/ProviderSelectionView.swift
  - Classes/SwapV2/Views/SwapTitleView.swift
  - Classes/SwapV2/Views/SwapView.swift
db_tables: []
depends_on: []
---

# Classes_SwapV2

## Purpose

App-target UI/feature module (`Classes/SwapV2`). Internal-by-default; see Public API for any cross-module-public surface.

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
