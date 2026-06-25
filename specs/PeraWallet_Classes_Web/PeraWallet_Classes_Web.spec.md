---
module: PeraWallet_Classes_Web
version: 1
status: active
files:
  - PeraWallet/Classes/Web/Cryptor.swift
  - PeraWallet/Classes/Web/Import/Account/ImportAccountScreen.swift
  - PeraWallet/Classes/Web/Import/Account/ImportAccountScreenTheme.swift
  - PeraWallet/Classes/Web/Import/AccountImportFlowCoordinator.swift
  - PeraWallet/Classes/Web/Import/AccountImportParameters.swift
  - PeraWallet/Classes/Web/Import/Error/Views/WebImportErrorResultViewTheme.swift
  - PeraWallet/Classes/Web/Import/Error/Views/WebImportErrorViewModel.swift
  - PeraWallet/Classes/Web/Import/Error/WebImportErrorScreen.swift
  - PeraWallet/Classes/Web/Import/Error/WebImportErrorScreenTheme.swift
  - PeraWallet/Classes/Web/Import/Introduction/Views/WebImportGoToPeraWebWalletInstructionItemViewModel.swift
  - PeraWallet/Classes/Web/Import/Introduction/Views/WebImportGoToTransferAccountsInstructionViewModel.swift
  - PeraWallet/Classes/Web/Import/Introduction/Views/WebImportSelectAccountsAndGenerateQRInstructionItemViewModel.swift
  - PeraWallet/Classes/Web/Import/Introduction/Views/WebImportTapStartToScanQRInstructionItemViewModel.swift
  - PeraWallet/Classes/Web/Import/Introduction/WebImportInstructionScreen.swift
  - PeraWallet/Classes/Web/Import/Introduction/WebImportInstructionScreenTheme.swift
  - PeraWallet/Classes/Web/Import/QRScanner/ImportQRScannerScreen.swift
  - PeraWallet/Classes/Web/Import/Success/Data/WebImportSuccessScreenDataController.swift
  - PeraWallet/Classes/Web/Import/Success/Data/WebImportSuccessScreenDataSource.swift
  - PeraWallet/Classes/Web/Import/Success/Data/WebImportSuccessScreenLocalDataController.swift
  - PeraWallet/Classes/Web/Import/Success/View/WebImportSuccessHeaderView.swift
  - PeraWallet/Classes/Web/Import/Success/View/WebImportSuccessHeaderViewModel.swift
  - PeraWallet/Classes/Web/Import/Success/View/WebImportSuccessHeaderViewTheme.swift
  - PeraWallet/Classes/Web/Import/Success/View/WebImportSuccessInfoBoxCell.swift
  - PeraWallet/Classes/Web/Import/Success/View/WebImportSuccessInfoBoxTheme.swift
  - PeraWallet/Classes/Web/Import/Success/View/WebImportSuccessInfoBoxViewModel.swift
  - PeraWallet/Classes/Web/Import/Success/WebImportSuccessScreen.swift
  - PeraWallet/Classes/Web/Import/Success/WebImportSuccessScreenListLayout.swift
  - PeraWallet/Classes/Web/Import/Success/WebImportSuccessScreenTheme.swift
  - PeraWallet/Classes/Web/QRBackupParameters.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Web

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Web`). Internal-by-default; see Public API for any cross-module-public surface.

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
