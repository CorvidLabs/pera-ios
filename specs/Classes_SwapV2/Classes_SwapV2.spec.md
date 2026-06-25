---
module: Classes_SwapV2
version: 1
status: active
files:
  - Classes/SwapV2/Models/SwapConfirmViewModel.swift
  - Classes/SwapV2/Models/SwapSharedViewModel.swift
  - Classes/SwapV2/SwapViewController.swift
  - Classes/SwapV2/Views/AssetSelectionView.swift
  - Classes/SwapV2/Views/BottomSheets/ConfirmSwapInfoSheet.swift
  - Classes/SwapV2/Views/BottomSheets/ProviderSheet.swift
  - Classes/SwapV2/Views/BottomSheets/SheetTitleView.swift
  - Classes/SwapV2/Views/BottomSheets/SwapSettingsSheet.swift
  - Classes/SwapV2/Views/Buttons/AccountSelectionButton.swift
  - Classes/SwapV2/Views/Buttons/AssetSwapButton.swift
  - Classes/SwapV2/Views/Buttons/ConfirmSlideButton.swift
  - Classes/SwapV2/Views/Buttons/SettingsSwapButton.swift
  - Classes/SwapV2/Views/Buttons/SwapButton.swift
  - Classes/SwapV2/Views/Buttons/SwitchSwapButton.swift
  - Classes/SwapV2/Views/ConfirmSwapView.swift
  - Classes/SwapV2/Views/ProviderSelectionView.swift
  - Classes/SwapV2/Views/SwapTitleView.swift
  - Classes/SwapV2/Views/SwapView.swift
db_tables: []
depends_on: []
---

# Classes_SwapV2

## Purpose

App-target UI/feature module (`Classes/SwapV2`) implementing the **redesigned (V2) in-app asset-swap experience** for Pera Wallet. It is the root screen of the **Swap tab** (`SwapViewController` is resolved by `TabBarController.launchSwap(with:)`).

This module is a SwiftUI rewrite of the legacy `Classes/Swap` flow, hosted inside the existing UIKit/Macaroon navigation stack via a `UIHostingController<SwapView>`. The UIKit `SwapViewController` owns the screen lifecycle, account/asset state, and bridges SwiftUI user intents (`SwapViewAction`) to the legacy swap infrastructure:

- **Main screen (`SwapView`)** — "you pay" / "you receive" asset selection cards (`AssetSelectionView`), a switch button to invert the pair (`SwitchSwapButton`), per-keystroke debounced quote fetching, a provider row (`ProviderSelectionView`), and a primary Swap button that appears once both amounts are positive.
- **Bottom sheets** — swap settings (`SwapSettingsSheet`), provider selection (`ProviderSheet`), the full-detent confirmation screen (`ConfirmSwapView` driven by `SwapConfirmViewModel`), and contextual info sheets for slippage tolerance / price impact (`ConfirmSwapInfoSheet`).
- **High price-impact guard** — when a quote's price impact is between 10% and 15%, a UIKit `UISheet` warning (with a Tinyman help link) is presented before allowing confirmation.

State lives in `SwapSharedViewModel` (an `ObservableObject`) for the editing surface and an immutable `SwapConfirmViewModel` snapshot for the confirm sheet. Account selection, asset-in/asset-out selection, quote retrieval, and transaction signing/confirmation are delegated to the legacy `SwapAssetFlowCoordinator`, `ALGSwapController`, `ConfirmSwapAPIDataController`, and `SwapTransactionSigner` from the `Classes/Swap` module.

**Ownership boundary:** this module owns the V2 Swap UI surface only. It does **not** own quote pricing, transaction assembly/signing, or persistence of swap drafts — those remain in the legacy swap stack and shared `PeraWalletCore` services. The module is internal to the app target and exposes no public cross-module API.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. The Swap tab opens with a non-watch default account selected: `SwapViewController` filters `sharedDataController.accountCollection` to exclude watch accounts and picks the first, so swaps cannot be initiated from a watch-only account.
3. The primary Swap button (and provider row) is shown only when both the paying and receiving amounts parse to values `> 0` (`SwapSharedViewModel.shouldShowSwapButton`); an empty/zero quote cannot proceed to confirmation.
4. Quotes are fetched debounced (0.5s) off the "you pay" field; while a quote is in flight `isLoadingQuote` is true and the "you receive" card renders a shimmer placeholder instead of a value.
5. When a quote's `priceImpact` is in the (10%, 15%] band, confirmation is gated behind the high-price-impact warning sheet; only after the user confirms that warning does `confirmSwap()` proceed.
6. The SwiftUI view is re-hosted (`loadSwapView()`) on every account/asset/switch change; the existing `UIHostingController<SwapView>` child is removed and replaced rather than mutated in place.

## Behavioral Examples

### Scenario: Entering a paying amount fetches a quote
- **Given** the Swap tab is open with a paying asset (e.g. ALGO) and a receiving asset selected
- **When** the user types a positive amount into the "you pay" field
- **Then** after a 0.5s debounce the amount is reformatted, `isLoadingQuote` becomes true (shimmer shown on the receive card), and `SwapViewAction.getQuote(for:)` is dispatched; on success `receivingText` and `quote` are populated and the Swap button appears

### Scenario: Switching the asset pair
- **Given** the user has selected ALGO → USDC
- **When** the user taps the switch button (`SwitchSwapButton`)
- **Then** `selectedAssetIn` and `selectedAssetOut` are swapped and the SwiftUI view is re-hosted with USDC → ALGO

### Scenario: Confirming a swap with elevated price impact
- **Given** a fetched quote with `priceImpact` greater than 10% and at most 15%
- **When** the user taps Swap and confirms on the `ConfirmSwapView` sheet
- **Then** the high-price-impact warning `UISheet` is presented first; only after the user accepts it does `confirmSwap()` build the `ALGSwapController` / `ConfirmSwapAPIDataController` and call `confirmSwap()`

## Error Cases

| Condition | Behavior |
|-----------|----------|
| No non-watch account exists in the collection | `viewDidAppear` returns early without loading the swap view (no screen rendered) |
| Quote request fails (`onQuoteLoaded` error) | Error is currently only `print`-logged; quote/receiving text are left stale (TODO: surface an error alert) |
| Confirm tapped with missing `assetIn`/`assetOut` | `getQuote` path returns early without dispatching (TODO: surface an error alert) |
| Price impact in (10%, 15%] | High-price-impact warning sheet shown; swap proceeds only on explicit user confirmation, cancel dismisses |
| Paying amount empty / non-numeric / ≤ 0 | `receivingText` cleared to nil, Swap button hidden, no quote requested |
| Paying field focused while showing a zero placeholder | Field is cleared to empty so the user can type a fresh amount |

## Dependencies

| Module | Usage |
|--------|-------|
| SwiftUI / Combine | View layer (`SwapView`, sheets) and `SwapSharedViewModel` (`ObservableObject`, `@Published`) |
| MacaroonUIKit / BaseViewController | UIKit host (`SwapViewController`), tab-bar appearance, `BottomSheetTransition`, `UISheet` warnings |
| Classes/Swap (legacy swap stack) | `SwapAssetFlowCoordinator`, `SwapAssetFlowDraft`, `SwapDataLocalStore`, `ALGSwapController`/`ALGSwapControllerDraft`, `ConfirmSwapAPIDataController`, `SwapTransactionSigner`, `SwapQuote`, `PriceImpactLimit` |
| TabBarController | Resolves `SwapViewController` as the Swap tab root and injects `launchDraft` via `launchSwap(with:)` |
| PeraWalletCore (shared data/services) | `sharedDataController` (account collection, currency), `Account`, `Asset`, `AssetItem`, `configuration.api`, `analytics`, `hdWalletStorage` |
| Formatter / Typography / Colors | Decimal & percentage formatting, DM Sans typography tokens, app color tokens |
| AlgorandWeb | Tinyman swap and price-impact help links opened from the info and warning sheets |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
