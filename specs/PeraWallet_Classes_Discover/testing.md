# PeraWallet_Classes_Discover — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- No module-specific unit tests were found for the Discover screens, `DiscoverURLGenerator`, the search data controller, or the social-media deeplink routers. The most testable pure logic (URL/query construction, deeplink scheme/host mapping, account-filtering in `BrowserAuthorizedAddressEventHandler`, search snapshot transitions) is currently exercised only manually.

## Manual QA checklist

### Discover Home
- [ ] Discover tab loads the web home page in the current theme; tab bar visible.
- [ ] Toggle device light/dark — web content theme updates without a full reload.
- [ ] Change preferred currency elsewhere, return to Discover — currency updates in web content.
- [ ] Scroll the web content — large title collapses and the search bar button shows/hides accordingly.
- [ ] Pull to refresh reloads the Pera URL.

### Search
- [ ] Open search; empty query shows trending assets.
- [ ] Type a keyword; results are throttled and update as you type.
- [ ] Scroll to bottom of a long result set — next page loads (pagination).
- [ ] Tap an asset — search dismisses and token detail pushes loading `/token-detail/<assetID>/`.
- [ ] Cancel button dismisses the search screen.

### Asset / token detail & generic
- [ ] Token detail action buttons (e.g. buy/swap) trigger the expected native flows.
- [ ] Generic Pera URLs open with theme/currency/locale query params applied.

### External / dApp browser
- [ ] Toolbar back/forward/home enable/disable correctly with navigation history.
- [ ] Reload and close bar buttons work.
- [ ] On a dApp with favorites: favorite/unfavorite toggles the icon and emits the event.
- [ ] PeraConnect from a dApp page initiates a session.

### Social deeplinks
- [ ] Tapping Twitter/X, Discord, and Telegram links routes to the installed native app when present.

## Edge cases

- [ ] No internet during search/trending → connection-specific error cell; retry works after reconnecting.
- [ ] Generic/other API error during search → generic error cell; retry works.
- [ ] Next-page request fails → only the footer shows `nextError`; existing results stay intact.
- [ ] Keyword with zero matches → not-found cell.
- [ ] Joint / ledger / non-authorized accounts are excluded from web-injected account lists per mode.
- [ ] Attempting to add a favorite at the 100-item cap → error banner, no add.
- [ ] Unrecognized social-media URL scheme/host → no deeplink opened (stays in browser).
- [ ] Rapid keyword edits → only one in-flight request; prior request cancelled (throttle).
