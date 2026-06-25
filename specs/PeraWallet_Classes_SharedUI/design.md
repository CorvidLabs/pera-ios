# PeraWallet_Classes_SharedUI — Design

## Layout & components

### State screens (centered single-column layout)
All three share a vertically-centered composition built with constraint helpers:

- **LoadingScreen** — `imageBackgroundView` (rounded square hosting a Lottie
  `LottieImageView`) above a centered `titleView`, with `detailView` below. No
  actions; the screen is driven to dismissal by its owner.
- **ErrorScreen** — `iconBackgroundView` + `iconView` above the centered
  `titleView`, `detailView` below, then a stacked `primaryActionView` and
  `secondaryActionView` (Macaroon `Button`s) pinned to the bottom safe area.
- **SuccessResultScreen** — `successIconBackgroundView` + `successIconView`,
  centered `titleView`, `detailView`, a `viewDetailActionView` link and a
  bottom-pinned `doneActionView`. Navigation bar hidden.

### Reusable views
- **InfoBoxHeaderView** — vertical stack: `InfoBoxView` banner over a body
  `Label`; exposes `calculatePreferredSize` for list-header sizing.
- **ShowMoreView** — title `Label` + body (`ALGActiveLabel` with overlaid
  full/truncated measurement labels) + a bottom toggle button; switches between
  truncated and full text overflow.
- **RightAccessorizedLabel** — horizontal: text `UILabel` (low hugging, required
  compression) with a trailing `ImageView` accessory centered vertically.
- **CircleIconView** — single `UIImageView` inset by `padding`; corner radius set
  to half the min dimension in `layoutSubviews` to stay circular.
- **NavigationPrimaryTitle** — large primary nav-bar title item (view model +
  theme).
- **UIViewControllerCollectionCell** — frames a single hosted `contextView` to
  the cell's content bounds; used for paged/carousel-style hosted content.

## Navigation hierarchy

These are leaf presentation components, not navigators. The state screens are
pushed/presented by the app `Router` from `Screen` enum cases (`.loading`,
`.error`, success-result), typically as modal-in-presentation steps inside a
feature flow coordinator (Swap, Incoming ASA, Account Import/Recover, Secure
Backup). User intent flows back up via each screen's `Event` enum and
`eventHandler`; the coordinator decides the next navigation step. The screens
themselves suppress system back/dismiss affordances.

## Design tokens

- Styling, spacing, sizing and corners come exclusively from the paired `*Theme`
  / `*Style` types (e.g. `LoadingScreenTheme`, `ErrorScreenTheme`,
  `SuccessResultScreenTheme`, `ShowMoreViewTheme`, `RightAccessorizedLabelStyle`),
  following the MacaroonUIKit theme pattern.
- Colors/typography/images are applied via `customizeAppearance(_:)` with the
  app design-system style objects (`theme.background`, `theme.title`,
  `theme.detail`, `theme.primaryAction`, icon/animation references, URL color for
  `ShowMoreView`, etc.). No literal colors or fonts are hard-coded in the views.

## Assets

- Lottie animation JSON for the loading indicator (set via
  `imageView.setAnimation(viewModel.imageName)`).
- Icon images for the error and success state screens, supplied through the
  theme's image styles and the asset catalog.
