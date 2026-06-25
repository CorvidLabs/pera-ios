---
module: PeraWallet_Classes_Application
version: 1
status: active
files:
  - PeraWallet/Classes/Application/AppConfigurator.swift
  - PeraWallet/Classes/Application/AppDelegate.swift
  - PeraWallet/Classes/Application/Core/Base/BaseScrollViewController.swift
  - PeraWallet/Classes/Application/Core/Base/BaseViewController.swift
  - PeraWallet/Classes/Application/Core/Base/ScrollScreen.swift
  - PeraWallet/Classes/Application/Core/Container/Navigation/NavigationController.swift
  - PeraWallet/Classes/Application/Core/Container/TabBar/TabBarController.swift
  - PeraWallet/Classes/Application/Core/Root/RootViewController.swift
  - PeraWallet/Classes/Application/Core/Root/RootViewController+WalletConnect.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Application

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Application`). Internal-by-default; see Public API for any cross-module-public surface.

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
