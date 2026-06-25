---
module: PeraWallet_Scenes
version: 1
status: active
files:
  - PeraWallet/Scenes/Add Account/AddAccountCompatibilityController.swift
  - PeraWallet/Scenes/Add Account/AddAccountConstructor.swift
  - PeraWallet/Scenes/Add Account/AddAccountModel.swift
  - PeraWallet/Scenes/Add Account/AddAccountView.swift
  - PeraWallet/Scenes/Add Account/AddAccountViewController.swift
  - PeraWallet/Scenes/Add Account/Views/AddAccountExpandListRow.swift
  - PeraWallet/Scenes/Add Account/Views/CreateJointAccountOverlay.swift
  - PeraWallet/Scenes/Add Account/Views/RoundedMenuRow.swift
  - PeraWallet/Scenes/Create Joint Account/Data Types/AddedAccountData.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Accounts List/CreateJointAccountAccountsListConstructor.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Accounts List/CreateJointAccountAccountsListModel.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Accounts List/CreateJointAccountAccountsListView.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Add Account/CreateJointAccountAddAccountConstructor.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Add Account/CreateJointAccountAddAccountModel.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Add Account/CreateJointAccountAddAccountView.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Edit Account/CreateJointAccountEditAccountConstructor.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Edit Account/CreateJointAccountEditAccountModel.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Edit Account/CreateJointAccountEditAccountView.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Name Account/CreateJointAccountNameAccountConstructor.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Name Account/CreateJointAccountNameAccountModel.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Name Account/CreateJointAccountNameAccountView.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Name Account/CreateJointAccountNameAccountViewModel.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Set Threshold/CreateJointAccountSetThresholdConstructor.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Set Threshold/CreateJointAccountSetThresholdModel.swift
  - PeraWallet/Scenes/Create Joint Account/Scenes/Set Threshold/CreateJointAccountSetThresholdView.swift
  - PeraWallet/Scenes/Create Joint Account/Views/CreationConfirmationSheet.swift
  - PeraWallet/Scenes/Home/Views/InboxButton.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/InboxConstructor.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/InboxModel.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/InboxNoContentViewModel.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/Views/InboxJointAccountCoreRow.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/Views/JointAccountInviteInboxRow.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/Views/JointAccountSendRequestInboxCapsule.swift
  - PeraWallet/Scenes/Inbox/Scenes/Inbox List/Views/JointAccountSendRequestInboxRow.swift
  - PeraWallet/Scenes/Inbox/Scenes/Joint Account Invite Confirmation/JointAccountInviteConfirmationOverlay.swift
  - PeraWallet/Scenes/Inbox/Scenes/Joint Account Invite Confirmation/JointAccountInviteConfirmationOverlayCompatibilityController.swift
  - PeraWallet/Scenes/Inbox/Scenes/Joint Account Invite Confirmation/JointAccountInviteConfirmationOverlayConstructor.swift
  - PeraWallet/Scenes/Inbox/Scenes/Joint Account Invite Confirmation/JointAccountInviteConfirmationOverlayModel.swift
  - PeraWallet/Scenes/Inbox/Scenes/Joint Account Invite Confirmation/Views/JointAccountInviteConfirmationOverlayAccountRow.swift
  - PeraWallet/Scenes/Inbox/Scenes/Name Joint Account/NameAddedJointAccountConstructor.swift
  - PeraWallet/Scenes/Inbox/Scenes/Name Joint Account/NameAddedJointAccountHostingController.swift
  - PeraWallet/Scenes/Inbox/Scenes/Name Joint Account/NameAddedJointAccountModel.swift
  - PeraWallet/Scenes/Inbox/Scenes/Name Joint Account/NameAddedJointAccountView.swift
  - PeraWallet/Scenes/Joint Account/Detail/JointAccountDetail.swift
  - PeraWallet/Scenes/Joint Account/Detail/JointAccountDetailCompatibilityController.swift
  - PeraWallet/Scenes/Joint Account/Detail/JointAccountDetailConstructor.swift
  - PeraWallet/Scenes/Joint Account/Detail/JointAccountDetailModel.swift
  - PeraWallet/Scenes/Joint Account/Pending Transaction Overlay/JointAccountPendingTransactionOverlay.swift
  - PeraWallet/Scenes/Joint Account/Pending Transaction Overlay/JointAccountPendingTransactionOverlayConstructor.swift
  - PeraWallet/Scenes/Joint Account/Pending Transaction Overlay/JointAccountPendingTransactionOverlayHostingController.swift
  - PeraWallet/Scenes/Joint Account/Pending Transaction Overlay/JointAccountPendingTransactionOverlayModel.swift
  - PeraWallet/Scenes/Joint Account/Pending Transaction Overlay/JointAccountPendingTransactionOverlayViewController.swift
  - PeraWallet/Scenes/Joint Account/Pending Transaction Overlay/Views/JointAccountPendingTransactionOverlayRow.swift
  - PeraWallet/Scenes/Joint Account/Transaction Request/Summary/JointAccountTransactionRequestSummaryConstructor.swift
  - PeraWallet/Scenes/Joint Account/Transaction Request/Summary/JointAccountTransactionRequestSummaryHostingViewController.swift
  - PeraWallet/Scenes/Joint Account/Transaction Request/Summary/JointAccountTransactionRequestSummaryView.swift
  - PeraWallet/Scenes/Joint Account/Transaction Request/Summary/JointAccountTransactionRequestSummaryViewController.swift
  - PeraWallet/Scenes/Joint Account/Transaction Request/Summary/JointAccountTransactionRequestSummaryViewModel.swift
  - PeraWallet/Scenes/Joint Account/Transaction Request/Summary/TransactionViewModel.swift
  - PeraWallet/Scenes/Recovered Accounts List/RecoveredAccountsListConstructor.swift
  - PeraWallet/Scenes/Recovered Accounts List/RecoveredAccountsListModel.swift
  - PeraWallet/Scenes/Recovered Accounts List/RecoveredAccountsListView.swift
  - PeraWallet/Scenes/Recovered Accounts List/RecoveredAccountsListViewController.swift
  - PeraWallet/Scenes/Recovered Accounts List/Views/Checkbox.swift
  - PeraWallet/Scenes/Recovered Accounts List/Views/FormButton.swift
  - PeraWallet/Scenes/Recovered Accounts List/Views/RecoveredAccountsListCell.swift
  - PeraWallet/Scenes/Settings/DeveloperMenu/DeveloperMenuListView.swift
  - PeraWallet/Scenes/Settings/DeveloperMenu/DeveloperMenuModel.swift
  - PeraWallet/Scenes/Settings/DeveloperMenu/Views/DeveloperMenuListNavigationCell.swift
  - PeraWallet/Scenes/Settings/DeveloperMenu/Views/DeveloperMenuListToggleCell.swift
  - PeraWallet/Scenes/Settings/DeveloperMenu/Views/RemoteConfigListCell.swift
  - PeraWallet/Scenes/Settings/DeveloperMenu/Views/RemoteConfigListView.swift
  - PeraWallet/Scenes/Settings/Settings List/SettingsListCompatibilityController.swift
  - PeraWallet/Scenes/Settings/Settings List/SettingsListConstructor.swift
  - PeraWallet/Scenes/Settings/Settings List/SettingsListModel.swift
  - PeraWallet/Scenes/Settings/Settings List/SettingsListView.swift
  - PeraWallet/Scenes/Settings/Settings List/SettingsListViewController.swift
  - PeraWallet/Scenes/Settings/Settings List/Views/ListSectionHeader.swift
  - PeraWallet/Scenes/Settings/Settings List/Views/SettingsListCell.swift
  - PeraWallet/Scenes/SwapV2/Formatters/SwapAmountFormatter.swift
  - PeraWallet/Scenes/SwapV2/Models/NoAccountViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/PercentageValue.swift
  - PeraWallet/Scenes/SwapV2/Models/ProviderSelectionViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/ProviderSheetViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/SlippageValue.swift
  - PeraWallet/Scenes/SwapV2/Models/SwapConfirmViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/SwapHistoryViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/SwapSettingsViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/SwapSharedViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/SwapTopPairViewModel.swift
  - PeraWallet/Scenes/SwapV2/Models/TextFieldType.swift
  - PeraWallet/Scenes/SwapV2/Services/SwapCurrencyService.swift
  - PeraWallet/Scenes/SwapV2/Services/SwapPricingService.swift
  - PeraWallet/Scenes/SwapV2/SwapViewController.swift
  - PeraWallet/Scenes/SwapV2/Views/AssetSelectionView.swift
  - PeraWallet/Scenes/SwapV2/Views/BottomSheets/ConfirmSwapInfoSheet.swift
  - PeraWallet/Scenes/SwapV2/Views/BottomSheets/ProviderSheet.swift
  - PeraWallet/Scenes/SwapV2/Views/BottomSheets/SwapHistorySheet.swift
  - PeraWallet/Scenes/SwapV2/Views/BottomSheets/SwapSettingsSheet.swift
  - PeraWallet/Scenes/SwapV2/Views/Buttons/AccountSelectionButton.swift
  - PeraWallet/Scenes/SwapV2/Views/Buttons/AssetSwapButton.swift
  - PeraWallet/Scenes/SwapV2/Views/Buttons/ConfirmSlideButton.swift
  - PeraWallet/Scenes/SwapV2/Views/Buttons/SettingsSwapButton.swift
  - PeraWallet/Scenes/SwapV2/Views/Buttons/SwapButton.swift
  - PeraWallet/Scenes/SwapV2/Views/Buttons/SwitchSwapButton.swift
  - PeraWallet/Scenes/SwapV2/Views/ConfirmSwapView.swift
  - PeraWallet/Scenes/SwapV2/Views/NoAccountSwapView.swift
  - PeraWallet/Scenes/SwapV2/Views/ProviderSelectionView.swift
  - PeraWallet/Scenes/SwapV2/Views/SheetTitleView.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapHistoryListItem.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapHistoryListView.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapLogosView.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapSettingsHListItem.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapSettingsTextField.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapSettingsToogle.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapTitleView.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapTopPairsListView.swift
  - PeraWallet/Scenes/SwapV2/Views/SwapView.swift
db_tables: []
depends_on: []
---

# PeraWallet_Scenes

## Purpose

App-target UI/feature module (`PeraWallet/Scenes`) housing several user-facing
SwiftUI screens and their flows in the Pera Wallet iOS app. It owns:

- **Add Account** — the entry menu offering Add Account / Add Joint Account
  (feature-flagged) / Import Wallet / Watch Account / Create Universal Wallet /
  Create Algo25 Wallet, with an expand/collapse list and terms-and-conditions
  footer. Available options depend on whether the user already has HD wallets.
- **Create Joint Account** — a multi-step wizard (Accounts List → Add Account →
  Edit Account → Name Account → Set Threshold) to assemble participants and an
  M-of-N signing threshold for a multisig ("joint") account.
- **Inbox** — a list of pending items: joint-account import invitations,
  joint-account transaction sign requests, and incoming ASA (asset) inbox
  requests; with read/unread tracking and an invite-confirmation overlay.
- **Joint Account** — read-only Detail (participants + threshold), the Pending
  Transaction Overlay (signature progress), and the Transaction Request Summary
  (review, sign-with-Ledger, copy address, view per-signer status).
- **Recovered Accounts List** — post-recovery screen letting the user select
  rekeyed accounts to add after authentication.
- **Settings** — the Settings list (Account / App Preferences / Support
  sections) and the Developer menu (feature-flag and remote-config toggles).
- **SwapV2** — the asset swap screen: account/asset selection, quote fetching,
  provider selection, slippage settings, swap history/top-pairs, and confirm
  (including Ledger-signed) swaps.

Screens follow an MVVM + Constructor pattern: a SwiftUI `*View` is driven by an
`ObservableObject` `*ViewModel` (published presentation state) owned by a
`*Model` (business logic, behind a `*Modelable` protocol); a `*Constructor`
assembles dependencies; and a `*CompatibilityController` / `*HostingController`
bridges the SwiftUI screen into the legacy UIKit `BaseViewController` +
`ViewControllerConfiguration` navigation stack. Internal-by-default; see Public
API for any cross-module-public surface.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. SwiftUI screens never own navigation or signing directly: a `*View` raises
   intents through closures/`@Published var action`, which the bridging
   `*ViewController` / `*CompatibilityController` translates into legacy
   `open(_:by:)` / `present` calls on `ViewControllerConfiguration`.
3. `*ViewModel` mutable state is updated only on the main actor (models hop via
   `Task { @MainActor in … }` / `@MainActor` methods), and `*ViewModel`
   published setters are `fileprivate(set)`/`private(set)` so only the owning
   `*Model` mutates them.
4. The Add Account menu composition is gated on session/feature state: the Add
   Joint Account row appears only when `featureFlagService.isEnabled(.jointAccountEnabled)`,
   and Add-vs-Create-Universal-Wallet depends on whether the authenticated user
   already has HD wallets.
5. Joint-account transactions are only signable by a locally held participant
   that has not yet responded; the threshold (M-of-N) and per-participant
   signature status drive both the Inbox sign-request state and the Transaction
   Request Summary signing affordances.

## Behavioral Examples

### Scenario: Creating a joint account threshold
- **Given** the user has assembled N participant addresses in the Create Joint
  Account wizard
- **When** they reach the Set Threshold step and tap continue
- **Then** `CreateJointAccountSetThresholdModel.requestData()` emits
  `.moveNext(participantAddresses:threshold:)` (default threshold 2) and the
  flow advances to naming the account

### Scenario: Acting on a joint-account sign request from the Inbox
- **Given** the Inbox lists a pending joint-account sign request
- **When** the user taps it
- **Then** `InboxModel.handleSendRequestAction` routes to
  `.moveToRequestSendScene` if a locally held, not-yet-signed participant is
  required, otherwise to `.presentPendingTransactionOverlay` (e.g. the request
  already failed or no further local signature is required)

### Scenario: Confirming a swap
- **Given** a valid account, asset-in, asset-out and a fetched best quote on the
  SwapV2 screen
- **When** the user completes the confirm-slide
- **Then** `SwapViewController` builds an `ALGSwapController`, prepares
  transactions; if the account requires Ledger it opens the sign-with-Ledger
  confirmation, otherwise it signs directly, and on success shows a banner and
  resets the screen, recording `lastAddressUsedInSwapCompleted`

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Joint-account detail fetch fails | `JointAccountDetailModel` sets `.unableToFetchData`; an error banner is shown via `legacyBannerController` |
| Sign-request metadata missing signer/threshold/deadline | Transaction Request Summary throws `SendTransactionPreviewScreen.InternalError.noSigner` and shows an error banner |
| Inbox import/sign-request markdown fails to parse | Row is dropped; `viewModel.errorMessage` set to `.unableToParseImportRequest` / `.unableToParseSendRequest` |
| Ignoring a joint-account invitation fails | `InboxModel.ignoreJointAccountInvitation` returns `false` and sets `.unableToIgnoreTransaction` |
| Swap quote / amount / history / top-pairs request fails | `SwapViewController` presents an error banner (`error.prettyDescription`) and clears the affected list / loading state |
| Swap transaction fails (blockchain/network/signing) or cancelled | Failure is logged via the swap coordinator, transactions cleared, and `swapConfirmationState` set to `.error`/`.idle` |
| Ledger pairing/connection issue during signing | Ledger overlay dismissed and a "pairing issue" bottom warning is shown |
| Recovered accounts: no authenticated user / account not found | `RecoveredAccountsListModel` sets `.noAuthenticatedUser` / `.noAccountFound` and shows a default error banner |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core (PeraWalletCore) | `Account`, `Asset`/`AssetItem`, `AccountsServiceable`, `InboxServiceable`, `SignRequestObject` & joint-account models, `FeatureFlagServicing`, `PeraCoreManager`, formatters/providers |
| ViewControllerConfiguration / BaseViewController | Legacy app navigation host, session, shared data controller, banner/loading/toast controllers, analytics, API |
| SwapAssetFlowCoordinator / ALGSwapController | Swap quotes, providers, history, transaction preparation and signing |
| TransactionController & Ledger screens | Joint-account & swap transaction signing, Ledger connection/sign-with-Ledger overlays |
| MacaroonUIKit / SnapKit | Layout and UI primitives in UIKit bridge controllers |
| SwiftUI / Combine | Screen rendering and `ObservableObject` state binding |
| PeraUserDefaults | Persisted prefs (last swap account, local-currency-in-swap, watched inbox messages, new-account animation) |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
