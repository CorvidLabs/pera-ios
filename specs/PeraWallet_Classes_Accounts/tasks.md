# PeraWallet_Classes_Accounts — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Refactor inline data-store retention / flow-coordinator construction in
      `AccountDetailViewController` and `HomeViewController` (multiple `// <todo>`
      markers: "we shouldn't retain data store or create flow coordinator here").
- [ ] Refactor `HomeViewController.selectedAccountHandle` workaround needed only
      for `ChoosePasswordViewControllerDelegate` (`// <todo>: Refactor`).
- [ ] Audit force-unwrapped dependencies (`api!`, `session!`, `bannerController!`,
      `loadingController!`) threaded through coordinators for safer optionals.
- [ ] Confirm `managementOptionsViewControllerDidTapFilterCollectibles` is meant
      to be a no-op (empty body) or wire up collectible filtering.
- [ ] Consider extending `RemoveAccountAuthorizationValidator` chain with
      additional validators (only `RemoveAuthAccountAuthorizationValidator` is
      currently in the chain).

## Done
- [x] Spec and companion files scaffolded.
- [x] Purpose / Invariants / Behavioral Examples / Error Cases / Dependencies
      rewritten from source (HomeViewController, AccountDetailViewController,
      AccountInformationFlowCoordinator, RemoveAccountFlowCoordinator,
      RemoveAuthAccountAuthorizationValidator, PassphraseDisplayViewController).
