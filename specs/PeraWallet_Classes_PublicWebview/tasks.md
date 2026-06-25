# PeraWallet_Classes_PublicWebview — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Add user-facing error/empty state when `url` is `nil` or a page fails to load (currently a
      blank web view, since pull-to-refresh is disabled).
- [ ] Consider surfacing a manual reload affordance for failed loads (pull-to-refresh is off).
- [ ] Validate/allowlist URLs passed to `pushWebView` so only trusted Pera hosts can stack new
      public-webview screens.
- [ ] Revisit the hard-coded `1.0s` delay before the first `updateTheme` call in `viewWillAppear`
      (timing workaround; confirm it is still needed and not racy).
- [ ] Confirm whether `hideBackButtonInWebView` is actually consumed anywhere (declared but unused
      in this module).
- [ ] Add automated coverage for `handlePublicWebview` bridge dispatch (see testing.md).

## Done
- [x] Spec and companion files scaffolded.
- [x] Spec enriched with source-grounded Purpose, Invariants, Behavioral Examples, Error Cases,
      and Dependencies.
- [x] `PublicWebviewScreen` / `PublicWebviewInAppBrowserScreen` implemented over the shared
      `InAppBrowser` base, wired into `Router` via `Screen.publicWebview(url:)`.
- [x] Public JS bridge restricted to `getPublicSettings` (no address/signing/device-id surface).
