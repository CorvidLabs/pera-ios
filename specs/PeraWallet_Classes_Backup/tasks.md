# PeraWallet_Classes_Backup — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] `BackUpAccountSelectionListLayout` force-unwraps `itemDataSource.accountItems[item.accountAddress]!` when sizing an account cell — guard or fall back to a sample size to avoid a crash if the item map and snapshot ever drift out of sync.
- [ ] The cell-size cache (`sizeCache`) is keyed only by reuse identifier and never invalidated on trait/size-class change; revisit if Dynamic Type or rotation needs fresh measurement.
- [ ] `didBackUpAccount` notification is posted from outside this module (Tutorial flow). Confirm the producer always includes the `account` user-info key with an `Account` value; otherwise completion silently no-ops.
- [ ] No automated tests cover the `!isBackedUp` filter or the HD-vs-Algo25 tutorial branching; add coverage for `BackUpAccountSelectionListLocalDataController.load()` and `BackUpAccountFlowCoordinator.openIntroduction`.

## Done
- [x] Single- and multi-account launch overloads on `BackUpAccountFlowCoordinator`.
- [x] HD (BIP-39) vs Algo25 tutorial routing.
- [x] Diffable snapshot pipeline (loading / no-content / content) in the local data controller.
- [x] Single-shot `didBackUpAccount` observation with teardown in `deinit`.
- [x] Spec and companion files scaffolded.
