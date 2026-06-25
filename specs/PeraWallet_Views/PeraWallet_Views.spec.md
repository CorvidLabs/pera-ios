---
module: PeraWallet_Views
version: 1
status: active
files:
  - PeraWallet/Views/Buttons/AccountRowWithAddButton.swift
  - PeraWallet/Views/Buttons/AccountRowWithEditButton.swift
  - PeraWallet/Views/Buttons/RoundedButton.swift
  - PeraWallet/Views/Buttons/SquareIconButton.swift
  - PeraWallet/Views/Image Views/RoundedIconView.swift
  - PeraWallet/Views/Labels/FormTitleLabel.swift
  - PeraWallet/Views/Labels/RelativeDateTextView.swift
  - PeraWallet/Views/Misc/CounterView.swift
  - PeraWallet/Views/Misc/OnboardingTitleView.swift
  - PeraWallet/Views/Misc/OverlayView.swift
  - PeraWallet/Views/Misc/SearchFieldWithButtons.swift
  - PeraWallet/Views/Misc/SelfSizingScrollView.swift
  - PeraWallet/Views/Misc/ShareSheet.swift
  - PeraWallet/Views/Misc/TitleSectionHeader.swift
  - PeraWallet/Views/Passkeys/PasskeyDisabledView.swift
  - PeraWallet/Views/Passkeys/PasskeyEmptyView.swift
  - PeraWallet/Views/Passkeys/PasskeyListCell.swift
  - PeraWallet/Views/Passkeys/PasskeyListCellViewModel.swift
  - PeraWallet/Views/Passkeys/PasskeyListModel.swift
  - PeraWallet/Views/Passkeys/PasskeyListView.swift
  - PeraWallet/Views/Rows/AccountRowWithValues.swift
  - PeraWallet/Views/Rows/CoreAccountRow.swift
  - PeraWallet/Views/Styles/NavigationBarStyle.swift
  - PeraWallet/Views/Text Fields/LabeledUnderlinedTextField.swift
  - PeraWallet/Views/Text Fields/PeraTextField.swift
  - PeraWallet/Views/Text Fields/RoundedTextField.swift
  - PeraWallet/Views/View Modifiers/BackButtonModifier.swift
  - PeraWallet/Views/WebView.swift
db_tables: []
depends_on: []
---

# PeraWallet_Views

## Purpose

App-target UI/feature module (`PeraWallet/Views`). Internal-by-default; see Public API for any cross-module-public surface.

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
