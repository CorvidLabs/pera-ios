# PeraWallet_Classes_Accounts — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Run via the Xcode test action (see `BUILDING.md`).
- This module is UI/coordinator-heavy; most coverage is manual. Pure logic worth
  unit-testing in isolation: `RemoveAuthAccountAuthorizationValidator.validate`
  (granted vs denied), and `AccountInformationFlowCoordinator.launch` routing by
  `authorization`.

## Manual QA checklist

### Home / Account List
- [ ] Account list renders all local accounts; watch accounts use the watch
      portfolio cell; total portfolio value shown.
- [ ] TestNet banner appears only on TestNet; portfolio calculation info sheet opens.
- [ ] Account sort/order screen reorders the list and persists.

### Account Detail
- [ ] Assets / Collectibles / Transactions tabs page correctly; tab bar stays visible.
- [ ] Send / Receive / Swap / Buy-Sell / Fund / Add Asset launch their flows.
- [ ] Manage assets → Sort, Filter, Remove each open and reload the asset list.
- [ ] Account options bar button opens the correct information sheet per account type.

### Account Information by authorization type
- [ ] Standard, Watch, Ledger, No-Auth, Rekeyed, Rekeyed-Joint, and
      Any-to-No-Auth-Rekeyed each present the right sheet with the right options.
- [ ] Rekey-to-Ledger / Standard / Joint, Undo-Rekey, Rescan, Import-Connected
      each dismiss the sheet then launch the matching flow.

### Remove account
- [ ] Removing a plain account shows back-up warning → confirmation → removes.
- [ ] Removing an auth account with rekeyed dependents shows the error banner and
      does NOT proceed.

### Passphrase / options
- [ ] View passphrase requires biometrics/password and the warning acknowledgement
      before showing mnemonics.
- [ ] Rename account updates the navigation title and account list.

### Selection pickers
- [ ] Receiver selection lists accounts + contacts; clipboard paste works.
- [ ] HD-wallet SelectAddress shows already-imported addresses as disabled.

## Edge cases

- [ ] No-auth account: every action button surfaces the
      `action-not-available-for-account-type` banner (no flow launches).
- [ ] Account authorization changes while Account Detail is open → nav title and
      right bar button refresh (`updateNavigationItemsIfNeededWhenAccountDidUpdate`).
- [ ] Joint account: options bar button opens joint account detail, not the
      standard information sheet.
- [ ] Swap/Fund when `rootViewController` is nil → no navigation, no crash.
- [ ] Screenshot taken on the passphrase display screen.
