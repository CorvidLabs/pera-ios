# PeraWallet_Classes_Notifications — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Run via the Xcode test action (see `BUILDING.md`).
- This module is largely UIKit view-controller/data-controller code with no dedicated unit tests at
  the time of writing; the deterministic seams worth covering are `NotificationsViewModel`
  (icon/title/time/isRead binding), `NotificationsAPIDataController` pagination/de-duplication, and
  `NotificationFilterDataSource` section/rollback logic.

## Manual QA checklist

Feed:
- [ ] Open the Notifications tab on a fresh device id — loading cells animate, then the feed or
      empty state appears.
- [ ] Pull-to-refresh reloads from the first cursor and clears stale items.
- [ ] Scroll to the bottom — the next page loads (cell three from the end) and no duplicates appear.
- [ ] Unread items are visually distinct from read items (driven by `notificationLatestFetchTimestamp`).
- [ ] Tap each notification type and confirm routing: ASA opt-in discovery, ASA opt-out discovery,
      ASA detail, collectible detail, transaction detail, asset inbox / account detail (watch),
      external in-app browser, external deep link.
- [ ] Receiving a notification while the tab is visible reloads the feed.

Filter:
- [ ] Open the filter (bar button on the feed). Push row shows OS authorization status.
- [ ] Toggling the push row presents the "go to Settings" alert and does not change in-app state.
- [ ] Toggle a per-account switch off/on — loading shows, state persists after leaving and
      returning; analytics `changeNotificationFilter` fires.
- [ ] Returning to the app from background re-reads OS push settings.

## Edge cases

- No device id yet (just signed in / not registered): feed shows empty state, then loads after
  `.DeviceIDDidSet`.
- `getNotifications` failure: empty state shown (not an error state — known gap, see tasks).
- Empty feed: `notifications-empty-title` / `notifications-empty-subtitle` with `img-nc-empty`.
- Per-account filter API failure: error banner and switch reverts to its previous value.
- Watch account / no-auth local account opt-in via notification: appropriate error banner instead
  of navigation.
- Asset / account not found in a deep link: corresponding not-found banner.
- Notification with no icon URL: falls back to `notification-icon-default`.
