---
module: PeraWallet_Classes_BuySell
version: 1
status: active
files:
  - PeraWallet/Classes/BuySell/Buy/Meld/AccountSelection/Data/MeldAccountSelectionListDataSource.swift
  - PeraWallet/Classes/BuySell/Buy/Meld/AccountSelection/Data/MeldAccountSelectionListLocalDataController.swift
  - PeraWallet/Classes/BuySell/Buy/Meld/AccountSelection/MeldAccountSelectionListLayout.swift
  - PeraWallet/Classes/BuySell/Buy/Meld/AccountSelection/Views/AccountCell/MeldAccountSelectionListAccountListItemCell.swift
  - PeraWallet/Classes/BuySell/Buy/Meld/AccountSelection/Views/AccountCell/MeldAccountSelectionListAccountListItemCellTheme.swift
  - PeraWallet/Classes/BuySell/Buy/Meld/AccountSelection/Views/Header/MeldAccountSelectionListHeader.swift
  - PeraWallet/Classes/BuySell/Buy/Meld/AccountSelection/Views/Header/MeldAccountSelectionListHeaderTheme.swift
  - PeraWallet/Classes/BuySell/Buy/Meld/AccountSelection/Views/Header/MeldAccountSelectionListHeaderViewModel.swift
  - PeraWallet/Classes/BuySell/Buy/Meld/DappDetail/MeldConfig.swift
  - PeraWallet/Classes/BuySell/Buy/Meld/MeldDraft.swift
  - PeraWallet/Classes/BuySell/Buy/Meld/MeldFlowCoordinator.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/AccountSelection/Data/MoonPayAccountSelectionListDataSource.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/AccountSelection/Data/MoonPayAccountSelectionListLocalDataController.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/AccountSelection/MoonPayAccountSelectionListLayout.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/AccountSelection/Views/AccountCell/MoonPayAccountSelectionListAccountListItemCell.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/AccountSelection/Views/AccountCell/MoonPayAccountSelectionListAccountListItemCellTheme.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/AccountSelection/Views/Header/MoonPayAccountSelectionListHeader.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/AccountSelection/Views/Header/MoonPayAccountSelectionListHeaderTheme.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/AccountSelection/Views/Header/MoonPayAccountSelectionListHeaderViewModel.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/Introduction/MoonPayIntroductionScreen.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/Introduction/MoonPayIntroductionScreenTheme.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/MoonPayDraft.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/MoonPayFlowCoordinator.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/MoonPayParams.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/Transaction/MoonPayTransactionDataController.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/Transaction/MoonPayTransactionView.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/Transaction/MoonPayTransactionViewController.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/Transaction/MoonPayTransactionViewModel.swift
  - PeraWallet/Classes/BuySell/Buy/MoonPay/Transaction/MoonPayTransactionViewTheme.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/AccountSelection/BidaliAccountSelectionListLayout.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/AccountSelection/Data/BidaliAccountSelectionListDataSource.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/AccountSelection/Data/BidaliAccountSelectionListLocalDataController.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/AccountSelection/Views/AccountCell/BidaliAccountSelectionListAccountListItemCell.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/AccountSelection/Views/AccountCell/BidaliAccountSelectionListAccountListItemCellTheme.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/AccountSelection/Views/Header/BidaliAccountSelectionListHeader.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/AccountSelection/Views/Header/BidaliAccountSelectionListHeaderTheme.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/AccountSelection/Views/Header/BidaliAccountSelectionListHeaderViewModel.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/BidaliFlowCoordinator.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/DappDetail/BidaliConfig.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/DappDetail/BidaliDappDetailScreen.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/DappDetail/BidaliOpenURLParameters.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/DappDetail/BidaliPaymentParameters.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/Introduction/BidaliIntroductionScreen.swift
  - PeraWallet/Classes/BuySell/Sell/Bidali/Introduction/BidaliIntroductionScreenTheme.swift
  - PeraWallet/Classes/BuySell/Shared/Options/Buy/BuyWithMeldOptionViewModel.swift
  - PeraWallet/Classes/BuySell/Shared/Options/BuySellOptionsScreen.swift
  - PeraWallet/Classes/BuySell/Shared/Options/BuySellOptionsScreenTheme.swift
  - PeraWallet/Classes/BuySell/Shared/Options/Sell/BuyGiftCardsWithBidaliOptionViewModel.swift
  - PeraWallet/Classes/BuySell/Shared/Views/SecuredByPaymentOptions/PaymentOption.swift
  - PeraWallet/Classes/BuySell/Shared/Views/SecuredByPaymentOptions/SecuredByPaymentOptionsView.swift
  - PeraWallet/Classes/BuySell/Shared/Views/SecuredByPaymentOptions/SecuredByPaymentOptionsViewModel.swift
  - PeraWallet/Classes/BuySell/Shared/Views/SecuredByPaymentOptions/SecuredByPaymentOptionsViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_BuySell

## Purpose

App-target UI/feature module (`PeraWallet/Classes/BuySell`). Internal-by-default; see Public API for any cross-module-public surface.

## Public API

| Export | Description |
|--------|-------------|
| `calculatePreferredSize` | Document caller-visible behavior and constraints. |

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
