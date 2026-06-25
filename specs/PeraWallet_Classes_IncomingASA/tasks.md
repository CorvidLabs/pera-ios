# PeraWallet_Classes_IncomingASA — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Reduce duplication across the four `composeAndSign*` / signing branches in `IncomingASATransactionController` (claim vs. reject share most of the body; consider a shared compose+sign helper).
- [ ] Collapse the repeated `startAnimatingListLoadingIfNeeded` overloads in `IncomingASAAccountInboxViewController` (separate overloads per cell type) into one generic loading helper.
- [ ] `appendSectionForSearchNoContent` in `IncomingASAAccountInboxAPIDataController` is identical to `appendSectionForNoContent` and unused — remove or wire up search empty state.
- [ ] `IncomingASASection.title` is declared but the inbox snapshot only uses `.assets`/`.empty`; confirm the title section is still needed or remove.
- [ ] Replace `unowned`/`[unowned self]` captures in the info-sheet and reject-sheet closures with `[weak self]` to avoid crashes if the screen is torn down mid-presentation.
- [ ] Magic timing constants (3.0s success delay, 0.2s dismiss delay, 50s ledger timeout) should be named/extracted.
- [ ] Add automated coverage for claim/reject transaction composition and the insufficient-Algo guards (see testing.md — none currently exist for this module).

## Done
- [x] ARC-59 claim/reject inbox flow implemented across accounts list, per-account inbox, and detail screens.
- [x] Standard, HD-wallet, and Ledger signing paths wired through `IncomingASATransactionController`.
- [x] Spec and companion files scaffolded.
