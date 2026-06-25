# PeraWallet_Data_Types — Design

## Layout & components

This module is a data-type leaf, not a screen. Its visual contract is realized by the
shared renderer and its consumers:

- **`ImageType`** — describes one of three image sources for an avatar/icon slot:
  `.data` (raw bytes), `.icon(IconData)` (tinted asset glyph on a colored chip),
  `.uiImage` (ready image).
- **`RoundedIconView`** (`Views/Image Views`) — canonical renderer. Given an `ImageType`,
  a `size`, and `padding`, it produces a circular image. For `.icon` it tints the glyph,
  pads it, and fills the background; clipping uses corner radius `size / 2.0`.
- **Consumers** — account/contact/joint-account/inbox row views (e.g. `CoreAccountRow`,
  `AccountRowWithValues`, joint-account and inbox rows) embed `ImageType` avatars.

## Navigation hierarchy

None. `ImageType` carries no navigation; it is composed into rows/cells owned by feature
screens elsewhere in the app target.

## Design tokens

- **Glyphs (asset catalog `ImageResource`):** `.Icons.user`, `.Icons.group`,
  `.Icons.question`, `.Icons.wallet`, `.Icons.walletUniversal`, `.Icons.watchAccount`,
  `.Icons.ledger`, `.Icons.rekeyedAccount`.
- **Colors:** account-type tint/background pairs drawn from the wallet palette
  (`.Wallet.wallet1`, `.Wallet.wallet1Icon`, `.Wallet.wallet3`, `.Wallet.wallet3Icon`,
  `.Wallet.wallet4`, `.Wallet.wallet4Icon`), neutral tokens (`.Text.grayLighter`,
  `.Layer.grayLighter`), and invalid-state tokens (`.Helpers.negative`,
  `.Helpers.negativeLighter`). The default user/group placeholders use
  `tintColor: .Wallet.wallet1`, `backgroundColor: .Wallet.wallet1Icon`.
- **Shape:** always circular — corner radius `size / 2.0`.

## Assets

- Asset-catalog icon resources under `.Icons.*` (listed above) plus `account.typeImage`
  for generated account identity images. Color tokens come from the app design system.
