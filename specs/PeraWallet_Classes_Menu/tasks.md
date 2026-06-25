# PeraWallet_Classes_Menu — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Remove dead/stub code: root `Menu/MenuViewController.swift` and
      `Data/MenuDataSource.swift` use a stale `MenuOption` shape
      (`cards(withCardCreated:)`, string thumbnails) and a placeholder
      "Cards: implemented later" cell; only `Screens/MenuViewController.swift`
      is wired up.
- [ ] Implement the Cards row tap in `Screens/MenuViewController`'s
      `didSelectItemAt` — currently `case .cards: print("cards pressed")`
      (the launch happens via the card's action button instead).
- [ ] Replace `fatalError`/`assertionFailure` paths (`.transfer` "not
      implemented", out-of-bounds index, card action default case) with safe
      handling so unexpected states cannot crash the tab.
- [ ] Move thumbnail/cards-state resolution off `viewWillAppear` re-entry or
      de-duplicate it so repeated tab visits don't re-fire API + data-controller
      loads unnecessarily.
- [ ] Fix the `addedToWailist` spelling (`MenuCardState`/`MenuOption`) — likely
      a typo for `addedToWaitlist`.

## Done
- [x] Spec and companion files scaffolded.
- [x] Menu list backed by `MenuOption` with two cell types (standard + card).
- [x] Async Pera Cards state resolution via `CardsSupportedCountriesFlowCoordinator`.
- [x] NFT thumbnails (max 3, image/non-GIF) wired into the Collectibles row.
- [x] Buy/Sell options sheet routing to Meld and Bidali.
- [x] Invite Friends bottom sheet + native share activity.
