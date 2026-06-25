---
module: PeraWallet_Extensions
version: 1
status: active
files:
  - PeraWallet/Extensions/AttributedString+Utils.swift
  - PeraWallet/Extensions/Bundle+Utils.swift
  - PeraWallet/Extensions/Font+CustomFonts.swift
  - PeraWallet/Extensions/Int+Extensions.swift
  - PeraWallet/Extensions/JSONDecoder+Utils.swift
  - PeraWallet/Extensions/JSONEncoder+Utils.swift
  - PeraWallet/Extensions/NSDiffableDataSourceSnapshot+Replace.swift
  - PeraWallet/Extensions/View+Styles.swift
  - PeraWallet/Extensions/Views/AnyTransition+Extensions.swift
  - PeraWallet/Extensions/Views/View+Extensions.swift
db_tables: []
depends_on: []
---

# PeraWallet_Extensions

## Purpose

App-target UI/feature module (`PeraWallet/Extensions`). Internal-by-default; see Public API for any cross-module-public surface.

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
