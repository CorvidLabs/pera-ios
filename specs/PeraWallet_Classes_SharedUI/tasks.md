# PeraWallet_Classes_SharedUI — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Rename `ShowMoreView` — flagged with an in-source `<todo>` "Let's find a better name." (`ShowMoreView.swift:22`).
- [ ] `RightAccessorizedLabel.calculatePreferredSize` returns `.zero` (stub); implement a real size calculation if it is ever used in self-sizing cells.
- [ ] Audit which `Screen` enum cases still route to `SuccessResultScreen` — the file header comment still references its old name (`IncomingASAsDetailSuccessScreen.swift`), suggesting it was generalized; confirm naming is consistent.
- [ ] Consider extracting the duplicated "non-dismissible state screen" boilerplate (`isModalInPresentation`, hidden back button, pop-gesture toggling, `didTapBackBarButton == false`) shared by `LoadingScreen` / `ErrorScreen` / `SuccessResultScreen` into a shared base.
- [ ] `ShowMoreView` uses `[unowned self]` in the ActiveLabel URL tap closure — verify there is no retain/lifetime edge case and prefer `[weak self]` per concurrency conventions.

## Done
- [x] Spec and companion files scaffolded.
- [x] Spec enriched with source-grounded purpose, invariants, behavioral examples, error cases, and dependency table.
