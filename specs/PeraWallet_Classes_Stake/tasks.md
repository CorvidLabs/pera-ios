# PeraWallet_Classes_Stake — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Add explicit error/empty-state handling when `StakingURLGenerator.generateURL` returns `nil` (currently loads a `nil` URL into the web view with no user feedback).
- [ ] Fix duplicate `currency` query item in `StakingURLGenerator.makeInHouseQueryItems` (the `currency` item is appended twice).
- [ ] Reconsider the 1.0s `asyncAfter` theme-sync hack in `viewWillAppear`; tie theme injection to a `didFinishNavigation` callback so `updateTheme` runs only after the web app is ready.
- [ ] `StakingScreen` carries an unused `theme` (`DiscoverHomeScreenTheme`) and an `isViewLayoutLoaded` flag with no effect — clean up or wire them in.
- [ ] Confirm `requestDeviceID`/`getDeviceId` and `openDappWebview` message contracts still match the deployed staking web app.

## Done
- [x] Spec and companion files scaffolded.
- [x] Documented module purpose, invariants, behavioral examples, error cases, and dependencies from source.
