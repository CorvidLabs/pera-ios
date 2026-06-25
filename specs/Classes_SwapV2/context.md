# Classes_SwapV2 — Context

## Overview

`Classes/SwapV2` is the redesigned (V2) SwiftUI implementation of Pera Wallet's asset-swap feature. It is the root screen of the **Swap tab**. The authoritative contract is `Classes_SwapV2.spec.md`; covered source files are listed in that spec's `files:` frontmatter.

## Architecture

- **Pattern:** SwiftUI views + `ObservableObject` view model, hosted inside the legacy UIKit/Macaroon stack.
- **UIKit host:** `SwapViewController` (`BaseViewController`) owns lifecycle and screen state (`selectedAccount`, `selectedAssetIn`, `selectedAssetOut`, `sharedViewModel`). It builds a `SwapView` and embeds it via `UIHostingController<SwapView>`, re-hosting on each state change (`loadSwapView()`).
- **Intent bridge:** `SwapView` emits `SwapViewAction` cases (`selectAccount`, `selectAssetIn/Out`, `switchAssets`, `getQuote`, `confirmSwap`, `showInfo`) through an `onTap` closure; `SwapViewController` translates these into calls on the legacy `SwapAssetFlowCoordinator` and the swap controller/data-controller stack.
- **State:** `SwapSharedViewModel` (editing surface, `@Published` account/assets/amounts/loading) and the immutable `SwapConfirmViewModel` snapshot passed to the confirm sheet.

## Key files

- `SwapViewController.swift` — UIKit host, state owner, action bridge, high-price-impact warning.
- `Views/SwapView.swift` — main SwiftUI screen, `SwapViewAction` / `SwapViewSheet`, debounced quote trigger, sheet routing.
- `Views/ConfirmSwapView.swift` — full-detent confirm sheet, slippage/price-impact info sheets.
- `Views/AssetSelectionView.swift` — "you pay" / "you receive" cards with amount field and shimmer loading.
- `Models/SwapSharedViewModel.swift` — editing state + derived `shouldShowSwapButton`, `slippageTolerance`, `priceImpact`, `price`.
- `Models/SwapConfirmViewModel.swift` — immutable confirm-sheet snapshot.
- `Views/SwapTitleView.swift`, `Views/ProviderSelectionView.swift`, `Views/BottomSheets/*`, `Views/Buttons/*` — supporting components.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.

This is an in-progress redesign. Several values on the confirm sheet are still hard-coded/placeholder (minimum received, exchange fee, Pera fee, provider defaults to "Vestige.fi"), quote-error handling is `print`-only, and the `ConfirmSwapAPIDataController.eventHandler` wiring is commented out. The legacy `Classes/Swap` stack remains the source of truth for quoting, signing, and confirmation.
