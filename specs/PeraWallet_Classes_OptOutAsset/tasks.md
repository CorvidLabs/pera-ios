# PeraWallet_Classes_OptOutAsset — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Consider adding a unit test for `OptOutAssetViewModel` covering both the
      collectible vs. standard-asset string/label branches.
- [ ] Consider showing the actual estimated fee rather than a hard-coded
      `Transaction.Constant.minimumFee` if grouped/inner transactions change the cost.
- [ ] Add a destroyed/suspicious-asset visual QA pass (negative-color name + badge)
      since `OptOutAssetNameViewModel` handles these states but they are rarely seen.
- [ ] Evaluate whether the "transfer balance first" branch deserves a clearer
      handoff message inside the confirmation flow (currently a separate screen).

## Done
- [x] Spec and companion files scaffolded.
- [x] Documented the opt-out confirmation sheet, its draft-driven binding, and the
      `.performApprove`/`.performClose` event contract.
- [x] Documented the coordinator-owned opt-out flow (zero-balance vs. transfer-first,
      Ledger/joint-account signing, error handling) as the screen's consumer.
