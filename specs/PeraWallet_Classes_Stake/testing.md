# PeraWallet_Classes_Stake — Testing

## Automated tests

- App/library test bundle: `algorand-tests/` (run via the Xcode test action — see `BUILDING.md`).
- This module has no dedicated unit tests today. The most testable seam is `StakingURLGenerator.generateURL(destination:theme:session:)`, a pure static function — a good candidate for query-item / nil-URL assertions. The web-view screens require UI/integration testing.

## Manual QA checklist

- [ ] Open staking from the Home list, the Menu, and an asset-detail screen — each route presents `StakingScreen` and loads the staking web app.
- [ ] Open a `staking` / `staking-path` deep link (QR or universal link) — the staking screen is presented.
- [ ] Loaded URL carries `theme`, `platform=ios`, `currency`, `language`, and `region` matching the device/session.
- [ ] Toggle device Light/Dark mode while on the screen — web content re-themes (`updateTheme`) without reload.
- [ ] Background then foreground the app on the staking screen — theme re-syncs.
- [ ] Trigger a PeraConnect/WalletConnect pairing from the web app — native pairing flow launches.
- [ ] Tap a link that posts `openSystemBrowser` — opens in the system browser, not the in-app web view.
- [ ] Trigger `closeWebView` — screen dismisses when presented, or pops when pushed, and never strands an empty screen.
- [ ] Navigation bar is hidden while the screen is visible and restored on disappear.

## Edge cases

- `Session == nil` (locked / no accounts): URL still builds; `currency` is absent. Page should still load.
- Invalid/empty `stakingBaseUrl`: `generateURL` returns `nil` → web view loads nothing (no native error UI today — see tasks).
- Unknown inbound JS message name: silently ignored.
- `closeWebView` when the screen can neither dismiss nor go back: no-op.
- Duplicate `currency` query item currently emitted by `makeInHouseQueryItems` — verify the web app tolerates it.
- Pull-to-refresh is disabled on this screen; recovery from a failed load is via re-entry.
