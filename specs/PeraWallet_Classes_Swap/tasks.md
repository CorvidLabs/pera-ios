# PeraWallet_Classes_Swap — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Remove `SwapAssetFlowCoordinator` after the app routing refactor lands (file-level `<todo>`); migrate screen presentation to the new router.
- [ ] Resolve the `<todo>` dismiss ambiguity in `openEditSlippage` / `openEditAmount` ("How can we be sure which screen we should return when the event occurs?") — return deterministically instead of `dismissScreen()`.
- [ ] Replace the leftover `print("loading...")` in `getQuote`'s `.willLoadQuote` handler with proper loading state, and create the missing error in the `swapAmount` conversion guard (`// create error`).
- [ ] Reconcile/de-duplicate this coordinator-based Swap with the newer `SwapV2` surface; decide which is canonical.
- [ ] Remove the hardcoded `swapVersion ?? "v2"` default in `updateSwapStatus`/`logFailedSwap` once swap version is always known.
- [ ] Add automated coverage for the coordinator flow + balance/slippage validators (currently only `SwapV2` view models are unit-tested).

## Done
- [x] Spec and companion files scaffolded.
- [x] Documented coordinator-driven flow: intro gate → account selection → swap composer → confirm → execute → success/summary.
- [x] Captured invariants (agreement gate, opt-in requirements, distinct in/out assets, failure reporting) and the error-case table.
