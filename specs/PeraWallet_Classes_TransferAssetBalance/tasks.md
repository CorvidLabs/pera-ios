# PeraWallet_Classes_TransferAssetBalance — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Confirm collectible vs fungible warning copy is correct in both flows (collectible opt-out via `CollectibleDetailViewController`, fungible removal via `ManageAssetListViewController`).
- [ ] Consider surfacing the actual remaining balance amount in the warning text (currently only asset/account names are interpolated into `asset-remove-warning`).
- [ ] Audit accessibility: copy-to-clipboard accessory on the asset-ID row has no visible label; verify VoiceOver announces the copy action.
- [ ] Verify the footer gradient `locations` array (`[0, 0.2, 1]`) matches the two-color `colors` array — there is a color/location count mismatch that may produce an unintended gradient stop.

## Done
- [x] Spec and companion files scaffolded.
- [x] Spec narrative, invariants, behavioral examples, error cases, and dependencies grounded in source (`TransferAssetBalanceScreen`, `TransferAssetBalanceViewModel`, `TransferAssetBalanceDraft`, `TransferAssetBalanceNameViewModel`).
- [x] Screen wired into `Screen.transferAssetBalance` routing case and `Router` instantiation.
- [x] Callers integrated: `OptOutAssetCoordinator`, `ASADiscoveryScreen`, `ManageAssetListViewController`, `CollectibleDetailViewController`.
