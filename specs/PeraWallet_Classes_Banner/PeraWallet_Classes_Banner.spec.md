---
module: PeraWallet_Classes_Banner
version: 1
status: active
files:
  - PeraWallet/Classes/Banner/Announcement/AnnouncementCell.swift
  - PeraWallet/Classes/Banner/Announcement/AnnouncementView.swift
  - PeraWallet/Classes/Banner/Announcement/AnnouncementViewModel.swift
  - PeraWallet/Classes/Banner/Announcement/AnnouncementViewTheme.swift
  - PeraWallet/Classes/Banner/Carousel/CarouselBannerCell.swift
  - PeraWallet/Classes/Banner/Carousel/CarouselBannerView.swift
  - PeraWallet/Classes/Banner/Carousel/CarouselBannerViewTheme.swift
  - PeraWallet/Classes/Banner/Carousel/FlowLayout/CarouselFlowLayout.swift
  - PeraWallet/Classes/Banner/Carousel/Item/CarouselBannerItemCell.swift
  - PeraWallet/Classes/Banner/Carousel/Item/CarouselBannerItemModel.swift
  - PeraWallet/Classes/Banner/Carousel/Item/CarouselBannerItemView.swift
  - PeraWallet/Classes/Banner/Carousel/Item/CarouselBannerItemViewTheme.swift
  - PeraWallet/Classes/Banner/Carousel/PageControl/CarouselPageControl.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Banner

## Purpose

App-target UI module (`PeraWallet/Classes/Banner`) that renders the promotional and informational banners shown on the Home screen. It owns two independent banner presentations:

- **Carousel** (`Carousel/`): a horizontally paged collection of "spot banners". Each item (`CarouselBannerItemView`/`CarouselBannerItemCell`) shows an icon, text, and either a trailing arrow (backup banner) or a close button (promotional banners). `CarouselBannerView` hosts a `UICollectionView` driven by `CarouselFlowLayout` (88%-width snapping pages) and a custom `CarouselPageControl` with pill-shaped active dots. Items are built from `SpotBannerListItem.APIModel` (`CarouselBannerItemModel(apiModel:)`) or from the parameterless `CarouselBannerItemModel()` init, which produces the local, non-dismissible "account not backed up" banner.
- **Announcement** (`Announcement/`): a full-width card (`AnnouncementView`) with optional title, subtitle, CTA button, close button, and background image. `AnnouncementViewModel(_:Announcement)` maps an `Announcement` (typed by `AnnouncementType`: governance / generic / backup / staking / card / retail) into display strings and decides whether the CTA shows. `AnnouncementCell` and its typed subclasses (`StakingAnnouncementCell`, `GenericAnnouncementCell`, `GovernanceAnnouncementCell`, `CardAnnouncementCell`, `RetailCampaignAnnouncementCell`) bind the view per type-specific theme.

Ownership boundary: this module supplies the views, cells, view models, themes, and the `CarouselBannerDelegate` protocol only. Data fetching, dismissal persistence, CTA navigation, and analytics live in the Home feature (`HomeViewController`, `HomeAPIDataController`, `SpotBannersAPIDataController`) and `PeraWalletCore`. All types are `internal` to the app target.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary. The only shared contract it defines is the `CarouselBannerDelegate` protocol (`didPressBanner(in:)`, `didTapCloseButton(in:)`).
2. The carousel `pageControl` is hidden when `items.count <= 1` and its `numberOfPages` always equals the number of bound `CarouselBannerItemModel`s; `currentPage` is clamped to `0...(numberOfPages - 1)`.
3. The backup carousel item (`isBackupBanner == true`, produced by `CarouselBannerItemModel()`) shows the arrow and hides the close button; promotional items (`isBackupBanner == false`, built from `SpotBannerListItem.APIModel`) hide the arrow and show the close button. The backup item therefore cannot be dismissed.
4. `AnnouncementViewModel.shouldDisplayAction` is always `true` for `.backup`, `.card`, and `.retail` types, and is `true` for `.governance`, `.generic`, and `.staking` only when both `ctaUrl` and `ctaTitle` are non-nil. The `AnnouncementView` shows/hides the action button strictly according to this flag.
5. Tapping a banner does not navigate or persist state inside this module; it forwards the event to the delegate (the carousel) or publishes a `.action` / `.close` UI interaction (the announcement), and the consumer (`HomeViewController`) decides the outcome.

## Behavioral Examples

### Scenario: Tapping a promotional spot banner
- **Given** the Home carousel is bound with one or more `SpotBannerListItem`-derived items
- **When** the user taps an item cell
- **Then** `CarouselBannerView` calls `delegate.didPressBanner(in:)`, and `HomeViewController` opens the banner's `url` via `triggerBannerCTA(itemUrl:)` and tracks `spotBannerPressed(type: .tapBanner)`.

### Scenario: Tapping the backup carousel banner
- **Given** the carousel contains the local backup item (`isBackupBanner == true`, no close button)
- **When** the user taps it
- **Then** `didPressBanner(in:)` fires; because `banner.isBackupBanner` is true, `HomeViewController` calls `openBackUpAccount()` instead of opening a URL.

### Scenario: Dismissing a promotional banner
- **Given** a promotional carousel item showing a close button
- **When** the user taps the close button
- **Then** `CarouselBannerItemView` calls `delegate.didTapCloseButton(in:)`; `HomeViewController` calls `dataController.updateClose(for:)` to persist the dismissal and tracks `spotBannerPressed(type: .tapClose)`.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Spot banner `image`/`url` string is not a valid URL | `URL(string:)` returns nil; the icon falls back to no image and tapping a banner with a nil `url` returns early without navigation. |
| Carousel bound with an empty item list | `numberOfItemsInSection` is 0, `pageControl` is hidden (`count <= 1`); nothing renders, no crash. |
| `Announcement.type` decodes an unknown raw string | `AnnouncementType(rawValue:)` maps it to `.generic`; the view model uses the generic configuration. |
| Announcement has no `buttonUrl`/`buttonLabel` for a governance/generic/staking type | `shouldDisplayAction` is false; `AnnouncementView` hides the action button. |
| Page-control / scroll math with `numberOfPages == 0` | `currentPage` is clamped via `max(0, min(page, numberOfPages - 1))`, avoiding negative indices. |

## Dependencies

| Module | Usage |
|--------|-------|
| PeraWalletCore (`pera_wallet_core`) | `SpotBannerListItem.APIModel`, `Announcement`, `AnnouncementType` models consumed by the item model and view model; `SpotBannerEvent` analytics. |
| MacaroonUIKit | `ViewComposable`/`View`, `ViewModelBindable`, `ListReusable`, `UIInteractable`, theme `StyleSheet`/`LayoutSheet`, `VStackView`, `Button`, `TargetActionInteraction`. |
| MacaroonURLImage | Remote banner icon/image loading in the carousel item theme and view. |
| Kingfisher (`kf`) | `iconView.kf.setImage(with:)` for promotional banner icons. |
| App design system (`Colors`, `Typography`) | Color and typography tokens for all banner views. |
| Home feature (`HomeViewController`, `HomeAPIDataController`, `SpotBannersAPIDataController`) | Owns the `CarouselBannerDelegate`, builds/binds items, persists dismissal, performs CTA navigation and analytics. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
| Source-grounded enrichment (carousel + announcement banners) | 2026-06-24 | 1 |
