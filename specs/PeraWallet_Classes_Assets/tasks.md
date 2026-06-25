# PeraWallet_Classes_Assets — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Refactor routing so `ASADetailScreen` no longer retains `SwapDataStore` / constructs flow
      coordinators inline (flagged by the in-code `<todo>` at the top of `ASADetailScreen.swift`).
- [ ] Consolidate the duplicated opt-in (`AssetAdditionViewController`) and opt-out
      (`ManageAssetListViewController`) ledger/joint-account transaction plumbing — both
      reimplement nearly identical `TransactionControllerDelegate`, ledger, and monitoring logic.
- [ ] Retire / fold the legacy `AlgosDetailViewController` and `AssetDetailViewController`
      (`Detail/List/Screens`) into `ASADetailScreen` once transaction-listing parity exists.
- [ ] Replace the fixed `activityContentHeight = 600` seed and +100px padding heuristic in
      `ASADetailScreen` with a measured layout pass.
- [ ] Audit `[unowned self]` captures in `AssetAdditionViewController` cell-event observers for
      lifecycle safety during fast scroll / dismissal.

## Done
- [x] Spec and companion files scaffolded.
- [x] Spec narrative (Purpose / Invariants / Behavioral Examples / Error Cases / Dependencies)
      rewritten from source.
