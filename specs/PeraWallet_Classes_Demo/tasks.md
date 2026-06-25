# PeraWallet_Classes_Demo — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open

Inferred from in-source `<todo>` / `<note>` markers:

- [ ] Routing refactor: remove the standalone flow coordinators
  (`SendTransactionFlowCoordinator`, `ScanQRFlowCoordinator`) once the app has a
  proper router — both are explicitly marked `/// <todo> This should be removed
  after the routing refactor.`
- [ ] `ScanQRFlowCoordinator` opt-in error handling is centralized; split it so
  each transaction type handles its own errors (`<todo>` markers in the file).
- [ ] `ALGAppLaunchController.prepareForLaunch`: `session.authenticatedUser` is
  decoded on every getter call — cache it (`<todo>` in source).
- [ ] `AlertPresenter.canDisplayItem`: rename the
  `isPresentingScreenPushedViewController` check for clarity (`<todo>`).
- [ ] Rename the legacy `Demo` directory to reflect that it holds app launch +
  Home-tab infrastructure (the file headers already use real names like
  `AppLaunchController.swift`, `AccountsPortfolioDataSource.swift`).
- [ ] Audit deeplink `DeeplinkSource` cases vs. `Screen` router coverage as new
  surfaces (cards, staking) are added.

## Done

- [x] App launch state machine (onboarding/authorization/main) with first-launch
  interruption handling and `ALGAppLaunchStore` open-count tracking.
- [x] Pending-deeplink suspend/resume/cancel via atomic slot.
- [x] Home diffable data source with portfolio, charts, announcement, carousel
  banner, and accounts sections.
- [x] Quick-action coordinators (send / receive / scan QR) and the transaction
  options bottom sheet view models.
- [x] Shared UI controllers: toast, copy-to-clipboard, alert presenter,
  UISheet, user-interface-style controller.
- [x] Spec and companion files scaffolded.
