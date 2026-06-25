---
module: PeraWallet_Classes_AlgorandSecureBackup
version: 1
status: active
files:
  - PeraWallet/Classes/AlgorandSecureBackup/AlgorandSecureBackupFlowCoordinator.swift
  - PeraWallet/Classes/AlgorandSecureBackup/AlgorandSecureBackupImportFlowCoordinator.swift
  - PeraWallet/Classes/AlgorandSecureBackup/BackupParameters.swift
  - PeraWallet/Classes/AlgorandSecureBackup/BackupValidator.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Backup/AlgorandSecureBackupImportBackupScreen.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Backup/AlgorandSecureBackupImportBackupScreenTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Backup/Views/AlgorandSecureBackupFileView.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Backup/Views/AlgorandSecureBackupFileViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Backup/Views/AlgorandSecureBackupFileViewTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Recover/AlgorandSecureBackupRecoverMnemonicScreen.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Recover/AlgorandSecureBackupRecoverMnemonicScreenTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Recover/Views/AlogranSecureBackupImportMnemonicTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Success/Data/AlgorandSecureBackupImportSuccessScreenLocalDataController.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Success/Views/AlgorandSecureBackupImportSuccessHeaderViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Import/Success/Views/AlgorandSecureBackupImportSuccessInfoBoxViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/AlgorandSecureBackupInstructionsScreen.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/AlgorandSecureBackupInstructionsScreenTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/Views/AlgorandSecureBackupInstructionItemView.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/Views/AlgorandSecureBackupInstructionItemViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/Views/AlgorandSecureBackupInstructionItemViewTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/Views/AlgorandSecureBackupSaveBackupFileInstructionItemViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/Views/AlgorandSecureBackupSelectAccountsInstructionItemViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Instructions/Views/AlgorandSecureBackupStoreKeysInstructionItemViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Mnemonics/AlgorandSecureBackupMnemonicsScreen.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Mnemonics/AlgorandSecureBackupMnemonicsScreenTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Mnemonics/Views/AlgorandSecureBackupMnemonicViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Error/AlgorandSecureBackupErrorScreen.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Error/AlgorandSecureBackupErrorScreenTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Error/Views/AlgorandSecureBackupErrorResultViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Error/Views/AlgorandSecureBackupErrorResultViewTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/AlgorandSecureBackupSuccessScreen.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/AlgorandSecureBackupSuccessScreenTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/Views/FileInfo/FileInfoView.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/Views/FileInfo/FileInfoViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/Views/FileInfo/FileInfoViewTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/Views/Header/AlgorandSecureBackupSuccessHeaderViewModel.swift
  - PeraWallet/Classes/AlgorandSecureBackup/Result/Success/Views/Header/AlgorandSecureBackupSuccessHeaderViewTheme.swift
  - PeraWallet/Classes/AlgorandSecureBackup/SecureBackup.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_AlgorandSecureBackup

## Purpose

App-target UI/feature module (`PeraWallet/Classes/AlgorandSecureBackup`). Internal-by-default; see Public API for any cross-module-public surface.

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
