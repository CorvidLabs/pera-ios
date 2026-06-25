---
module: PeraWallet_Classes_Settings
version: 1
status: active
files:
  - PeraWallet/Classes/Settings/Appearance/AppearanceSelectionViewController.swift
  - PeraWallet/Classes/Settings/Appearance/AppearanceSelectionViewController+Theme.swift
  - PeraWallet/Classes/Settings/Common/Selection/ViewModels/SingleSelectionViewModel.swift
  - PeraWallet/Classes/Settings/Common/Selection/Views/SingleSelection/Cell/SingleSelectionCell.swift
  - PeraWallet/Classes/Settings/Common/Selection/Views/SingleSelection/Cell/SingleSelectionView.swift
  - PeraWallet/Classes/Settings/Common/Selection/Views/SingleSelection/Cell/SingleSelectionViewTheme.swift
  - PeraWallet/Classes/Settings/Common/Selection/Views/SingleSelection/List/SingleSelectionListView.swift
  - PeraWallet/Classes/Settings/Common/Selection/Views/SingleSelection/List/SingleSelectionListViewTheme.swift
  - PeraWallet/Classes/Settings/Currency/DataSource/CurrencySelectionDataController.swift
  - PeraWallet/Classes/Settings/Currency/DataSource/CurrencySelectionListAPIDataController.swift
  - PeraWallet/Classes/Settings/Currency/DataSource/CurrencySelectionListDataSource.swift
  - PeraWallet/Classes/Settings/Currency/Layout/CurrencySelectionListLayout.swift
  - PeraWallet/Classes/Settings/Currency/Layout/CurrencySelectionListLayout+Theme.swift
  - PeraWallet/Classes/Settings/Currency/Loading/CurrencySelectionItemLoadingView.swift
  - PeraWallet/Classes/Settings/Currency/Loading/CurrencySelectionItemLoadingViewTheme.swift
  - PeraWallet/Classes/Settings/Currency/Loading/CurrencySelectionLoadingView.swift
  - PeraWallet/Classes/Settings/Currency/Loading/CurrencySelectionLoadingViewCell.swift
  - PeraWallet/Classes/Settings/Currency/Loading/CurrencySelectionLoadingViewTheme.swift
  - PeraWallet/Classes/Settings/Currency/Screens/CurrencySelectionViewController.swift
  - PeraWallet/Classes/Settings/Currency/Screens/CurrencySelectionViewController+Theme.swift
  - PeraWallet/Classes/Settings/Currency/ViewModels/CurrencySelectionNoContentViewModel.swift
  - PeraWallet/Classes/Settings/Currency/ViewModels/CurrencySelectionViewModel.swift
  - PeraWallet/Classes/Settings/Currency/Views/CurrencySelectionCell.swift
  - PeraWallet/Classes/Settings/Currency/Views/CurrencySelectionView.swift
  - PeraWallet/Classes/Settings/Currency/Views/CurrencySelectionViewTheme.swift
  - PeraWallet/Classes/Settings/Developer/Screens/DeveloperSettingsViewController.swift
  - PeraWallet/Classes/Settings/Developer/Screens/DeveloperSettingsViewController+Theme.swift
  - PeraWallet/Classes/Settings/Developer/Views/DeveloperSettingsView.swift
  - PeraWallet/Classes/Settings/Developer/Views/DeveloperSettingsViewTheme.swift
  - PeraWallet/Classes/Settings/DeveloperMenu/Screens/DeveloperMenuViewController.swift
  - PeraWallet/Classes/Settings/List/Screens/WalletRating/WalletRatingViewController.swift
  - PeraWallet/Classes/Settings/List/Screens/WalletRating/WalletRatingViewController+Theme.swift
  - PeraWallet/Classes/Settings/List/ViewModels/SettingsDetailViewModel.swift
  - PeraWallet/Classes/Settings/List/ViewModels/SettingsToggleViewModel.swift
  - PeraWallet/Classes/Settings/List/ViewModels/SingleGrayTitleHeaderViewModel.swift
  - PeraWallet/Classes/Settings/List/Views/Detail/SettingsDetailCell.swift
  - PeraWallet/Classes/Settings/List/Views/Detail/SettingsDetailView.swift
  - PeraWallet/Classes/Settings/List/Views/Detail/SettingsDetailViewTheme.swift
  - PeraWallet/Classes/Settings/List/Views/Footer/SecuritySettingsFooterView.swift
  - PeraWallet/Classes/Settings/List/Views/Header/SingleGrayTitleHeaderSuplementaryView.swift
  - PeraWallet/Classes/Settings/List/Views/Header/SingleGrayTitleHeaderView.swift
  - PeraWallet/Classes/Settings/List/Views/Header/SingleGrayTitleHeaderViewTheme.swift
  - PeraWallet/Classes/Settings/List/Views/Toggle/SettingsToggleCell.swift
  - PeraWallet/Classes/Settings/List/Views/Toggle/SettingsToggleView.swift
  - PeraWallet/Classes/Settings/List/Views/Toggle/SettingsToggleViewTheme.swift
  - PeraWallet/Classes/Settings/List/Views/WalletRating/WalletRatingView.swift
  - PeraWallet/Classes/Settings/List/Views/WalletRating/WalletRatingViewTheme.swift
  - PeraWallet/Classes/Settings/Node/Screens/NodeSettingsViewController.swift
  - PeraWallet/Classes/Settings/Node/Screens/NodeSettingsViewController+Theme.swift
  - PeraWallet/Classes/Settings/Security/Screens/SecuritySettingsViewController.swift
  - PeraWallet/Classes/Settings/Security/Screens/SecuritySettingsViewController+Theme.swift
  - PeraWallet/Classes/Settings/Security/Views/SecuritySettingsView.swift
  - PeraWallet/Classes/Settings/Security/Views/SecuritySettingsViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Settings

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Settings`). Internal-by-default; see Public API for any cross-module-public surface.

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
