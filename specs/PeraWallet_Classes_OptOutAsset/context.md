# PeraWallet_Classes_OptOutAsset — Context

## Overview

Architectural context for the `PeraWallet_Classes_OptOutAsset` module. The authoritative contract is `PeraWallet_Classes_OptOutAsset.spec.md`; the source files it covers are listed in that spec's `files:` frontmatter.

This module is the **opt-out confirmation bottom sheet** for removing a standard
asset (ASA) or a collectible (NFT) from an account. It is presentation-only; the
actual opt-out transaction flow is owned by `OptOutAssetCoordinator`.

## Key files

- `OptOutAssetScreen.swift` — the bottom-sheet screen (`ScrollScreen` +
  `BottomSheetScrollPresentable`, `.compressed` height). Lays out title, asset ID,
  account, fee, description, and approve/close buttons; emits
  `Event.performApprove` / `Event.performClose`.
- `OptOutAssetDraft.swift` — immutable input: `account`, `asset`, fixed
  `transactionFee = Transaction.Constant.minimumFee`, and the
  `isOptingOutCollectibleAsset` flag (true when the asset is a `CollectibleAsset`).
- `OptOutAssetViewModel.swift` — binds all visible text/list rows from the draft,
  switching strings between the collectible "opt-out" and standard "remove" wording.
- `Views/OptOutAssetNameView/OptOutAssetNameViewModel.swift` — the title view model:
  asset name, verification-tier badge (trusted/verified/suspicious), favorite icon,
  destroyed-asset "(deleted)" prefix, and unit-name subtitle.
- `OptOutAssetScreenTheme.swift` / `OptOutAssetNameViewTheme.swift` — Macaroon
  `StyleSheet`/`LayoutSheet` themes (colors, typography, spacing, button styles).

## Architectural decisions

- **MVVM, no view controller logic for business rules.** The screen binds a
  `OptOutAssetViewModel` and forwards taps as events; it owns no transaction state.
- **Coordinator-owned flow.** `OptOutAssetCoordinator` (in
  `Shared/View Coordinators`) decides between showing this sheet (zero balance) or a
  transfer-balance screen (non-empty), then composes/signs via `TransactionController`,
  handles Ledger + joint-account signing, and drives `BlockchainUpdatesMonitor`.
- **Routing indirection.** The screen is created through
  `Screen.optOutAsset(draft:theme:eventHandler:)` in `Routing/Screen.swift` and
  instantiated in `Routing/Router.swift`, so callers don't construct it directly.
- **Fixed fee display.** The fee shown is always the network minimum, not computed.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
