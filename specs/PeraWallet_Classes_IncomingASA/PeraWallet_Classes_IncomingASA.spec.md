---
module: PeraWallet_Classes_IncomingASA
version: 1
status: active
files:
  - PeraWallet/Classes/IncomingASA/Accounts/InboxDiffableDataSource.swift
  - PeraWallet/Classes/IncomingASA/Accounts/IncomingASAAccountCell.swift
  - PeraWallet/Classes/IncomingASA/Accounts/IncomingASAAccountsNoContentViewModel.swift
  - PeraWallet/Classes/IncomingASA/Accounts/IncomingASAAccountsViewController.swift
  - PeraWallet/Classes/IncomingASA/Accounts/IncomingASAAccountsViewController+Theme.swift
  - PeraWallet/Classes/IncomingASA/Accounts/IncomingASAAccountView.swift
  - PeraWallet/Classes/IncomingASA/Accounts/IncomingASAAccountViewTheme.swift
  - PeraWallet/Classes/IncomingASA/Detail/AccountView/IncomingASADetailAccountView.swift
  - PeraWallet/Classes/IncomingASA/Detail/AccountView/IncomingASADetailAccountViewTheme.swift
  - PeraWallet/Classes/IncomingASA/Detail/Header/IncomingASARequestHeaderTheme.swift
  - PeraWallet/Classes/IncomingASA/Detail/Header/IncomingASARequestHeaderViewModel.swift
  - PeraWallet/Classes/IncomingASA/Detail/Id/IncomingASARequestIdTheme.swift
  - PeraWallet/Classes/IncomingASA/Detail/IncomingASAsDetailScreen.swift
  - PeraWallet/Classes/IncomingASA/Detail/IncomingASAsDetailScreen+Theme.swift
  - PeraWallet/Classes/IncomingASA/Detail/IncomingASAsDetailSuccessResultScreenViewModel.swift
  - PeraWallet/Classes/IncomingASA/Detail/IncomingASAsDetailView.swift
  - PeraWallet/Classes/IncomingASA/Detail/IncomingASAsDetailViewModel.swift
  - PeraWallet/Classes/IncomingASA/Detail/IncomingASAsDetailViewTheme.swift
  - PeraWallet/Classes/IncomingASA/Detail/Loading/IncomingASAsDetailLoadingScreenViewModel.swift
  - PeraWallet/Classes/IncomingASA/Detail/Sender/IncomingASARequesSenderView.swift
  - PeraWallet/Classes/IncomingASA/Detail/Sender/IncomingASARequestSenderViewModel.swift
  - PeraWallet/Classes/IncomingASA/Detail/Sender/IncomingASARequestSenderViewTheme.swift
  - PeraWallet/Classes/IncomingASA/Detail/Transaction/IncomingASATransactionController.swift
  - PeraWallet/Classes/IncomingASA/Detail/Transaction/IncomingASATransactionController+Delegate.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Data/IncomingASAAccountInboxAPIDataController.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Data/IncomingASAAccountInboxDataController.swift
  - PeraWallet/Classes/IncomingASA/Inbox/ListItemView/IncomingASAListItem.swift
  - PeraWallet/Classes/IncomingASA/Inbox/ListItemView/IncomingASAListItemTheme.swift
  - PeraWallet/Classes/IncomingASA/Inbox/ListItemView/IncomingASAListItemView.swift
  - PeraWallet/Classes/IncomingASA/Inbox/ListItemView/IncomingASAListItemViewModel.swift
  - PeraWallet/Classes/IncomingASA/Inbox/ListItemView/IncomingASAListItemViewTheme.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Model/IncomingASAAssetListItemViewModel.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Model/IncomingASASenderViewModel.swift
  - PeraWallet/Classes/IncomingASA/Inbox/TitleView/IncominASAListTitleView.swift
  - PeraWallet/Classes/IncomingASA/Inbox/TitleView/IncominASAListTitleViewModel.swift
  - PeraWallet/Classes/IncomingASA/Inbox/TitleView/IncominASAListTitleViewTheme.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxHeaderTitleCell.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxListDataSource.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxListItemCell.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxListLayout.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxListLayout+Theme.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxViewController.swift
  - PeraWallet/Classes/IncomingASA/Inbox/Views/IncomingASAAccountInboxViewController+Theme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_IncomingASA

## Purpose

App-target UI/feature module (`PeraWallet/Classes/IncomingASA`). Internal-by-default; see Public API for any cross-module-public surface.

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
