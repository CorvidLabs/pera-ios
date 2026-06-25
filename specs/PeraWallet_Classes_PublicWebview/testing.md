# PeraWallet_Classes_PublicWebview — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- No dedicated unit tests currently target the public-webview screens; the bridge logic lives in
  `InAppBrowserHelpers.handlePublicWebview(_:_:)` and is best covered there. Good candidates:
  - `pushWebView` with a valid vs. malformed `url` → routes vs. ignored.
  - `getPublicSettings` returns only public params (no `deviceId`/`appPackageName`/addresses).
  - Unknown `method` strings are skipped silently.
  - `closeWebView` / `onBackPressed` dismiss-vs-pop decision.

## Manual QA checklist

- [ ] Open a public-webview deep link / entry point; page loads and renders within the tab bar.
- [ ] Navigation bar is hidden while the screen is visible and restored after leaving.
- [ ] Tab bar remains visible on the public-webview screen.
- [ ] Toggle device light/dark mode while on the page → page theme updates live (`updateTheme`).
- [ ] Background then foreground the app → theme re-syncs on becoming active.
- [ ] In-page link that calls `pushWebView` stacks a second public-webview screen; back navigation pops it.
- [ ] In-page `openSystemBrowser` link leaves the app and opens Safari.
- [ ] In-page close/back control dismisses the modal or pops the stack correctly.
- [ ] Inspect outbound user agent: it ends with `pera_ios_<appVersion>`.
- [ ] Trigger an analytics event from the page (`logAnalyticsEvent`) and confirm it is tracked.

## Edge cases

- `nil` URL → blank web view, no crash (no error UI today).
- Page fails to load / 30s timeout → no retry affordance because pull-to-refresh is disabled.
- Malformed `pushWebView` / `getPublicSettings` payloads → silently ignored (no user feedback).
- Rapid light/dark toggling → multiple `updateTheme` evaluations; ensure no flicker or stale theme.
- Deeply nested `pushWebView` chain → confirm each screen pushes/pops cleanly without leaks.
