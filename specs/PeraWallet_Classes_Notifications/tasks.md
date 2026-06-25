# PeraWallet_Classes_Notifications — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Deliver a dedicated error snapshot (with retry affordance) instead of a no-content snapshot
      when there is no device id or when `getNotifications` fails — see the `// TODO` markers in
      `NotificationsAPIDataController.load`.
- [ ] Distinguish "API failed" from "genuinely empty feed" in the UI; today both render the same
      empty state.
- [ ] Review thread-safety of `NotificationsAPIDataController.notifications` (mutated in the API
      completion and read on the main thread for `didSelect`); consider isolating reads/writes.
- [ ] Confirm the relative-time labels (`SwiftDate` `.ago`) refresh when the screen reappears.

## Done
- [x] Spec and companion files scaffolded.
- [x] Cursor pagination with de-duplication and forward-only `nextCursor`.
- [x] Deep-link routing for notification taps via `DeepLinkParser` (ASA opt-in/opt-out, ASA detail,
      collectible detail, transaction detail, asset inbox, account detail, external browser/deep link).
- [x] Per-account filter toggle with optimistic update and rollback on failure.
- [x] OS push toggle that deep-links to iOS Settings.
- [x] Last-seen notification tracking and `.newNotificationReceieved` posting.
