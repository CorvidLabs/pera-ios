# PeraWallet_Views — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Run via the Xcode test action (see `BUILDING.md`).
- The Passkeys feature is structured for unit testing via the
  `PasskeyListModelable` protocol: substitute a fake `PasskeyListModel` whose
  view model is seeded with `PassKeyModel` fixtures to assert state selection
  (disabled / empty / list) and `passKeyDeleted(_:)` matching behaviour without a
  real `PassKeyService`.

## Manual QA checklist

### Passkeys (Settings > Passkeys)
- [ ] With AutoFill passkeys enabled and one or more saved passkeys, the list
      shows each cell with display name, origin, last-used date, and username.
- [ ] Tapping trash opens the confirmation sheet (medium detent); "Remove"
      deletes the passkey and it disappears; "Keep" dismisses without deleting.
- [ ] Deleting the last passkey transitions the screen to the empty state.
- [ ] With AutoFill passkeys disabled in iOS Settings, the disabled state shows
      and "Open Settings" deep-links into iOS Settings.
- [ ] Custom toolbar back button returns to the previous screen
      (`navigationPath.removeLast()`).

### Reusable components
- [ ] `RoundedButton`: primary/secondary/destructive styles render correct
      token colors; disabled and spinner states do not fire `onTap`.
- [ ] `SearchFieldWithButtons`: QR-scan and paste buttons hide while the field is
      focused and reappear on blur; both callbacks fire.
- [ ] `ShareSheet` presents the system share UI for the supplied items.
- [ ] `WebView` opens the URL in Safari and dismisses when the user closes it.
- [ ] `RelativeDateTextView` updates its relative time on the periodic timeline.

## Edge cases

- [ ] `AppDelegate.shared?.appConfiguration == nil` → Passkeys screen shows empty
      state, no crash.
- [ ] Passkey with `lastUsed == nil` displays the localized "Never" string.
- [ ] Two passkeys with same origin but different username — delete removes only
      the exact `origin` + `username` match.
- [ ] Open Settings URL unavailable / `canOpenURL` false → no-op, no navigation.
- [ ] Dark mode + Dynamic Type: token colors and DMSans typography render
      correctly; fixed-size frames do not clip text.
