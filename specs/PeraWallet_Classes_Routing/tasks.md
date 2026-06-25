# PeraWallet_Classes_Routing — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open

- [ ] Refactor the routing mechanism so a screen's `EventHandler` can be defined
      decoupled from the actual screen (in-source `<todo>` on `Screen.editSwapAmount`).
- [ ] Resolve deallocation of finished transitions held in `Router.ongoingTransitions`
      (in-source `<todo>`: "How to dealloc finished transitions?").
- [ ] Revisit lifetime of `ledgerConnectionScreen` / `signWithLedgerProcessScreen`
      retained on `Router` (in-source `<todo>`: "Change after refactoring routing").
- [ ] Consider relocating the WalletConnect sign-request draft structs
      (`WalletConnectTransactionSignRequestDraft` / `...ArbitraryDataSignRequestDraft`)
      out of `DeeplinkSource.swift` when the WalletConnect infrastructure is refactored
      (in-source `<todo>`).
- [ ] `Router.buildViewController(for:)` carries a `// swiftlint:disable function_body_length`;
      the giant `switch` is a candidate to split per feature area.
- [ ] Audit `AppEndpoint` query-param parsing for newer endpoints (swap/cards/staking)
      for missing-parameter handling parity with the older endpoints.

## Done

- [x] Spec and companion files scaffolded.
- [x] Centralized every navigable destination in the `Screen` enum and the
      single `Router.buildViewController(for:)` factory.
- [x] Added the app-endpoint deep-link family (`AppEndpoint` +
      `AppDeeplinkParser`) for `perawallet://app/...` URLs.
- [x] Typed deep-link error model (`DeepLinkParser.Error`) with localized
      `uiRepresentation`.
