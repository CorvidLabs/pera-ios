# PeraWallet_Data_Providers — Design

This module renders no screens of its own. It produces presentation data
(`ImageType.IconData`) and persists a model (`Contact`) for other UI modules.

## Layout & components

- No view hierarchy. `AccountIconProvider` outputs an `ImageType.IconData`
  (`image`, `tintColor`, `backgroundColor`) consumed by account-badge views in
  consuming scenes (e.g. Inbox rows, Joint Account transaction-request summary,
  Create Joint Account add-account view).
- `ContactsManager` produces `Contact` model objects consumed by contact
  add/edit and contact-picker UI.

## Account-badge mapping (AccountIconProvider)

| Account state | Image | Tint | Background |
|---|---|---|---|
| `nil` account | `.Icons.question` | `.Text.grayLighter` | `.Layer.grayLighter` |
| rekeyed (`authType != nil`) | `.Icons.rekeyedAccount` | follows base `type` | follows base `type` |
| `algo25` | `.Icons.wallet` | `.Wallet.wallet4Icon` | `.Wallet.wallet4` |
| `universalWallet` | `.Icons.walletUniversal` | `.Wallet.wallet4Icon` | `.Wallet.wallet4` |
| `watch` | `.Icons.watchAccount` | `.Wallet.wallet1Icon` | `.Wallet.wallet1` |
| `ledger` | `.Icons.ledger` | `.Wallet.wallet3Icon` | `.Wallet.wallet3` |
| `joint` | `.Icons.group` | `.Wallet.wallet1` | `.Wallet.wallet1Icon` |
| `invalid` / invalid auth | `.Icons.rekeyedAccount` | `.Helpers.negative` | `.Helpers.negativeLighter` |

## Design tokens

- Colors come exclusively from the app design-system asset catalogs:
  `.Wallet.*` (per-wallet palette), `.Helpers.*` (negative/error states),
  `.Text.*` and `.Layer.*` (neutral placeholder). Returned as SwiftUI `Color`.
- Images come from the `.Icons.*` asset catalog
  (`wallet`, `walletUniversal`, `watchAccount`, `ledger`, `group`,
  `rekeyedAccount`, `question`).

## Assets

- `ImageResource` references resolved through `.Icons.*`.
- `Color` references resolved through `.Wallet.*`, `.Helpers.*`, `.Text.*`,
  `.Layer.*`.
- `Contact` may carry an `image: Data?` (CoreData attribute) for a stored
  contact avatar.
