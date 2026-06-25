# PeraWallet_Classes_Menu — Design

## Layout & components

The Menu tab is a single full-bleed `UICollectionView` (vertical flow layout,
one section) inside `MenuListView`, hosted by `MenuViewController`.

- **Standard row** (`MenuListViewCell` → `MenuListItemView`), 72pt tall:
  leading icon, title, trailing chevron. Optional inline "NEW" badge (used by
  `.transfer`). The **NFTs row** additionally renders an overlapping stack of up
  to three rounded NFT thumbnails (40×40, 8pt corner radius, 2pt
  `Layer.grayLighter` border) left of the chevron.
- **Cards promo card** (`MenuListCardViewCell` → `MenuListCardView`), 220pt tall:
  icon, title, description, trailing illustration, and a bottom-aligned action
  button. State-driven:
  - `inactive` → "create card" style action (left-aligned title).
  - `active` → "go to cards" style action (right-aligned image, forced RTL).
  - `addedToWailist` → hides action + description, shows "not supported country"
    title + body copy.

Rows are sized in `sizeForItemAt` (card = 220pt, all others = 72pt) using the
collection width minus the 16pt horizontal edge insets.

## Navigation hierarchy

```
Tab bar
└─ Menu tab (MenuViewController)
   ├─ Nav bar: [QR scanner]  [Settings]
   ├─ NFTs row        → push Collectibles list
   ├─ Buy row         → BidaliFlowCoordinator (gift cards)
   │  (or Buy/Sell sheet → Meld | Bidali)
   ├─ Stake row       → push Staking
   ├─ Receive row     → ReceiveTransactionFlowCoordinator
   ├─ Invite Friends  → InviteFriends bottom sheet → native share
   └─ Cards card      → CardsFlowCoordinator (action button)
```

## Design tokens

- **Theme:** MacaroonUIKit `LayoutSheet`/`StyleSheet`. `MenuListViewTheme`
  sets `backgroundColor = Colors.Defaults.background`, `cellSpacing = 12`,
  collection edge insets `(top 36, left 16, bottom 0, right 16)`.
- **Spacing/metrics:** standard cell height 72pt, cards cell height 220pt,
  NFT thumbnail 40×40 with 16pt overlap offset.
- **Color tokens:** `Colors.Defaults.background`, `Colors.Layer.grayLighter`
  (NFT thumbnail borders). Per-cell title/arrow/badge styling comes from the
  `MenuListItemViewTheme` / `MenuListCardViewTheme` style sheets.

## Assets

Asset-catalog images referenced via `MenuOption.icon`:
`icon-menu-cards`, `tabbar-icon-collectibles-selected`, `icon-menu-transfer`,
`icon-menu-buy-algo`, `icon-menu-buy-gift-card`, `icon-menu-receive`,
`icon-menu-invite`, `tabbar-icon-stake-selected`. NFT thumbnails are loaded
remotely (Kingfisher / MacaroonURLImage) from collectible preview/download URLs.
