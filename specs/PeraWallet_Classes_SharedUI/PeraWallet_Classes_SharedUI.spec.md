---
module: PeraWallet_Classes_SharedUI
version: 1
status: active
files:
  - PeraWallet/Classes/SharedUI/CircleIconView.swift
  - PeraWallet/Classes/SharedUI/Screens/ErrorScreen/ErrorScreen.swift
  - PeraWallet/Classes/SharedUI/Screens/ErrorScreen/ErrorScreenTheme.swift
  - PeraWallet/Classes/SharedUI/Screens/ErrorScreen/ErrorScreenViewModel.swift
  - PeraWallet/Classes/SharedUI/Screens/LoadingScreen/LoadingScreen.swift
  - PeraWallet/Classes/SharedUI/Screens/LoadingScreen/LoadingScreenTheme.swift
  - PeraWallet/Classes/SharedUI/Screens/LoadingScreen/LoadingScreenViewModel.swift
  - PeraWallet/Classes/SharedUI/Screens/SuccessResultScreen/SuccessResultScreen.swift
  - PeraWallet/Classes/SharedUI/Screens/SuccessResultScreen/SuccessResultScreenTheme.swift
  - PeraWallet/Classes/SharedUI/Screens/SuccessResultScreen/SuccessResultScreenViewModel.swift
  - PeraWallet/Classes/SharedUI/Views/Header/InfoBox/InfoBoxHeaderView.swift
  - PeraWallet/Classes/SharedUI/Views/Header/InfoBox/InfoBoxHeaderViewModel.swift
  - PeraWallet/Classes/SharedUI/Views/Header/InfoBox/InfoBoxHeaderViewTheme.swift
  - PeraWallet/Classes/SharedUI/Views/List/UIViewControllerCollectionCell/UIViewControllerCollectionCell.swift
  - PeraWallet/Classes/SharedUI/Views/NavigationPrimaryTitle/NavigationPrimaryTitleItemViewModel.swift
  - PeraWallet/Classes/SharedUI/Views/NavigationPrimaryTitle/NavigationPrimaryTitleItemViewTheme.swift
  - PeraWallet/Classes/SharedUI/Views/Text/RightAccessorizedLabel/RightAccessorizedLabel.swift
  - PeraWallet/Classes/SharedUI/Views/Text/RightAccessorizedLabel/RightAccessorizedLabelModel.swift
  - PeraWallet/Classes/SharedUI/Views/Text/RightAccessorizedLabel/RightAccessorizedLabelStyle.swift
  - PeraWallet/Classes/SharedUI/Views/Text/ShowMore/ShowMoreView.swift
  - PeraWallet/Classes/SharedUI/Views/Text/ShowMore/ShowMoreViewModel.swift
  - PeraWallet/Classes/SharedUI/Views/Text/ShowMore/ShowMoreViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_SharedUI

## Purpose

App-target UI/feature module (`PeraWallet/Classes/SharedUI`). Internal-by-default; see Public API for any cross-module-public surface.

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
