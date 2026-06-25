---
module: PeraWallet_Managers
version: 1
status: active
files:
  - PeraWallet/Managers/API/API Services/Algod/AlgodApiManager.swift
  - PeraWallet/Managers/API/API Services/Algod/Requests/Algod/WaitForBlockRequest.swift
  - PeraWallet/Managers/API/API Services/Indexer/IndexerApiManager.swift
  - PeraWallet/Managers/API/API Services/Indexer/Requests/AccountRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/ASAInboxMeta.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/JointAccountDetailRequestResponse.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/JointAccountSignRequestResponse.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/JointAccountTransactionStatus.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/MultiSigAccountObject.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/SignRequestObject.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/SignRequestStatus.swift
  - PeraWallet/Managers/API/API Services/Mobile/MobileApiManager.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/CancelJointAccountAccountImportRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/CreateJointAccountRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/CurrencyDataRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/InboxCreateRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/JointAccountDetailRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/JointAccountSignRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/JointAccountsSignRequestSearchRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/NameServiceSearchRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/ProposeSignRequest.swift
  - PeraWallet/Managers/API/CoreApiManager.swift
  - PeraWallet/Managers/API/Data Types/APICodingKey.swift
  - PeraWallet/Managers/API/Data Types/EmptyResponse.swift
  - PeraWallet/Managers/API/Enums/RequestMethod.swift
  - PeraWallet/Managers/API/Protocols/BodyRequestable.swift
  - PeraWallet/Managers/API/Protocols/QueryRequestable.swift
  - PeraWallet/Managers/API/Protocols/Requestable.swift
  - PeraWallet/Managers/Core/Data Providers/AccountDataProvider.swift
  - PeraWallet/Managers/Core/Data Providers/ContactDataProvider.swift
  - PeraWallet/Managers/Core/Formatters/AccountNameFormatter.swift
  - PeraWallet/Managers/Core/PeraCoreManager.swift
  - PeraWallet/Managers/Core/Services/AccountsService.swift
  - PeraWallet/Managers/Core/Services/BlockchainService.swift
  - PeraWallet/Managers/Core/Services/CurrencyService.swift
  - PeraWallet/Managers/Core/Services/Data Types/NonFungibleDomainData.swift
  - PeraWallet/Managers/Core/Services/Data Types/PeraAccount.swift
  - PeraWallet/Managers/Core/Services/InboxService.swift
  - PeraWallet/Managers/Core/Services/NFDService.swift
  - PeraWallet/Managers/Core/Services/Protocols/NetworkConfigureable.swift
  - PeraWallet/Managers/Tasks Manager/CancellableTask.swift
  - PeraWallet/Managers/Tasks Manager/CancellableTasksManager.swift
db_tables: []
depends_on: []
---

# PeraWallet_Managers

## Purpose

App-target networking and domain-services layer (`PeraWallet/Managers`). This is the
modern (async/await) backbone the rest of the app uses to talk to Algorand
infrastructure and Pera's mobile backend, and to expose reactive account/currency/inbox
state to the UI. It has three concerns:

- **API layer** (`API/`): a generic, `Requestable`-driven HTTP client. `CoreApiManager`
  builds URLs/requests, encodes/decodes JSON (per-endpoint key strategies), validates
  HTTP status codes, and tracks every in-flight request through a `CancellableTasksManager`
  so requests can be cancelled when the network or base URL changes. Endpoint-specific
  managers wrap it: `AlgodApiManager` (algod node — block following), `IndexerApiManager`
  (account lookups), and `MobileApiManager` (Pera backend — currency rates, NFD/name
  service, ASA inbox, and joint/multisig account create/sign/search flows). `BaseURL`
  resolves mainnet/testnet algod, indexer, and mobile v1/v2 endpoints from `AppEnvironment`.
- **Core services** (`Core/`): `PeraCoreManager` is the shared singleton that owns the
  service graph and the current `network` (mainNet/testNet). It lazily constructs and wires
  `AccountsService`, `BlockchainService`, `CurrencyService`, `NonFungibleDomainService`, and
  `InboxService`, all behind protocols. Services expose state via Combine
  `ReadOnlyPublisher`s. `BlockchainService` long-polls algod for new rounds; new blocks
  drive `AccountsService` (re-fetch balances/types via indexer) and `CurrencyService`
  (re-fetch fiat exchange rate). `InboxService` polls the mobile backend every 6s for
  pending joint-account import requests, joint-account sign requests, and ASA inboxes.
- **Tasks manager** (`Tasks Manager/`): `CancellableTasksManager`, an actor keying `Task`s by
  `UUID` for bulk cancellation, used by the API client and inbox polling loop.

Ownership boundary: this module owns the networking/service plumbing and the
`PeraAccount`/`CurrencyData`/joint-account data model. It bridges to the legacy stack
(`Session`, `SharedDataController`, `FeatureFlagServicing`, `Account`/`AccountInformation`,
`AppDelegate`) rather than replacing it; the legacy controllers still own persistence and the
authenticated user. Domain models (`PeraAccount`, etc.) come from `pera_wallet_core`.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.
2. `PeraCoreManager.shared` is the single source of the current `network`. Setting `network`
   propagates to every service conforming to `NetworkConfigureable`; each service in turn
   resets its endpoint managers and clears stale state (account set, currency data, last
   block number, inbox). Switching network must never leave mainnet data visible on testnet.
3. Every request goes through `CoreApiManager.perform`, which registers the `Task` with a
   `CancellableTasksManager` and removes it on completion. Changing a manager's `baseURL`
   cancels all in-flight requests, so a network switch cannot deliver responses for the old
   network.
4. Service state is published one-directionally: services expose `ReadOnlyPublisher`s /
   `AnyPublisher`s; mutation happens only inside the owning service via private
   `CurrentValueSubject`/`PassthroughSubject`. UI consumers observe, never write.
5. `BlockchainService` block-following and `InboxService` polling are self-rescheduling loops:
   a failed request emits on the error publisher and then re-arms the next poll, so transient
   network failures never permanently stop the loop.
6. Joint-account/inbox features are feature-flag gated (`jointAccountEnabled`): when disabled,
   `InboxService` clears and never surfaces joint-account import/sign requests, and
   `AccountDataProvider` does not classify accounts as `.joint`.

## Behavioral Examples

### Scenario: New block triggers account and currency refresh
- **Given** `PeraCoreManager.shared` has wired its services and `BlockchainService` is
  long-polling algod via `WaitForBlockRequest`
- **When** algod returns a new `lastRound`
- **Then** `BlockchainService.lastBlockNumber` publishes the new round, which fires
  `AccountsService.fetchAccounts` (indexer lookup per local account, 404 treated as a
  zero-balance account) and `CurrencyService.fetchCurrency`, updating the published
  `accounts` set and `selectedCurrencyData`

### Scenario: Accepting a joint-account import request from the inbox
- **Given** `InboxService` is polling the mobile backend (every 6s) and surfaces a pending
  `MultiSigAccountObject` in `jointAccountImportRequests` (feature flag `jointAccountEnabled`
  on)
- **When** the user accepts it and `acceptAccountImportRequest(jointAccountAddress:name:)` is
  called
- **Then** `AccountsService.createJointAccount` registers the multisig with the mobile backend
  and adds it as a local account via the legacy bridge, the import request is cancelled on the
  backend, and the inbox is re-fetched immediately so the request disappears

### Scenario: Network switch from mainnet to testnet
- **Given** services are running on `.mainNet` with populated account/currency/inbox state
- **When** `PeraCoreManager.shared.network` is set to `.testNet`
- **Then** every `NetworkConfigureable` service points its endpoint managers at testnet,
  in-flight requests are cancelled, published state is cleared (accounts emptied, currency
  nil, block number 0), and joint accounts are re-registered on testnet via
  `syncJointAccountsAfterNetworkSwitch`

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Base URL missing / unresolvable from `AppEnvironment` | `CoreApiManager` throws `ApiError.invalidBaseUrl` (or `.cantGenerateUrlFromComponents`) before any network call |
| Request body fails to encode | Throws `ApiError.unableToEncodeBody(error:)` |
| Non-2xx HTTP response | Throws `ApiError.invalidHTTPStatusCode(code:description:)`; body string is captured for diagnostics |
| Indexer returns 404 for an account | `AccountsService.fetchAccounts` treats it as a valid account with amount `0.0` (not an error) |
| `URLSession` task cancelled (e.g. network switch / base URL change) | Mapped to `ApiError.cancelled`; other `URLError`s become `.responseError` |
| Empty HTTP body on success | `CoreApiManager` substitutes `{}` so decoding into `EmptyResponse` succeeds |
| No device ID for current network | `AccountsService`/`InboxService` throw `.noDeviceID`; inbox emits on its error publisher and skips the poll |
| Joint account create/sign/search request fails | `AccountsService.ActionError` (`unableToCreate…`/`unableToSign…`/`unableToSearch…`) surfaced to caller with `LocalizedError` description |
| Inbox accept request fails (create vs. delete stage) | `InboxService.ActionError.failedAcceptAccountImportRequest(createAccountError:)` or `(deleteInboxMessageError:)` distinguishes which stage failed |
| Block-following / inbox / currency fetch fails | Service emits on its error publisher and re-arms the next poll; the loop is never permanently halted |
| Legacy joint account missing persisted threshold/version | `syncJointAccountsAfterNetworkSwitch` skips it rather than deriving a wrong (stale) address on the new network |

## Dependencies

| Module | Usage |
|--------|-------|
| `pera_wallet_core` | Domain models and reactive primitives: `PeraAccount` types, `ReadOnlyPublisher`, currency formatting (`CurrencyFormatter`/`CurrencyFormatterSettings`) |
| `Foundation` / `Combine` | `URLSession`, JSON coding, `Task`/actor concurrency; `CurrentValueSubject`/`PassthroughSubject`/`AnyPublisher` for service state |
| `AppEnvironment` | Resolves algod / indexer / mobile (v1, v2) base URLs per mainnet/testnet |
| Legacy session stack (`Session`, `SharedDataController`) | Source of the authenticated user, local `AccountInformation`, device IDs, private-key presence; `LegacyBridgeAccountManager` adds local accounts |
| `FeatureFlagServicing` | Gates joint-account / inbox behavior (`jointAccountEnabled`) |
| `ALGAPI.Network` / `IndexerAccount` / `Account` | Legacy network enum bridging and account model conversion (`Account(localAccount:)`, rekey/auth detection) |
| `AppDelegate` | `@MainActor` access to the current authenticated user's local accounts |
| Algorand algod & indexer + Pera mobile backend (HTTP) | Block following, account lookups, currency rates, NFD/name service, ASA inbox, joint/multisig requests |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
| Enriched Purpose/Invariants/Examples/Errors/Dependencies from source | 2026-06-24 | 1 |
