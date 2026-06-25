---
module: PeraWallet_Classes_InviteFriends
version: 1
status: active
files:
  - PeraWallet/Classes/InviteFriends/InviteFriendsScreen.swift
  - PeraWallet/Classes/InviteFriends/InviteFriendsScreenTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_InviteFriends

## Purpose

App-target UI/feature module (`PeraWallet/Classes/InviteFriends`) that presents the
"Invite Friends" promotional bottom sheet. The single screen,
`InviteFriendsScreen`, is a `BottomSheetScrollPresentable` `BaseScrollViewController`
that shows a one-time Lottie share animation, a localized title
(`title-invite-friends`) and description (`invite-screen-description`), a primary
**Share** button, and a secondary **Close** button.

The screen is entered from the Menu tab: tapping the "Invite Friends" menu option
(`MenuViewController.openInviteFriends()`) presents this screen as a bottom sheet via
`Router`'s `.inviteFriends` route. The screen itself owns no business logic — it emits
`Event.share` / `Event.close` through its `eventHandler` closure. The caller
(`MenuViewController`) interprets those events: on `.close` it dismisses; on `.share`
it dismisses then opens the system share sheet (`UIActivityViewController`) seeded with
the app's download URL (read from the `AppDownloadURL` Info.plist key). Analytics events
are tracked by the caller, not the screen.

Ownership boundary: this module owns only the presentation (view + theme) and the
`share`/`close` event contract. Navigation, the actual share action, the download URL,
and analytics live outside the module (Menu + Routing).

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. The screen is presentation-only: it never performs navigation, sharing, or analytics
   itself. It communicates exclusively by invoking `eventHandler` with `Event.share` or
   `Event.close`; all side effects are the caller's responsibility.
3. `InviteFriendsScreen.Event` has exactly two cases (`share`, `close`), each wired 1:1 to
   the primary and secondary buttons respectively.
4. Presentation conforms to `BottomSheetScrollPresentable`, so the screen is always shown
   as a bottom sheet (`Router` uses `.presentWithoutNavigationController`), never pushed.
5. The Lottie "share" animation plays once (`loopMode = .playOnce`) on `viewDidAppear` and
   is non-interactive (`isUserInteractionEnabled = false`).

## Behavioral Examples

### Scenario: User shares the app from the Menu
- **Given** the user taps "Invite Friends" in the Menu tab
- **When** the `InviteFriendsScreen` bottom sheet appears and the user taps the **Share** button
- **Then** the screen emits `Event.share`, `MenuViewController` dismisses the sheet, opens
  the system share sheet seeded with the app download URL, and tracks
  `tapShareInviteFriends`

### Scenario: User dismisses the invite sheet
- **Given** the `InviteFriendsScreen` bottom sheet is presented
- **When** the user taps the **Close** button
- **Then** the screen emits `Event.close`, `MenuViewController` dismisses the sheet and
  tracks `tapCloseInviteFriends`; no share sheet is shown

### Scenario: Animation plays on appearance
- **Given** the `InviteFriendsScreen` is presented
- **When** `viewDidAppear` fires
- **Then** the "share" Lottie animation plays exactly once and does not loop or respond to
  touch

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `AppDownloadURL` Info.plist key missing or not a valid `URL` | `openShare()` guard fails and returns silently; the sheet is already dismissed, so no share sheet appears |
| User taps Close instead of Share | Sheet dismisses with no share action; only the close analytics event is tracked |
| `eventHandler` is nil (screen used without a caller wiring it) | Button taps invoke `eventHandler?(...)` as a no-op; nothing happens |

## Dependencies

| Module | Usage |
|--------|-------|
| MacaroonUIKit | `StyleSheet`/`LayoutSheet` theming, `ViewStyle`/`TextStyle`, `Button`, `BaseScrollViewController` base UI |
| MacaroonBottomSheet | `BottomSheetScrollPresentable` conformance for bottom-sheet presentation |
| PeraWallet Routing (`Router`, `Screen`) | `.inviteFriends` route that instantiates the screen and binds its `eventHandler` |
| PeraWallet Menu (`MenuViewController`) | Entry point; presents the screen, handles `share`/`close` events, opens the share sheet, tracks analytics |
| LottieImageView | Plays the bundled "share" animation |
| App design system (`Colors`, `Typography`, `ButtonPrimaryTheme`, `ButtonSecondaryTheme`) | Background, text, and button styling via `InviteFriendsScreenTheme` |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
