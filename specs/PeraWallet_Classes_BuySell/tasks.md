# PeraWallet_Classes_BuySell — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Remove `MoonPayFlowCoordinator` after the routing refactor (in-source `<todo>`); it is currently an empty shell holding only the presenting screen.
- [ ] MoonPay `openMoonPay` swallows `.failure` from `getSignedMoonPayURL` silently — consider surfacing an error banner to the user.
- [ ] De-duplicate the three near-identical per-provider account-selection stacks (Meld / MoonPay / Bidali data sources, layouts, cells, headers) onto a shared generic component.
- [ ] Bidali `presentGenericErrorBanner` is defined but unused — wire it into payment/script error paths or remove it.
- [ ] MoonPay introduction registers the `didRedirectFromMoonPay` observer twice (`startObservingNotifications` and `setListeners`); confirm intentional or collapse to one.

## Done
- [x] Spec and companion files scaffolded.
- [x] Meld / MoonPay / Bidali flow coordinators implemented with optional account-selection step.
- [x] Bidali in-app browser balance bridge with `SharedDataController` sync implemented.
- [x] Network/availability gating implemented for MoonPay (TestNet block) and Bidali (production MainNet-only).
