# PeraWallet_Classes_Swap — Testing

## Automated tests

- App/library test bundle: `algorand-tests/` (run via the Xcode test action — see `BUILDING.md`).
- Closest existing coverage lives in `algorand-tests/SwapV2/` (e.g. `SwapConfirmViewModelTests`, `SwapAmountFormatterTests`, `SwapPricingServiceTests`, `SwapSettingsViewModelTests`, `SwapHistoryViewModelTests`, `SwapTopPairViewModelTests`). Note these exercise the newer **SwapV2** surface, not the coordinator-based `Classes/Swap` screens covered by this spec.
- This module's own coordinator/view models/validators are largely uncovered by unit tests — see tasks.md.

## Manual QA checklist

- [ ] **Intro gate:** Fresh install → open Swap tab → `SwapIntroductionScreen` appears; accept → flow proceeds and flag persists across relaunch; reopen Swap → intro no longer shown. Close button dismisses without starting flow.
- [ ] **Account selection:** With multiple accounts, picker appears; selecting an account not opted in to the in asset shows the `swap-asset-not-opted-in-error` banner and does not proceed.
- [ ] **In/out asset selection:** In-asset picker hides zero-balance assets; out/pool picker excludes the current in asset and only lists provider-supported assets; selecting a non-held pool asset triggers the opt-in sheet, and approving returns to the composer with the asset set.
- [ ] **Amount + balance validation:** Enter amount > available balance → blocked with insufficient-balance feedback; max/percentage buttons (`EditSwapAmountScreen`) clamp to available balance after fee reservation.
- [ ] **Quote:** Valid input loads a live quote (price, minimum received, exchange/Pera fees, price impact, slippage); changing amount/assets refetches.
- [ ] **Slippage:** `EditSwapSlippageScreen` accepts 0.5/1/2/5% presets and custom values; confirm screen reflects the chosen tolerance; info sheets open from the (i) actions.
- [ ] **Confirm + execute (standard account):** Confirm → loading → success screen; View Detail opens the correct Pera Explorer group link (mainnet vs testnet); Summary shows fees/received/paid; Done dismisses.
- [ ] **Confirm + execute (Ledger account):** Sign-with-Ledger confirmation sheet → connection screen → signing process with correct transaction count; cancel at any point clears transactions and stops loading.
- [ ] **Failure paths:** Force a blockchain failure and a network failure → error screen shown, primary action returns to `SwapAssetScreen` and refetches the quote; verify `swapFailed` analytics + status update fire.

## Edge cases

- ALGO as the in asset (`account.algo` default) — min-balance / fee reservation must leave enough ALGO.
- High price impact at the 5% / 10% / 15% `PriceImpactLimit` thresholds — warning styling and acknowledgement.
- Out asset requiring opt-in vs already opted-in (two distinct branches in `openPoolAssetSelection`).
- Account balance changing mid-flow (`sharedDataController.didFinishRunning` → `updateAccountIfNeeded`).
- Stale `LoadingScreen`: success/error handlers no-op when the visible screen is not the expected `LoadingScreen`.
- Quote conversion guard in `getQuote` when `doubleToUInt64` returns nil (currently silently returns — see tasks.md).
