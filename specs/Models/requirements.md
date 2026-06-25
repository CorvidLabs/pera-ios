# Models — Requirements

The Models module owns the domain data layer of Pera Wallet: the Swift types that
represent Algorand accounts, assets, collectibles, transactions, swaps,
WalletConnect sessions/requests, contacts, notifications, and settings, along with
their API-DTO bridging and pure derived helpers.

## User Stories

### Story 1: Reliable account & asset representation
As a wallet user, I want my accounts and their balances to be modeled accurately so
that the app can show correct names, balances, asset details, and rekey/authorization
state.

**Acceptance Criteria**
- [ ] An `Account` can be decoded from an algod API payload and re-encoded back to an
  equivalent `APIModel`.
- [ ] Native ALGO is represented with asset id `0`, 6 decimals, and the trusted
  verification tier.
- [ ] `Account` exposes the correct `AccountAuthorization` for standard, watch, ledger,
  joint, and all rekeyed combinations.
- [ ] Asset lookup by id (subscript / `containsStandardAsset` / `containsCollectibleAsset`)
  stays consistent with the account's standard and collectible asset arrays.

### Story 2: Safe transaction and request modeling
As a wallet user, I want transactions and WalletConnect requests to be classified and
validated so that the app can warn me before signing risky operations.

**Acceptance Criteria**
- [ ] Transaction models can classify themselves (payment, asset transfer, app call,
  asset config, key registration, rekey, close).
- [ ] WalletConnect transactions expose validation helpers (`isMultisig`,
  `hasValidSignerAddress`, `hasRekeyOrCloseAddress`, `hasHighFee`) and resolve the
  required signer via `findSignerAccount`.
- [ ] Request validation failures surface as a typed `WCTransactionErrorResponse` with a
  localized message rather than crashing.

## Non-Goals

- No networking, persistence orchestration, or business workflows live here; those
  belong to API/service and feature modules. Models only define data shapes,
  serialization, and pure derived properties.
