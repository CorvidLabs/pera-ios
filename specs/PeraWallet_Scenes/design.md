# PeraWallet_Scenes — Design

## Screens & components

| Area | Screens / components |
|------|----------------------|
| Add Account | `AddAccountView` menu with `AddAccountExpandListRow`, `RoundedMenuRow`, `CreateJointAccountOverlay`; terms & conditions footer |
| Create Joint Account | Wizard views: Accounts List, Add Account, Edit Account, Name Account, Set Threshold; `CreationConfirmationSheet` |
| Inbox | `InboxButton` (Home), inbox list rows (`JointAccountInviteInboxRow`, `JointAccountSendRequestInboxRow`, `JointAccountSendRequestInboxCapsule`, `InboxJointAccountCoreRow`), `JointAccountInviteConfirmationOverlay`, `NameAddedJointAccountView`, no-content state |
| Joint Account | `JointAccountDetail`, `JointAccountPendingTransactionOverlay` (+ row), `JointAccountTransactionRequestSummaryView` (+ `TransactionViewModel`) |
| Recovered Accounts | `RecoveredAccountsListView` with `RecoveredAccountsListCell`, `Checkbox`, `FormButton` |
| Settings | `SettingsListView` (`ListSectionHeader`, `SettingsListCell`); Developer menu (`DeveloperMenuListView`, navigation/toggle cells, `RemoteConfigListView`/cell) |
| SwapV2 | `SwapView`, `ConfirmSwapView`, `NoAccountSwapView`, `ProviderSelectionView`, `AssetSelectionView`; bottom sheets (`ConfirmSwapInfoSheet`, `ProviderSheet`, `SwapHistorySheet`, `SwapSettingsSheet`); buttons (`SwapButton`, `SwitchSwapButton`, `ConfirmSlideButton`, `AccountSelectionButton`, `AssetSwapButton`, `SettingsSwapButton`); `SwapLogosView`, `SwapTitleView`, history/top-pairs list views |

## Navigation hierarchy

- SwiftUI screens are embedded in the legacy UIKit stack via
  `UIHostingController` subclasses (`*ViewController`) and
  `SwiftUICompatibilityBaseViewController` / `*CompatibilityController`.
- Intents flow View → closures / `@Published action` → bridge controller →
  `open(_:by:)` / `present` on `ViewControllerConfiguration`.
- Add Account is the hub into the Create Joint Account wizard, import, watch, and
  wallet-creation legacy flows. The Inbox routes into joint-account import
  confirmation, transaction request summary, pending-transaction overlay, and
  asset detail. Swap presents account/asset selection, provider/settings/history
  sheets, and Ledger overlays.

## Design tokens / assets

- Icons referenced through generated `ImageResource` accessors, e.g.
  `.Icons.walletAdd`, `.Icons.walletUniversal`, `.Icons.group`,
  `.Icons.watchAccount`, and `.Settings.Icon.*` (security, contacts,
  notifications, walletConnect, passkeys, currency, moon, feedback, star, terms,
  developer).
- Account avatars via `AccountIconProvider.iconData(account:)`; contact/user
  placeholders via `ImageType.placeholderUserIconData`.
- Strings via `String(localized:)` / `AttributedString(localizedMarkdown:)`
  (terms, joint-account titles, swap/settings labels).
- Currency/amount formatting via `CurrencyFormatter`, `Formatter.decimalFormatter`,
  and `SwapAmountFormatter`.
- Web links via `AlgorandWeb` (terms, privacy policy, Tinyman swap, Pera
  Explorer).
