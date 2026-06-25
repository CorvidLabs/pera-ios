# PeraWallet_Classes_Banner — Design

## Layout & components

### Carousel (spot banners)
- `CarouselBannerView` — root: a horizontal, non-paging-enabled `UICollectionView` (clips disabled so neighbouring cards peek) above a centered `CarouselPageControl`.
- `CarouselFlowLayout` — items are 88% of the collection width and full height; `targetContentOffset` snaps the scroll to the nearest item; `decelerationRate = .fast`.
- `CarouselBannerItemView` (in `CarouselBannerItemCell`) — rounded card (16pt radius, 1pt gray border) with:
  - leading circular icon (48pt) — remote image (Kingfisher) for promotional items; `icon-backup-banner` on a light-negative background for the backup banner.
  - multi-line text label (center-aligned vertically).
  - trailing arrow chip (shown only for the backup banner) OR a top-trailing circular close button (shown only for promotional banners).
- `CarouselPageControl` — pill-shaped active dot (12x4), round inactive dots (4x4); hidden when there is `<= 1` item.

### Announcement (cards)
- `AnnouncementView` — rounded card with a full-bleed background image, a top-trailing close button, and a vertical stack (`VStackView`) of title, subtitle, and an action (CTA) button. Each element is shown/hidden by the bound `AnnouncementViewModel`.
- `AnnouncementCell` base + typed subclasses each apply a distinct theme: `StakingAnnouncementViewTheme`, `GenericAnnouncementViewTheme`, `GovernanceAnnouncementViewTheme`, `CardAnnouncementViewTheme`, `RetailCampaignAnnouncementViewTheme`. Context paddings: `(0, 24, 0, 24)`.
- Self-sizing via `AnnouncementView.calculatePreferredSize(_:for:fittingIn:)` summing title/subtitle/action heights and stack insets.

## Navigation hierarchy

Both banner families are embedded as cells inside the Home list (`HomeViewController` / `HomeListLayout`). Interactions bubble out of the module:
- Carousel: cell tap → `CarouselBannerDelegate.didPressBanner(in:)`; close tap → `didTapCloseButton(in:)`.
- Announcement: action button → `.action` interaction; close button → `.close` interaction.

The module itself performs no navigation; CTA routing (`triggerBannerCTA`, `openBackUpAccount`) and dismissal persistence (`updateClose`) happen in the Home feature.

## Design tokens

- Colors: `Colors.Defaults.background`, `Colors.Text.main`, `Colors.Layer.gray` / `grayLighter`, `Colors.Helpers.negative` / `negativeLighter` (backup state).
- Typography: `Typography.bodyMedium()` for carousel item text; announcement themes set title/subtitle/CTA typography.
- Layout metrics live in the `*ViewTheme` structs (radii, paddings, icon/close/arrow sizes, item spacing).
- Border color is refreshed on `traitCollectionDidChange` so it tracks light/dark mode.

## Assets

- `icon-backup-banner` asset catalog image, used to render the non-dismissible backup carousel banner.
- Remote banner icons/images loaded by URL (MacaroonURLImage / Kingfisher); no bundled assets for promotional banners.
