# Classes_Application — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones
as discovered.

## Open
- [ ] Refactor routing so `TabBarController` no longer retains
  `analytics`/`api`/`session` directly — tracked by the in-source
  `<todo>` ("Normally, we shouldn't retain data store or create flow
  coordinator here but our current routing approach hasn't been
  refactored yet").
- [ ] Replace force-unwrap of the Fund tab image
  (`image!.withTintColor(...)` in `TabBarItems.swift`) with a safe unwrap
  per CorvidLabs no-force-unwrap convention.
- [ ] Consider centralizing tab enablement rules (Discover/Swap) so they
  cannot drift between `RootViewController` and `TabBarController`.
- [ ] Document/clarify why Stake and Collectibles tab items exist in
  `TabBarItemID` but are not in the default five-tab layout.

## Done
- [x] Tab selection bridged through `selectedTab`/`selectedIndex`.
- [x] Re-tap-to-pop-to-root behavior implemented.
- [x] Reactive Discover enablement on `didUpdateNetwork`.
- [x] Reactive Swap enablement on `.userAccountsChanged`.
- [x] Analytics tracking on tab selection change.
- [x] Deep-link entry points `launchDiscover(with:)` and
  `launchSwap(with:)`.
- [x] Spec and companion files scaffolded.
