# PeraWallet_Classes_InviteFriends — Design

## Layout & components

Single screen: `InviteFriendsScreen`, presented as a scrollable bottom sheet. Vertical
stack inside a `contextView` (paddings `32 / 20 / 20 / 20`):

1. **Lottie animation** — `LottieImageView` (100×100), centered, plays the "share"
   animation once.
2. **Title** — `UILabel`, single line, centered (`title-invite-friends`), 35pt below the
   animation.
3. **Description** — `UILabel`, up to 2 lines, centered (`invite-screen-description`), 12pt
   below the title, 50pt horizontal inset.
4. **Primary "Share" button** — full-width `Button`, 52pt tall, 55pt below the description;
   emits `Event.share`.
5. **Secondary "Close" button** — full-width `Button`, 52pt tall, 12pt below the primary
   button, 10pt bottom inset; emits `Event.close`.

## Navigation hierarchy

```
MenuViewController
  └─ tap "Invite Friends" (MenuOption.inviteFriends)
       └─ Router .inviteFriends(eventHandler:)  [bottom sheet, no nav controller]
            └─ InviteFriendsScreen
                 ├─ Share → dismiss → UIActivityViewController(app download URL)
                 └─ Close → dismiss
```

## Design tokens

Defined in `InviteFriendsScreenTheme` (`StyleSheet` + `LayoutSheet`):

- **Background:** `Colors.Defaults.background`
- **Title:** `Colors.Text.main`, `Typography.bodyLargeMedium()`, centered, single line
- **Description:** `Colors.Text.gray`, `Typography.bodyRegular()`, centered, 2 lines
- **Primary button:** `ButtonPrimaryTheme()`
- **Secondary button:** `ButtonSecondaryTheme()`
- **Spacing/metrics:** animation 100, anim→title 35, title→desc 12, desc→main button 55,
  main→secondary 12, button height 52, secondary bottom padding 10, description horizontal
  padding 50.

## Assets

- Lottie animation named `"share"` (loaded via `lottieAnimationView.setAnimation("share")`).
- App download URL is read at share time from the `AppDownloadURL` Info.plist key (not an
  asset-catalog reference).
