# PeraWallet_Classes_Application — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Implement a `Migrator`/`Migration` protocol so migrations run through a single pipeline instead of ad-hoc calls in `runMigrations` (in-source `<todo>`).
- [ ] Replace `fatalError` on app-group migration / Core Data init failure with a user-visible error page (in-source TODOs in `runMigrations` and `createAppConfiguration`).
- [ ] Investigate and remove the ~1s WC-URI delay HACK in `application(_:open:)` (sign sheet not appearing when launched from background).
- [ ] Refactor routing so `TabBarController` no longer retains `analytics`/`api` or hosts Swap/Fund/Discover launchers (in-source `<todo>`).
- [ ] Address `setNeedsTabBarAppearanceUpdateOnAppearing` causing nav-bar title flashing when cancelling back-swipe (in-source `<todo>` in `BaseViewController`).
- [ ] Force-unwraps of `window!` in `BlockingLoadingController`/`ToastPresentationController`/`BannerController` factories — guard or restructure.

## Done
- [x] Composition root assembles `AppConfiguration` and publishes `CoreAppConfiguration.shared`.
- [x] WC v1 + v2 request validation/forwarding/rejection gateway in `RootViewController+WalletConnect`.
- [x] Lazy tab construction (Home/Discover/Swap/Fund/Menu) with Discover network/build gating.
- [x] Deeplink / universal-link / QR / push / quick-action dispatch into `AppLaunchController`.
- [x] Testnet network banner + privacy blur overlay on background.
- [x] Spec and companion files filled with source-grounded content.
