---
module: PeraWallet_Classes_Authentication
version: 1
status: active
files:
  - PeraWallet/Classes/Authentication/AccountFlow.swift
  - PeraWallet/Classes/Authentication/Common/AccountName/Screens/AccountNameSetupViewController.swift
  - PeraWallet/Classes/Authentication/Common/AccountName/Screens/AccountNameSetupViewControllerTheme.swift
  - PeraWallet/Classes/Authentication/Common/AccountName/Views/AccountNameSetupView.swift
  - PeraWallet/Classes/Authentication/Common/AccountType/ViewModels/AccountTypeViewModel.swift
  - PeraWallet/Classes/Authentication/Common/AccountType/Views/AccountTypeView.swift
  - PeraWallet/Classes/Authentication/Common/AccountType/Views/AccountTypeViewTheme.swift
  - PeraWallet/Classes/Authentication/Common/AccountType/Views/NewAccountWarningOverlayView.swift
  - PeraWallet/Classes/Authentication/Common/AddressName/Screens/AddressNameSetupViewController.swift
  - PeraWallet/Classes/Authentication/Common/AddressName/Screens/AddressNameSetupViewControllerTheme.swift
  - PeraWallet/Classes/Authentication/Common/HDWallet/Cells/HDWalletCell.swift
  - PeraWallet/Classes/Authentication/Common/HDWallet/Cells/HDWalletListItemView.swift
  - PeraWallet/Classes/Authentication/Common/HDWallet/Data/HDWalletSetupDataController.swift
  - PeraWallet/Classes/Authentication/Common/HDWallet/Screens/HDWalletSetupViewController.swift
  - PeraWallet/Classes/Authentication/Common/HDWallet/Screens/HDWalletSetupViewControllerTheme.swift
  - PeraWallet/Classes/Authentication/Common/HDWallet/ViewModels/HDWalletItemViewModel.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/DataSource/PassphraseVerifyDataSource.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Screens/BackUp/PassphraseBackUpViewController.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Screens/BackUp/PassphraseBackUpViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Screens/Verify/PassphraseVerifyViewController.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Screens/Verify/PassphraseVerifyViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Screenshot/ScreenshotWarningViewController.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Screenshot/ScreenshotWarningViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/ViewModels/BackUp/PassphraseCellViewModel.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/ViewModels/Verify/PassphraseVerifyCardViewModel.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/ViewModels/Verify/PassphraseVerifyViewModel.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseBackUpView.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseBackUpViewTheme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseCell.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseCellView.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseCellViewTheme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseView.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/BackUp/PassphraseViewTheme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/Verify/PassphraseVerifyCardView.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/Verify/PassphraseVerifyCardViewTheme.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/Verify/PassphraseVerifyView.swift
  - PeraWallet/Classes/Authentication/Create/Passphrase/Views/Verify/PassphraseVerifyViewTheme.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicType/ViewModels/MnemonicTypeViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicType/Views/MnemonicTypeView.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicType/Views/MnemonicTypeViewTheme.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicTypes/MnemonicProvider.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicTypes/Screens/MnemonicTypeSelectionScreen +Theme.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicTypes/Screens/MnemonicTypeSelectionScreen.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicTypes/ViewModels/MnemonicTypeSelectionViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicTypes/Views/MnemonicTypeSelectionView.swift
  - PeraWallet/Classes/Authentication/Introduction/MnemonicTypes/Views/MnemonicTypeSelectionViewTheme.swift
  - PeraWallet/Classes/Authentication/Introduction/PeraIntroduction/PeraIntroductionViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/PinLimit/Screens/PinLimitViewController.swift
  - PeraWallet/Classes/Authentication/Introduction/PinLimit/Views/PinLimitView.swift
  - PeraWallet/Classes/Authentication/Introduction/PinLimit/Views/PinLimitViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/PinLimit/Views/PinLimitViewTheme.swift
  - PeraWallet/Classes/Authentication/Introduction/Recover/RecoverAccountView.swift
  - PeraWallet/Classes/Authentication/Introduction/Recover/RecoverAccountViewController.swift
  - PeraWallet/Classes/Authentication/Introduction/Recover/RecoverAccountViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Introduction/Recover/RecoverAccountViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/Recover/RecoverAccountViewTheme.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/Screens/WelcomeViewController.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/Screens/WelcomeViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/ViewModels/WelcomeTypeViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/ViewModels/WelcomeViewModel.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/Views/WelcomeTypeView.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/Views/WelcomeTypeViewTheme.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/Views/WelcomeView.swift
  - PeraWallet/Classes/Authentication/Introduction/Welcome/Views/WelcomeViewTheme.swift
  - PeraWallet/Classes/Authentication/Recover/List/Data/AccountRecoverDataController.swift
  - PeraWallet/Classes/Authentication/Recover/List/Screens/AccountRecoverViewController.swift
  - PeraWallet/Classes/Authentication/Recover/List/Screens/AccountRecoverViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Recover/List/ViewModels/RecoverInputViewModel.swift
  - PeraWallet/Classes/Authentication/Recover/List/Views/AccountRecoverView.swift
  - PeraWallet/Classes/Authentication/Recover/List/Views/AccountRecoverViewTheme.swift
  - PeraWallet/Classes/Authentication/Recover/List/Views/RecoverInputView.swift
  - PeraWallet/Classes/Authentication/Recover/List/Views/RecoverInputViewTheme.swift
  - PeraWallet/Classes/Authentication/Recover/Loading/RecoverAccountsLoadingScreen.swift
  - PeraWallet/Classes/Authentication/Recover/Loading/RecoverAccountsLoadingTheme.swift
  - PeraWallet/Classes/Authentication/Recover/Loading/RecoverAccountsLoadingViewModel.swift
  - PeraWallet/Classes/Authentication/Recover/Options/Screens/AccountRecoverOptionsViewController.swift
  - PeraWallet/Classes/Authentication/Recover/Options/Screens/AccountRecoverOptionsViewController+Theme.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/DataSource/InputSuggestionDataSource.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/DataSource/InputSuggestionsDataController.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/Layout/InputSuggestionLayoutBuilder.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/Screens/InputSuggestionViewController.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/ViewModels/InputSuggestionViewModel.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/Views/InputSuggestionCell.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/Views/InputSuggestionView.swift
  - PeraWallet/Classes/Authentication/Recover/Suggestion/Views/InputSuggestionViewTheme.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Data/RekeyedAccountSelectionListDataController.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Data/RekeyedAccountSelectionListDataSource.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Data/RekeyedAccountSelectionListLocalDataController.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/RekeyedAccountSelectionListLayout.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/RekeyedAccountSelectionListScreen.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/RekeyedAccountSelectionListScreenTheme.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountCell/RekeyedAccountSelectionListAccountCell.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountCell/RekeyedAccountSelectionListAccountCellTheme.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountCell/RekeyedAccountSelectionListAccountItemAccessory.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountLoadingCell/RekeyedAccountSelectionListAccountLoadingCell.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountLoadingCell/RekeyedAccountSelectionListAccountLoadingItemView.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountLoadingCell/RekeyedAccountSelectionListAccountLoadingItemViewTheme.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountLoadingCell/RekeyedAccountSelectionListAccountLoadingView.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/AccountLoadingCell/RekeyedAccountSelectionListAccountLoadingViewTheme.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/Header/RekeyedAccountSelectionListHeader.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/Header/RekeyedAccountSelectionListHeaderTheme.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/Header/RekeyedAccountSelectionListHeaderViewModel.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/NavigationBar/RekeyedAccountSelectionListNavigationBarView.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/NavigationBar/RekeyedAccountSelectionListNavigationBarViewModel.swift
  - PeraWallet/Classes/Authentication/RekeyedAccountList/Views/NavigationBar/RekeyedAccountSelectionListNavigationBarViewTheme.swift
  - PeraWallet/Classes/Authentication/WalletFlowType.swift
  - PeraWallet/Classes/Authentication/WatchAccount/Data/WatchAccountAdditionAPIDataController.swift
  - PeraWallet/Classes/Authentication/WatchAccount/Data/WatchAccountAdditionDataController.swift
  - PeraWallet/Classes/Authentication/WatchAccount/Screens/WatchAccountAdditionViewController.swift
  - PeraWallet/Classes/Authentication/WatchAccount/Screens/WatchAccountAdditionViewControllerTheme.swift
  - PeraWallet/Classes/Authentication/WatchAccount/Views/WatchAccountAdditionView.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Authentication

## Purpose

App-target onboarding / account-setup feature module (`PeraWallet/Classes/Authentication`). It owns the full set of screens a user passes through to create, import, recover, watch, or back up an Algorand account, plus the PIN lockout screen that gates app entry. Internal-by-default; see Public API for any cross-module-public surface.

The module is organised around an `AccountSetupFlow` (`initializeAccount`, `addNewAccount`, `backUpAccount`, `none`) and an `AccountSetupMode` (`addAlgo25Account`, `addBip39Address`, `addBip39Wallet`, `recover`, `rekey`, `watch`, `none`) that are threaded through every screen so each controller knows which onboarding context it is part of. A `WalletFlowType` (`bip39` vs `algo25`) further selects the mnemonic provider and themes for the create / recover screens.

Major sub-areas and their screens:

- **Introduction** — `WelcomeViewController` (create-wallet vs import entry point), `MnemonicTypeSelectionScreen` (choose BIP39 vs Algo25 24/25-word backup type), `RecoverAccountViewController`, `PinLimitViewController` (countdown lockout after exhausted PIN attempts, with reset-all-data escape hatch).
- **Common** — reusable setup steps: `AccountNameSetupViewController`, `AddressNameSetupViewController`, `AccountType` selection views, and the `HDWalletSetupViewController` that lists existing HD wallets and lets the user create a new wallet or derive a new address from one.
- **Create / Passphrase** — `PassphraseBackUpViewController` (reveal the 24/25-word phrase), `PassphraseVerifyViewController` (challenge the user to confirm words before the account is committed), and `ScreenshotWarningViewController`.
- **Recover** — mnemonic entry (`AccountRecoverViewController`) with word suggestions (`InputSuggestionViewController`), QR / clipboard import, `AccountRecoverOptionsViewController`, and `RecoverAccountsLoadingScreen`.
- **RekeyedAccountList** — `RekeyedAccountSelectionListScreen`, shown after recovery to let the user also import accounts that are rekeyed to the recovered key.
- **WatchAccount** — `WatchAccountAdditionViewController` for adding view-only accounts by address, QR, clipboard, or `.algo`/NFD name-service lookup.

Ownership boundary: this module owns onboarding/account-creation UI and the local persistence side effects of registering an account (writing to `Session`, `HDWalletStorage`, and the authenticated `User`). It does not own steady-state account management, transaction signing, or ledger pairing screens.

## Public API

| Export | Description |
|--------|-------------|
| `calculatePreferredSize` | Macaroon view-sizing method computing a view/cell's preferred `CGSize` for its view model, layout sheet, and fitting size. |

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. Every onboarding screen carries the originating `AccountSetupFlow` (and where relevant `AccountSetupMode` / `WalletFlowType`); navigation pushes always propagate these so the final commit step knows whether it is creating, recovering, rekeying, watching, or backing up.
3. An account is only persisted (`User.addAccount` / `Session.savePrivate` / `HDWalletStorage.save`) once its setup step completes. Newly created standard accounts start `isBackedUp: false`; an account becomes `isBackedUp: true` only after passphrase verification or recovery. A watch account is always `isWatchAccount: true` with no private key.
4. Mnemonic-bearing screens (passphrase back-up/verify, recover input) never leave secret material in shared state: the recover input field is reset on a wrong verification, and the create flow stages entropy under the `"temp"` key in `Session` and removes it (`removePrivateData(for: "temp")`) once the real address is derived.
5. Duplicate-account guards hold before commit: recover and watch-account flows reject an address that already exists in `sharedDataController.accountCollection` (unless upgrading a rekeyed/watch/no-auth account to standard via recovery).
6. `PinLimitViewController` blocks app entry until the stored remaining-time countdown reaches zero; the only user action available before then is "reset all data" (full logout), and the timer is paused/persisted across backgrounding.

## Behavioral Examples

### Scenario: Create a new BIP39 wallet from Welcome
- **Given** the user is on `WelcomeViewController` with an `AccountSetupFlow`
- **When** they tap "Create Wallet"
- **Then** an HD wallet is generated via `hdWalletService.saveHDWalletAndComposeHDWalletAddressDetail`, a not-yet-backed-up `AccountInformation` is created and assigned to the authenticated `User`, and the app pushes `AddressNameSetupViewController` (mode `.addBip39Wallet`) with the close button and interactive pop disabled.

### Scenario: Verify the recovery phrase before committing the account
- **Given** the user is on `PassphraseVerifyViewController` during create (not back-up) flow
- **When** they tap the picked words and the selection does not match the staged phrase
- **Then** the device vibrates, an error banner ("passphrase-verify-wrong-message") is shown, and the view + data source reset for another attempt; only a correct selection commits the account (`createAccount`, now `isBackedUp: true`) and pushes the post-verification tutorial.

### Scenario: Recover an Algo25 account that has rekeyed accounts
- **Given** the user fills 25 valid words in `AccountRecoverViewController` and taps Recover
- **When** the private key resolves to an address and `api.fetchRekeyedAccounts` returns accounts rekeyed to it
- **Then** the app pushes `RekeyedAccountSelectionListScreen` so the user can also import those accounts; if none are returned (or the fetch fails) it proceeds directly to `AccountNameSetupViewController`.

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Recover input incomplete (fewer than the required word count filled) | Recover button stays disabled; tapping shows alert "recover-fill-all-error". |
| Invalid mnemonic on recover (SDK can't derive key) | `AccountRecoverDataController` reports `.invalid`; bottom warning "pass-phrase-verify-invalid-passphrase". |
| Address derivation fails | Reports `.sdk`; bottom warning "pass-phrase-verify-sdk-error". |
| Recovered/added account already exists as a standard account | Recover reports `.alreadyExist`; watch-add shows "recover-from-seed-verify-exist-error" banner. |
| Bad copy/paste or QR text in recover field | Error banner ("recover-copy-error" / "...-algo25" / "qr-scan-should-scan-mnemonics-message"); input not applied. |
| Wrong words chosen in passphrase verify | Vibrate + "passphrase-verify-wrong-message" banner; view and data source reset, account not committed. |
| BIP39 import decryption / import failure | `ImportAccountScreen` dismisses to an `importAccountError` screen; on continue, a fresh user is created and main is launched. |
| Watch address empty or not a valid Algorand address | "watch-account-error-address" banner; add action blocked. |
| Name-service lookup returns nothing / fails | Address input enters `.incorrect` state ("title-account-not-found" / "title-generic-error"). |
| Camera unavailable for QR scan | "qr-scan-error-message" alert; scanner not opened. |
| HD wallet creation/address generation fails (create/select) | `assertionFailure` in debug; the step aborts without committing an account. |

## Dependencies

| Module | Usage |
|--------|-------|
| pera_wallet_core (PeraWalletCore) | `Account` / `AccountInformation` / `User` models, `Session`, `SharedDataController`, `HDWalletService` & `HDWalletStorage`, `FeatureFlagServicing`, `PublicKey`, mnemonic & rekey helpers. |
| App routing (`Screen` / `open(_:by:)`) | Pushing/presenting setup screens (addressNameSetup, tutorial, recoverAccount, importAccount, rekeyedAccountSelectionList, qrScanner, etc.). |
| PushNotificationController | `sendDeviceDetails()` after an account is registered. |
| Analytics | Onboarding/registration events (`createNewWallet`, `importAccount`, `registerAccount`, `onboardCreateAccount*`). |
| API (`ALGAPI`) | `fetchRekeyedAccounts`, name-service search backing the watch-account screen. |
| Macaroon UIKit / Form / URLImage / SnapKit | View themes, keyboard handling, layout, and remote image loading for the screens. |
| QRScanner module | Scanning mnemonics/addresses into recover and watch flows. |



## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
