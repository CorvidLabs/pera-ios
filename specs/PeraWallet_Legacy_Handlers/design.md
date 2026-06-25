# PeraWallet_Legacy_Handlers — Design

This module is a non-visual bridge layer. It renders no views and owns no design
tokens; the screens below are driven by its callers and are listed for context.

## Layout & components

`LegacyBridgeAccountManager` itself has no UI. The account-creation results it produces
feed these caller-owned screens:

- **AddAccountCompatibilityController** (`PeraWallet/Scenes/Add Account/`) — entry point
  that maps `AddAccountView.LegacyNavigationOption` to flows: add account, import wallet,
  watch account, create universal wallet, create Algo25 wallet.
- **AddressNameSetupViewController** — pushed after a universal (HD) wallet account is
  created; back navigation and interactive pop are disabled so the user must finish naming.
- **AccountNameSetupViewController** — pushed after an Algo25 account is created; on save,
  sets `PeraUserDefaults.shouldShowNewAccountAnimation = true` and dismisses the flow.
- **QRScannerViewController** — used for scan-to-address within the add-account flow.

## Navigation hierarchy

```
AddAccountCompatibilityController (SwiftUICompatibilityBaseViewController)
├── createUniversalWallet → LegacyBridgeAccountManager.createUniversalWalletAccount
│       └── push AddressNameSetupViewController (mode: .addBip39Wallet)
├── createAlgo25Wallet    → LegacyBridgeAccountManager.createAlgo25Account
│       └── push AccountNameSetupViewController (mode: .addAlgo25Account)
├── addAccount    → push hdWalletSetup
├── importWallet  → push recoverAccount
└── watchAccount  → push tutorial(.watchAccount)
```

`AccountsService.createJointAccount` is a non-UI path that calls
`addLocalAccount` after the mobile API returns the multisig address.

## Design tokens

- None owned by this module. Visual styling (colors, typography, spacing) lives in the
  caller screens and the shared app design system.

## Assets

- None owned by this module.
