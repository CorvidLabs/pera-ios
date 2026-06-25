# PeraWallet_Classes_Banner — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] `Announcement/AnnouncementView.bindData` force-unwraps `actionTitle!` when `shouldDisplayAction` is true — replace with a safe unwrap to satisfy the no-force-unwrap convention.
- [ ] `PeraWalletCore/Models/Banner/Announcement.swift` carries a `<todo>` to rethink the paginated `AnnouncementList` model for reusability (tracked upstream, surfaces banner data).
- [ ] Consider unit coverage for `CarouselFlowLayout` snapping math and `CarouselBannerView` page-index clamping.
- [ ] Consider unit coverage for `AnnouncementViewModel.shouldDisplayAction` across all `AnnouncementType` cases.

## Done
- [x] Spec and companion files scaffolded.
- [x] Source-grounded enrichment of Purpose / Invariants / Behavioral Examples / Error Cases / Dependencies.
- [x] Carousel: paged spot-banner collection with custom flow layout + page control.
- [x] Carousel: local, non-dismissible "account not backed up" banner via `CarouselBannerItemModel()`.
- [x] Announcement: typed cells (staking/generic/governance/card/retail) with per-type themes.
