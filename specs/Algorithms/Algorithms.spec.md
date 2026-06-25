---
module: Algorithms
version: 1
status: active
files:
  - PeraWalletCore/Algorithms/AccountAscendingTitleAlgorithm.swift
  - PeraWalletCore/Algorithms/AccountAscendingTotalPortfolioValueAlgorithm.swift
  - PeraWalletCore/Algorithms/AccountAssetAscendingAmountAlgorithm.swift
  - PeraWalletCore/Algorithms/AccountAssetAscendingTitleAlgorithm.swift
  - PeraWalletCore/Algorithms/AccountAssetDescendingAmountAlgorithm.swift
  - PeraWalletCore/Algorithms/AccountAssetDescendingTitleAlgorithm.swift
  - PeraWalletCore/Algorithms/AccountAssetSortingAlgorithm.swift
  - PeraWalletCore/Algorithms/AccountCustomReorderingAlgorithm.swift
  - PeraWalletCore/Algorithms/AccountDescendingTitleAlgorithm.swift
  - PeraWalletCore/Algorithms/AccountDescendingTotalPortfolioValueAlgorithm.swift
  - PeraWalletCore/Algorithms/AccountListFilterAlgorithm.swift
  - PeraWalletCore/Algorithms/AccountSortingAlgorithm.swift
  - PeraWalletCore/Algorithms/AuthorizedAccountListFilterAlgorithm.swift
  - PeraWalletCore/Algorithms/CollectibleAscendingOptedInRoundAlgorithm.swift
  - PeraWalletCore/Algorithms/CollectibleAscendingTitleAlgorithm.swift
  - PeraWalletCore/Algorithms/CollectibleDescendingOptedInRoundAlgorithm.swift
  - PeraWalletCore/Algorithms/CollectibleDescendingTitleAlgorithm.swift
  - PeraWalletCore/Algorithms/CollectibleSortingAlgorithm.swift
  - PeraWalletCore/Algorithms/NonWatchAccountListFilterAlgorithm.swift
db_tables: []
depends_on:
  - specs/Demo/Demo.spec.md
  - specs/Models/Models.spec.md
---

# Algorithms

## Purpose

Provides the comparison and filtering strategies used to order and trim the lists shown across the wallet: accounts, account assets, and collectibles. Each algorithm conforms to a small sorting or filtering protocol that exposes a stable identity, a localized display name, and a `getFormula` predicate the caller plugs into `sort`/`filter`. The module owns only the ordering/inclusion rules; it does not fetch data or mutate the lists it ranks.

## Public API

| Export | Description |
|--------|-------------|
| `AccountAssetAscendingTitleAlgorithm` | Sorts an account's assets alphabetically A-to-Z by name, with favorited assets pinned first and ID as the tie-breaker. |
| `id` | Stable cache key string identifying the algorithm instance for persistence of the user's chosen sort. |
| `name` | Localized, user-facing display name of the sort/reorder option (e.g. "A to Z", "Manually"). |
| `getFormula` | Predicate comparing two elements (or testing one) that returns whether the first should be ordered before the second, or whether an item passes the filter. |
| `init` | Initializes an algorithm, seeding its `id`/`name` and any required collaborators (e.g. currency or exclusion list). |
| `AccountAssetSortingAlgorithm` | Protocol for ordering two `Asset` values within an account; requires `id`, `name`, and a `getFormula` comparator. |
| `AccountCustomReorderingAlgorithm` | Account sort that honors the user's manual ordering via each account's `preferredOrder`; marked `isCustom`. |
| `isCustom` | Flag indicating the account sort has no predefined formula and instead reflects the user's manual ordering. |
| `AccountDescendingTotalPortfolioValueAlgorithm` | Account sort ordering accounts by total portfolio value (highest to lowest) in the primary currency, with address as tie-breaker. |
| `currency` | Currency provider used to convert each account's portfolio into a comparable amount in the primary currency. |
| `AccountSortingAlgorithm` | Protocol for ordering two `AccountHandle` values; requires `id`, `name`, `isCustom`, and a `getFormula` comparator. |
| `AssetFilterAlgorithm` | Protocol for an inclusion predicate that decides whether a single `Asset` should be kept. |
| `AssetZeroBalanceFilterAlgorithm` | Asset filter that keeps only assets with a positive (non-zero) balance. |
| `AssetExcludeFilterAlgorithm` | Asset filter built from an excluded list, keeping assets that are not in that list. |
| `AssetVerifiedAndCategoryFilterAlgorithm` | Asset filter that keeps verified/trusted assets or assets in category 1. |
| `AuthorizedAccountListFilterAlgorithm` | Account-list filter keeping only authorized accounts (excludes non-authorized entries such as watch accounts). |
| `CollectibleDescendingOptedInRoundAlgorithm` | Collectible sort ordering newest to oldest by opted-in round; items missing a round are treated as not ordered ahead. |
| `CollectibleSortingAlgorithm` | Protocol for ordering two `CollectibleAsset` values; requires `id`, `name`, and a `getFormula` comparator. |

## Invariants

1. Every sorting algorithm exposes a stable, non-empty `id` used as a cache key and a localized `name` for display.
2. `getFormula` is a pure function of its inputs and produces no side effects on the elements it compares or tests.
3. Sorting comparators apply a deterministic tie-breaker (asset/account ID or address) so equal-ranked elements have a stable order.
4. Only `AccountSortingAlgorithm` carries `isCustom`; when `true` ordering is driven by the user's manual `preferredOrder` rather than a predefined formula.
5. Filter predicates decide inclusion of a single element and never reorder the collection.

## Behavioral Examples

### Scenario: Sort account assets alphabetically with favorites first
- **Given** two assets where one is favorited and the other is not
- **When** `AccountAssetAscendingTitleAlgorithm.getFormula(asset:otherAsset:)` is called
- **Then** the favorited asset is ordered first; otherwise the assets are compared case-insensitively by name, falling back to ID

### Scenario: Order accounts by portfolio value
- **Given** two accounts with different total portfolio values and a valid primary currency
- **When** `AccountDescendingTotalPortfolioValueAlgorithm.getFormula(account:otherAccount:)` is called
- **Then** the account with the higher converted value is ordered first, with address used as a tie-breaker

### Scenario: Keep only positive-balance assets
- **Given** an asset with a zero balance
- **When** `AssetZeroBalanceFilterAlgorithm.getFormula(asset:)` is called
- **Then** it returns `false`, excluding the asset from the filtered list

## Error Cases

| Condition | Behavior |
|-----------|----------|
| No primary currency value available in portfolio sort | `getFormula` returns `false` (no defined ordering) |
| Currency exchange/unwrap throws during portfolio sort | Falls back to comparing account addresses |
| Collectible missing an opted-in round | Treated as not ordered ahead; `getFormula` returns `false` |
| Asset name empty/nil during title sort | Substitutes the localized "Unknown" title before comparing |

## Dependencies

| Module | Usage |
|--------|-------|
| Foundation | Localized strings and case-insensitive string comparison |
| MacaroonUtils | `unwrapNonEmptyString()` helper for asset name normalization |
| Asset / CollectibleAsset | Domain models compared by the sorting/filtering predicates |
| AccountHandle | Account wrapper compared by account-sort and account-filter algorithms |
| CurrencyProvider / CurrencyExchanger / Portfolio | Convert account holdings into comparable primary-currency amounts |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
