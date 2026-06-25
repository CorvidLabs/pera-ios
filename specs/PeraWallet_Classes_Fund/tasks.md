# PeraWallet_Classes_Fund — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] `generateURL` silently returns `nil` when `fundBaseUrl` is malformed and the screen
      loads nothing — consider surfacing an error/empty state instead of a blank web view.
- [ ] The `enableTestXOSwapPage` `/test` override discards any deep-link `path`; confirm
      this is intended or guard the override to debug builds only.
- [ ] `notifyUser` ignores `.haptic` and `.sound` variants (empty `break`s); decide
      whether to implement or document them as no-ops.
- [ ] `updateTheme` is fired from a 1s `asyncAfter` in `viewWillAppear`; revisit the
      magic delay (race if the page loads slower than 1s).
- [ ] Add automated coverage for `FundURLGenerator` query-item assembly and the
      `/test` / deep-link-path branches.

## Done
- [x] Fund tab hosted as an in-app browser over `InAppBrowserScreen`.
- [x] JS ↔ native bridge wired via `handleFund` (`getAddresses`, `getSettings`,
      `pushWebView`, `openSystemBrowser`, `openNativeURI`, `notifyUser`,
      `logAnalyticsEvent`, `closeWebView`/`onBackPressed`).
- [x] Deep-link entry (`launchFundFromDeeplink`) and one-shot `selectedAddress` routing.
- [x] Theme and preferred-currency changes pushed into the page.
- [x] Spec and companion files scaffolded.
