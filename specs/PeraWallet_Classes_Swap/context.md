# PeraWallet_Classes_Swap — Context

## Overview

Architectural context for the `PeraWallet_Classes_Swap` module — the in-wallet asset swap feature under `PeraWallet/Classes/Swap`. The authoritative contract is `PeraWallet_Classes_Swap.spec.md`; the full source list is in that spec's `files:` frontmatter.

## Architecture

- **Pattern:** UIKit + a single navigation **coordinator** (`SwapAssetFlowCoordinator`) plus MVVM per screen. View controllers are thin; presentation is computed by `*ViewModel` types; styling by `*Theme` structs (Macaroon). Cell/header sizing goes through `calculatePreferredSize` (the module's only cross-module-public surface).
- **Data access:** screen-scoped data controllers/providers (`SwapAssetAPIDataController`, `ConfirmSwapAPIDataController`, `SelectAssetDataController` family, `EditSwap*DataProvider`) wrap `ALGAPI`. They expose `eventHandler` callbacks rather than async/await (legacy app-target style).
- **Shared state:** `SwapDataStore` / `SwapDataLocalStore` (observable via `SwapDataStoreObservation`) hold the cross-screen swap inputs — `SwapAmountPercentage(Store)`, `SwapSlippageTolerancePercentage(Store)`. `SwapDisplayStore` persists the one-time agreement flag.
- **Swap engine:** `SwapController` protocol → `ALGSwapController` (+ `ALGSwapControllerDraft`). Drives quote loading, transaction grouping, `SwapTransactionSigner` signing (standard & Ledger), `TransactionUploadAndWaitOperation` upload, and status updates. Emits `SwapControllerEvent`s consumed by the coordinator.
- **Validation:** `SwapAvailableBalanceValidator` (+ percentage/quote validators), `SwapAmountPercentageValidator`, `SwapSlippageTolerancePercentageValidator`, `SwapAssetInputValidator`. Numeric guards: `PriceImpactLimit` (5/10/15%) and `SlippageTolerancePercentage` (0.5/1/2/5%).
- **Asset caching:** `AssetCache` / `MobileAPIAssetCache` fetch and cache asset details needed for opt-in before a swap.

## Key files

- `Auxiliaries/Flow/SwapAssetFlowCoordinator.swift` — central coordinator, owns the whole flow (entry point of the module).
- `SwapContainerVC.swift` — tab container that instantiates the coordinator and calls `resetDraft()` + `launch()` on appear.
- `Auxiliaries/Flow/SwapAssetFlowDraft.swift` — in-flight selection (account, assetInID, assetOutID) with opt-in helpers.
- `Auxiliaries/SwapController/{SwapController,ALGSwapController,ALGSwapControllerDraft}.swift` — swap engine + events.
- `SwapScreen/SwapAssetScreen.swift` (+ `Data/SwapAssetAPIDataController.swift`) — main composer.
- `ConfirmSwapScreen/ConfirmSwapScreen.swift` (+ `Data/ConfirmSwapAPIDataController.swift`) — quote review/confirm.
- `IntroScreen/SwapIntroductionScreen.swift` — agreement gate; `Data/SwapDisplayStore.swift` persists acceptance.
- `SelectAssetScreen/` — in/out asset pickers and their data controllers (`SelectLocalAssetDataController`, `SelectSwapPoolAssetDataController`).
- `SwapAssetSuccessScreen/`, `SwapSummaryScreen/` — post-swap success + detailed summary.

## Architectural decisions / notes

- The coordinator is explicitly marked `<todo> remove after routing refactor` — it should migrate to the app's newer routing once that lands. Several dismiss points carry `<todo>` notes about which screen to return to.
- Two swap generations coexist in the repo: this UIKit coordinator-based `Classes/Swap` module and a newer `SwapV2` surface (see `algorand-tests/SwapV2`). This spec covers only the `Classes/Swap` files listed in frontmatter.
- Swap status reporting branches on `swapVersion == "v2"`; the coordinator defaults `swapVersion` to `"v2"` when posting status.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
