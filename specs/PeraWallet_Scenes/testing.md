# PeraWallet_Scenes — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action
  (see `BUILDING.md`).
- View models are designed to be testable: `*Modelable` protocols and the
  `SettingsListModelMockable` mock extension allow injecting/asserting state
  without UIKit. Prefer testing `*Model` logic (action emission, row
  composition, error mapping) over SwiftUI views.

## Manual QA checklist

### Add Account
- [ ] With no HD wallet, menu shows "Create Universal Wallet"; with an HD
      wallet, shows "Add Account".
- [ ] "Add Joint Account" row appears only when the joint-account feature flag
      is enabled, and shows the NEW badge.
- [ ] Expand/collapse reveals Watch Account / Create Algo25 Wallet; Scan QR
      populates a scanned address; terms & privacy links open.

### Create Joint Account
- [ ] Add multiple participants, edit and remove them, set a threshold, name the
      account, and confirm creation.
- [ ] Default threshold is 2; threshold cannot exceed participant count.

### Inbox
- [ ] Joint-account import invite, sign request, and ASA inbox rows render with
      correct titles and unread dots.
- [ ] Tapping a sign request opens the send/request scene when a local signature
      is still required, otherwise the pending-transaction overlay.
- [ ] Ignoring an invite removes it; failures show an error banner.
- [ ] Opening the Inbox marks messages as read (persists in `PeraUserDefaults`).

### Joint Account
- [ ] Detail shows participants and threshold; missing participants resolve to
      contacts or shortened addresses.
- [ ] Transaction Request Summary: review, show per-signer status, copy address,
      view details, and sign (including via Ledger connect / sign-with-Ledger).

### Recovered Accounts List
- [ ] Only not-yet-added rekeyed accounts are listed; selecting and confirming
      adds them and triggers the new-account animation.

### Settings / Developer
- [ ] Account / App Preferences / Support sections render; Passkeys row appears
      only when Liquid Auth is enabled; app version shown.
- [ ] Developer menu toggles flags and remote-config values.

### SwapV2
- [ ] No-account state offers create-account / info; with an account, asset
      selection, quote fetch, switch assets, percentage amounts, provider and
      slippage settings, history and top pairs all work.
- [ ] Confirm swap succeeds (banner + reset) and Ledger-account swaps route
      through sign-with-Ledger.

## Edge cases

- [ ] Network change while on the swap screen re-fetches providers and rebuilds
      the view.
- [ ] Local-currency-in-swap toggle reformats paying/receiving amounts.
- [ ] Joint-account sign request already failed or expired → overlay path.
- [ ] Markdown localization failures drop a row rather than crash.
