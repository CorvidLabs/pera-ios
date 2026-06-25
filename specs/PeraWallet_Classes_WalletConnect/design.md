# PeraWallet_Classes_WalletConnect — Design

## Screens & components

### Connection (bottom sheet)
- `WCSessionConnectionScreen` — `UICollectionView` list (profile header, requested-permissions rows, account rows) over a gradient footer with primary "Connect" / secondary "Cancel" actions. Presented via `BottomSheetPresentable` with a calculated modal height.
  - Cells: `WCSessionConnectionProfileCell` (dApp name/URL/logo, tappable link), `WCSessionRequestedPermissionItemView` (supported methods/events), `WCSessionConnectionAccountCell` (selectable, `.selected`/`.unselected` accessory).
  - Loading: `InAppBrowserLoadingView` cross-dissolves into the list once data loads.

### Sessions
- `WCSessionListViewController` — full list (`WCSessionItemCell` with live status), QR bar button, gradient "Disconnect all" footer, empty state (`NoContentWithActionCell`).
- `WCSessionShortListViewController` — compact variant (`WCSessionShortListItemCell`).
- `WCSessionDetailScreen` — sections: profile (`WCSessionProfileCell`), connection info / status (`WCSessionInfoCell` with check-status), connected accounts (`WCSessionConnectedAccountListItemCell` + header), advanced permissions (`WCSessionAdvancedPermissionCell` + header with info action), optional WC v1 badge (`WCV1SessionBadgeView`); gradient footer with disconnect (and a disabled extend-validity primary action).
- Sheets: `WCSessionConnectionSuccessfulSheet`, `WCTransactionSignSuccessfulSheet`, `WCAdvancedPermissionsInfoSheet`, `ExtendWCSessionValiditySheet`.

### Transaction
- `WCMainTransactionScreen` — host: dApp message header (`WCTransactionDappMessageView`) over a rounded-corner navigation-container fragment.
  - Fragments: `WCSingleTransactionRequestScreen` (single), `WCUnsignedRequestScreen` (multiple/group); arbitrary-data variants `WCSingleArbitraryDataRequestScreen` / `WCUnsignedArbitrayDataRequestScreen`.
  - Per-type detail views: Algos, Asset (+asset info), AssetAddition, AssetConfig (create/reconfigure/delete), AppCall, KeyReg, Group (`WCGroupTransactionView`), ArbitraryData.
  - Supporting: `WCTransactionWarningView`, `WCTransactionFullDappDetailView`, `JSONDisplayView` (raw transaction JSON), `RekeySupportOverlayView`, bottom/scroll overlay fragments.

## Navigation hierarchy

`Router`/`Screen` are the entry points (`.wcConnection`, `.wcMainTransaction`, `.wcSessionDetail`, `.qrScanner`).
- QR scan → `.wcConnection` bottom sheet → approve → session created.
- Settings > WalletConnect → `WCSessionListViewController` → push `WCSessionDetailScreen` → disconnect pops back.
- dApp sign request → `WCMainTransactionScreen` → embedded single/unsigned fragment → optional Ledger sub-flow (`LedgerConnectionScreen` → `SignWithLedgerProcessScreen`) → result sheet/banner.

## Design tokens

- Each view ships a `*Theme` / `*ViewTheme` struct holding Macaroon `Colors`, typography, spacing, and inset tokens (e.g. `Colors.Defaults.background`, action margins, `spacingBetweenActions`, corner radii).
- Footers use a `LinearGradientEffect` / `GradientView` from transparent → `Colors.Defaults.background` so the scrolling list fades under the pinned action buttons.
- Cell sizes are computed through `*ViewModel.calculatePreferredSize(...)` invoked from the corresponding `*Layout` (the module's sole cross-cell public hook).

## Assets

- Icons referenced by name: `icon-info-red`, `icon-info-green`, `icon-info-green-large` (warning sheets), plus QR/bar-button assets from the shared catalog; localized strings via `String(localized:)` keys (e.g. `settings-wallet-connect-title`, `wallet-connect-transaction-warning-initial-*`).
