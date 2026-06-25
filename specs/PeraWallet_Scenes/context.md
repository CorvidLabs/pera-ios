# PeraWallet_Scenes — Context

## Overview

Architectural context for the `PeraWallet_Scenes` module. The authoritative
contract is `PeraWallet_Scenes.spec.md`; the source files it covers are listed
in that spec's `files:` frontmatter. This is an app-target UI module (internal
access) grouping several SwiftUI feature areas under `PeraWallet/Scenes`.

## Architecture

The module uses an MVVM + Constructor + UIKit-bridge pattern, repeated per
screen:

- `*View.swift` — SwiftUI view; raises user intents via closures or by reading a
  `@Published var action` on its view model. Owns no navigation/signing.
- `*Model.swift` — business logic behind a `*Modelable` protocol, plus a nested
  `*ViewModel: ObservableObject` exposing `@Published`, `fileprivate(set)`
  presentation state. State mutated on the main actor.
- `*Constructor.swift` — factory/DI: wires the model, view, and bridge
  controller; injects services from `pera_wallet_core` (e.g.
  `PeraCoreManager.shared.accounts`) and the legacy `ViewControllerConfiguration`.
- `*CompatibilityController.swift` / `*HostingController.swift` /
  `*ViewController.swift` — `UIHostingController` / `BaseViewController`
  subclasses bridging the SwiftUI screen into the legacy UIKit navigation stack
  and forwarding intents to `open(_:by:)` / `present`.

## Feature areas (key files)

- **Add Account** — `Add Account/AddAccountModel.swift`,
  `AddAccountViewController.swift`, `AddAccountConstructor.swift` (menu
  composition gated on session HD wallets + `jointAccountEnabled` flag).
- **Create Joint Account** — `Create Joint Account/Scenes/*` wizard
  (Accounts List → Add Account → Edit Account → Name Account → Set Threshold).
- **Inbox** — `Inbox/Scenes/Inbox List/InboxModel.swift` (joint-account import &
  sign requests, ASA inbox; read/unread via `PeraUserDefaults`), invite
  confirmation overlay, name-added-joint-account.
- **Joint Account** — `Joint Account/Detail/*`, `Pending Transaction Overlay/*`,
  `Transaction Request/Summary/*` (Ledger signing via `TransactionController`).
- **Recovered Accounts List** — `Recovered Accounts List/RecoveredAccountsListModel.swift`
  (select rekeyed accounts to add).
- **Settings** — `Settings/Settings List/SettingsListModel.swift` (sectioned
  list), `Settings/DeveloperMenu/*` (flags + remote config).
- **SwapV2** — `SwapV2/SwapViewController.swift` (orchestrator),
  `SwapV2/Models/*` view models, `SwapV2/Services/*`, `SwapV2/Views/*` (bottom
  sheets, buttons, confirm slide).

## Architectural decisions

- New screens are written in SwiftUI but presented inside the existing UIKit
  navigation via compatibility/hosting controllers ("legacy" configuration is
  threaded through as `ViewControllerConfiguration`).
- Several models note `// FIXME: Convert ObservableObject to @Observable macro
  when min. target will be updated to iOS 17+`.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
