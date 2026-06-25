# Demo — Requirements

## Overview

The Demo module is the shared-data layer of Pera Wallet. It owns the in-memory
account and asset-detail collections, polls the chain for block updates, exchanges
balances into the user's preferred currency, tracks pending opt-in / opt-out /
pure-collectible-send blockchain operations, and gates the app behind
authentication / authorization checks.

## User Stories

### Story 1: View an up-to-date portfolio

**As** a wallet user
**I want** my accounts and their balances kept current and converted to my chosen currency
**So that** the dashboard always reflects my real holdings.

**Acceptance Criteria**
- The shared data controller starts polling whenever at least one local account exists.
- Account values are exposed as `AccountHandle`s whose `isAvailable` is true only when fully fetched.
- Portfolio totals are exchanged into the preferred currency via `CurrencyExchanger`.
- Observers are notified on the main thread when running state changes.

### Story 2: Track pending asset operations

**As** a wallet user
**I want** my pending opt-in, opt-out, and collectible-send actions remembered
**So that** the UI shows them as pending until they are confirmed on chain.

**Acceptance Criteria**
- Starting an opt-in/opt-out/send registers a pending update keyed by account address and asset ID.
- Pending updates are filterable per account and in aggregate.
- Confirmed updates transition pending -> waiting-for-notification -> completed, and completed updates can be pruned.

### Story 3: Re-authenticate after inactivity

**As** a wallet user with a passcode
**I want** the app to require my passcode again after a period of inactivity
**So that** my funds stay protected if I leave the app open.

**Acceptance Criteria**
- `AppAuthChecker.launch` resolves the initial status from the session's authentication / password state.
- After `resignActive`, re-entering the app re-requires authorization once the inactive session expiration duration has elapsed.
- `authorize` clears the inactivity timer and marks the app ready.
