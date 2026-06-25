# PeraWallet_Classes_Application — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- This module is the bootstrap/UI-shell layer (no isolated unit tests for `AppDelegate`/`RootViewController`); coverage is mostly via launch and WalletConnect integration paths exercised by feature-level tests.

## Manual QA checklist

Launch & lifecycle
- [ ] Cold launch (authenticated) lands on the Home tab with all expected tabs present.
- [ ] Backgrounding shows the privacy blur overlay; foregrounding removes it.
- [ ] On testnet, the top network banner and testnet status-bar styling appear; on mainnet they do not.
- [ ] Switching network (Node settings) updates the banner and the Discover tab availability.

Tab bar / navigation
- [ ] Tapping each tab tracks the correct analytics event and selects the right screen.
- [ ] Re-tapping the active tab pops its navigation stack to root.
- [ ] Discover tab is disabled on production testnet and enabled otherwise.
- [ ] Swap/Fund/Discover deeplink launchers select the tab and pass the draft/address/destination.

WalletConnect (v1 and v2)
- [ ] Valid transaction sign request presents the sign screen; success sheet shows after signing (unless in-app browser active).
- [ ] Arbitrary-data sign request presents and shows its success warning with the dApp name.
- [ ] Request for an unknown session is rejected (no UI shown).
- [ ] v2 request on an unauthorized method/chain/namespace is rejected with the correct error.
- [ ] A duplicate request for a topic already being signed is rejected (`alreadyDisplayed`).
- [ ] Rejecting a request dismisses the sheet and clears the ongoing topic.

Deeplinks / entry points
- [ ] WC URI from QR/clipboard opens the sign flow; from background it still appears (delay HACK).
- [ ] MoonPay redirect, browser/in-app-browser links, external deeplinks, and QR text each route correctly.
- [ ] "Scan QR" home-screen quick action opens the QR scanner.
- [ ] Push notification tap routes to the referenced screen (or shows the in-app banner).

Reset
- [ ] `deleteAllData` (remove all accounts) revokes the device, resets session/contacts, disconnects all WC sessions, and stops/resets polling.

## Edge cases

- WC request arriving while another for the same topic is in flight.
- In-app browser active when a WC sign succeeds (success sheet must be suppressed).
- App-group migration / Core Data failure (currently crashes by design — verify no silent corrupt state).
- Logging bootstrap failure (launch must still proceed).
- Re-entrancy of `launchTabsIfNeeded()` (must be a no-op when tabs already visible).
