# LiquidAuth — Requirements

## User Stories

- As a user, I can authenticate to a relying party using a passkey backed by my Algorand account.

## Acceptance Criteria

- [ ] Auth flow is gated behind the `liquidAuthEnabled` feature flag.
- [ ] Registration creates and persists a passkey; assertion reuses it.
