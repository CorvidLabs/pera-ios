---
module: PeraWallet_Classes_TransferAssetBalance
version: 1
status: active
files:
  - PeraWallet/Classes/TransferAssetBalance/TransferAssetBalanceDraft.swift
  - PeraWallet/Classes/TransferAssetBalance/TransferAssetBalanceScreen.swift
  - PeraWallet/Classes/TransferAssetBalance/TransferAssetBalanceScreenTheme.swift
  - PeraWallet/Classes/TransferAssetBalance/TransferAssetBalanceViewModel.swift
  - PeraWallet/Classes/TransferAssetBalance/Views/TransferAssetBalanceNameView/TransferAssetBalanceNameViewModel.swift
  - PeraWallet/Classes/TransferAssetBalance/Views/TransferAssetBalanceNameView/TransferAssetBalanceNameViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_TransferAssetBalance

## Purpose

App-target UI/feature module (`PeraWallet/Classes/TransferAssetBalance`). Internal-by-default; see Public API for any cross-module-public surface.

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
