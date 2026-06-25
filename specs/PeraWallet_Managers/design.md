# PeraWallet_Managers — Design

> This is a networking / domain-services layer, not a screen module — it has no view
> controllers, layout, or asset usage of its own. "Design" here documents the module's
> structure, the state it exposes to the UI, and the data/navigation flow of its requests.

## Module structure

- **`API/`** — generic HTTP client.
  - `CoreApiManager` — request execution, URL/`URLRequest` construction, JSON coding,
    status validation, empty-body handling, `ApiError`, `BaseURL` resolution.
  - Protocols: `Requestable` (+ `QueryRequestable`, `BodyRequestable`); `RequestMethod`;
    helper types `APICodingKey`, `EmptyResponse`.
  - `API Services/Algod` — `AlgodApiManager` + `WaitForBlockRequest`.
  - `API Services/Indexer` — `IndexerApiManager` + `AccountRequest`.
  - `API Services/Mobile` — `MobileApiManager` + requests (currency, name service, inbox,
    joint-account create/sign/search/cancel/propose) and data objects (`MultiSigAccountObject`,
    `SignRequestObject`, `ASAInboxMeta`, `JointAccount*`).
- **`Core/`** — services and providers.
  - `PeraCoreManager` (`CoreServiceable`) — service graph + network.
  - `Services/` — `AccountsService`, `BlockchainService`, `CurrencyService`,
    `NonFungibleDomainService`, `InboxService`, `NetworkConfigureable`.
  - `Data Providers/` — `AccountDataProvider` (type/auth classification),
    `ContactDataProvider`.
  - `Formatters/` — `AccountNameFormatter`.
  - `Data Types/` — `PeraAccount`, `CurrencyData`, `NonFungibleDomainData`.
- **`Tasks Manager/`** — `CancellableTasksManager` (actor), `CancellableTask`.

## State exposed to the UI (the "surface" consumers bind to)

| Service | Published output | Shape |
|---------|------------------|-------|
| `AccountsService` | `accounts` | `ReadOnlyPublisher<Set<PeraAccount>>` |
| `AccountsService` | `error` | `AnyPublisher<ServiceError, Never>` |
| `BlockchainService` | `lastBlockNumber` | `ReadOnlyPublisher<Int>` |
| `CurrencyService` | `selectedCurrencyData` | `ReadOnlyPublisher<CurrencyData?>` |
| `CurrencyService` | `isAlgoPrimaryCurrency` | `CurrentValueSubject<Bool, Never>` |
| `InboxService` | `jointAccountImportRequests` | `ReadOnlyPublisher<[MultiSigAccountObject]>` |
| `InboxService` | `jointAccountSignRequests` | `ReadOnlyPublisher<[SignRequestObject]>` |
| `InboxService` | `algorandStandardAssetInboxes` | `ReadOnlyPublisher<[ASAInboxMeta]>` |

`PeraAccount` carries `address`, `type` (`algo25`/`universalWallet`/`watch`/`ledger`/`joint`/
`invalid`), `authType`, `amount`, `titles` (primary/secondary, localized), and `sortingIndex`.

## Data / control flow

```
AppEnvironment ──base URLs──> CoreApiManager.BaseURL
                                   │
PeraCoreManager.shared (network) ──┤ propagates via NetworkConfigureable
                                   ▼
  AlgodApiManager ── WaitForBlock ──> BlockchainService.lastBlockNumber
                                         │ (new block)
                                         ├─> AccountsService ── Indexer ──> accounts
                                         └─> CurrencyService ── Mobile  ──> selectedCurrencyData
  AccountsService.accounts ── change ──> InboxService ── Mobile (poll 6s) ──> import/sign/ASA inboxes
```

## Conventions / "tokens" for this layer

- Per-endpoint JSON key strategies: algod uses kebab-case decoding; mobile uses
  snake_case <-> camelCase; encoders/decoders use ISO-8601 dates.
- Errors are typed enums conforming to `LocalizedError`, with user-facing copy via
  `String(localized:)` keys (e.g. `error-api-*`, `services.accounts.error.*`).
- Reactive loops use a fixed `InboxService` polling interval of `.seconds(6)`.

## Assets

None — this module renders nothing and references no asset catalog entries.
