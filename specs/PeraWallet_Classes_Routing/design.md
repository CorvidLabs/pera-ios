# PeraWallet_Classes_Routing — Design

This is the navigation layer, so "design" here is the navigation model and the
transition vocabulary rather than a single screen's layout. The concrete screens
are owned by their own feature modules; this module only decides *how* and *in
what container* they appear.

## Navigation model

- **Destination catalog:** `Screen` (`indirect enum`, ~180 cases) is the
  single source of truth for everything navigable. Representative groups:
  - Onboarding / recovery: `welcome`, `addAccount`, `recoverAccount`,
    `passphraseView/Verify`, `hdWalletSetup`, `ledger*`, `watchAccountAddition`.
  - Assets / collectibles: `asaDetail`, `asaDiscovery`, `addAsset`,
    `collectibleList`, `collectibleDetail`, `sendCollectible`, sort/filter
    sheets.
  - Transactions / send / swap / buy-sell: `sendTransaction`,
    `sendTransactionPreview`, `swapAsset`, `confirmSwap`, `swapSuccess`,
    `buySellOptions`, `moonPay*`, `meld*`, `bidali*`.
  - WalletConnect: `wcConnection`, `wcMainTransactionScreen`,
    `wcAlgosTransaction`, `wcGroupTransaction`, `wcSessionDetail`, …
  - Rekey / account info: `rekey*`, `undoRekey*`, `*AccountInformation`.
  - System / settings / backup / discover: `settings`, `securitySettings`,
    `algorandSecureBackup*`, `discover*`, `cards`, `staking`,
    `externalInAppBrowser`.
  - Generic UI: `bottomWarning`, `sheetAction`, `loading`, `error`,
    `successResultScreen`, `alert`, `shareActivity`.
- **Factory:** `Router.buildViewController(for:)` maps each `Screen` case to its
  concrete `UIViewController`, wiring data controllers, themes, and event
  handlers from the case payload.
- **Visible-screen resolution:** `findVisibleScreen(...)` descends
  presented controllers → active `UINavigationController` →
  selected `TabbedContainer` tab to find the controller to present from.

## Transition vocabulary

`Screen.Transition.Open`:

| Style | Container / behavior |
|-------|----------------------|
| `root` | Replace the navigation stack root (`setViewControllers([vc])`) |
| `push` | Push onto the source's navigation controller |
| `present` / `customPresent` | Wrap in `NavigationContainer` and present modally (custom variant sets presentation/transition style + delegate) |
| `presentWithoutNavigationController` / custom variant | Present the controller directly, no nav wrapper |
| `launch` | Dismiss current (unless root), wrap in `NavigationContainer`, present full-screen from root |
| `set` | Keep nav root, replace the rest with a single pushed controller |

`Screen.Transition.Close`: `pop`, `dismiss`.

Status-bar appearance is propagated across transitions for
`StatusBarConfigurable` controllers. Bottom sheets use `BottomSheetTransition`
(e.g. `launchWithBottomWarning`, QR scan-options), tracked in
`Router.ongoingTransitions`.

## Containers

- `RootViewController` — owns the tab bar (`TabBarItemID.home`, …) and is the
  presentation root for `launch`-style flows.
- `NavigationContainer` — the standard `UINavigationController` subclass that
  wraps presented screens.
- `TabbedContainer` — host for the main tabbed experience.

## Design tokens / assets

- This module instantiates feature screens but does not itself define visual
  tokens; colors, typography, and spacing come from the app design system used
  by the individual screens. Per-screen `Theme` values
  (`SuccessResultScreenViewTheme`, `OptOutAssetScreenTheme`, etc.) are passed
  through `Screen` case payloads with sensible defaults.
- No asset-catalog references are owned here; assets belong to the target
  feature modules.
