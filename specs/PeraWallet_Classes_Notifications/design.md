# PeraWallet_Classes_Notifications — Design

## Layout & components

Two screens, both `BaseViewController` subclasses hosting a `UICollectionView`.

### Notifications list (`List/`)
- `NotificationsView` — container with the collection view and pull-to-refresh; `NotificationsViewTheme`.
- `NotificationCell` / `NotificationView` (`NotificationViewTheme`) — a single row: 40×40 icon
  (circle or notification-specified shape), body text (`bodyRegular`), relative time, and an
  unread indicator.
- Loading state: `NotificationLoadingCell` / `NotificationLoadingView`
  (`NotificationLoadingViewTheme`, `NotificationLoadingViewCommonTheme`) — shimmer placeholders.
- Empty state: rendered via `NotificationsNoContentViewModel` → `NoContentView` with `img-nc-empty`.
- Right bar button: `ALGBarButtonItem(kind: .filter)` opens the filter screen.

### Notification filter (`Filter/`)
- Compositional list (`NotificationFilterListLayout`) with two sections:
  - Section 0 — single push-permission row: `TitledToggleCell` / `TitledToggleView`
    (`TitledToggleViewTheme`), or `TitledToggleLoadingCell` / `TitledToggleLoadingView`
    (`TitledToggleLoadingViewTheme`) while OS settings are being read.
  - Section 1 — one row per account: `AccountNameSwitchCell` / `AccountNameSwitchView`
    (`AccountNameSwitchViewTheme`) bound by `AccountNameSwitchViewModel`.
  - Section header: `ToggleTitleHeaderSupplementaryView` / `ToggleTitleHeaderView`
    (`ToggleTitleHeaderViewTheme`).
- `NotificationFilterViewControllerTheme` provides background/padding.

## Navigation hierarchy

```
Notifications tab
└─ NotificationsViewController (push feed)
   ├─ [bar button] NotificationFilterViewController (present)
   └─ on row tap → DeepLinkParser → one of:
      ├─ ASA Discovery (opt-in / opt-out)      [present]
      ├─ ASA Detail                            [push]
      ├─ Collectible Detail                    [push]
      ├─ Transaction Detail                    [present]
      ├─ Asset Inbox / Account Detail          [push]
      ├─ External In-App Browser               [push]
      └─ External Deep Link                    [launchController]
```

## Design tokens

- Colors, typography (`bodyRegular`), spacing and shapes come from the app's `MacaroonUIKit` theme
  layer; each view has a paired `*Theme` struct (listed above) rather than inline literals.
- Images/assets: `img-nc-empty` (empty state), `notification-icon-default` (icon fallback); remote
  icons are sized to 40×40 via `PrismURL` with a circle/notification-specified `ImageShape`.
- Copy is localized via `String(localized:)` keys (`notifications-title`,
  `notifications-empty-*`, `notifications-trying-to-opt-in-for-watch-account-*`,
  `settings-notification-*-go-settings-*`, etc.).

## Assets

- `img-nc-empty`
- `notification-icon-default`
- Filter / bar-button glyphs supplied by `ALGBarButtonItem(kind: .filter)`.
