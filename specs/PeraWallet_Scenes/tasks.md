# PeraWallet_Scenes — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as
discovered.

## Open
- [ ] Migrate `*ViewModel` types from `ObservableObject` to the `@Observable`
      macro once the minimum target reaches iOS 17+ (FIXME noted in
      `RecoveredAccountsListModel` and others).
- [ ] Reduce `configuration.api!` force-unwraps in `SwapViewController`
      (`makeSwapController`, `confirmSwap`) to align with no-force-unwrap rule.
- [ ] Audit the `fatalError` paths in `SwapViewController`
      (`createSwapView` "No account selected", `resolveDefaultAlgoAsset`) for
      graceful fallbacks.
- [ ] Confirm Add Account menu rows and badges stay in sync as new account
      types / feature flags are added.
- [ ] Verify joint-account sign-request state mapping (pending/submitting/
      confirmed/failed/expired/declined) stays aligned with backend statuses.

## Done
- [x] Add Account menu (incl. feature-flagged Add Joint Account, expand/collapse).
- [x] Create Joint Account wizard (accounts list → threshold → naming).
- [x] Inbox: joint-account import/sign requests + ASA inbox with read tracking.
- [x] Joint Account detail, pending-transaction overlay, transaction request
      summary with Ledger signing.
- [x] Recovered Accounts List for rekeyed-account selection.
- [x] Settings list (Account / App Preferences / Support) + Developer menu.
- [x] SwapV2 screen: quotes, providers, slippage, history, top pairs, confirm.
- [x] Spec and companion files scaffolded.
