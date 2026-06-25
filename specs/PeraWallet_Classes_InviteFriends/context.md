# PeraWallet_Classes_InviteFriends — Context

## Overview

Architectural context for the `PeraWallet_Classes_InviteFriends` module. The authoritative
contract is `PeraWallet_Classes_InviteFriends.spec.md`. The module is a single promotional
bottom-sheet screen ("Invite Friends") that lets a user share the app download link.

## Key files

- `PeraWallet/Classes/InviteFriends/InviteFriendsScreen.swift` — the screen itself. A
  `BaseScrollViewController` + `BottomSheetScrollPresentable` that lays out a Lottie share
  animation, title, description, primary Share button, and secondary Close button. Exposes
  `EventHandler` (`(Event) -> Void`) and `Event { share, close }`.
- `PeraWallet/Classes/InviteFriends/InviteFriendsScreenTheme.swift` — `StyleSheet`/
  `LayoutSheet` describing background, paddings, animation size, fonts/colors, and the
  primary/secondary `ButtonTheme`s. Sources copy from localized strings
  (`title-invite-friends`, `invite-screen-description`).

### Callers (outside this module)

- `PeraWallet/Classes/Routing/Screen.swift` — declares the `.inviteFriends(eventHandler:)`
  route case.
- `PeraWallet/Classes/Routing/Router.swift` (~line 2474) — instantiates `InviteFriendsScreen`
  and assigns its `eventHandler`.
- `PeraWallet/Classes/Menu/Screens/MenuViewController.swift` — `openInviteFriends()` presents
  the sheet; `openShare()` builds the `UIActivityViewController` from the `AppDownloadURL`
  Info.plist value and excludes irrelevant activity types. Also tracks the
  `tapInviteFriends` / `tapShareInviteFriends` / `tapCloseInviteFriends` analytics events.

## Architectural decisions

- **MVVM-lite / event closure pattern.** The screen carries no view model and no business
  logic; it surfaces user intent as `Event` values through an `eventHandler` closure. The
  caller owns all side effects (dismiss, share, analytics). This keeps the screen reusable
  and free of routing/analytics dependencies.
- **Theme separation.** Layout and styling live entirely in `InviteFriendsScreenTheme`,
  constructed from `LayoutFamily`, consistent with other Macaroon-based screens.
- **Bottom-sheet presentation** via `MacaroonBottomSheet`, presented without a navigation
  controller.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
