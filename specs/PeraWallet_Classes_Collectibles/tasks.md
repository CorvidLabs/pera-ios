# PeraWallet_Classes_Collectibles — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Refactor send-transaction recreation out of `SendCollectibleViewController` — see in-file `<todo>`: "Recreating of the transaction should be refactored when the transaction structure is changed so that it can be separated from the view controller" (`isRecreatingTransaction`).
- [ ] Remove `fatalError("API should be set.")` / `configuration.api!` force-unwraps in `CollectibleDetailViewController` and `SendCollectibleViewController`; thread the API dependency non-optionally instead.
- [ ] Audit `as!` downcasts in `CollectibleDetailViewController.collectionView(_:willDisplay:forItemAt:)` (cell casts) for safer handling.
- [ ] Verify the grid⇄list layout switch's `canPerformUpdates` gating against rapid toggling / mid-fetch snapshot application.
- [ ] Confirm all media types (image, video, audio, GIF, WebP, 3D) have coverage in the full-screen and copy/save paths.

## Done
- [x] Spec and companion files scaffolded.
- [x] Spec narrative (Purpose, Invariants, Behavioral Examples, Error Cases, Dependencies) grounded in source.
- [x] List/Detail/Receive/Send/Filter/FullScreen/3DCard flows documented.
