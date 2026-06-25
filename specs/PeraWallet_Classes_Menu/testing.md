# PeraWallet_Classes_Menu — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Run via the Xcode test action (see `BUILDING.md`).
- No dedicated unit tests currently target this module; the screen is
  view-controller-driven with no separate view model, so coverage is primarily
  manual. Good candidates for future unit tests: `MenuOption` title/icon/
  `showNewLabel` mapping, and `parseCollectionData` (image/non-GIF filtering,
  3-thumbnail cap, preview→download→thumbnail URL fallback).

## Manual QA checklist

- [ ] Open the Menu tab — list renders immediately with default rows
      (NFTs, Buy, Stake, Receive, Invite Friends) before any network response.
- [ ] Account with an active Pera card + `enableImmersve` on → Cards promo card
      appears with the "go to cards" action; tapping the action opens the Cards flow.
- [ ] Account in a waitlisted-only country → Cards card shows the
      "not supported country" copy and hides the action button.
- [ ] `enableImmersve` off → Cards row is absent regardless of card state.
- [ ] Account with image NFTs → up to three thumbnails show in the NFTs row;
      tapping the row pushes the Collectibles list.
- [ ] Tap Buy gift card → Bidali flow; via Buy/Sell options sheet, picking Meld
      dismisses the sheet then opens the Meld flow.
- [ ] Tap Receive → receive flow; tap Stake → staking pushes.
- [ ] Tap Invite Friends → bottom sheet; "share" dismisses then opens the native
      share sheet with the app download URL.
- [ ] Nav bar: QR button opens the scanner; Settings button pushes Settings.
- [ ] Analytics events fire for each tap (`recordMenuScreen` types).

## Edge cases

- Cards/NFT lookups fail → list still renders; Cards falls back to inactive,
  NFTs row renders without thumbnails (no crash, no spinner stuck).
- GIF or non-image collectibles are excluded from thumbnails; accounts with only
  GIFs show an empty NFT thumbnail stack.
- Returning to the tab re-runs `viewWillAppear` enrichment — confirm no flicker,
  duplicate rows, or stale Cards state after switching tabs.
- Watch-only accounts are excluded from the Cards fund-address lookup.
- `AppDownloadURL` Info.plist key missing → invite share is silently skipped.
