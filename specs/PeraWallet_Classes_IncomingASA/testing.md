# PeraWallet_Classes_IncomingASA — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- No module-specific unit tests currently exist for the Incoming ASA inbox. Highest-value gaps to add (see tasks.md):
  - ARC-59 claim vs. reject compose selection and network-based app-ID selection in `IncomingASATransactionController`.
  - Insufficient-Algo guards (`hasInsufficientAlgoForClaiming`/`Rejecting`) preventing submission.
  - `IncomingASAAccountInboxAPIDataController` snapshot building: loading → assets, `requestsCount == 0` → empty, and cursor paging.

## Manual QA checklist

Inbox / list:
- [ ] Open the inbox; assets with pending incoming requests render with sender info and amounts.
- [ ] Empty state shows when there are no pending requests (`requestsCount == 0`).
- [ ] Loading shimmer appears while `fetchIncomingASAsRequest` is in flight and clears on data.
- [ ] Long-press an asset → "Copy asset ID" context menu copies the ID.
- [ ] Info bar button presents the inbox info sheet; close dismisses it.
- [ ] Joint-account invite / sign-request / pending-transaction rows route to the correct overlays.

Claim:
- [ ] Tap an asset → detail screen shows asset, sender(s), request id, account portfolio, and Algo gain on claim.
- [ ] Claim a not-yet-opted-in asset → opt-in + claim group submits; loading → success; "View transaction" opens Pera Explorer on the correct network.
- [ ] Claim an already-opted-in asset → claim succeeds without a duplicate opt-in.
- [ ] On success, the screen dismisses and the wallet reflects the claimed asset.

Reject:
- [ ] Tap secondary action → reject confirmation sheet shows the Algo gain on reject.
- [ ] Confirm reject → reject group submits; success returns the asset to the sender.
- [ ] Cancel in the sheet → no transaction is submitted.

Signing paths:
- [ ] Standard (Algo25) account claim/reject signs and uploads.
- [ ] HD-wallet account (and rekeyed-to-HD auth account) claim/reject signs and uploads.
- [ ] Ledger account: BLE connection screen appears, approval is requested, progress advances per signed transaction, and a 50s timeout surfaces a connection error.

## Edge cases

- [ ] Insufficient Algo for claim → min-balance error banner, no submission.
- [ ] Insufficient Algo for reject → min-balance error banner, no submission.
- [ ] Multi-transaction ARC-59 group: upload happens only after *all* transactions are signed.
- [ ] API fetch failure → error banner with API description; list does not crash.
- [ ] SDK compose returns nil → SDK error banner, flow stops cleanly.
- [ ] Ledger cancel / closed-app / address-mismatch each show the matching BLE error and reset the ledger operation.
- [ ] Collectible (NFT) incoming asset renders via the collectible view model path.
- [ ] Navigating away from the accounts list marks inbox messages as read (on `deinit`).
