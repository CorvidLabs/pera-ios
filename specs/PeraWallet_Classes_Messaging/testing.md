# PeraWallet_Classes_Messaging — Testing

## Automated
- Target: `algorand-tests/`. Add tests for service gating (flag off, watch-only account, empty input).

## Manual QA
- [ ] With flag on + a standard account, conversation list loads.
- [ ] Sending a message appears in the thread after reload.
- [ ] Watch-only account shows the no-signing-account error.

## Edge cases
- Empty/whitespace body; invalid peer address; transport/network failure.
