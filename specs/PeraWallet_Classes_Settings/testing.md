# PeraWallet_Classes_Settings — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- These Settings screens are UIKit view controllers with side effects on
  `SharedDataController`, `ALGAPI`, push notifications, and `session`, so they are
  primarily covered by manual QA; the most unit-testable seam is
  `CurrencySelectionListAPIDataController` (snapshot building, search filtering,
  selected-currency observation) which can be exercised with a stub `ALGAPI` /
  `SharedDataController`.

## Manual QA checklist

### Appearance
- [ ] Selecting System / Light / Dark applies immediately app-wide and persists across relaunch.
- [ ] Exactly one row is checked on re-entry, matching the active style.

### Currency
- [ ] List loads from the API; the synthesized Algo entry appears at the top.
- [ ] Searching filters by id and name; clearing search restores the full list.
- [ ] Selecting a new currency updates balances/displays elsewhere (currency change
      notification) and restarts polling.
- [ ] Pull/loss of connectivity shows the error reload cell; tapping reload refetches.
- [ ] No-match search shows the empty state.

### Security
- [ ] With no PIN set, only PIN activation + rekey rows show; enabling PIN routes through
      the choose-password flow.
- [ ] With a PIN set, change-PIN and biometrics rows appear.
- [ ] Enabling biometrics with OS biometrics disabled shows the "go to Settings" alert and
      reverts the toggle.
- [ ] Disabling biometrics requires password confirmation; cancelling leaves it on.
- [ ] Rekey support toggle persists to `PeraUserDefaults.isRekeySupported`.

### Node
- [ ] Switching MainNet <-> TestNet shows loading, then updates the checkmark.
- [ ] On a forced push/registration failure the selection reverts and an error banner shows.
- [ ] After a successful switch, accounts/data reflect the new network and joint accounts re-sync.

### Developer
- [ ] Dispenser row appears only on TestNet.
- [ ] Developer menu row appears only when `shouldShowDevMenu` is set.
- [ ] Create Algo25 account and Recover account routes launch correctly.

### Wallet Rating
- [ ] Presented as a compressed bottom sheet; the button triggers the App Store review prompt.

## Edge cases

- Currency change while polling is mid-cycle (stop -> set primary -> reset ordering).
- Network switch initiated while a previous switch's loading indicator is still up.
- Biometric revert paths rely on hardcoded index paths (`IndexPath(item:1, section:1)` /
  `(1,0)`) — verify after any section-layout change.
- Unauthenticated/`session == nil` entry (controllers force-unwrap `session!`/`api!`).
