# PeraWallet_Classes_Statistics — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action
  (see `BUILDING.md`).
- No dedicated unit tests exist for this module. The two view files are
  pure-layout UIKit views with no logic branches, so coverage is best done via
  visual/snapshot inspection rather than XCTest.

## Manual QA checklist

- [ ] When a host screen shows `AlgoStatisticsLoadingView`, the skeleton
      matches the loaded layout's shape (price, subtitle, chart area, control
      bar) with 4pt rounded gradient blocks.
- [ ] The `chart-loading-bg` image renders at ~180pt height and scales aspect-fit
      without distortion.
- [ ] The loading view ignores taps/scrolls (interaction disabled).
- [ ] Gradient colors track light/dark mode via `AppColors.Shared.Layer.gray*`.
- [ ] If the statistics screen is presented, the date-selection modal is
      screen-width × 434 and the main modal is ~80% of screen height.

## Edge cases

- Small/large devices: modal heights are derived from `UIScreen.main.bounds`,
  so verify on the smallest (SE) and largest (Pro Max / iPad) screens.
- Orientation/screen-size changes after init: `Theme` captures bounds at init
  time and does not recompute on rotation.
- Dead-code check: since the owning view controller is absent, confirm there is
  no live runtime path that instantiates these views before relying on QA here.
