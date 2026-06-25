# PeraWallet_Managers — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- This is a services/networking layer (no UI), so it is best covered by unit tests against the
  protocol seams: `CoreServiceable`, `AccountsServiceable`, `BlockchainServiceable`,
  `CurrencyServiceable`, `InboxServiceable`, `NonFungibleDomainServiceable`, and the
  `Requestable` protocols. Mock `MobileApiManager`/`IndexerApiManager`/`AlgodApiManager` (or
  `URLProtocol`) and assert on the published `ReadOnlyPublisher` outputs.

## Manual QA checklist

Joint / multisig accounts (feature flag `jointAccountEnabled` on):
- [ ] Create a joint account (participants + threshold); it appears as a `.joint` local account.
- [ ] A pending import request appears in the inbox within ~6s; Accept adds the account and the
      request disappears; Ignore removes the request without adding an account.
- [ ] Propose a sign request, then sign / decline from another participant; status updates.
- [ ] Search a sign request by ID returns the expected status.

Network switching:
- [ ] Switch mainnet -> testnet: account list, balances, currency, and inbox all clear and then
      repopulate with testnet data; no mainnet balances/accounts linger.
- [ ] Joint accounts re-register on the new network (and legacy joint accounts without stored
      threshold/version are skipped, not mis-registered).

Reactive state:
- [ ] Balances update as new blocks arrive (no manual refresh needed).
- [ ] Selected currency change re-fetches and reformats fiat amounts; ALGO-primary toggle honored.
- [ ] NFD / name-service lookup resolves a domain to an address.

Resilience:
- [ ] Kill connectivity mid-session: errors surface but block-follow / inbox / currency loops
      resume automatically once connectivity returns.

## Edge cases

- Indexer 404 for an account -> shown with `0.0` balance, not an error.
- Empty HTTP body on a success status -> decodes as `EmptyResponse` (no crash).
- Request cancelled by a `baseURL`/network change -> surfaces as `ApiError.cancelled`, not a
  spurious failure.
- No device ID for the current network -> joint/inbox actions throw `.noDeviceID`; inbox poll
  is skipped rather than crashing.
- Inbox accept that succeeds at create but fails at delete -> distinct error case
  (`failedAcceptAccountImportRequest(deleteInboxMessageError:)`).
- `jointAccountEnabled` off -> inbox never surfaces joint requests and accounts are never typed
  `.joint`.
- Rekeyed accounts -> `AccountDataProvider` derives `authType`; auth account not held locally
  yields `.invalid`.
