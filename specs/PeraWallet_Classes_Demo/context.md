# PeraWallet_Classes_Demo — Context

## Overview

App-target module under `PeraWallet/Classes/Demo`. The directory name is legacy;
the contents are core app-launch and Home-tab infrastructure plus shared UI
controllers. The authoritative contract is `PeraWallet_Classes_Demo.spec.md`;
the full source list is its `files:` frontmatter.

## Key files

- **Launch lifecycle / routing**
  - `AppLaunchController.swift` — protocol for the launch state machine.
  - `ALGAppLaunchController.swift` — concrete implementation: auth gating,
    foreground/background handling, polling control, deeplink suspend/resume,
    `ALGAppLaunchStore` (app-open count).
  - `AppLaunchUIHandler.swift` — `launchUI(_:)` state sink (onboarding /
    authorization / main / deeplink / remote-notification states).
- **Home tab** (`Home/`)
  - `Data/HomeDataController.swift` — protocol + section/item identifier enums
    (`HomeSectionIdentifier`, `HomeItemIdentifier`, events).
  - `Data/HomeAPIDataController.swift` — concrete data controller.
  - `Data/HomeListDataSource.swift` — diffable data source wiring.
  - `Models/` — portfolio / no-content view models.
  - `View/` — portfolio, account, loading cells/views + themes.
- **Quick actions** (`QuickActions/`) — `SendTransactionFlowCoordinator`,
  `ReceiveTransactionFlowCoordinator`, `ScanQRFlowCoordinator`.
- **Transaction options** (`TransactionOptions/`) — bottom-sheet view + the
  `*TransactionOptionListItemButtonViewModel` family.
- **Account action buttons** — `*ListItemButtonViewModel` family
  (rekey/rename/remove/copy-address/view-passphrase/mute/ASA-report/...).
- **Shared UI** — `AlertPresenter/`, `ToastUIController/`,
  `CopyToClipboardController/`, `UISheet/`, `UserInterfaceStyleController.swift`,
  `TabBarItems.swift` / `TabBarButtonItem.swift`, `UIBlockInteraction.swift`.

## Architectural decisions

- **MVVM + diffable data source** for the Home list; cells render view models,
  the data controller publishes events that become snapshots.
- **Flow coordinators** (not a global router) drive multi-screen quick-action
  flows. These are explicitly transitional — marked `<todo>` for removal after a
  routing refactor.
- **Single pending-deeplink slot** guarded by `@Atomic`; deeplinks are resolved
  into `AppLaunchUIState` only when the app is `.ready`.
- **Dependency injection via constructors / `AppConfiguration`**; controllers
  hold `unowned`/`weak` references to `Session`, `ALGAPI`,
  `SharedDataController`, etc., from `pera_wallet_core`.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
