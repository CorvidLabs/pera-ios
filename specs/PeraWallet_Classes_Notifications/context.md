# PeraWallet_Classes_Notifications — Context

## Overview

Architectural context for the `PeraWallet_Classes_Notifications` module. The authoritative contract is `PeraWallet_Classes_Notifications.spec.md`; the source files it covers are listed in that spec's `files:` frontmatter.

This module owns the in-app Notifications tab (a paginated feed of backend notifications) and the
Notification Filter screen (OS push permission + per-account notification preferences).

## Key files

- `List/Screens/NotificationsViewController.swift` — feed screen; wires data controller, list layout,
  deep-link routing, refresh, and the filter bar button.
- `List/DataSources/NotificationsAPIDataController.swift` — cursor pagination over
  `ALGAPI.getNotifications`, diffable snapshot building on a serial queue, de-duplication, unread
  timestamp bookkeeping, `.DeviceIDDidSet` observation. Conforms to the `NotificationsDataController`
  protocol (`List/DataSources/NotificationsDataController.swift`).
- `List/DataSources/NotificationsDataSource.swift` + `List/Layout/NotificationsListLayout.swift` —
  diffable data source and layout/handlers (willDisplay, didSelect).
- `List/ViewModels/NotificationsViewModel.swift` — per-row icon/title/time/isRead binding from
  `NotificationMessage`. `NotificationsNoContentViewModel.swift` — empty state.
- `LastSeenNotificationController.swift` — polls notification status, reports last-seen id, posts
  `.newNotificationReceieved` for unread badging.
- `Filter/Screens/NotificationFilterViewController.swift` — push toggle + per-account toggles.
- `Filter/DataSources/NotificationFilterDataSource.swift` — two sections (push, accounts), drives
  `ALGAPI.updateNotificationFilter`, optimistic rollback.
- `Filter/ViewModels/AccountNameSwitchViewModel.swift` and the `Filter/Views/...` cells/headers/themes.

## Architectural decisions

- MVVM + data-controller pattern (no coordinator). View controllers subclass `BaseViewController`
  and use the app-wide `open(_:by:)` routing rather than owning navigation.
- The feed uses `UICollectionViewDiffableDataSource`; snapshots are computed off-main on a dedicated
  serial queue and applied on main, animating only while appeared.
- Notification tap routing is delegated entirely to `DeepLinkParser` so the screen logic lives with
  the parser, not the cells.
- Filter toggles are optimistic with rollback; the OS push toggle is read-only in-app and only
  deep-links to iOS Settings (the app cannot flip system permission directly).
- `// TODO` markers in `NotificationsAPIDataController` note that API/no-device-id failures currently
  fall back to a no-content snapshot instead of a dedicated error snapshot.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
