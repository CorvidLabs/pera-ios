---
module: PeraWallet_Classes_TransferAssetBalance
version: 1
status: active
files:
  - PeraWallet/Classes/TransferAssetBalance/TransferAssetBalanceDraft.swift
  - PeraWallet/Classes/TransferAssetBalance/TransferAssetBalanceScreen.swift
  - PeraWallet/Classes/TransferAssetBalance/TransferAssetBalanceScreenTheme.swift
  - PeraWallet/Classes/TransferAssetBalance/TransferAssetBalanceViewModel.swift
  - PeraWallet/Classes/TransferAssetBalance/Views/TransferAssetBalanceNameView/TransferAssetBalanceNameViewModel.swift
  - PeraWallet/Classes/TransferAssetBalance/Views/TransferAssetBalanceNameView/TransferAssetBalanceNameViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_TransferAssetBalance

## Purpose

App-target UI/feature module (`PeraWallet/Classes/TransferAssetBalance`). Internal-by-default; see Public API for any cross-module-public surface.

This module presents a single confirmation bottom sheet — `TransferAssetBalanceScreen` — shown when a user tries to opt out of (remove) an Algorand asset or collectible that still holds a non-zero balance on the chosen account. Algorand requires an asset balance to be zero before its asset slot can be closed, so the screen warns the user that they still hold a balance and offers two choices: transfer the remaining balance away first ("Transfer balance") or keep the asset ("Keep").

The screen is a `ScrollScreen` conforming to `BottomSheetScrollPresentable` (compressed modal height). It renders:
- A `PrimaryTitleView` titled by `TransferAssetBalanceNameViewModel` (asset name, unit name, and a verification-tier accessory icon: trusted/verified/suspicious).
- An asset-ID row (`SecondaryListItemView`) with a copy-to-clipboard accessory.
- An account row (`SecondaryListItemView`) showing the holding account.
- A warning description body sourced from the `asset-remove-warning` localized string.
- Two footer buttons: a primary "Transfer balance" approve action and a secondary "Keep" close action, over a linear-gradient footer background.

The screen is data-only and stateless: it receives a `TransferAssetBalanceDraft` (`account` + `asset`) and reports the user's choice back to its caller via an `EventHandler` emitting `.performApprove` or `.performClose`. Ownership boundary: this module owns the confirmation UI and its view models/theme only; the actual opt-out / balance-transfer flow logic lives in the callers — e.g. `OptOutAssetCoordinator`, `ASADiscoveryScreen`, `ManageAssetListViewController`, `CollectibleDetailViewController` — which construct the draft, route to the screen via `Screen.transferAssetBalance` / `Router`, and act on the emitted event.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. The screen is presentation-only: it never mutates account state, submits transactions, or performs the opt-out itself. It only emits `.performApprove` (transfer balance) or `.performClose` (keep) back to the caller's `EventHandler`.
3. Every presentation requires a fully populated `TransferAssetBalanceDraft` (non-optional `account` and `asset`); the title, asset-ID row, account row, and warning copy are all derived from that draft.
4. Title and warning copy branch on asset kind: collectibles (`asset is CollectibleAsset`, via `isTransferingCollectibleAssetBalance`) use the collectible opt-out title; fungible assets use the asset-remove confirmation title. Missing names fall back to the localized `title-unknown`.
5. Tapping the asset-ID accessory copies the asset ID to the clipboard via `CopyToClipboardController` and does not dismiss the sheet or change navigation state.

## Behavioral Examples

### Scenario: Opting out of a fungible asset that still has a balance
- **Given** an account holds a non-zero balance of a fungible asset and the user triggers removal/opt-out (e.g. from `ManageAssetListViewController` or `ASADiscoveryScreen`)
- **When** the caller builds a `TransferAssetBalanceDraft(account:asset:)` and presents `TransferAssetBalanceScreen` as a bottom sheet
- **Then** the sheet shows the asset name with its verification accessory, the asset ID (copyable), the holding account, and the `asset-remove-warning` text, with a primary "Transfer balance" and secondary "Keep" button

### Scenario: User chooses to transfer the remaining balance
- **Given** the `TransferAssetBalanceScreen` is presented
- **When** the user taps the primary "Transfer balance" button
- **Then** the screen emits `.performApprove`, and the caller (e.g. `OptOutAssetCoordinator` / `ASADiscoveryScreen.continueToTransferAssetBalance`) proceeds to the send/transfer flow for the asset and account

### Scenario: User keeps the asset
- **Given** the `TransferAssetBalanceScreen` is presented
- **When** the user taps the secondary "Keep" button
- **Then** the screen emits `.performClose` and the caller cancels/dismisses the transfer-balance flow, leaving the asset opted in

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Asset has no display name | Title and warning fall back to localized `title-unknown` for the asset name |
| Asset has no unit name (collectible title) | Collectible title falls back to `title-unknown` for the unit name |
| Asset is destroyed (`isDestroyed`) | Title prepends the localized `title-deleted-with-parantheses` marker in the negative color |
| Asset is suspicious (`verificationTier.isSuspicious`) | Title is colored with `Colors.Helpers.negative` and a `icon-suspicious` accessory is shown |
| User taps asset-ID accessory | Asset ID is copied to clipboard; no navigation change |
| Decision outcome | Reported to caller as `.performApprove` / `.performClose`; this module performs no transaction or opt-out itself |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core (PeraWalletCore) | `Account`, `Asset`, `CollectibleAsset`, `AssetDecoration`, verification tiers; `ALGAPI` for the screen's API context |
| MacaroonUIKit | `ViewModel`, `StyleSheet`/`LayoutSheet`, `Button`, `Label`, `TextProvider`, theming primitives |
| MacaroonBottomSheet | `BottomSheetScrollPresentable` bottom-sheet presentation |
| Shared UI components | `PrimaryTitleView`, `SecondaryListItemView` + `AssetIDSecondaryListItemViewModel` / `AccountSecondaryListItemViewModel`, `OptOutAssetNameViewModel` |
| Routing (`Screen` / `Router`) | `Screen.transferAssetBalance(draft:theme:eventHandler:)` case and its `Router` instantiation |
| CopyToClipboardController | Copying the asset ID to the clipboard from the asset-ID row accessory |
| Callers | `OptOutAssetCoordinator`, `ASADiscoveryScreen`, `ManageAssetListViewController`, `CollectibleDetailViewController` build the draft and consume the events |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
