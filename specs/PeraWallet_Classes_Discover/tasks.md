# PeraWallet_Classes_Discover — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] `DiscoverExternalInAppBrowserScreen` uses `[unowned self]` in several bar-button closures (close/reload/home/prev/next); audit for retain/lifetime safety vs. the `[weak self]` convention used elsewhere.
- [ ] The favorites cap (100) is hard-coded in `DiscoverDappDetailScreen.hasExceededFavouritesLimit()`; consider sourcing from config/core so it stays in sync with the favorites store.
- [ ] `DiscoverInAppBrowserScreen.viewWillAppear` re-applies theme via a fixed 1.0s `asyncAfter` delay to let the web app boot — fragile; investigate a readiness signal from the web content instead.
- [ ] `DiscoverURLGenerator` pins `version=5`; confirm this is still the contract expected by the current Discover web app.
- [ ] No dedicated unit tests found for `DiscoverSocialMediaRouter` / deeplink builders or `DiscoverURLGenerator` query construction; add coverage.

## Done
- [x] Spec and companion files scaffolded.
- [x] Spec Purpose/Invariants/Behavioral Examples/Error Cases/Dependencies rewritten from source.
- [x] Public API documented for `BrowserAuthorizedAddressEventHandler` (account-filtering/base64 injection contract).
- [x] Search flow (trending vs. keyword, throttling, pagination, error/not-found states) captured in spec.
