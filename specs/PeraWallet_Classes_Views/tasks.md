# PeraWallet_Classes_Views — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Reconcile the two screenshot-warning presentations: the full-screen
      `ScreenshotWarningView` / `ScreenshotWarningViewController` vs. the
      `BottomWarningViewConfigurator` bottom sheet used directly in
      `PassphraseDisplayViewController` / `PassphraseBackUpViewController`. Confirm
      which is the canonical UX and whether the full-screen variant is still wired
      into any flow (otherwise flag for removal).
- [ ] Consider adding a vibrate/haptic on presentation of the full-screen view to
      match the bottom-sheet variant (which calls `AudioServicesPlaySystemSound`).
- [ ] Add a snapshot test for `ScreenshotWarningView` layout across long localized
      title/description strings and small-screen devices.

## Done
- [x] `ScreenshotWarningView` implemented: theme-driven icon/title/description/close
      button with `weak` delegate emitting `screenshotWarningViewDidCloseScreen(_:)`.
- [x] Host `ScreenshotWarningViewController` wires delegate and dismisses on close.
- [x] Spec and companion files grounded against source.
