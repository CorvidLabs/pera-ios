# Messaging — Requirements

## User Stories

- As a wallet user, I can send an end-to-end encrypted message to another Algorand address.
- As a user, I can see my conversations and read message history.

## Acceptance Criteria

- [ ] Messaging is gated behind the `enable_messaging` feature flag (default off).
- [ ] Only standard HD-wallet accounts can send/receive.
- [ ] Message bodies are end-to-end encrypted; plaintext never leaves the device.
