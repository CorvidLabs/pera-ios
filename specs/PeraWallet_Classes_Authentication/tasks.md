# PeraWallet_Classes_Authentication — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Refactor watch-account error handling out of `WatchAccountAdditionViewController.performAddAccount` into the data controller (existing `<todo>` comment in source).
- [ ] Replace `assertionFailure`-only failure paths (HD wallet creation/address generation in `WelcomeViewController.createAccount`, `HDWalletSetupViewController.select/createAccount`, `PassphraseVerifyViewController.createAccount`) with user-facing error handling for release builds.
- [ ] Remove the hardcoded `"temp"` session-key staging pattern in favour of a typed staging abstraction so create/verify don't share a magic string.
- [ ] Review the `api!` / `session!` force-unwraps in `AccountRecoverViewController` and `PushNotificationController` construction for safer handling.
- [ ] Confirm BIP39 import-failure recovery (creating a fresh user + `launchMain`) is the intended UX when decryption fails mid-recover.

## Done
- [x] Spec and companion files scaffolded.
- [x] Documented onboarding flow model (`AccountSetupFlow` / `AccountSetupMode` / `WalletFlowType`) and per-screen behavior, error cases, and dependencies.
