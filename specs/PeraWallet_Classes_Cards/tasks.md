# PeraWallet_Classes_Cards — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Wire up the menu entry point: `MenuViewController.didSelectItemAt` for `.cards` currently only `print("cards pressed")` — it should invoke `CardsFlowCoordinator.launch()` (or equivalent routing).
- [ ] Remove the unused `theme`/`isViewLayoutLoaded` scaffolding in `CardsScreen` if it stays a no-op, or use it for the intended layout-once behavior.
- [ ] Confirm the `viewWillAppear` ~1s deferred `updateTheme(...)` is the right approach vs. waiting on the web app's ready signal (timing hack).
- [ ] Add automated coverage for `CardsURLGenerator` query-item construction and the `.other(path: nil)` -> `nil` URL path.
- [ ] Validate behavior when `session?.preferredCurrencyID` / locale language/region are unavailable (currently passed as possibly-nil query values).

## Done
- [x] `CardsFlowCoordinator.launch()` presents Cards full-screen without a navigation controller.
- [x] `CardsInAppBrowserScreen` reloads the cards URL on `destination` change, `viewDidLoad`, and pull-to-refresh.
- [x] Theme sync wired to `viewWillAppear`, `preferredUserInterfaceStyleDidChange`, and app-became-active.
- [x] Bridge messages (`getAuthorizedAddresses`, `openSystemBrowser`, `closePeraCards`, `peraconnect`, `getDeviceId`) dispatched via `handleCards`.
- [x] Spec and companion files scaffolded.
