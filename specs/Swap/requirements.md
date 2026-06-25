# Swap — Requirements

## User Stories

### Story 1: Sign a swap
**As a** wallet user swapping one asset for another,
**I want** the swap transactions to be signed with my account's key,
**so that** the swap can be submitted to the network on my behalf.

**Acceptance Criteria:**
- Given a swap quote that produces one or more transaction groups, when I confirm the swap, then every unsigned transaction in those groups is signed.
- Given a Ledger-backed account, when signing proceeds, then transactions are signed one at a time and the UI is notified of each Ledger approval step.
- Given any signing failure, when it occurs, then a typed error event is surfaced to the UI rather than silently completing.
- Given all transactions are signed, when signing finishes, then a single completion event delivers the upload-ready transaction data.

### Story 2: Track swap confirmation
**As a** wallet user who submitted a swap,
**I want** to know when the swap has confirmed or failed on chain,
**so that** I can see an accurate result instead of an indefinite spinner.

**Acceptance Criteria:**
- Given a submitted transaction id, when monitoring starts, then the transaction pool is polled until a terminal status is reached.
- Given the transaction confirms, when the pool reports completion, then a completion event is emitted and polling stops.
- Given the transaction does not confirm within the polling limit, when the limit is reached, then a failure event is emitted and polling stops.
- Given a transient not-found response, when it occurs before the polling limit, then monitoring continues without emitting a failure.

### Story 3: Read swap amounts
**As a** wallet user viewing a swap,
**I want** asset amounts and names shown in a readable, correctly scaled form,
**so that** I can understand exactly what I am swapping.

**Acceptance Criteria:**
- Given an asset, when its display name is requested, then the unit name is preferred, then the name, then the id.
- Given a raw on-chain amount, when formatted, then it is scaled by the asset's decimals before display.
