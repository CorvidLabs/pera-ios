# Classes_Application — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test
  action (see `BUILDING.md`).
- No dedicated unit test currently targets `TabBarController` (it is a
  UIKit container with notification-driven side effects). Coverage is
  primarily manual / via parent flows.

## Manual QA checklist

### Selection & navigation
- [ ] All five tabs (Home, Discover, Swap, Fund, Menu) appear in order and
  switch the displayed screen.
- [ ] Tapping the already-selected tab while its stack has pushed screens
  pops back to that tab's root.
- [ ] Tapping the already-selected tab at its root does nothing
  (no flicker, no crash).
- [ ] The parent navigation bar stays hidden while the tab bar is shown.

### Conditional enablement
- [ ] Switch the node to TestNet on a production (store) build → Discover
  tab becomes disabled; switch back to MainNet → re-enabled.
- [ ] On a staging build, Discover stays enabled on both networks.
- [ ] Remove all accounts (or test a fresh session with none) → Swap tab
  is disabled; add an account → Swap re-enables after
  `.userAccountsChanged`.

### Deep links / programmatic launch
- [ ] Trigger a swap deep link with a draft → Swap tab selected and the
  draft is applied to `SwapViewController.launchDraft`.
- [ ] Trigger a discover deep link with a destination → Discover tab
  selected and `DiscoverHomeScreen.destination` is set.

### Analytics
- [ ] Selecting Home/Discover/Swap/Menu/Stake/Collectibles each fires the
  corresponding `.tabBarPressed` analytics event exactly once.

## Edge cases

- Setting `selectedTab` to an ID not present in `items` must not crash and
  must leave the current selection unchanged.
- `launchSwap`/`launchDiscover` when the tab's root screen is not the
  expected type → tab still selects, no payload applied (silent no-op).
- Re-enabling a tab button already in the desired state must be a no-op
  (`setTabBarItemEnabled` early-return).
- Session validity: confirm `session.isValid` is set `true` on appear and
  that re-entering after lock re-shows the tab bar correctly.
