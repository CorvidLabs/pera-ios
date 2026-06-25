# Algorithms — Requirements

## Overview

The Algorithms module supplies the ordering and filtering strategies that drive how
accounts, account assets, and collectibles are presented throughout the wallet. Each
strategy is a small, pure predicate that callers plug into standard `sort`/`filter`
operations.

## User Stories

### Story 1: Choose how my accounts are ordered
As a wallet user, I want to order my account list by manual order or by total portfolio
value, so that the accounts most relevant to me appear first.

**Acceptance Criteria**
- [ ] A "Manually" option orders accounts by their saved `preferredOrder`.
- [ ] A "Highest value to lowest" option orders accounts by total portfolio value in my
      primary currency.
- [ ] When two accounts rank equally, their order is stable (tie-broken by address).
- [ ] Each ordering option exposes a stable identity so my choice can be persisted.

### Story 2: Sort and filter my assets and collectibles
As a wallet user, I want assets sorted alphabetically with my favorites first, and I want
to hide zero-balance or excluded assets, so that the list is clean and useful.

**Acceptance Criteria**
- [ ] Assets can be sorted alphabetically A-to-Z by name with favorited assets pinned first.
- [ ] A zero-balance filter keeps only assets with a positive balance.
- [ ] An exclude filter removes assets present in a provided exclusion list.
- [ ] Collectibles can be ordered newest-to-oldest by opted-in round.

### Story 3: Restrict account lists to relevant accounts
As a feature developer, I want to filter the account list to only authorized (non-watch)
accounts, so that flows requiring signing show only usable accounts.

**Acceptance Criteria**
- [ ] An authorized-account filter keeps only accounts that are authorized.
- [ ] Filter predicates only decide inclusion and never reorder the collection.
