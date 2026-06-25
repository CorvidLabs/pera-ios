# PeraWallet_Classes_BuySell — Design

## Screens & components

- **BuySellOptionsScreen** — `BaseScrollViewController` + `BottomSheetScrollPresentable`. Two stacked sections (Buy / Sell), each a `VStackView` of `ListItemButton` rows bound via `BuyWithMeldOptionViewModel` / `BuyGiftCardsWithBidaliOptionViewModel`. Buy options can fall back to a "not available" label.
- **MoonPayIntroductionScreen** — `ScrollScreen` with a collapsing illustration (parallax on scroll between `illustrationMinHeight`/`illustrationMaxHeight`), title, body, `SecuredByPaymentOptionsView`, and a footer primary button over a linear-gradient fade. Transparent → default navigation-bar appearance transition on appear/disappear.
- **MoonPayTransactionViewController** — `BaseViewController` + `BottomSheetPresentable` (`.compressed` height); hosts `MoonPayTransactionView`, bound by `MoonPayTransactionViewModel(status:account:)`; no navigation bar; close event dismisses.
- **BidaliIntroductionScreen** — same collapsing-illustration `ScrollScreen` pattern as MoonPay (without the payment badges); emits `performCloseAction` / `performPrimaryAction`.
- **BidaliDappDetailScreen** — in-app web browser (`DiscoverExternalInAppBrowserScreen`) rendering the Bidali web app; injects payment user-script and bridges balances.
- **Account-selection lists** (Meld / MoonPay / Bidali) — list screens composed of: a `*Layout`, a diffable `*DataSource`/`*LocalDataController`, an account cell (`*AccountListItemCell` + `*Theme`), and a header (`*Header` + `*Theme` + `*ViewModel`). States: loading (placeholder rows), content (account rows), empty (no-content).
- **SecuredByPaymentOptionsView** — icon + "secured by" title + a row of `PaymentOption` badges (`visa`, `mastercard`, `apple`, `ach`), bound via `SecuredByPaymentOptionsViewModel`.

## Navigation hierarchy

```
Quick action
  └─ BuySellOptionsScreen (bottom sheet)
       ├─ Buy with Meld → MeldFlowCoordinator
       │     ├─ [no account] Meld account selection (present) → select → open Meld URL (external)
       │     └─ [account]    open Meld URL (external)
       ├─ Buy with MoonPay → MoonPayFlowCoordinator
       │     └─ MoonPayIntroductionScreen → signed URL (external)
       │           └─ deep link → MoonPayTransactionViewController (bottom sheet)
       └─ Sell gift cards (Bidali) → BidaliFlowCoordinator
             └─ BidaliIntroductionScreen (present)
                   ├─ [no account] Bidali account selection (push) → select → BidaliDappDetailScreen (push)
                   └─ [account]    BidaliDappDetailScreen (push)
```

## Design tokens

- **Colors:** `Colors.Defaults.background` (screen background and gradient endpoints), white close-button tint on the transparent intro nav bar; cell/header colors via per-component `*Theme` structs.
- **Typography:** Macaroon text styles — `.titleMedium()` (titles), `.bodyRegular()` (body), `.bodyMedium()` (secured-by label).
- **Spacing / layout:** themes expose paddings and spacings (e.g. `spacingBetweenBuyAndSellContext`, `spacingBetweenTitleAndBody`, `illustrationMin/MaxHeight`, primary-action edge insets); footer uses a `LinearGradientEffect`.

## Assets

- Illustration / logo images referenced by the MoonPay and Bidali intro themes.
- Payment badge icons: `icon-payment-visa`, `icon-payment-mastercard`, `icon-payment-apple`, `icon-payment-ach`, and `icon-payment-security`.
