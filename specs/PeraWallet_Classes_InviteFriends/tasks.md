# PeraWallet_Classes_InviteFriends — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Consider showing a user-visible fallback when `AppDownloadURL` is missing/invalid;
  today `openShare()` returns silently after the sheet has already dismissed (dead-end).
- [ ] Fix typos in theme property names (`spacingBetweendDescriptionAndMainButton`,
  `spacingBetweendMainAndSecondaryButtons`) for readability.
- [ ] Remove the duplicated `descriptionLabel` leading constraint in
  `InviteFriendsScreen.addDescription()` (the same `leading == inset` is added twice).
- [ ] Evaluate moving the `openShare()` URL/analytics logic so the share action is unit
  testable independent of `MenuViewController`.

## Done
- [x] Spec and companion files scaffolded.
- [x] Screen wired into the Menu via the `.inviteFriends` route with a `share`/`close`
  event handler.
- [x] Localized title/description and Share/Close buttons implemented.
- [x] One-shot Lottie "share" animation on appearance.
