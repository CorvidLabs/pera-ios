# PeraWallet_Classes_SharedUI — Context

## Overview

`PeraWallet/Classes/SharedUI` is the app target's pool of reusable, feature-agnostic
UI building blocks. It contains three full-screen "state" controllers (loading,
error, success) and a set of small composable views, all consumed by feature
modules (Swap, Incoming ASA, Account Import/Recover, Secure Backup, etc.) via the
app `Router`. The authoritative contract is `PeraWallet_Classes_SharedUI.spec.md`.

## Key files

State screens (each: `*Screen.swift` + `*ScreenViewModel.swift` (protocol) + `*ScreenTheme.swift`):
- `Screens/LoadingScreen/` — `LoadingScreen` (`BaseViewController`), Lottie-animated busy state; emits `willStartLoading` / `didStartLoading` / `didStopLoading`.
- `Screens/ErrorScreen/` — `ErrorScreen` (`BaseScrollViewController`), icon + title + detail + primary/secondary actions; emits `didTapPrimaryAction` / `didTapSecondaryAction`. View-model extension builds a swap-failure title from a `SwapQuote`.
- `Screens/SuccessResultScreen/` — `SuccessResultScreen` (`BaseViewController`), success icon + title + detail + "view detail" link + "done" action; emits `didTapViewDetailAction` / `didTapDoneAction`. File header still names it `IncomingASAsDetailSuccessScreen` (origin before it was generalized).

Reusable views:
- `Views/Header/InfoBox/InfoBoxHeaderView` — list-header banner (`InfoBoxView`) + body label, with `calculatePreferredSize`.
- `Views/Text/ShowMore/ShowMoreView` — expand/collapse truncated body text using `ALGActiveLabel`; detects/forwards tapped URLs via `ShowMoreViewDelegate`.
- `Views/Text/RightAccessorizedLabel/` — label with a trailing image accessory (style/model split).
- `Views/NavigationPrimaryTitle/` — large nav-bar primary-title item (view-model + theme only).
- `Views/List/UIViewControllerCollectionCell/` — collection cell that hosts an arbitrary `contextView` (a child VC's view), used for paged/carousel content.
- `CircleIconView.swift` — auto-circular icon container with adjustable padding (`@MainActor` properties, programmatic Auto Layout).

## Architectural decisions

- **MVVM + theme split.** Every screen/view pairs a `View`/controller with a
  `*ViewModel` (protocol supplying `TextProvider` content) and a `*Theme`
  (styling/spacing). Controllers stay declarative: `prepareLayout` builds the
  view tree, `bindData` loads view-model content.
- **Event-out, no in-view navigation.** Screens never navigate. They expose a
  nested `Event` enum and an `eventHandler` closure; the presenting coordinator
  owns flow control. This keeps the screens reusable across features.
- **Non-dismissible state screens.** Loading/error/success screens block user
  dismissal (modal-in-presentation, hidden back button, disabled pop gesture)
  so the owning flow controls when they go away.
- **Routing via `Router`/`Screen`.** Instances are created through the app's
  `Screen` enum cases and presented by `Router`, not constructed inline by
  callers.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
