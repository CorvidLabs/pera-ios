---
module: PeraWallet_Classes_Menu
version: 1
status: active
files:
  - PeraWallet/Classes/Menu/Cells/Cards/CardEnabled/MenuListCardEnabledView.swift
  - PeraWallet/Classes/Menu/Cells/Cards/CardEnabled/MenuListCardEnabledViewTheme.swift
  - PeraWallet/Classes/Menu/Cells/Cards/MenuListCardView.swift
  - PeraWallet/Classes/Menu/Cells/Cards/MenuListCardViewCell.swift
  - PeraWallet/Classes/Menu/Cells/Cards/MenuListCardViewTheme.swift
  - PeraWallet/Classes/Menu/Cells/MenuListItem/MenuListItemView.swift
  - PeraWallet/Classes/Menu/Cells/MenuListItem/MenuListItemViewTheme.swift
  - PeraWallet/Classes/Menu/Cells/MenuListItem/MenuListViewCell.swift
  - PeraWallet/Classes/Menu/Data/MenuDataSource.swift
  - PeraWallet/Classes/Menu/MenuViewController.swift
  - PeraWallet/Classes/Menu/Models/MenuOption.swift
  - PeraWallet/Classes/Menu/Screens/CardsSupportedCountriesFlowCoordinator.swift
  - PeraWallet/Classes/Menu/Screens/MenuViewController.swift
  - PeraWallet/Classes/Menu/Screens/MenuViewController+Theme.swift
  - PeraWallet/Classes/Menu/Views/MenuListView.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Menu

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Menu`) that renders the
**Menu** tab — a single scrolling list of entry points into secondary Pera
Wallet features that don't warrant their own tab.

`MenuViewController` (in `Screens/`) owns a `MenuListView` whose
`UICollectionView` is backed directly by the controller acting as
`UICollectionViewDataSource`/`UICollectionViewDelegateFlowLayout`. Each row is
a `MenuOption` case rendered either as a standard list row
(`MenuListViewCell` → `MenuListItemView`: icon, title, chevron, optional
"NEW" badge, optional NFT thumbnail stack) or, for the Pera Cards entry, a
taller promo card (`MenuListCardViewCell` → `MenuListCardView`: icon, title,
description, illustration, action button).

On `viewWillAppear` the controller builds its option list and fans out two
async lookups: `CardsSupportedCountriesFlowCoordinator` resolves the Pera
Cards state (active / inactive / waitlisted) from the API, and
`CollectibleListLocalDataController` supplies up to three NFT thumbnail URLs
for the Collectibles row. Tapping a row dispatches to the relevant flow:
Collectibles list push, Staking push, Receive (`ReceiveTransactionFlowCoordinator`),
Buy gift cards (`BidaliFlowCoordinator`), Buy with Meld (`MeldFlowCoordinator`),
Invite Friends bottom sheet + native share, and Cards (`CardsFlowCoordinator`).
The navigation bar exposes a QR scanner button (`ScanQRFlowCoordinator`) and a
Settings push.

The Cards row is gated by the `enableImmersve` feature flag. Ownership is the
Menu tab and its option dispatch only; each destination feature owns its own
screens and flows. Internal-by-default; see Public API.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. The option list is rebuilt on every `viewWillAppear`; the Cards row is appended
   only when its state is `.active` **and** the `enableImmersve` feature flag is
   enabled, so a disabled flag or non-active card state hides the Cards row.
3. Exactly one collection-view section is rendered; row count equals
   `menuOptions.count` and every visible option maps to a concrete tap handler
   (the `.transfer`/`.buyAlgo` cases are not part of the live list).
4. Cards state and NFT thumbnails are resolved asynchronously and applied via
   `collectionView.reloadData()`; the list renders immediately with defaults
   (`cards(state: .inactive)`, empty thumbnails) and never blocks on the network.
5. Only non-watch accounts contribute fund addresses to the Cards availability
   lookup, and only non-GIF image-type collectibles contribute thumbnails (max 3).

## Behavioral Examples

### Scenario: Pera Cards row reflects an active card
- **Given** the user has at least one non-watch account with a card fund address
  and the `enableImmersve` flag is enabled
- **When** the Menu tab appears and `CardsSupportedCountriesFlowCoordinator` returns
  `success(hasActiveCard: true, isWaitlisted: false)`
- **Then** the option list is rebuilt with `.cards(state: .active)`, rendered as a
  promo card with a "go to cards" action, and tapping it launches `CardsFlowCoordinator`

### Scenario: Collectibles row shows recent NFT thumbnails
- **Given** the account holds image-type (non-GIF) collectibles
- **When** the Menu tab appears and `CollectibleListLocalDataController` emits
  `.didUpdate`
- **Then** up to three preview/download/thumbnail URLs are parsed and shown in the
  NFTs row, and tapping the row pushes the Collectibles list

### Scenario: Buy entry offers Meld and Bidali
- **Given** the user taps the "Buy" gift-card row (or the Buy/Sell options sheet)
- **When** they pick a provider
- **Then** the bottom sheet dismisses and either `MeldFlowCoordinator` (buy with Meld)
  or `BidaliFlowCoordinator` (buy gift cards) is launched

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Cards fund-address / country-availability API call fails | `CardsSupportedCountriesFlowCoordinator` emits `.error`; controller falls back to `.cards(state: .inactive)` and still loads NFT thumbnails |
| Collectible data controller finishes with `hasError == true` | Option list is rebuilt with the resolved cards option only; NFT row renders without thumbnails |
| User is in a waitlisted-only country | `success(..., isWaitlisted: true)` → `.cards(state: .addedToWailist)`; card shows "not supported country" copy, hides the action button |
| Index path out of bounds in data source/delegate | Reached only on programmer error; `fatalError` is raised (out-of-range guarded by `[safe:]`) |
| `AppDownloadURL` Info.plist key missing/invalid when sharing invite | Share sheet is silently not presented (guard returns early) |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core (PeraWalletCore) | `ALGAPI` (cards fund addresses / country availability), `Session`, `SharedDataController`, `BaseViewController`, feature-flag service |
| Collectibles UI | `CollectibleListLocalDataController`, `CollectibleListQuery`, `CollectibleAsset` for NFT thumbnails and the pushed list screen |
| Flow coordinators | `ScanQRFlowCoordinator`, `CardsFlowCoordinator`, `ReceiveTransactionFlowCoordinator`, `MeldFlowCoordinator`, `BidaliFlowCoordinator` |
| Bottom sheets / screens | `BuySellOptionsScreen`, `InviteFriendsScreen` via `BottomSheetTransition`; Settings and Staking via `open(_:by:)` routing |
| MacaroonUIKit / MacaroonURLImage / Kingfisher | Theming (`LayoutSheet`/`StyleSheet`), composable views, remote image loading for NFT thumbnails |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
