---
module: PeraWallet_Classes_Notifications
version: 1
status: active
files:
  - PeraWallet/Classes/Notifications/Filter/DataSources/NotificationFilterDataSource.swift
  - PeraWallet/Classes/Notifications/Filter/Layout/NotificationFilterListLayout.swift
  - PeraWallet/Classes/Notifications/Filter/Screens/NotificationFilterViewController.swift
  - PeraWallet/Classes/Notifications/Filter/Screens/NotificationFilterViewControllerTheme.swift
  - PeraWallet/Classes/Notifications/Filter/ViewModels/AccountNameSwitchViewModel.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Header/ToggleTitleHeaderSupplementaryView.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Header/ToggleTitleHeaderView.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Header/ToggleTitleHeaderViewTheme.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/AccountNameSwitchCell.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/AccountNameSwitchView.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/AccountNameSwitchViewTheme.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/TitledToggleCell.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/TitledToggleLoadingCell.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/TitledToggleLoadingView.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/TitledToggleLoadingViewTheme.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/TitledToggleView.swift
  - PeraWallet/Classes/Notifications/Filter/Views/Item/TitledToggleViewTheme.swift
  - PeraWallet/Classes/Notifications/LastSeenNotificationController.swift
  - PeraWallet/Classes/Notifications/List/DataSources/NotificationsAPIDataController.swift
  - PeraWallet/Classes/Notifications/List/DataSources/NotificationsDataController.swift
  - PeraWallet/Classes/Notifications/List/DataSources/NotificationsDataSource.swift
  - PeraWallet/Classes/Notifications/List/Layout/NotificationsListLayout.swift
  - PeraWallet/Classes/Notifications/List/Screens/NotificationsViewController.swift
  - PeraWallet/Classes/Notifications/List/ViewModels/NotificationsNoContentViewModel.swift
  - PeraWallet/Classes/Notifications/List/ViewModels/NotificationsViewModel.swift
  - PeraWallet/Classes/Notifications/List/Views/Item/NotificationCell.swift
  - PeraWallet/Classes/Notifications/List/Views/Item/NotificationView.swift
  - PeraWallet/Classes/Notifications/List/Views/Item/NotificationViewTheme.swift
  - PeraWallet/Classes/Notifications/List/Views/Loading/NotificationLoadingCell.swift
  - PeraWallet/Classes/Notifications/List/Views/Loading/NotificationLoadingView.swift
  - PeraWallet/Classes/Notifications/List/Views/Loading/NotificationLoadingViewCommonTheme.swift
  - PeraWallet/Classes/Notifications/List/Views/Loading/NotificationLoadingViewTheme.swift
  - PeraWallet/Classes/Notifications/List/Views/NotificationsView.swift
  - PeraWallet/Classes/Notifications/List/Views/NotificationsViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Notifications

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Notifications`) that powers the in-app
Notifications tab and its per-account notification preferences. It has two sub-areas:

- **List** (`List/`): `NotificationsViewController` renders a paginated, pull-to-refresh feed
  of `NotificationMessage` items in a diffable-data-source collection view. Items are fetched
  from the Pera backend via `ALGAPI.getNotifications` (cursor pagination) by
  `NotificationsAPIDataController`. Tapping a notification runs `DeepLinkParser.discover(notification:)`
  and routes to the corresponding screen: ASA opt-in / opt-out discovery, ASA detail, collectible
  detail, transaction detail, asset inbox, account detail, an external in-app browser, or an
  external deep link. Unread state is computed by comparing each item's date against the session's
  `notificationLatestFetchTimestamp`.

- **Filter** (`Filter/`): `NotificationFilterViewController` lets the user toggle the OS-level push
  permission (deep-linking to iOS Settings when changed) and a per-account "receives notifications"
  flag. Per-account toggles call `ALGAPI.updateNotificationFilter` and persist the result onto the
  authenticated user's local account record.

The module also owns `LastSeenNotificationController`, which polls notification status
(`hasNewNotification`) and reports the latest-seen notification id to the backend, posting
`.newNotificationReceieved` so the rest of the app can surface an unread badge.

Internal-by-default; see Public API for any cross-module-public surface.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. The notifications feed requires a device id (`authenticatedUser.getDeviceId(on:)`). Without one,
   the controller delivers a no-content snapshot rather than calling the API, and re-loads when
   `.DeviceIDDidSet` fires while no snapshot has been built yet.
3. Snapshots are built off the main thread on a dedicated serial queue and always published back on
   the main thread; the collection view animates differences only while the view is appeared.
4. Pagination is forward-only via an opaque `nextCursor`; the next page is requested when the cell
   three from the end is about to display and `hasNext` is true. Results are de-duplicated
   (`filterDuplicates()`) before being appended.
5. A notification tap always resolves through `DeepLinkParser.discover(notification:)` — the screen
   opened (or error banner shown) is determined solely by the parser result, never by the cell.
6. A per-account filter toggle is optimistic-with-rollback: on API failure the switch is reverted by
   re-binding `AccountNameSwitchViewModel`; the OS push toggle is never changed in-app — it only
   deep-links to iOS Settings.

## Behavioral Examples

### Scenario: Opening an ASA notification routes to opt-in discovery
- **Given** the user is on the Notifications list and the feed contains a message whose deep link
  targets an asset the account has not opted into
- **When** the user taps the notification
- **Then** `analytics.track(.openNotification(...))` fires, `DeepLinkParser.discover` returns
  `.asaDiscoveryWithOptInAction`, the asset is fetched if not already cached, and the ASA Discovery
  screen is presented with `quickAction: .optIn`

### Scenario: Paginating the feed
- **Given** the feed has loaded a page and `nextCursor` is non-nil
- **When** the cell three from the end is about to display
- **Then** `loadNextPageIfNeeded` requests the next page, de-duplicates the results, appends them,
  and applies an updated diffable snapshot

### Scenario: Disabling notifications for one account
- **Given** the user is on the Notification Filter screen with at least one account
- **When** the user flips an account's switch off
- **Then** a loading indicator shows, `ALGAPI.updateNotificationFilter` is called, on success the
  local account's `receivesNotification` is updated and `.changeNotificationFilter` is tracked, and
  on failure an error banner shows and the switch is reverted

## Error Cases

| Condition | Behavior |
|-----------|----------|
| No device id available when loading the feed | No-content snapshot delivered (empty-state view); feed reloads later when `.DeviceIDDidSet` fires (`// TODO: should deliver error snapshot`) |
| `getNotifications` request fails | No-content snapshot delivered (empty-state view); user can pull-to-refresh / "try again" |
| Feed returns zero results | No-content snapshot delivered: "img-nc-empty" image, `notifications-empty-title`, `notifications-empty-subtitle` |
| Deep link targets a watch account opt-in | Error banner: `notifications-trying-to-opt-in-for-watch-account-*` |
| Deep link targets a no-auth local account opt-in | Error banner: title `notifications-trying-to-opt-in-for-watch-account-title`, body `action-not-available-for-account-type` |
| Asset has a pending opt-in / opt-out request | Error banner: `ongoing-opt-in-request-description` / `ongoing-opt-out-request-description` (formatted with account name) |
| Deep-linked account not found | Error banner: `notifications-account-not-found-*` |
| Deep-linked asset not found | Error banner: `notifications-asset-not-found-*` |
| ASA opt-in asset list fetch returns empty / fails | Error banner: `asset-confirmation-not-found` / `asset-confirmation-not-fetched` |
| Transaction-detail deep link fails to load | Falls back to opening the account detail screen |
| Per-account filter update fails | `loadingController` stops, error banner (`HIPAPIError.fallbackMessage` or `title-generic-error`), switch reverted |
| User flips the OS push toggle | No in-app change; alert offers to open iOS Settings (`settings-notification-*-go-settings-*`) |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core | `ALGAPI` (getNotifications, updateNotificationStatus, fetchNotificationStatus, updateNotificationFilter, fetchAssetList), `Session`, `NotificationMessage`, `Account` / `AccountHandle`, `SharedDataController`, `Asset` / `AssetDecoration` / `StandardAsset` / `CollectibleAsset` |
| DeepLinkParser | Resolves a tapped notification into a navigation `Screen` or routing error |
| Screen / BaseViewController routing | `open(_:by:)` push/present navigation to ASA discovery, ASA detail, collectible detail, transaction detail, asset inbox, account detail, external in-app browser; `launchController.receive(deeplinkWithSource:)` for external deep links |
| TransactionDetailLocalDataController | Loads a transaction before opening transaction detail from a notification |
| MagpieCore / MagpieHipo / MagpieExceptions | API request/response and `HIPAPIError` handling |
| MacaroonUIKit / MacaroonURLImage / MacaroonUtils | Diffable collection-view UI, view models, `NoContentViewModel`, async helpers |
| Prism / SwiftDate | Remote notification-icon URLs and relative timestamp formatting |
| UNUserNotificationCenter | Reads OS push authorization status for the filter screen |
| analytics | `openNotification`, `changeNotificationFilter` events |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
