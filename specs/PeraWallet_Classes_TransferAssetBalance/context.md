# PeraWallet_Classes_TransferAssetBalance — Context

## Overview

Architectural context for the `PeraWallet_Classes_TransferAssetBalance` module. The authoritative contract is `PeraWallet_Classes_TransferAssetBalance.spec.md`; the source files it covers are listed in that spec's `files:` frontmatter.

This module is a single confirmation bottom sheet that asks the user whether to transfer away a remaining asset balance before opting out, or keep the asset. It is invoked from any flow that needs to remove/close an asset slot that still has a non-zero balance.

## Key files

- `TransferAssetBalanceScreen.swift` — the `ScrollScreen` / `BottomSheetScrollPresentable` view controller. Builds layout (title, asset-ID row, account row, warning, two footer buttons), binds data from the view model, and emits `.performApprove` / `.performClose` via its `EventHandler`.
- `TransferAssetBalanceDraft.swift` — the input value type (`account: Account`, `asset: Asset`) plus the `isTransferingCollectibleAssetBalance` helper (asset is `CollectibleAsset`).
- `TransferAssetBalanceViewModel.swift` — `ViewModel` that maps the draft to title, asset-ID row, account row, warning description, and the two button titles (localized strings).
- `TransferAssetBalanceScreenTheme.swift` — `StyleSheet`/`LayoutSheet` defining colors, spacing, separators, button styles, and content insets.
- `Views/TransferAssetBalanceNameView/TransferAssetBalanceNameViewModel.swift` — `PrimaryTitleViewModel` for the asset title: name, deleted/destroyed marker, verification-tier accessory icon, and unit-name secondary title.
- `Views/TransferAssetBalanceNameView/TransferAssetBalanceNameViewTheme.swift` — theme for the title view.

## Architectural decisions

- MVVM with a draft input: the screen is stateless and presentation-only. All copy and rows derive from `TransferAssetBalanceDraft` through `TransferAssetBalanceViewModel`; the screen owns no business logic.
- Coordinator/router-driven: callers construct the draft and present the screen through `Screen.transferAssetBalance(draft:theme:eventHandler:)` (routed in `Router.swift`). The screen reports the user's decision back through the closure rather than navigating itself.
- Reused shared components: `PrimaryTitleView`, `SecondaryListItemView`, `AssetIDSecondaryListItemViewModel`, and `AccountSecondaryListItemViewModel` are shared across opt-in/opt-out screens; the note in `OptInAssetNameViewModel.swift` flags that one of these name view models is enough to cover all variants.

## Callers (consume the events)

- `OptOutAssetCoordinator` — coordinates the opt-out flow and builds the draft.
- `ASADiscoveryScreen` — `openTransferAssetBalance` / `continueToTransferAssetBalance` / `cancelTransferAssetBalance`.
- `ManageAssetListViewController` — asset removal list.
- `CollectibleDetailViewController` — collectible opt-out.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
