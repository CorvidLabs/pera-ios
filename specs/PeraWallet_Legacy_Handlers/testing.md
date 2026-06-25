# PeraWallet_Legacy_Handlers — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- This module has no UI; it is a pure account-factory layer, so coverage is best added as
  unit tests around `LegacyBridgeAccountManager` with mocked `HDWalletServicing`,
  `Session`, `SharedDataController`, and `PushNotificationController`.

## Manual QA checklist

Driven through `AddAccountCompatibilityController` (Add Account flow) and
`AccountsService` (joint accounts):

- [ ] Create Universal Wallet with no existing accounts → a new `User` is created, account
      appears in the list, wallet has a name derived from its `walletId`.
- [ ] Create Universal Wallet with an existing authenticated user → account is appended and
      a push device-details registration is triggered.
- [ ] After universal-wallet creation, the naming screen (`AddressNameSetupViewController`)
      is pushed with back/interactive-pop disabled.
- [ ] Create Algo25 Wallet → account is created, naming screen
      (`AccountNameSetupViewController`) is pushed, and on save the new-account animation
      flag is set and the flow dismisses.
- [ ] Create a joint account via `AccountsService.createJointAccount` → the returned
      multisig address is added locally with the correct participants.
- [ ] New accounts always show as not-backed-up (`isBackedUp == false`) immediately after
      creation.

## Edge cases

- [ ] HD wallet service returns nil detail/address → universal-wallet creation aborts
      (`try?` yields nil) and the UI does not advance.
- [ ] `addLocalAccount` with no authenticated user → surfaces as
      `ActionError.unableToCreateLocalAccount` from `createJointAccount`.
- [ ] `generatePrivateKey()` or `address(for:)` returns nil in the Algo25 path → returns
      nil, no partial account and no leftover `"temp"` private-key entry.
- [ ] First-user bootstrap path does NOT send device details (only existing-user adds do).
- [ ] Wallet name is set against the correct `hdWalletAddressDetail.walletId`.
