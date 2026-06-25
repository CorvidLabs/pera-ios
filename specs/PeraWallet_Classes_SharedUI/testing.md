# PeraWallet_Classes_SharedUI — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- These views are presentation-only and largely thin; there are no dedicated unit
  tests for the screens themselves. Coverage, where it exists, is indirect via the
  feature flows that route to them (Swap, Incoming ASA, Account Import/Recover).
- Good candidates for added unit tests: `InfoBoxHeaderView.calculatePreferredSize`
  (height math), `ShowMoreView` truncation toggle logic, and `ErrorScreenViewModel`'s
  `getTitle(from:)` swap-asset title formatting.

## Manual QA checklist

### LoadingScreen
- [ ] Lottie animation starts when the screen appears and visibly stops once it is dismissed (no leaked animation).
- [ ] Title and detail render; with a `nil` image name the screen still shows text and does not crash.
- [ ] Swipe-from-edge back gesture is disabled while visible; no back/close button is shown.

### ErrorScreen
- [ ] Icon, title, detail, primary and secondary actions render from the view model.
- [ ] Tapping primary action triggers the presenter's retry path; secondary action triggers cancel/close.
- [ ] Screen cannot be dismissed by swipe or back button.
- [ ] Swap-failure title shows `assetIn / assetOut` correctly (via `getTitle(from: SwapQuote)`).

### SuccessResultScreen
- [ ] Success icon, title, detail render; "view detail" link and "done" action are tappable and emit the right events.
- [ ] Navigation bar is hidden (`shouldShowNavigationBar == false`); screen is non-dismissible by gesture.

### ShowMoreView
- [ ] Long body shows the toggle; tapping expands to full text and collapses back.
- [ ] Short body that fits shows no toggle control.
- [ ] Tapping a URL inside the body opens it / forwards to the delegate; malformed URLs are ignored.

### Other views
- [ ] `RightAccessorizedLabel` keeps the accessory image pinned to the trailing edge as text length varies.
- [ ] `CircleIconView` stays perfectly circular across sizes and honors `padding`.
- [ ] `UIViewControllerCollectionCell` shows the assigned content view and never shows a stale view after recycling/scrolling.
- [ ] `InfoBoxHeaderView` sizes correctly in its list with multi-line body text.

## Edge cases

- Dynamic Type / very long localized strings in titles and details (multi-line wrapping, action button height).
- RTL layouts for the trailing accessory (`RightAccessorizedLabel`) and action insets.
- Dark/light appearance switching while a screen is visible.
- Rapid present/dismiss of `LoadingScreen` (animation start/stop races).
- Reused collection cells during fast scrolling for `UIViewControllerCollectionCell`.
