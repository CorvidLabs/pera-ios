# PeraWallet_Classes_Fund — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- No dedicated Fund tests currently exist. The most unit-testable surface is
  `FundURLGenerator.generateURL` (pure function): assert query items, the optional
  `address` item, the `/test` override, and deep-link path appending.

## Manual QA checklist

- [ ] Tapping the Fund tab loads the Pera fund page (web view, no native nav bar visible).
- [ ] Pull-to-refresh reloads the same page.
- [ ] URL carries correct `theme`, `currency`, `language`, `region`, `platform=ios`.
- [ ] Switching system appearance (light/dark) updates the page theme (and on app
      foreground / returning to the tab).
- [ ] Changing preferred currency (Currency Selection) updates the page currency.
- [ ] `launchFund(with:address:)` opens the Fund tab focused on that account.
- [ ] A Fund deep link (`launchFundFromDeeplink` with path + address) opens the correct
      route/account.
- [ ] Web page "get addresses" shows only non-joint authenticated accounts.
- [ ] Web "open in system browser" and "open native URI" actions launch correctly.
- [ ] Web "push web view" opens a nested in-app browser; back/close returns to Fund.
- [ ] `notifyUser` banner/toast variants appear; close/back from the page dismisses or pops.

## Edge cases

- [ ] Misconfigured `fundBaseUrl` (nil generated URL) — verify graceful behavior.
- [ ] `enableTestXOSwapPage = true` loads `/test` and ignores any deep-link path.
- [ ] `selectedAddress` applies once then resets (re-entering the tab does not re-route).
- [ ] No authenticated user — `getAddresses` returns an empty list.
- [ ] Slow page load vs. the 1s `viewWillAppear` theme-push delay.
- [ ] Malformed / unknown JS method names are ignored without crashing.
