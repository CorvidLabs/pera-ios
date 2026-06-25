---
module: PeraWallet_Classes_Backup
version: 1
status: active
files:
  - PeraWallet/Classes/Backup/AccountSelection/BackUpAccountSelectionListLayout.swift
  - PeraWallet/Classes/Backup/AccountSelection/Data/BackUpAccountSelectionListDataSource.swift
  - PeraWallet/Classes/Backup/AccountSelection/Data/BackUpAccountSelectionListLocalDataController.swift
  - PeraWallet/Classes/Backup/AccountSelection/Views/AccountCell/BackUpAccountSelectionListAccountListItemCell.swift
  - PeraWallet/Classes/Backup/AccountSelection/Views/AccountCell/BackUpAccountSelectionListAccountListItemCellTheme.swift
  - PeraWallet/Classes/Backup/AccountSelection/Views/Header/BackUpAccountSelectionListHeader.swift
  - PeraWallet/Classes/Backup/AccountSelection/Views/Header/BackUpAccountSelectionListHeaderTheme.swift
  - PeraWallet/Classes/Backup/AccountSelection/Views/Header/BackUpAccountSelectionListHeaderViewModel.swift
  - PeraWallet/Classes/Backup/BackUpAccountFlowCoordinator.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Backup

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Backup`). Internal-by-default; see Public API for any cross-module-public surface.

## Public API

| Export | Description |
|--------|-------------|
| `calculatePreferredSize` | Macaroon view-sizing method computing a header/cell's preferred size for a given view model, layout sheet, and fitting size. |

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
