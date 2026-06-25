# PeraWallet_Classes_BuySell — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Run via the Xcode test action (see `BUILDING.md`).
- Note: this module is UI/coordinator-heavy with external web/deep-link dependencies; most coverage is manual. Pure value types worth unit-testing in isolation: `MeldConfig` URL construction, `MoonPayDraft.hasValidAddress()`, and `MoonPayParams` parsing.

## Manual QA checklist

### Entry / options sheet
- [ ] Quick action opens `BuySellOptionsScreen` showing a Buy section (Meld) and a Sell section (Bidali gift cards).
- [ ] Tapping each option fires the correct `buyCryptoSelected` analytics event and routes to the right provider flow.

### Buy → Meld
- [ ] Launching with a pre-selected account opens the Meld URL directly (no picker).
- [ ] Launching with no account shows the account picker; selecting one opens Meld seeded with that address and dismisses the picker.

### Buy → MoonPay
- [ ] Intro screen renders illustration, title, body, and the secured-by payment badges (mastercard/visa/apple).
- [ ] On TestNet, primary action shows the "not available" alert and does NOT open MoonPay.
- [ ] On MainNet with a valid address, primary action shows the loading indicator, fetches the signed URL, and opens MoonPay.
- [ ] Returning via deep link shows the transaction-status sheet with the correct status (completed/pending/failed/waiting...).
- [ ] A redirect missing `MoonPayParams` triggers the failed-transaction path.

### Sell → Bidali
- [ ] Intro screen renders correctly; close button dismisses.
- [ ] Store/MainNet: Bidali available; TestNet store build shows the "not available" alert.
- [ ] Staging build: Bidali available on any network.
- [ ] Account picker excludes joint accounts and non-authorized accounts; empty result shows no-content state.
- [ ] In-app browser loads the Bidali web app with the selected account's balances bridged in.
- [ ] Changing balances (e.g. receive ALGO/USDC/USDT) updates the in-browser balance object live.
- [ ] Swipe-to-dismiss during a payment cancels the in-progress payment.

## Edge cases

- Malformed Meld/Bidali config URL → flow returns early, nothing opens.
- Account becomes unavailable mid-flow (`isAvailable` false) → balance refresh from `SharedDataController` is skipped.
- USDC/USDT not held by the account → balances bridged as `nil` for those currencies.
- Bidali balance JSON encoding failure → balance script injection/update is silently skipped.
- MoonPay loading indicator must always be stopped on both success and failure responses.
