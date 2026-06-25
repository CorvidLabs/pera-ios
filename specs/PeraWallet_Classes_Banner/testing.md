# PeraWallet_Classes_Banner — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- No dedicated unit tests exist for this UI module today; the views are exercised through the Home screen. Good candidates for new tests:
  - `AnnouncementViewModel.shouldDisplayAction` truth table per `AnnouncementType`.
  - `CarouselBannerItemModel(apiModel:)` mapping vs. the parameterless backup init (`isBackupBanner`, nil URLs).
  - `CarouselBannerView` page-index clamping (`max(0, min(page, numberOfPages - 1))`).

## Manual QA checklist

Carousel (Home screen):
- [ ] With multiple spot banners, the carousel scrolls horizontally and snaps each card to center; the page control reflects the current page.
- [ ] With a single banner, the page control is hidden.
- [ ] Tapping a promotional banner opens its CTA URL; banners with no valid URL do nothing.
- [ ] Tapping the close button on a promotional banner dismisses it (and it stays dismissed after reload).
- [ ] The backup banner shows the arrow, has no close button, and tapping it opens the account backup flow.
- [ ] Tapping the page control dots scrolls to the corresponding banner.

Announcement cards:
- [ ] Each type (governance / generic / staking / card / retail / backup) renders its title, subtitle, and CTA per theme.
- [ ] Action button is hidden for governance/generic/staking when the announcement has no button URL/label.
- [ ] Close button dismisses the announcement; CTA button triggers the expected action.
- [ ] Cards self-size correctly for long/short titles and subtitles.

## Edge cases

- Empty banner list: nothing renders, no crash; page control hidden.
- Invalid `image`/`url` strings in the spot-banner API model resolve to nil (no icon, no navigation on tap).
- Unknown `AnnouncementType` raw value falls back to `.generic`.
- Light/dark mode switch refreshes the carousel card border color (`traitCollectionDidChange`).
- Page-index math with `numberOfPages == 0` must not produce negative indices.
