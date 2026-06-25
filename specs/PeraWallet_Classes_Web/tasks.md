# PeraWallet_Classes_Web — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] QR scanner silently ignores frames that fail to decode to
      `QRBackupParameters` (no user feedback) — consider a "not a Pera transfer
      QR" hint after repeated failures.
- [ ] `convertAccountParametersToTransferAccounts` catch path emits
      `.invalidPrivateKey` but then still falls through to `saveAccounts` /
      `completeImporting` with partial state — review whether import should abort
      cleanly on conversion failure.
- [ ] Backup fetch (`api?.fetchBackupDetail`) has no loading-timeout / retry UX
      beyond the Lottie spinner; confirm long-network behavior.
- [ ] `WebImportErrorViewModel` only special-cases `unsupportedVersion`; all other
      errors collapse to the same generic body — consider per-error copy
      (network vs decryption vs serialization).
- [ ] Reconcile the shared `ImportAccountScreen` HD-wallet branch with this
      coordinator's `fatalError("Shouldn't enter here")` guard (split screens or
      document the contract).

## Done
- [x] Web Wallet QR import flow implemented end-to-end (instruction → scan →
      import → success/error) via `AccountImportFlowCoordinator`.
- [x] On-device decryption of fetched backups via `Cryptor`/AlgoSDK.
- [x] Duplicate-account detection routes existing addresses to the
      missing-accounts summary instead of re-saving.
- [x] Unsupported version / action QR payloads routed to the error screen.
- [x] Spec and companion files scaffolded.
