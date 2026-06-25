# PeraWallet_Classes_Views — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action
  (see `BUILDING.md`).
- No dedicated unit/snapshot test currently exists for `ScreenshotWarningView`.
  Because the view is presentational, the most valuable coverage is a snapshot
  test of its theme-driven layout and a verification that tapping the close button
  invokes `ScreenshotWarningViewDelegate.screenshotWarningViewDidCloseScreen(_:)`.

## Manual QA checklist

Sensitive flow — exercise on a real device (screenshot notifications are
unreliable in the simulator):

- [ ] Start the create-account / recovery-phrase backup flow and reach a passphrase
      screen (`PassphraseBackUpViewController` or `PassphraseDisplayViewController`).
- [ ] Take a screenshot while the passphrase is visible.
- [ ] Confirm the screenshot warning appears (full-screen `ScreenshotWarningView`
      and/or the bottom-sheet variant per the active flow) with the warning icon,
      title, and description.
- [ ] Confirm the device vibrates when the bottom-sheet warning is triggered.
- [ ] Tap "Close" and confirm the warning is dismissed and the user returns to the
      passphrase screen.
- [ ] Re-take a screenshot and confirm the warning re-presents correctly.
- [ ] Verify the close button stays anchored to the bottom (above the safe area)
      and content is readable on the smallest supported device.

## Edge cases

- Delegate `nil` at close time → close is a safe no-op (screen will not dismiss);
  ensure the controller always sets `delegate = self`.
- Rapid double-tap of "Close" → must not double-dismiss or crash.
- Long localized title/description (e.g. translations) must not overlap the close
  button (button uses `greaterThanOrEqualTo` top constraint).
- Light vs. dark appearance — all colors are theme-driven; verify both.
