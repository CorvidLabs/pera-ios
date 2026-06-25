# AlgoChat integration & snapshot tests

Runnable, self-contained tests for the Messaging / AlgoChat feature. Standalone
SwiftPM package (not part of the Xcode app) so it runs with `swift test` without
the app build or the SPM-wiring blocker.

```bash
cd tools/AlgoChatTests
swift test
```

## Tests

- **`KeyDerivationSnapshotTests`** — snapshot (golden) tests of the **real**
  `MessagingKeyDerivation` (symlinked from `PeraWalletCore/Messaging/`). Locks the
  seed → messaging-address derivation so it can never silently drift (which would
  change every user's messaging identity). Runs anywhere; no network needed.

- **`LocalNetTests`** — end-to-end integration: derives two messaging identities
  via the real derivation, funds them from the LocalNet dispenser, publishes a
  key, sends an end-to-end-encrypted message on-chain, and asserts the recipient
  decrypts the original plaintext. **Auto-skips** when no AlgoKit LocalNet is
  reachable on `:4001`; start one with `algokit localnet start` to exercise it.

Last verified: 4 tests, 0 failures (LocalNet exchange ~9s).

> When the `swift-algochat` SPM package is wired into the Xcode project, these can
> be ported into `algorand-tests/` as native app-target tests.
