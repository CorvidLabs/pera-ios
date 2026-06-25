# PeraWallet_Classes_Collectibles — Context

## Overview

Architectural context for the `PeraWallet_Classes_Collectibles` module — the NFT/collectible feature of Pera Wallet. The authoritative contract is `PeraWallet_Classes_Collectibles.spec.md`; the full source list is in that spec's `files:` frontmatter.

## Key files

- **List / Gallery**
  - `List/Screens/CollectiblesViewController.swift` — container; nav bar add/opt-in button, fetch-error banner, routes to receive + filter.
  - `List/Screens/CollectibleListViewController.swift` — the gallery collection view; emits `Event` (`didTapReceive`, `willDisplayListHeader`, `didEndDisplayingListHeader`, `didFinishRunning(hasError:)`, `didTapFilter`, `didUpdateSnapshot`).
  - `List/Data/CollectibleListLocalDataController.swift` — `SharedDataControllerObserver` + `NotificationObserver`; reloads gallery on add/remove/send notifications; owns grid/list `CollectibleGalleryUIStyle`.
  - `List/Data/CollectibleListQuery.swift`, `CollectibleListDataSource.swift`, `List/Layout/*` — query, diffable data source, switchable grid/list flow layout.
  - `List/Screens/Sort/*` — sort sub-screen.
- **Detail**
  - `Detail/Screens/CollectibleDetailViewController.swift` — main detail screen, MVVM + diffable data source, quick actions, Ledger transitions.
  - `Detail/Screens/CollectibleDetailTransactionController.swift` — opt-in/opt-out transaction orchestration (incl. joint accounts).
  - `Detail/Data/CollectibleDetailAPIDataController.swift` — fetch asset, media, image-to-copy, media-to-save; emits detail events.
  - `Detail/ViewModels/Media/*` + `Detail/Views/Media/*` — image / video / audio / GIF / WebP / error media previews.
- **Receive**: `Receive/SelectAccount/*` then `Receive/SelectAsset/*` (account list → asset list → opt-in).
- **Send**: `Send/SendCollectibleViewController.swift` (+ `+Animation`, `+Layout`), `Send/ApproveTransaction/ApproveCollectibleTransactionViewController.swift`.
- **Filter**: `Filter/CollectiblesFilterSelectionViewController.swift`, `Filter/Data/CollectibleFilterOptions.swift` + `CollectibleFilterOptionsCache.swift`.
- **FullScreen / 3DCard**: full-screen image/video viewers, `3DCard/Collectible3D*` viewers and theme.

## Architectural decisions

- **MVVM + DataController/DataSource + Theme.** Screens are thin `UIViewController`s; `*DataController` (often `*APIDataController` / `*LocalDataController`) own fetching and emit events; `*DataSource` are diffable data sources; `*ViewModel` map models to view state; `*Theme` files hold tokens/layout constants and `calculatePreferredSize`.
- **Event-handler closures, not delegates,** are the dominant cross-screen wiring pattern (e.g. `CollectibleListViewController.eventHandler`, `CollectibleDetailViewController.Event`).
- **NotificationCenter** keeps list and detail consistent across opt-in/out/send (`didAddCollectible` / `didRemoveCollectible` / `didSendCollectible`).
- **Transaction infra is shared** with the rest of the app via `TransactionController` + `sharedDataController.blockchainUpdatesMonitor`; Ledger and joint-account paths are handled inline in the screens.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI. Feature is shipping; active development areas are media rendering, joint/shared-account transaction handling, and the grid/list gallery layout.
