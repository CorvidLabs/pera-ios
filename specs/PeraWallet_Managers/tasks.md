# PeraWallet_Managers — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Normalize mobile API base URLs and remove the `removeTrailingSlash()` workaround +
      `FIXME` in `CoreApiManager.swift` (inconsistent trailing slashes across v1/v2 URLs).
- [ ] Reduce the legacy bridge surface (`Session`, `SharedDataController`, `AppDelegate.shared`,
      `LegacyBridgeAccountManager`) as ownership migrates into this layer.
- [ ] Consider making service state `Sendable`/actor-isolated as the codebase moves to strict
      concurrency; several services mutate Combine subjects off `@MainActor`.
- [ ] Backfill automated coverage for `CoreApiManager` URL building, status validation, empty-
      body handling, and `CancellableTasksManager` cancellation semantics.
- [ ] Make polling intervals (`InboxService` 6s) and block-follow backoff configurable / testable.

## Done
- [x] Async/await API client (`CoreApiManager`) with `Requestable`-driven requests and
      typed `ApiError`.
- [x] Network-aware service graph wired through `PeraCoreManager` + `NetworkConfigureable`.
- [x] Joint/multisig account create, sign, search, import-accept, and ignore flows.
- [x] Block-following, currency, NFD, and inbox-polling services with Combine outputs.
- [x] `syncJointAccountsAfterNetworkSwitch` skips legacy accounts lacking persisted
      threshold/version to avoid registering stale addresses.
- [x] Spec and companion files scaffolded, then enriched from source.
