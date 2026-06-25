---
module: PeraWallet_Classes_SharedUI
version: 1
status: active
files:
  - PeraWallet/Classes/SharedUI/CircleIconView.swift
  - PeraWallet/Classes/SharedUI/Screens/ErrorScreen/ErrorScreen.swift
  - PeraWallet/Classes/SharedUI/Screens/ErrorScreen/ErrorScreenTheme.swift
  - PeraWallet/Classes/SharedUI/Screens/ErrorScreen/ErrorScreenViewModel.swift
  - PeraWallet/Classes/SharedUI/Screens/LoadingScreen/LoadingScreen.swift
  - PeraWallet/Classes/SharedUI/Screens/LoadingScreen/LoadingScreenTheme.swift
  - PeraWallet/Classes/SharedUI/Screens/LoadingScreen/LoadingScreenViewModel.swift
  - PeraWallet/Classes/SharedUI/Screens/SuccessResultScreen/SuccessResultScreen.swift
  - PeraWallet/Classes/SharedUI/Screens/SuccessResultScreen/SuccessResultScreenTheme.swift
  - PeraWallet/Classes/SharedUI/Screens/SuccessResultScreen/SuccessResultScreenViewModel.swift
  - PeraWallet/Classes/SharedUI/Views/Header/InfoBox/InfoBoxHeaderView.swift
  - PeraWallet/Classes/SharedUI/Views/Header/InfoBox/InfoBoxHeaderViewModel.swift
  - PeraWallet/Classes/SharedUI/Views/Header/InfoBox/InfoBoxHeaderViewTheme.swift
  - PeraWallet/Classes/SharedUI/Views/List/UIViewControllerCollectionCell/UIViewControllerCollectionCell.swift
  - PeraWallet/Classes/SharedUI/Views/NavigationPrimaryTitle/NavigationPrimaryTitleItemViewModel.swift
  - PeraWallet/Classes/SharedUI/Views/NavigationPrimaryTitle/NavigationPrimaryTitleItemViewTheme.swift
  - PeraWallet/Classes/SharedUI/Views/Text/RightAccessorizedLabel/RightAccessorizedLabel.swift
  - PeraWallet/Classes/SharedUI/Views/Text/RightAccessorizedLabel/RightAccessorizedLabelModel.swift
  - PeraWallet/Classes/SharedUI/Views/Text/RightAccessorizedLabel/RightAccessorizedLabelStyle.swift
  - PeraWallet/Classes/SharedUI/Views/Text/ShowMore/ShowMoreView.swift
  - PeraWallet/Classes/SharedUI/Views/Text/ShowMore/ShowMoreViewModel.swift
  - PeraWallet/Classes/SharedUI/Views/Text/ShowMore/ShowMoreViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_SharedUI

## Purpose

App-target shared UI library (`PeraWallet/Classes/SharedUI`): a collection of
reusable, feature-agnostic screens and views consumed across the Pera Wallet
app (Swap, Incoming ASA, Account Import/Recover, Secure Backup, etc.). It owns
generic presentation building blocks, not any single feature flow.

It provides three full-screen "state" controllers built on Macaroon base
classes:

- **`LoadingScreen`** (`BaseViewController`) — a full-screen busy state with a
  Lottie animation, title and detail. Emits `willStartLoading` /
  `didStartLoading` / `didStopLoading` events so the presenting coordinator can
  drive the underlying async work and dismiss when done.
- **`ErrorScreen`** (`BaseScrollViewController`) — a terminal error state with an
  icon, title, detail and up to two actions (primary/secondary). Emits
  `didTapPrimaryAction` / `didTapSecondaryAction`.
- **`SuccessResultScreen`** (`BaseViewController`) — a success state with a
  success icon, title, detail, a "view detail" link and a "done" action. Emits
  `didTapViewDetailAction` / `didTapDoneAction`.

All three are view-model driven (`*ViewModel` protocols supply `TextProvider`
content), themed by a paired `*Theme`, and routed through the app `Router` /
`Screen` enum rather than instantiated ad hoc.

It also exposes small reusable views: `InfoBoxHeaderView` (info banner + body for
list headers), `ShowMoreView` (expand/collapse truncated body text with tappable
URLs), `RightAccessorizedLabel` (label with a trailing image accessory),
`CircleIconView` (auto-circular icon container), `NavigationPrimaryTitle*` (large
nav-bar title item) and `UIViewControllerCollectionCell` (hosts an arbitrary
`UIView`/child VC content view inside a collection cell, e.g. for paged carousels).

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. The state screens (`LoadingScreen`, `ErrorScreen`, `SuccessResultScreen`) are
   non-dismissible by the user via system gestures: each sets
   `isModalInPresentation = true`, hides the close/back bar button, returns
   `false` from `didTapBackBarButton`, and disables the interactive pop gesture
   while visible (re-enabling it on `viewWillDisappear`). Navigation away happens
   only through emitted events handled by the presenter.
3. Screens are pure presentation: they never perform navigation or business
   logic themselves. User intent is surfaced exclusively through the per-screen
   `Event` enum via `eventHandler`; content comes only from the injected
   view model (`TextProvider`/`imageName`) and theme.
4. `LoadingScreen` starts its Lottie animation on `viewWillAppear` and stops it
   on `viewWillDisappear`, so the animation lifecycle is bound to visibility (no
   leaked running animations once dismissed).
5. `UIViewControllerCollectionCell` owns at most one `contextView`; assigning a
   new one removes the previous from the hierarchy, and `prepareForReuse` clears
   it, so a recycled cell never displays a stale hosted view.

## Behavioral Examples

### Scenario: Loading screen drives an async operation and dismisses
- **Given** a coordinator routes to `.loading` with a `LoadingScreenViewModel`
  (image name, title, detail) through the `Router`
- **When** the screen appears it emits `willStartLoading` then `didStartLoading`
  and plays its Lottie animation, while the user cannot swipe back or dismiss it
- **Then** when the underlying work completes the coordinator pops/dismisses the
  screen; the animation stops and `didStopLoading` is emitted

### Scenario: Error screen offers retry vs. cancel
- **Given** an operation (e.g. a Swap quote) fails and the flow routes to
  `.error` with an `ErrorScreenViewModel` providing title, detail and two action
  titles
- **When** the user taps the primary action
- **Then** `ErrorScreen` emits `.didTapPrimaryAction` and the presenter retries;
  tapping the secondary action emits `.didTapSecondaryAction` and the presenter
  cancels/closes the flow

### Scenario: Show-more text expands long body
- **Given** a `ShowMoreView` bound with body text longer than its truncated height
- **When** the user taps the toggle action
- **Then** the body switches from the truncated overflow to the full overflow
  (and back on subsequent taps); tapping a URL inside the body forwards the URL
  to `ShowMoreViewDelegate.showMoreViewDidTapURL`

## Error Cases

| Condition | Behavior |
|-----------|----------|
| View model field (`title`/`detail`/action) is `nil` | The corresponding label/button is left unpopulated; no crash (all binds are optional `TextProvider?.load(in:)`). |
| `LoadingScreenViewModel.imageName` is `nil` | No Lottie animation is set; the loading screen still shows title/detail. |
| User attempts back/swipe-to-dismiss on a state screen | Suppressed: back button hidden, `didTapBackBarButton` returns `false`, interactive pop gesture disabled while visible. |
| `ShowMoreView` body fits without truncation (`fullBodyHeight <= truncatedBodyHeight`) | The toggle action appearance is reset/hidden so no redundant "show more" control is offered. |
| `ShowMoreView` URL fails to decode/parse | The tap is ignored (guard returns) rather than forwarding an invalid URL. |
| `UIViewControllerCollectionCell` context view detached externally | `getContextView` detects it no longer contains the ref and returns `nil` instead of a dangling view. |

## Dependencies

| Module | Usage |
|--------|-------|
| MacaroonUIKit | `View`/`Button`/`Label`/`ImageView`, `ViewModelBindable`, `TextProvider`, theme/style protocols, layout helpers (SnapKit-style constraints). |
| pera_wallet_core (PeraWalletCore) | `CurrencyFormatter`, `SwapQuote`, `SwapAssetValueFormatter` used to build success/error titles. |
| BaseViewController / BaseScrollViewController | App-target base controllers providing nav-bar config, `ViewControllerConfiguration` and lifecycle hooks. |
| Router / Screen | App routing layer that instantiates and presents these screens via the `Screen` enum cases (`.loading`, `.error`, success result). |
| Lottie (`LottieImageView`) | Animated loading indicator on `LoadingScreen`. |
| ActiveLabel (`ALGActiveLabel`) | URL detection/highlighting in `ShowMoreView` body. |
| InfoBoxView | Reused by `InfoBoxHeaderView` for the banner portion of the header. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
| Enriched purpose/invariants/examples/errors/dependencies from source | 2026-06-24 | 1 |
