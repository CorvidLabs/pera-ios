# PeraWallet_Classes_BuySell — Context

## Overview

Architectural context for the `PeraWallet_Classes_BuySell` module. The authoritative contract is `PeraWallet_Classes_BuySell.spec.md`; the source files it covers are listed in that spec's `files:` frontmatter.

This module implements the wallet's "Buy / Sell crypto" surface: a bottom-sheet of options plus three third-party ramp integrations (Meld, MoonPay, Bidali).

## Key files

- `Shared/Options/BuySellOptionsScreen.swift` — entry bottom sheet listing Buy (Meld) and Sell (Bidali gift cards) options; emits `.performBuyWithMeld` / `.performBuyGiftCardsWithBidali` events and tracks `buyCryptoSelected`.
- `Buy/Meld/MeldFlowCoordinator.swift` + `DappDetail/MeldConfig.swift` — Meld routing; builds a MainNet Meld URL with the wallet address and opens it externally.
- `Buy/MoonPay/MoonPayIntroductionScreen.swift`, `MoonPayFlowCoordinator.swift`, `MoonPayParams.swift`, `MoonPayDraft.swift`, `Transaction/MoonPayTransaction*` — MoonPay intro, signed-URL fetch, deep-link redirect handling, and transaction-status sheet.
- `Sell/Bidali/BidaliFlowCoordinator.swift`, `Introduction/BidaliIntroductionScreen.swift`, `DappDetail/BidaliDappDetailScreen.swift` (+ `BidaliConfig`, `BidaliPaymentParameters`, `BidaliOpenURLParameters`) — Bidali intro, availability gating, in-app browser with JS balance bridge.
- `*/AccountSelection/Data/*LocalDataController.swift` + `*DataSource.swift` + `*Layout.swift` + `Views/...` — per-provider account pickers built on the shared `AccountSelectionListDataController` diffable-snapshot pattern.
- `Shared/Views/SecuredByPaymentOptions/*` — payment-network badge row (`PaymentOption` = visa/mastercard/apple/ach) shown on the MoonPay intro.

## Architecture

- **Coordinator-driven routing.** Each provider has a `*FlowCoordinator` that owns navigation: it decides between launching account selection vs. opening the provider destination, using the `Screen` routing enum and `open(_:by:)` (`.present` / `.push`).
- **MVVM for lists/cells.** Account pickers use local data controllers that publish diffable snapshots on a background queue and bind `AccountListItemViewModel` / header view models; cells/headers are themed via `*Theme` structs (Macaroon styling).
- **Web bridge for Bidali.** `BidaliDappDetailScreen` extends the app's in-app browser, injects balances as JSON, listens for `paymentRequest`/`openURLRequest` script messages, and observes `SharedDataController` to keep `window.bidaliProvider.balances` current.
- **Deep links for MoonPay.** Completion returns through the `didRedirectFromMoonPay` notification carrying `MoonPayParams`.

## Architectural decisions

- `MoonPayFlowCoordinator` is intentionally minimal — flagged in-source `<todo> This should be removed after the routing refactor.`
- Network gating differs per provider (see spec Invariant 4): MoonPay blocks TestNet; Bidali is open on staging but MainNet-only in the store build.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
