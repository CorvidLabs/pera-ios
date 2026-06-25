# API Module Requirements

## Overview

The API module provides the typed network layer for Pera Wallet, exposing
endpoint calls against the Algorand node (algod), indexer, and Pera mobile
backends, plus the request `Draft`/`Query` value types and network routing.

## User Stories

### Story 1: Fetch account state

**As a** wallet user
**I want** my account balances, assets, and transaction history loaded from the network
**So that** I can see an accurate, up-to-date view of my holdings.

**Acceptance Criteria:**
- [ ] `fetchAccount` returns account detail (including asset holdings) from the indexer.
- [ ] `fetchAccountFromNode` returns live account state from algod.
- [ ] `fetchTransactions` / `fetchTransactionsV2` return paged transaction history filtered by date, asset, and limit.
- [ ] Network failures are surfaced as `.failure` results, never crashes.

### Story 2: Submit transactions and swaps

**As a** wallet user
**I want** to broadcast signed transactions and execute asset swaps
**So that** I can move and trade my assets.

**Acceptance Criteria:**
- [ ] `sendTransaction` broadcasts a signed transaction and reports success or a typed error.
- [ ] `getSwapQuote` / `prepareSwapTransactions` produce a quote and an unsigned transaction group.
- [ ] `updateSwapStatus` reports the final swap outcome (including failure reason) to the backend.
- [ ] Suggested params are obtained via `getTransactionParams` before building a transaction.

### Story 3: Operate across mainnet and testnet

**As a** wallet user
**I want** the app to target the correct network
**So that** my requests are routed to mainnet or testnet consistently.

**Acceptance Criteria:**
- [ ] `setupNetworkBase` switches every subsequent request to the selected network.
- [ ] `network` and `isTestNet` reflect the active configuration.
- [ ] WalletConnect chain IDs/references are resolved per the active network.

## Non-Functional Requirements

- In-flight requests must be cancellable via the returned `EndpointOperatable`.
- Required headers (API key, modification, user-agent) are injected on every request by the interceptor.
- `Draft`/`Query` types perform no I/O and only encode request parameters.
