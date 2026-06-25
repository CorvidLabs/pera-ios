# PeraWallet_Managers — Context

## Overview

Modern networking + domain-services layer under `PeraWallet/Managers`. It is the async/await
backbone the app uses to reach Algorand algod/indexer and Pera's mobile backend, and to expose
reactive account / currency / inbox state to the UI. The authoritative contract is
`PeraWallet_Managers.spec.md`; the source files it covers are listed in that spec's `files:`
frontmatter.

## Architecture

- **Pattern:** protocol-oriented services with Combine outputs (not MVVM/coordinators — there
  are no view controllers here). Services own private subjects and publish read-only views.
- **Singleton root:** `PeraCoreManager.shared` (`CoreServiceable`) lazily builds and wires the
  service graph and holds the current `network`. Bridges to the legacy stack via
  `legacySessionManager`, `legacySharedDataController`, `legacyFeatureFlagService`.
- **API client:** generic `Requestable`/`QueryRequestable`/`BodyRequestable` protocols decoded
  by `CoreApiManager` (per-endpoint JSON key strategies). Endpoint wrappers: `AlgodApiManager`,
  `IndexerApiManager`, `MobileApiManager`. `BaseURL` resolves URLs from `AppEnvironment`.
- **Concurrency:** `CancellableTasksManager` (actor) tracks in-flight `Task`s by `UUID`;
  changing a manager's `baseURL` cancels them all. Reactive loops (`BlockchainService` block
  following, `InboxService` 6s polling) self-reschedule on success and failure.
- **Data flow:** new algod block -> `AccountsService` (indexer balances) + `CurrencyService`
  (fiat rate); account set change -> `InboxService` re-fetch.

## Key files

- `Core/PeraCoreManager.swift` — service graph root + network propagation.
- `Core/Services/AccountsService.swift` — account set, joint/multisig create/sign/search.
- `Core/Services/BlockchainService.swift` — algod block-following loop.
- `Core/Services/CurrencyService.swift` — fiat exchange rate + formatting.
- `Core/Services/InboxService.swift` — joint-account import/sign + ASA inbox polling.
- `Core/Services/NFDService.swift` — name-service (NFD) lookups.
- `Core/Data Providers/AccountDataProvider.swift` — account-type / authorization classification.
- `Core/Services/Data Types/PeraAccount.swift` — published account model + types.
- `API/CoreApiManager.swift` — generic HTTP client, `ApiError`, `BaseURL` resolution.
- `API/API Services/{Algod,Indexer,Mobile}/…` — endpoint managers, requests, response objects.
- `Tasks Manager/CancellableTasksManager.swift` — `UUID`-keyed cancellable task actor.

## Architectural decisions

- One-directional state: services expose `ReadOnlyPublisher`; UI observes, never mutates.
- Network is owned solely by `PeraCoreManager` and fanned out via `NetworkConfigureable`;
  switching network must cancel requests and clear state so no cross-network data leaks.
- Indexer 404 is modeled as a zero-balance account, not an error.
- Joint-account / inbox surface is feature-flag gated (`jointAccountEnabled`).
- Deliberate legacy bridge: persistence and the authenticated user still live in `Session` /
  `SharedDataController`; this layer adds accounts via `LegacyBridgeAccountManager`.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.

## Known follow-ups / debt

- `CoreApiManager` has a `FIXME` about inconsistent trailing slashes on mobile API URLs
  (`removeTrailingSlash` workaround should be deleted once URLs are normalized).
