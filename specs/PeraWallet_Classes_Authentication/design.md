# PeraWallet_Classes_Authentication — Design

## Screens & navigation hierarchy

Onboarding/account-setup screens, grouped by sub-area. Navigation is push-based via the app `Screen` enum unless noted as a bottom sheet.

- **Welcome** (`WelcomeViewController`) — Pera logo, illustration, "Create Wallet" and "Import" actions, plus a terms/links footer. Entry point of the flow.
  - → Create: derives an HD wallet → pushes **Address Name Setup** (close button & interactive-pop disabled).
  - → Import: pushes **Recover Account**.
- **Mnemonic Type Selection** (`MnemonicTypeSelectionScreen`) — bottom-sheet choice between BIP39 (recommended) and Algo25, each rendered by `MnemonicTypeView`; emits `didSelectBip39` / `didSelectAlgo25`.
- **HD Wallet Setup** (`HDWalletSetupViewController`) — collection list of existing HD wallets (`HDWalletCell`) with a footer "Create wallet" action over a gradient fade; select an item to derive a new address, or create a new wallet.
- **Account / Address Name Setup** (`AccountNameSetupViewController`, `AddressNameSetupViewController`) — name the new account/address before it joins the wallet.
- **Account Type** views (`AccountTypeView`, `NewAccountWarningOverlayView`) — selection + warning overlay for adding new addresses.
- **Passphrase Back Up** (`PassphraseBackUpViewController`) — reveals the 24/25-word phrase in a grid of `PassphraseCell`s, with `ScreenshotWarningViewController` guarding screenshots.
- **Passphrase Verify** (`PassphraseVerifyViewController`) — `PassphraseVerifyCardView` challenge cards; wrong selection vibrates + resets.
- **Recover Account** (`AccountRecoverViewController`) — scrollable grid of `RecoverInputView` word fields, keyboard-anchored Recover button, options bar button → `AccountRecoverOptionsViewController` (scan QR / paste / more info), and an `InputSuggestionViewController` keyboard accessory.
- **Recover Loading** (`RecoverAccountsLoadingScreen`) — progress while accounts are fetched.
- **Rekeyed Account Selection List** (`RekeyedAccountSelectionListScreen`) — header, account cells (`RekeyedAccountSelectionListAccountCell`), loading skeleton cells, and a custom navigation bar; lets the user import accounts rekeyed to the recovered key.
- **Watch Account Addition** (`WatchAccountAdditionViewController`) — multiline address input with QR accessory, animated paste-from-clipboard pill, and name-service result rows (`AccountListItemView`) over a gradient footer add-account action.
- **Pin Limit** (`PinLimitViewController`) — full-screen countdown (`PinLimitView`) shown while the app is locked out; only action is "reset all data" → logout bottom warning.

## Components & view models

Each screen pairs a Macaroon `*View` with a `*ViewModel` and a `*Theme`. Reusable building blocks include `RecoverInputView` (+ `RecoverInputViewModel` states: `active`/`wrong`/`empty`/`filled`/`filledWrongly`), `PassphraseCell` / `PassphraseVerifyCardView`, `HDWalletCell` / `HDWalletListItemView`, `InputSuggestionCell`, and the rekeyed-list account & loading cells.

## Design tokens

- Backgrounds/text/typography come from the app design system: `Colors.Defaults.background`, `Colors.Text.white` / `Colors.Text.grayLighter`, and `Typography.footnoteMedium()` / `.bodyRegular()` / `.bodyMedium()`.
- Footer fades use a `LinearGradientEffect` built from `Colors.Defaults.background` (transparent → opaque).
- Buttons use shared themes (`ButtonPrimaryTheme`, `ButtonCommonViewModel`); per-flow themes split into `*Bip39Theme` and `*CommonTheme` selected by `WalletFlowType`.

## Assets

- `icon-plus-24` (create wallet action), `icon-info-red` (recover error warning), `icon-settings-logout` (pin-limit reset), Pera welcome logo image, and remote name-service logos loaded via `DefaultURLImageSource`.
- User-facing strings are localized keys (e.g. `title-recover`, `mnemonic-types-screen-title`, `watch-account-paste`, `passphrase-verify-wrong-message`).
