---
module: PeraWallet_Classes_Settings
version: 1
status: active
files:
  - PeraWallet/Classes/Settings/Appearance/AppearanceSelectionViewController.swift
  - PeraWallet/Classes/Settings/Appearance/AppearanceSelectionViewController+Theme.swift
  - PeraWallet/Classes/Settings/Common/Selection/ViewModels/SingleSelectionViewModel.swift
  - PeraWallet/Classes/Settings/Common/Selection/Views/SingleSelection/Cell/SingleSelectionCell.swift
  - PeraWallet/Classes/Settings/Common/Selection/Views/SingleSelection/Cell/SingleSelectionView.swift
  - PeraWallet/Classes/Settings/Common/Selection/Views/SingleSelection/Cell/SingleSelectionViewTheme.swift
  - PeraWallet/Classes/Settings/Common/Selection/Views/SingleSelection/List/SingleSelectionListView.swift
  - PeraWallet/Classes/Settings/Common/Selection/Views/SingleSelection/List/SingleSelectionListViewTheme.swift
  - PeraWallet/Classes/Settings/Currency/DataSource/CurrencySelectionDataController.swift
  - PeraWallet/Classes/Settings/Currency/DataSource/CurrencySelectionListAPIDataController.swift
  - PeraWallet/Classes/Settings/Currency/DataSource/CurrencySelectionListDataSource.swift
  - PeraWallet/Classes/Settings/Currency/Layout/CurrencySelectionListLayout.swift
  - PeraWallet/Classes/Settings/Currency/Layout/CurrencySelectionListLayout+Theme.swift
  - PeraWallet/Classes/Settings/Currency/Loading/CurrencySelectionItemLoadingView.swift
  - PeraWallet/Classes/Settings/Currency/Loading/CurrencySelectionItemLoadingViewTheme.swift
  - PeraWallet/Classes/Settings/Currency/Loading/CurrencySelectionLoadingView.swift
  - PeraWallet/Classes/Settings/Currency/Loading/CurrencySelectionLoadingViewCell.swift
  - PeraWallet/Classes/Settings/Currency/Loading/CurrencySelectionLoadingViewTheme.swift
  - PeraWallet/Classes/Settings/Currency/Screens/CurrencySelectionViewController.swift
  - PeraWallet/Classes/Settings/Currency/Screens/CurrencySelectionViewController+Theme.swift
  - PeraWallet/Classes/Settings/Currency/ViewModels/CurrencySelectionNoContentViewModel.swift
  - PeraWallet/Classes/Settings/Currency/ViewModels/CurrencySelectionViewModel.swift
  - PeraWallet/Classes/Settings/Currency/Views/CurrencySelectionCell.swift
  - PeraWallet/Classes/Settings/Currency/Views/CurrencySelectionView.swift
  - PeraWallet/Classes/Settings/Currency/Views/CurrencySelectionViewTheme.swift
  - PeraWallet/Classes/Settings/Developer/Screens/DeveloperSettingsViewController.swift
  - PeraWallet/Classes/Settings/Developer/Screens/DeveloperSettingsViewController+Theme.swift
  - PeraWallet/Classes/Settings/Developer/Views/DeveloperSettingsView.swift
  - PeraWallet/Classes/Settings/Developer/Views/DeveloperSettingsViewTheme.swift
  - PeraWallet/Classes/Settings/DeveloperMenu/Screens/DeveloperMenuViewController.swift
  - PeraWallet/Classes/Settings/List/Screens/WalletRating/WalletRatingViewController.swift
  - PeraWallet/Classes/Settings/List/Screens/WalletRating/WalletRatingViewController+Theme.swift
  - PeraWallet/Classes/Settings/List/ViewModels/SettingsDetailViewModel.swift
  - PeraWallet/Classes/Settings/List/ViewModels/SettingsToggleViewModel.swift
  - PeraWallet/Classes/Settings/List/ViewModels/SingleGrayTitleHeaderViewModel.swift
  - PeraWallet/Classes/Settings/List/Views/Detail/SettingsDetailCell.swift
  - PeraWallet/Classes/Settings/List/Views/Detail/SettingsDetailView.swift
  - PeraWallet/Classes/Settings/List/Views/Detail/SettingsDetailViewTheme.swift
  - PeraWallet/Classes/Settings/List/Views/Footer/SecuritySettingsFooterView.swift
  - PeraWallet/Classes/Settings/List/Views/Header/SingleGrayTitleHeaderSuplementaryView.swift
  - PeraWallet/Classes/Settings/List/Views/Header/SingleGrayTitleHeaderView.swift
  - PeraWallet/Classes/Settings/List/Views/Header/SingleGrayTitleHeaderViewTheme.swift
  - PeraWallet/Classes/Settings/List/Views/Toggle/SettingsToggleCell.swift
  - PeraWallet/Classes/Settings/List/Views/Toggle/SettingsToggleView.swift
  - PeraWallet/Classes/Settings/List/Views/Toggle/SettingsToggleViewTheme.swift
  - PeraWallet/Classes/Settings/List/Views/WalletRating/WalletRatingView.swift
  - PeraWallet/Classes/Settings/List/Views/WalletRating/WalletRatingViewTheme.swift
  - PeraWallet/Classes/Settings/Node/Screens/NodeSettingsViewController.swift
  - PeraWallet/Classes/Settings/Node/Screens/NodeSettingsViewController+Theme.swift
  - PeraWallet/Classes/Settings/Security/Screens/SecuritySettingsViewController.swift
  - PeraWallet/Classes/Settings/Security/Screens/SecuritySettingsViewController+Theme.swift
  - PeraWallet/Classes/Settings/Security/Views/SecuritySettingsView.swift
  - PeraWallet/Classes/Settings/Security/Views/SecuritySettingsViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Settings

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Settings`) that implements the
detail screens reached from the app's Settings tab. Each sub-folder is a
self-contained screen built on `BaseViewController` + a custom view + a `Theme`:

- **Appearance** (`AppearanceSelectionViewController`) — single-select list of
  `UserInterfaceStyle` (`system`/`light`/`dark`); writes the choice to
  `session.userInterfaceStyle` and triggers a live theme update via
  `UserInterfaceStyleController.setNeedsUserInterfaceStyleUpdate`.
- **Currency** (`CurrencySelectionViewController` + `CurrencySelection...DataController`/
  `...DataSource`/`...Layout`) — searchable, async-loaded list of fiat currencies
  (plus a synthesized Algo entry) fetched from `ALGAPI.getCurrencies`; selecting an
  entry sets the preferred currency on the `SharedDataController`/`CurrencyService`,
  restarts polling, fires analytics, and posts `didChangePreferredCurrency`.
- **Security** (`SecuritySettingsViewController`) — toggles for PIN-code
  activation/change, biometric local authentication, and rekey support; PIN and
  biometric changes route into the `choosePassword` flow.
- **Node** (`NodeSettingsViewController`) — switches between MainNet and TestNet:
  re-points `ALGAPI`, re-registers push notifications, resets shared-data polling,
  and syncs joint accounts after the switch (`didUpdateNetwork`).
- **Developer** (`DeveloperSettingsViewController`) + **DeveloperMenu**
  (`DeveloperMenuViewController`, a SwiftUI `UIHostingController`) — network-dependent
  developer tools (node settings, dispenser on TestNet, create Algo25 account,
  recover account, feature-flag dev menu).
- **List** — shared cells/headers/view models (`SettingsDetailCell`,
  `SettingsToggleCell`, `SingleGrayTitleHeader...`) and the `WalletRating` bottom
  sheet that requests an App Store review.
- **Common/Selection** — reusable `SingleSelection` list/cell/view-model used by the
  Appearance and Node screens.

Ownership boundary: this module owns only the Settings detail screens and their
view models/data controllers. Routing enum cases, the settings landing list, the
`choosePassword` flow, networking (`ALGAPI`), and the `SharedDataController` live
outside this module and are consumed via the app target.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. Changing the preferred currency stops shared-data polling, sets the new currency as
   primary on `SharedDataController.currency`, resets polling, and posts
   `CurrencySelectionViewController.didChangePreferredCurrency` exactly once per
   selection. Selecting the already-selected currency only re-binds the checkmark.
3. Switching network rolls back atomically: `ALGAPI` is re-pointed only after push
   re-registration succeeds; on failure the previous network is restored, polling is
   restarted, an error banner is shown, and the selection list reverts to the old node.
4. The Security screen's available rows depend on PIN state — biometric and PIN-change
   rows only appear when `session.hasPassword()` is true; toggling biometrics off
   requires confirming via the `choosePassword` flow before the credential is removed.
5. Appearance selection is applied immediately and persisted to `session.userInterfaceStyle`;
   the list always reflects the persisted style on reload (one and only one row selected).
6. The Developer screen's row set is network-dependent (dispenser appears only on TestNet)
   and the hidden developer menu row appears only when `PeraUserDefaults.shouldShowDevMenu`
   is true.

## Behavioral Examples

### Scenario: Change the preferred currency
- **Given** the Currency Selection screen has loaded the currency list from `ALGAPI`
- **When** the user taps a currency row different from the current selection
- **Then** the data controller marks it selected, `currencyService.selectedCurrency`/
  `isAlgoPrimaryCurrency` are updated, `sharedDataController` stops polling, sets the
  currency as primary, resets polling, a `changeCurrency` analytics event is tracked, and
  `didChangePreferredCurrency` is posted so dependent screens refresh.

### Scenario: Switch from MainNet to TestNet
- **Given** the Node Settings screen shows MainNet selected
- **When** the user taps the TestNet row
- **Then** a loading indicator is shown, `ALGAPI` is re-based to TestNet, push device
  details are re-sent; on success the old device is unregistered, the default node is
  saved, polling resets, `didUpdateNetwork` is posted, joint accounts are re-synced, and
  `PeraCoreManager.shared.network` is updated — and on failure everything reverts to MainNet
  with an error banner.

### Scenario: Disable biometric authentication
- **Given** the Security screen has a password set and biometrics enabled
- **When** the user toggles Local Authentication off
- **Then** the `choosePassword(.confirm(.settings))` screen is pushed; after confirming,
  `localAuthenticator.removeBiometricPassword()` runs and the toggle stays off — or, if
  removal throws, an error banner is shown and the toggle is restored to on.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| `ALGAPI.getCurrencies` fails | Data controller delivers an error snapshot; the list shows a no-content reload cell whose primary action re-runs `loadData()`. |
| Currency search yields no matches | A `CurrencySelectionNoContentViewModel` empty state is shown; clearing/resetting search restores the full list. |
| Network switch push re-registration returns an error | `ALGAPI` is reset to the previous network, polling restarts, an error banner with the error description is shown, and the node list reverts. |
| Enabling biometrics throws `LAError.unexpected` | An alert prompts the user to open iOS Settings; the toggle is set back to off. |
| Removing the biometric credential throws | An error banner is shown and the biometric toggle is restored to on. |
| Settings index path out of bounds (Security/Developer) | A `fatalError` is raised (treated as a programmer error / invariant violation). |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core (PeraWalletCore) | `PeraUserDefaults`, `PeraCoreManager`, `LocalAuthenticator`, account/user models, push controller. |
| ALGAPI / Magpie | Fetching the currency list (`getCurrencies`) and re-basing the network for node switching. |
| SharedDataController | Currency primary value + observers, polling lifecycle around currency/network changes. |
| CurrencyService (`CurrencyServiceable`) | Persisting selected currency id and the Algo-primary flag. |
| Routing (`Screen.swift`) | Navigation cases pushed/presented (`choosePassword`, `nodeSettings`, `developerMenu`, `accountNameSetup`, `accountRecoverySearch`, `externalInAppBrowser`). |
| ChoosePassword flow | PIN activation/change and biometric confirmation (`ChoosePasswordViewController`). |
| PushNotificationController | Re-registering/unregistering the device across network switches and account creation. |
| Macaroon (UIKit/Utils/BottomSheet) | Base UI primitives, `Throttler` for search, bottom-sheet presentation for Wallet Rating. |
| Analytics | `changeCurrency` event on currency selection. |
| AlgorandAppStoreReviewer / AppEnvironment | Manual App Store review request from the Wallet Rating sheet. |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
