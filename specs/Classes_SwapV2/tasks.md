# Classes_SwapV2 — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open

### Source TODOs (in code)
- [ ] Show an error alert when `onQuoteLoaded` returns an error (currently `print(error)` in `SwapViewController.getQuote` handler).
- [ ] Show an error alert when `selectedAssetIn`/`selectedAssetOut` is missing before requesting a quote (currently silent `return`).
- [ ] Replace `print("---Confirm swap")` / `print("max")` / `print("receivingText changed:")` debug logging with real behavior.
- [ ] Wire up the commented-out `ConfirmSwapAPIDataController.eventHandler` (slippage update + transaction prepare events) in `confirmSwap()`.

### Placeholder / hard-coded UI to make data-driven
- [ ] `ConfirmSwapView` shows literal strings for minimum received (`"1,365,310.296595 AKTA"`), exchange fee (`"0.219412"`), and Pera fee (`"0.149382"`) — drive these from the quote / `SwapConfirmViewModel` (its `minimumReceived`, `exchangeFee`, `peraFee` fields are currently passed as `""`).
- [ ] `SwapSharedViewModel.provider` defaults to a hard-coded `Provider(name: "Vestige.fi", exchangeRate: "1 ALGO ≈ 0.17 USDC")` — populate from the real provider/quote.
- [ ] `SwapSettingsSheet` body is empty (only the title bar with dismiss/apply) — implement slippage / settings controls; `apply` currently just dismisses.
- [ ] `ProviderSheet` selection has no effect on the chosen provider yet.
- [ ] `SettingsSwapButton` "max" action is a no-op — implement max-amount fill.
- [ ] Confirm-sheet asset subtitle shows a literal `"-"` (fiat value) — populate.

### Robustness / cleanup
- [ ] `createSwapView()` force-unwraps `assetItem(from: selectedAccount[0])!` and uses `fatalError()` when `selectedAccount` is nil — replace with safe handling.
- [ ] `confirmSwap()` force-unwraps `configuration.api!` and `viewModel.payingText!`/`receivingText!` in `SwapView` — guard instead.

## Done
- [x] SwiftUI Swap V2 main screen, asset cards, switch, debounced quote trigger.
- [x] Confirm sheet with slippage / price-impact info sheets.
- [x] High-price-impact (10–15%) warning gate before confirmation.
- [x] Hosting of `SwapView` inside `SwapViewController` and Swap-tab launch via `TabBarController.launchSwap`.
- [x] Spec and companion files scaffolded.
