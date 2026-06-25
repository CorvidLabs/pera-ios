# Classes_SwapV2 — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- No dedicated `SwapV2` unit/UI tests currently exist. Highest-value candidates:
  - `SwapSharedViewModel.shouldShowSwapButton` across empty / zero / comma-decimal / valid inputs.
  - Derived formatting (`slippageTolerance`, `priceImpact`, `price`) for nil quote, zero, and populated quotes.
  - `switchAssets()` swaps in/out correctly.

## Manual QA checklist

- [ ] Open the Swap tab — defaults to a non-watch account and the account's first asset.
- [ ] Launch swap from a deep link / draft (`launchSwap(with:)`) — preselects the draft's account and paying asset.
- [ ] Enter a paying amount — after ~0.5s the receive card shows a shimmer, then a quote value; Swap button + provider row appear.
- [ ] Tap the switch button — paying/receiving assets swap and the screen re-renders.
- [ ] Tap the paying/receiving asset chips — account/asset selection flow opens and updates the selection.
- [ ] Tap the account selector — switching accounts reloads the swap view.
- [ ] Open the settings sheet and provider sheet — they present and dismiss.
- [ ] Tap the title info button — opens the Tinyman swap help link.
- [ ] Tap Swap with a normal quote — confirm sheet shows account, in/out amounts, price, provider, slippage, price impact.
- [ ] In the confirm sheet, tap the slippage and price-impact info buttons — corresponding info sheets appear.
- [ ] Slide to confirm — confirmation flow proceeds.
- [ ] Trigger a quote with price impact 10–15% and confirm — the red high-price-impact warning sheet appears first; cancel aborts, confirm proceeds; the warning body link opens the Tinyman price-impact page.

## Edge cases

- Watch-only-only wallet: Swap tab should render no editable surface (no non-watch account found, early return).
- Paying field with a zero placeholder gains focus — clears to empty for fresh entry.
- Comma vs dot decimal separators in the paying amount (locale) — both parse via the `","`→`"."` replacement.
- Rapid typing — debounce cancels in-flight work items so only the latest amount requests a quote.
- Quote fetch error — currently no user-visible alert (known gap; only logged).
- Confirm sheet placeholder values (minimum received / exchange fee / Pera fee) are hard-coded and should not be trusted in QA until wired to the quote.
