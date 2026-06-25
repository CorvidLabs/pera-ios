# PeraWallet_Classes_Transactions — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] `TransactionsViewController.asset` is typed loosely — source `<todo>` notes it "should work with `Asset` type". Tighten the type.
- [ ] Reduce force-casts in `TransactionsViewController` cell handling (`cell as! LoadingCell`, `as! TransactionHistoryLoadingCell`, `as! PendingTransactionCell`) to safe casts.
- [ ] Force-unwrapped `api!` is used in several controllers (`TransactionsAPIDataController` init, `SendTransactionScreen.redirectToPreview`, `SendAssetInboxScreen.sendTransactionController`); thread a non-optional API or guard.
- [ ] Consolidate the per-type `*TransactionItemDraftComposer` and `*TransactionItemViewModel` families — there is heavy structural duplication across algo/asset/app-call/asset-config/key-reg.
- [ ] Confirm ARC-59 inbox app IDs/addresses (`AppEnvironment.*ARC59AppID/Address`) stay in sync between testnet and mainnet.

## Done
- [x] Spec and companion files scaffolded.
- [x] Purpose/Invariants/Behavioral Examples/Error Cases/Dependencies rewritten from source.
- [x] Send/list/detail flows mapped to their owning files.
