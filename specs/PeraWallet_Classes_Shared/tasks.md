# PeraWallet_Classes_Shared — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Refactor `ChoosePasswordViewModel` — marked `// <todo> Refactor`; the view-model mutates view state directly (reaches into `passwordInputCircleViews`) instead of exposing a bindable model.
- [ ] Refactor `AlertScreen` — marked `// <todo> Refactor when UISheetActionScreen is refactored`.
- [ ] Add automated coverage for the `QRResolverManager` chain ordering (WalletConnect → … → Address) and the no-match `.jsonSerialization` fallback; today only `QRTextTests` / `DeeplinkQRTests` exist at the model level.
- [ ] `OptOutAssetCoordinator` has `clearData()`/state (`selectedAccount`) reset paths spread across delegate callbacks; consolidate teardown to avoid leaking monitoring registrations on edge-case failures.
- [ ] Consider extracting the many `*Theme` structs into the shared design-system layer so tokens (`Colors`, `Fonts`, corner radii) are defined once rather than per component.

## Done
- [x] Spec and companion files scaffolded.
- [x] QR resolution implemented as an ordered chain-of-responsibility (`QRResolverManager`).
- [x] Shared component triad (View + ViewModel + Theme) established across buttons, inputs, list/preview cells, and empty/loading/error states.
- [x] Opt-out flow (`OptOutAssetCoordinator`) wired for standard, Ledger, and joint-account signing with blockchain opt-out monitoring.
