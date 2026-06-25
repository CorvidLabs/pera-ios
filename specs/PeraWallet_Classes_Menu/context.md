# PeraWallet_Classes_Menu — Context

## Overview

Architectural context for the `PeraWallet_Classes_Menu` module — the **Menu**
tab of Pera Wallet. The authoritative contract is
`PeraWallet_Classes_Menu.spec.md`; the source files it covers are listed in
that spec's `files:` frontmatter.

## Key files

- `Screens/MenuViewController.swift` — the live menu screen. Builds the
  `MenuOption` list in `viewWillAppear`, acts as the collection-view data
  source/delegate, owns all destination flow coordinators, and dispatches
  taps. (This is the one referenced by the rest of the module.)
- `Screens/MenuViewController+Theme.swift` — `Theme` (cell heights) and
  `MenuListViewTheme` (background, spacing, edge insets).
- `Screens/CardsSupportedCountriesFlowCoordinator.swift` — async resolver for
  Pera Cards state (`active` / `inactive` / `addedToWailist`) via `ALGAPI`.
- `Models/MenuOption.swift` — the row enum (`cards`, `nfts`, `transfer`,
  `buyAlgo`, `buy`, `stake`, `receive`, `inviteFriends`) plus `MenuCardState`,
  and per-case title/description/icon/`showNewLabel`.
- `Views/MenuListView.swift` — wraps the `UICollectionView` with a flow layout.
- `Cells/MenuListItem/*` — standard row cell (`MenuListViewCell`) and its view
  (`MenuListItemView`: icon, title, chevron, NEW badge, NFT thumbnail stack).
- `Cells/Cards/*` — Pera Cards promo cell (`MenuListCardViewCell` →
  `MenuListCardView`) with action-button delegate chain back to the controller.

## Architectural decisions

- **MVC-ish with coordinators, not MVVM.** `MenuViewController` holds the
  option array and is its own data source/delegate; there is no separate view
  model. Navigation to each feature is delegated to dedicated flow coordinators
  (scan QR, cards, receive, Meld, Bidali) and to the app router's
  `open(_:by:)`.
- **Async enrichment over reloadData.** The list renders synchronously with
  default options, then card state and NFT thumbnails are resolved off the main
  flow and applied via `collectionView.reloadData()`.
- **Feature-flag gating.** The Cards row is only appended when
  `featureFlagService.isEnabled(.enableImmersve)` and the resolved state is
  `.active`.
- **Two-cell-type list.** A single section mixes a fixed-height standard row
  (72pt) and a taller card cell (220pt) sized in `sizeForItemAt`.

## Known cruft

- A second `Menu/MenuViewController.swift` and `Data/MenuDataSource.swift` exist
  at the module root with an older `MenuOption` shape (`cards(withCardCreated:)`,
  string thumbnails, a placeholder gray "Cards: implemented later" cell). The
  live screen is the one under `Screens/`. The root variant looks like dead/stub
  code and is a candidate for removal.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
