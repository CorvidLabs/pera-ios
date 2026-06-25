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

App-target UI/feature module (`PeraWallet/Classes/BuySell`) that hosts the "Buy / Sell crypto" flows surfaced from the wallet's quick actions. It presents a bottom-sheet of options (`BuySellOptionsScreen`) and drives three third-party on/off-ramp integrations through dedicated flow coordinators:

- **Buy → Meld** (`MeldFlowCoordinator`): optionally selects a destination account, builds a Meld web URL (`MeldConfig`) seeded with the wallet address, and opens it via `UIApplication.shared.open`.
- **Buy → MoonPay** (`MoonPayFlowCoordinator`, `MoonPayIntroductionScreen`, `MoonPayTransaction*`): shows an introduction screen, requests a signed MoonPay URL from the API, opens it, then handles the deep-link redirect back into the app and renders a MoonPay transaction status sheet.
- **Sell → Bidali gift cards** (`BidaliFlowCoordinator`, `BidaliIntroductionScreen`, `BidaliDappDetailScreen`): shows an introduction, gates availability by network, selects an account, then opens an in-app web browser (`DiscoverExternalInAppBrowserScreen`) that bridges live ALGO/USDC/USDT balances and payment requests to the Bidali web app via injected JavaScript.

Each provider has its own account-selection list (`*AccountSelectionList*` data sources, layouts, cells, headers) built on the shared `AccountSelectionListDataController` diffable-snapshot pattern. Shared UI lives under `Shared/` (the options screen and the `SecuredByPaymentOptionsView` payment-network badge row). Ownership boundary: this module owns only the Buy/Sell presentation and routing; account data, balances, the signed-URL/network API, analytics, and the in-app browser base class are provided by `pera_wallet_core` and other app modules.

## Public API

| Export | Description |
|--------|-------------|
| `calculatePreferredSize` | Macaroon/UIKit view-sizing method computing the cell/header's preferred size for the given view model and layout size constraints. |

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. A provider flow is launched with either a pre-chosen account/address or none. When an address is supplied the coordinator opens the provider destination directly; when it is `nil` the account-selection list is presented first and the destination opens only after a `.didSelect` event.
3. Account-selection lists are restricted to spendable accounts: the Bidali list filters through `AuthorizedAccountListFilterAlgorithm` and excludes joint accounts before building the snapshot, falling back to a no-content state when the result is empty.
4. Network gating: MoonPay refuses to open on TestNet and shows a "not available" alert; Bidali is always enabled in non-production (staging) builds but only on MainNet in the store build (`!ALGAppTarget.current.isProduction || !api.isTestNet`).
5. The Bidali in-app browser keeps the injected balance object in sync with `SharedDataController`: when ALGO/USDC/USDT balances change for the selected account it re-evaluates JavaScript to update `window.bidaliProvider.balances`; an interactive dismiss of the payment screen cancels the in-progress payment.

## Behavioral Examples

### Scenario: Buy with MoonPay from an account with a known address
- **Given** the user opens the Buy/Sell options sheet and taps "Buy with MoonPay" while on MainNet
- **When** the MoonPay introduction screen's primary action is tapped and the wallet address is valid
- **Then** the app requests a signed MoonPay URL via `api.getSignedMoonPayURL`, opens it, and on the `didRedirectFromMoonPay` deep link parses `MoonPayParams` and presents the MoonPay transaction status sheet (tracking `.moonPay(type: .completed)`)

### Scenario: Sell gift cards with Bidali requiring account selection
- **Given** the user taps "Buy gift cards with Bidali" and no account was pre-selected
- **When** the Bidali introduction primary action is tapped and Bidali is available for the current network
- **Then** the Bidali account-selection list is pushed, and selecting an account opens `BidaliDappDetailScreen` (an in-app browser) seeded with that account's live ALGO/USDC/USDT balances

### Scenario: Meld buy with no account chosen
- **Given** `MeldFlowCoordinator.launch()` is called without an address
- **When** the Meld account-selection list is presented and the user selects an account
- **Then** a `MeldConfig` URL is built with that account's address, the `.meld()` analytics event is tracked, the selection screen is dismissed, and the Meld URL is opened externally

## Error Cases

| Condition | Behavior |
|-----------|----------|
| MoonPay primary action tapped on TestNet | `presentTestNetAlert` shows a "not available" alert; MoonPay is not opened |
| `api.getSignedMoonPayURL` returns `.failure` | Loading indicator is stopped; flow exits silently (no URL opened) |
| `didRedirectFromMoonPay` notification missing `MoonPayParams` | `moonPayIntroductionScreenDidFailedTransaction` delegate callback is invoked |
| Bidali tapped while unavailable for the current network | `presentNotAvailableAlert` shows the Bidali "not available" alert; flow does not proceed |
| Meld config URL is malformed / not a valid `URL` | `openDappDetail` returns early; nothing is opened |
| Account-selection list resolves to an empty set of eligible accounts | A no-content snapshot is delivered and the empty state is shown |
| Bidali payment screen dismissed interactively (swipe-down) | `cancelPayment` is invoked to abort the in-progress payment |

## Dependencies

| Module | Usage |
|--------|-------|
| `pera_wallet_core` | `Account`/`AccountHandle`/`Asset`, `PublicKey`, `SharedDataController`, `ALGAPI` (signed MoonPay URL, network), `ALGAnalytics`, `ALGAppTarget`, `AppEnvironment`, account filter algorithms |
| In-app browser (`DiscoverExternalInAppBrowserScreen`) | Base class for `BidaliDappDetailScreen`; JS message bridge and user-script injection for Bidali payments |
| MacaroonUIKit / MacaroonBottomSheet / MacaroonUtils | View theming, `ViewModel`, bottom-sheet presentation, snapshot/async helpers |
| WebKit | `WKUserContentController` / `WKScriptMessage` handling for the Bidali web app |
| Account selection infrastructure | Shared `AccountSelectionListDataController`, `AccountListItemViewModel`, `AccountPortfolioItem`, `CurrencyFormatter`, `NoContentViewModel` |
| Notification / deep-link routing | `didRedirectFromMoonPay` notification and `Screen` routing enum for navigation |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
