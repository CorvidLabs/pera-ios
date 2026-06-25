# PeraWallet_Classes_Transactions — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Directly relevant suites:
  - `algorand-tests/Transactions/TransactionFeeCalculatorTests.swift`
  - `algorand-tests/Models/Transaction/TransactionTests.swift`, `PaymentTests.swift`, `Params/TransactionParamsTests.swift`
  - `algorand-tests/HDWallet/Transaction/HDWalletTransactionSignerTests.swift`
- Mocks for UI-level testing: `algorand-tests/Mock/MockSharedDataController.swift`, `AccountServiceMock.swift`.
- Most of this module is view/view-model/data-controller code without dedicated XCUI coverage, so the manual checklist below is the primary guard.
- Run via the Xcode test action (see `BUILDING.md`).

## Manual QA checklist

### Send flow
- [ ] Enter an amount with the numpad; verify live fiat conversion and decimal-separator/fraction limits.
- [ ] Tap MAX for algo and for an asset; confirm the correct max amount and that the participation-key warning appears for participation accounts.
- [ ] Add/edit/show a note (including a locked note from a draft).
- [ ] Send to a known authorized account, a contact, and an external address.
- [ ] Send an asset to a receiver that has NOT opted in → ARC-59 asset inbox screen appears for external addresses; opt-in info screen / continue path for authorized local accounts.
- [ ] First-ever send shows the transaction tutorial once; the info bar button re-opens it.
- [ ] Trigger insufficient/min-balance and verify the warning sheet and "continue with adjusted amount" path.

### History/list flow
- [ ] Open account and per-asset history; scroll to trigger pagination (next-list loading cell).
- [ ] Pending transactions animate and poll; polling stops when leaving the screen.
- [ ] Apply each filter option, including a custom date range with a future end date (polling should stop).
- [ ] Export/share history; verify share sheet on success and error banner on failure.
- [ ] Toggle privacy mode and confirm amounts mask/unmask across rows.

### Detail flow
- [ ] Tap algo, asset, app-call, asset-config, and key-reg rows → each opens its matching detail screen.
- [ ] App-call detail shows foreign assets and drills into inner transactions.
- [ ] Copy address (long-press) and open the Pera Explorer link (testnet vs mainnet URL).

## Edge cases

- Force-cast cells (`as! LoadingCell`, etc.) — verify mixed cell types never reach the wrong branch.
- `api!` force-unwraps in send/list controllers — confirm the API is always configured before these screens are reachable.
- Transaction params fetch failure mid-send (error banner, send blocked).
- App-call row that is not yet a `TransactionV2` (lazy v2 detail load before presenting).
- Same-account send / close-to-same-account rejection.
- Zero/reset amount state vs. explicit `0` entry (delete-button visibility, `isAmountResetted`).
