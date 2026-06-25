# PeraWallet_Classes_InviteFriends — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. There are currently no dedicated unit tests
  for this module — the screen is presentation-only and its side effects live in
  `MenuViewController`/`Router`.
- Run via the Xcode test action (see `BUILDING.md`).

## Manual QA checklist

- [ ] Open the Menu tab and confirm an "Invite Friends" option is present.
- [ ] Tap "Invite Friends": the bottom sheet appears with the Lottie share animation,
      "Invite Friends" title, description, and **Share** / **Close** buttons.
- [ ] The share animation plays exactly once on appearance and is not draggable/tappable.
- [ ] Tap **Share**: the sheet dismisses and the system share sheet appears containing the
      app download link; verify the link is correct.
- [ ] In the share sheet, confirm excluded activities (Reading List, Assign to Contact,
      Print, Save to Camera Roll, Open in iBooks, Markup as PDF) are not offered.
- [ ] Tap **Close**: the sheet dismisses with no share sheet shown.
- [ ] Verify analytics fire: `tapInviteFriends` on open, `tapShareInviteFriends` on share,
      `tapCloseInviteFriends` on close.
- [ ] Verify localized strings render in supported languages (`title-invite-friends`,
      `invite-screen-description`, `title-share`, `title-close`).
- [ ] Light and dark mode: background, text, and button colors use design-system tokens.

## Edge cases

- `AppDownloadURL` Info.plist key missing or malformed: tapping Share dismisses the sheet
  but no share sheet appears (silent no-op). Confirm this does not crash.
- Description text overflowing two lines (`MultilineText(numberOfLines: 2)`): confirm
  truncation/centering looks correct on small devices.
- Rapid double-tap on Share/Close should not double-present or leave a stuck sheet.
- Dismiss-by-swipe on the bottom sheet (no Close tap): confirm behavior is acceptable
  (the swipe path does not emit `Event.close`).
