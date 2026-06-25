---
module: PeraWallet_Classes_Notifications
version: 1
status: active
files:
  - PeraWallet/Classes/Notifications/Filter/DataSources/NotificationFilterDataSource.swift
  - PeraWallet/Classes/Notifications/Filter/Layout/NotificationFilterListLayout.swift
  - PeraWallet/Classes/Notifications/Filter/Screens/NotificationFilterViewController.swift
  - PeraWallet/Classes/Notifications/Filter/Screens/NotificationFilterViewControllerTheme.swift
  - PeraWallet/Classes/Notifications/Filter/ViewModels/AccountNameSwitchViewModel.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Header/ToggleTitleHeaderSupplementaryView.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Header/ToggleTitleHeaderView.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Header/ToggleTitleHeaderViewTheme.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/AccountNameSwitchCell.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/AccountNameSwitchView.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/AccountNameSwitchViewTheme.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/TitledToggleCell.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/TitledToggleLoadingCell.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/TitledToggleLoadingView.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/TitledToggleLoadingViewTheme.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/TitledToggleView.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/TitledToggleViewTheme.swift
  - PeraWallet/Classes/Notifications/LastSeenNotificationController.swift
  - PeraWallet/Classes/Notifications/List/DataSources/NotificationsAPIDataController.swift
  - PeraWallet/Classes/Notifications/List/DataSources/NotificationsDataController.swift
  - PeraWallet/Classes/Notifications/List/DataSources/NotificationsDataSource.swift
  - PeraWallet/Classes/Notifications/List/Layout/NotificationsListLayout.swift
  - PeraWallet/Classes/Notifications/List/Screens/NotificationsViewController.swift
  - PeraWallet/Classes/Notifications/List/ViewModels/NotificationsNoContentViewModel.swift
  - PeraWallet/Classes/Notifications/List/ViewModels/NotificationsViewModel.swift
  - PeraWallet/Classes/Notifications/List/Views/Item/NotificationCell.swift
  - PeraWallet/Classes/Notifications/List/Views/Item/NotificationView.swift
  - PeraWallet/Classes/Notifications/List/Views/Item/NotificationViewTheme.swift
  - PeraWallet/Classes/Notifications/List/Views/Loading/NotificationLoadingCell.swift
  - PeraWallet/Classes/Notifications/List/Views/Loading/NotificationLoadingView.swift
  - PeraWallet/Classes/Notifications/List/Views/Loading/NotificationLoadingViewCommonTheme.swift
  - PeraWallet/Classes/Notifications/List/Views/Loading/NotificationLoadingViewTheme.swift
  - PeraWallet/Classes/Notifications/List/Views/NotificationsView.swift
  - PeraWallet/Classes/Notifications/List/Views/NotificationsViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Notifications

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Notifications`). Internal-by-default; see Public API for any cross-module-public surface.

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
