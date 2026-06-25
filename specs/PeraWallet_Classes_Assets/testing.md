# PeraWallet_Classes_Assets — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Run via the Xcode test action (see `BUILDING.md`).
- This is a UIKit feature module with no dedicated unit suite; coverage is primarily manual /
  through shared transaction and data-controller tests. View models (`*ViewModel`) and
  `AssetFilterOptions` / `AssetFilterOptionsCache` are the most unit-testable units if adding
  coverage.

## Manual QA checklist

Addition / opt-in:
- [ ] Open Add Asset; search filters the list and results paginate while scrolling.
- [ ] Tapping "+" opens the opt-in bottom sheet showing correct asset ID, account, and fee.
- [ ] Approving opt-in shows the row spinner, then a check once confirmed on chain.
- [ ] Tapping a fungible row opens ASA Discovery; tapping a collectible opens collectible detail.
- [ ] Verification info (`i` bar button) opens and dismisses correctly.

Detail:
- [ ] `ASADetailScreen` shows profile, quick actions (send/receive/swap/buy), and Activity/About
      pages; market info appears only for discover-available assets.
- [ ] Each quick action launches the correct flow coordinator.

Removal / manage:
- [ ] Manage Assets lists opted-in assets and collectibles; search filters them.
- [ ] Opt-out with a non-zero balance prompts the transfer-balance path; zero balance opts out
      directly.

Filter / select:
- [ ] Filter toggles ("hide no-balance", "show collectibles") persist across relaunch.
- [ ] Select Asset (in a send flow) lists eligible assets and forwards the chosen one.

Ledger / joint accounts:
- [ ] Opt-in/opt-out on a ledger account walks through connect → sign screens; cancel restores
      the cell state.
- [ ] Joint-account opt-in/opt-out surfaces the sign-request overlay.

## Edge cases

- Asset-list page load failure shows a retry cell; retry re-issues the request.
- Transaction compose/broadcast failure restores the cell accessory to `.add`, clears the cache,
  and cancels blockchain monitoring (verify no stuck spinners).
- Ledger disconnect mid-opt-in surfaces the BLE re-pairing warning.
- Minimum-balance error shows the formatted required Algo amount.
- Backgrounding/foregrounding a list mid-load resumes loading animations correctly
  (`viewDidAppear` / `viewDidDisappear` start/stop hooks).
- Collectible opt-in posts `didAddCollectible` so the collectibles list refreshes.
