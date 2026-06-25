# PeraWallet_Classes_Statistics — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as
discovered.

## Open
- [ ] Confirm whether `AlgoStatisticsViewController` (the owning class) was
      intentionally removed; the `+Theme` extension is now orphaned.
- [ ] Decide retention vs. deletion: `AlgoStatisticsLoadingView` and its theme
      have no remaining call sites (charting moved to `Classes/Charts`). If
      dead, remove the directory and update the spec `files:` list.
- [ ] `AlgoStatisticsLoadingView.addHeaderView(_:)` and `addItems(_:)` are
      implemented but never invoked from `customize(_:)`; either wire them in
      or remove them.
- [ ] If retained, add an animated shimmer (the gradients are currently static).

## Done
- [x] Spec and companion files scaffolded.
- [x] Spec sections rewritten from source (theme metrics, skeleton layout,
      orphaned-code ownership boundary documented).
