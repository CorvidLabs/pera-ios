# PeraWallet_Classes_Demo — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action
  (see `BUILDING.md`).
- This module is mostly UI/coordinator code with no dedicated unit-test target;
  most coverage is manual. Pure view models (`*ListItemButtonViewModel`,
  `HomePortfolioViewModel`, `TotalPortfolioItem`) are the most unit-testable
  pieces if coverage is added — assert title/icon/value mapping for given inputs.

## Manual QA checklist

App launch / routing:
- [ ] Cold launch with passcode → authorization screen → Home tab; polling starts.
- [ ] Cold launch, no auth / app reinstalled with keys in keychain → onboarding,
      session reset (contacts preserved).
- [ ] Background → foreground re-locks per inactive-session expiration; deeplinks
      that arrived while locked resume after unlock.
- [ ] Deeplinks resolve: remote notification, WalletConnect session request,
      WalletConnect transaction sign request, QR text, Meld buy-Algo, external
      in-app browser link.

Home tab:
- [ ] Portfolio total, charts, and tendencies render and update on period change.
- [ ] Accounts list, announcement, and carousel/spot banners appear; banner close
      persists.
- [ ] Empty state (no accounts) and loading state render correctly.

Quick actions / transaction options:
- [ ] Send: no preselection → account → asset → send screen; preselected account
      skips account selection.
- [ ] Receive and Scan QR flows open and route correctly.
- [ ] Transaction options sheet shows correct actions per account type
      (watch/standard/joint/rekeyed).

Account action buttons / sheets:
- [ ] Copy address shows toast; rename, rekey, remove, view passphrase, mute
      notifications, ASA report, undo rekey present the right screens.

Shared UI:
- [ ] Toast presentation, UISheet actions, and light/dark/system style switching.

## Edge cases

- [ ] Deeplink arriving during the very first launch before accounts load is
      held and resumed after `.didFinishRunning`.
- [ ] First-launch interruption by a system permission alert (becomes
      inactive/active) does not double-trigger launch logic.
- [ ] Scanned QR for an uncached asset → confirmation sheet, not send flow.
- [ ] Opt-in when account already owns the asset → info banner, no transaction.
- [ ] Account-limit reached on add-account / recover QR → error banner.
- [ ] Ledger-required opt-in: connection screen, sign process, and
      cancel/timeout paths stop loading and cancel monitoring.
- [ ] Joint-account send routes to the pending-transaction overlay.
- [ ] `AlertPresenter` suppresses intro alerts when not on the selected tab's
      root, when a modal is presented, or before the first app launch.
