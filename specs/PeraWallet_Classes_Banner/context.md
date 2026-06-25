# PeraWallet_Classes_Banner — Context

## Overview

UI layer for the banners shown on the Pera Wallet Home screen. The authoritative contract is `PeraWallet_Classes_Banner.spec.md`; the source files it covers are listed in that spec's `files:` frontmatter.

The module has two independent sub-areas under `PeraWallet/Classes/Banner/`:

- `Carousel/` — horizontally paged "spot banners" (promotional + a local backup banner).
- `Announcement/` — full-width announcement cards typed by `AnnouncementType`.

## Key files

- `Carousel/CarouselBannerView.swift` — collection-view host; data source/delegate, paging math, `pageControl` sync; re-exposes `CarouselBannerDelegate`.
- `Carousel/CarouselBannerCell.swift` — wrapper cell; **defines the `CarouselBannerDelegate` protocol** (`didPressBanner(in:)`, `didTapCloseButton(in:)`).
- `Carousel/FlowLayout/CarouselFlowLayout.swift` — horizontal flow layout, item width = 88% of collection width, snaps to nearest item.
- `Carousel/PageControl/CarouselPageControl.swift` — `UIPageControl` subclass with pill-shaped active dot (12x4) and round inactive dots (4x4).
- `Carousel/Item/CarouselBannerItemModel.swift` — `Hashable` struct; `init(apiModel: SpotBannerListItem.APIModel)` for promotional items, `init()` for the local backup banner.
- `Carousel/Item/CarouselBannerItemView.swift` / `...Cell.swift` — per-item icon/text/arrow/close rendering; close button fires the delegate.
- `Announcement/AnnouncementViewModel.swift` — maps `Announcement` + `AnnouncementType` → title/subtitle/cta; computes `shouldDisplayAction`.
- `Announcement/AnnouncementView.swift` — stack-based card; `.action`/`.close` UI interactions; `calculatePreferredSize` for self-sizing cells.
- `Announcement/AnnouncementCell.swift` — base cell plus typed subclasses (`Staking`, `Generic`, `Governance`, `Card`, `RetailCampaign`), each with its own theme.
- `*ViewTheme.swift` — `StyleSheet`/`LayoutSheet` definitions using `Colors`/`Typography` design tokens.

## Architecture

- MVVM + theme objects (no coordinators in this module). Views conform to MacaroonUIKit `ViewComposable`/`View`, `ViewModelBindable`, `ListReusable`.
- Communication is delegate-based for the carousel (`CarouselBannerDelegate`) and UI-interaction-based for announcements (`UIInteractable` with `.action`/`.close` events).
- All data, dismissal persistence, navigation, and analytics are external — owned by the Home feature (`HomeViewController`, `HomeAPIDataController`, `SpotBannersAPIDataController`) and `PeraWalletCore` models.

## Architectural decisions

- The backup carousel banner is constructed locally (parameterless `CarouselBannerItemModel()`), not from the API, and is intentionally non-dismissible (no close button, arrow shown instead).
- Unknown `AnnouncementType` raw values intentionally fall back to `.generic` rather than failing to decode.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
