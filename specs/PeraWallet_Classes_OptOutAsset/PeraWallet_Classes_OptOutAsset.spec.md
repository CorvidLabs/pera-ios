---
module: PeraWallet_Classes_OptOutAsset
version: 1
status: active
files:
  - PeraWallet/Classes/OptOutAsset/OptOutAssetDraft.swift
  - PeraWallet/Classes/OptOutAsset/OptOutAssetScreen.swift
  - PeraWallet/Classes/OptOutAsset/OptOutAssetScreenTheme.swift
  - PeraWallet/Classes/OptOutAsset/OptOutAssetViewModel.swift
  - PeraWallet/Classes/OptOutAsset/Views/OptOutAssetNameView/OptOutAssetNameViewModel.swift
  - PeraWallet/Classes/OptOutAsset/Views/OptOutAssetNameView/OptOutAssetNameViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_OptOutAsset

## Purpose

App-target UI module (`PeraWallet/Classes/OptOutAsset`) that renders the
**opt-out confirmation bottom sheet** shown before a user removes a standard
asset (ASA) or a collectible (NFT) from one of their accounts. The single
screen (`OptOutAssetScreen`) is a compressed-height `ScrollScreen` /
`BottomSheetScrollPresentable` that summarizes the pending opt-out: the asset
name/verification badge (`OptOutAssetNameView`), the asset ID (copyable), the
owning account, and the flat transaction fee
(`Transaction.Constant.minimumFee`), plus a contextual warning description and
two actions (approve / close).

The screen is purely presentational and data-driven by `OptOutAssetDraft`
(an `Account` + an `Asset`). It emits two events — `.performApprove` and
`.performClose` — back to its caller and performs no transaction work itself.
All real opt-out orchestration (zero-balance vs. transfer-first routing,
transaction composition, Ledger/joint-account signing, blockchain-update
monitoring, error banners) lives in `OptOutAssetCoordinator`
(`Shared/View Coordinators`), which is the consumer of this module's screen.
The screen is reachable via `Screen.optOutAsset(...)` from contexts such as
asset detail / discovery, the collectible detail screen, and the Manage Assets
list.

Ownership boundary: this module owns only the confirmation sheet and its view
models/themes. The opt-out business logic, transaction signing, and the
"transfer balance first" alternative flow are owned by the coordinator and
`PeraWalletCore` (`pera_wallet_core`) services, not by this module.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. The screen is presentation-only: it never composes, signs, or submits a
   transaction. It emits exactly two events (`.performApprove`,
   `.performClose`) and defers all opt-out work to its caller
   (`OptOutAssetCoordinator`).
3. All displayed content is derived from the immutable `OptOutAssetDraft`
   (`account`, `asset`, and the fixed `transactionFee` =
   `Transaction.Constant.minimumFee`). The fee is always the network minimum,
   not a computed value.
4. Copy/wording is asset-type aware: when `draft.isOptingOutCollectibleAsset`
   is true (the asset is a `CollectibleAsset`) the title, description, approve,
   and close labels use the collectible "opt-out" strings; otherwise they use
   the standard asset "remove" strings.
5. Tapping the asset-ID accessory copies the asset ID to the clipboard via
   `CopyToClipboardController` and never navigates away.

## Behavioral Examples

### Scenario: Confirming removal of a zero-balance standard asset
- **Given** a user holds an ASA with a zero balance in an account and triggers opt-out
- **When** `OptOutAssetCoordinator.optOut(asset:account:)` runs and the asset `isEmpty`
- **Then** an `OptOutAssetScreen` is presented as a bottom sheet titled with the
  "asset-remove-confirmation-title" string, showing the asset name, asset ID,
  account, and minimum fee, with a "Remove" approve button and a "Keep" close button
- **And** tapping Remove emits `.performApprove`, the sheet dismisses, and the
  coordinator continues to compose and sign the opt-out transaction

### Scenario: Confirming opt-out of a collectible (NFT)
- **Given** the asset being removed is a `CollectibleAsset`
- **When** the screen binds its view model (`draft.isOptingOutCollectibleAsset == true`)
- **Then** the title uses "collectible-detail-opt-out-alert-title" with the unit name,
  the description uses the collectible opt-out message, and the actions read
  "Opt-out" (approve) and "Cancel" (close)

### Scenario: Asset still holds a balance
- **Given** the asset is not empty when opt-out is requested
- **When** the coordinator evaluates `asset.isEmpty` as false
- **Then** the `OptOutAssetScreen` is NOT shown; instead a `TransferAssetBalance`
  screen is presented so the user transfers the remaining balance before opting out

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Account cannot sign / asset has no creator | `isAssetOptOutable` returns false in the coordinator; opt-out is not initiated and the confirmation sheet is not advanced to signing |
| User taps close ("Keep"/"Cancel") | `.performClose` is emitted; the sheet is dismissed with no transaction |
| Opting out from the asset's own creator account | Coordinator shows an error banner using "asset-creator-opt-out-error-message" |
| Transaction below minimum amount | Coordinator shows "asset-min-transaction-error-title"/message with the formatted minimum amount |
| Ledger connection failure during signing | Ledger connection screen dismissed; "ledger pairing issue" warning is shown |
| Transaction composition / network failure (`HIPTransactionError`) | Opt-out monitoring is cancelled, state is cleared, and an error banner is presented |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core (PeraWalletCore) | `Account`, `Asset`, `CollectibleAsset`, `Transaction.Constant.minimumFee`, verification tier, naming |
| MacaroonUIKit | `ViewModel`, `StyleSheet`/`LayoutSheet` theming, `PrimaryTitleView`, `SecondaryListItemView`, `Button`, typography/colors |
| MacaroonBottomSheet | `BottomSheetScrollPresentable` for the compressed-height modal presentation |
| OptOutAssetCoordinator (Shared/View Coordinators) | Consumer that presents the screen, handles its events, and drives the opt-out transaction flow |
| Routing (`Screen`/`Router`) | `Screen.optOutAsset(draft:theme:eventHandler:)` case that instantiates `OptOutAssetScreen` |
| CopyToClipboardController | Copies the asset ID when its accessory is tapped |
| Shared list view models | `AssetIDSecondaryListItemViewModel`, `AccountSecondaryListItemViewModel`, `TransactionFeeSecondaryListItemViewModel` |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
