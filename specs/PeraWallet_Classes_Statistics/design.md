# PeraWallet_Classes_Statistics — Design

## Layout & components

The module renders the *loading skeleton* of the legacy ALGO statistics
screen. `AlgoStatisticsLoadingView` stacks the following gradient placeholders
top-to-bottom (each a `GradientView` with a 4pt corner radius):

- **Price block** — `109×44`, top/leading inset `20/24`.
- **Price subtitle** — `59×20`, `12`pt below the price.
- **Chart image** — full-width `chart-loading-bg` image, `180`pt tall,
  `15`pt below the subtitle (`scaleAspectFit`).
- **Control bar** — full-width, `30`pt tall, `40/24/24` margins.
- **Header + list rows** (`addHeaderView` / `addItems`) — an `81×20` header
  followed by three `56`pt rows, each with a left `81×16` label gradient and a
  right value gradient (`107×20`, `55×20`, `71×20`); rows 1–2 carry a bottom
  separator. (These helpers exist but are not called by `customize(_:)`.)

## Navigation hierarchy

No navigation is owned here. The `Theme` extension parameterizes how the
host statistics screen would present its modals:

- Date-selection modal: `screen width × 434`.
- Main statistics modal: `0.8 × screen height`.

The owning view controller and its push/present wiring no longer exist in the
codebase.

## Design tokens

- **Colors:** `AppColors.Shared.System.background` (screen background);
  `AppColors.Shared.Layer.gray` and `AppColors.Shared.Layer.grayLighter`
  (gradient start/end and row separators, end color at `0.5` alpha).
- **Spacing/sizing:** declared as `LayoutMargins`, `LayoutSize`,
  `LayoutMetric` in `AlgoStatisticsLoadingViewTheme`; modal sizing derived
  from `UIScreen.main.bounds`.
- **Corner radius:** `Corner(radius: 4)` for all skeleton blocks.

## Assets

- `chart-loading-bg` — placeholder chart background image used by the skeleton.
