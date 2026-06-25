# PeraWallet_Classes_Cards — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Run via the Xcode test action (see `BUILDING.md`).
- No dedicated unit tests currently exist for this module. The highest-value
  targets for new coverage are pure/static functions:
  - `CardsURLGenerator.generateURL(...)` — query items, `.welcome` vs
    `.other(path:)`, and `.other(path: nil)` -> `nil`.
  - `CardsAccounts` JSON encoding (`action == "getAuthorizedAddresses"`).

## Manual QA checklist

- [ ] Launch Cards from its entry point; the cards home (`.welcome`) loads.
- [ ] URL carries correct query params: `version=1`, `theme`, `platform=ios`,
      `currency`, `language`, `region`.
- [ ] On testnet vs mainnet, the base URL matches
      `AppEnvironment.cardsBaseUrl(network:)` for the active network.
- [ ] Toggle device light/dark mode while Cards is open — the web page theme
      updates (no app restart needed).
- [ ] Background then foreground the app — theme re-syncs on resume.
- [ ] Web app "request addresses" returns only authorized accounts.
- [ ] Pera Connect deep flow triggered from the page works end-to-end.
- [ ] "Open in system browser" link opens Safari (not in-app).
- [ ] Close action (`closePeraCards`) dismisses the screen and returns to the
      previous screen with the tab bar intact.
- [ ] Pull-to-refresh is disabled; web view does not bounce and stays pinned to
      the top.

## Edge cases

- `.other(path: nil)` produces a `nil` URL — verify the screen does not load a
  blank/garbage page.
- Missing currency / locale language / region — query values become `nil`;
  verify the web app degrades gracefully.
- No active API network — URL generation falls back to `.mainnet`.
- Rapid theme toggling — the ~1s deferred `updateTheme` on `viewWillAppear`
  should not race with the navigation-time theme change.
- Unknown script-message names are silently ignored (no crash).
