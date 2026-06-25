# PeraWallet_Classes_Shared — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see `BUILDING.md`).
- Relevant existing tests touching this area:
  - `algorand-tests/Models/QR/QRTextTests.swift` — QR text model parsing.
  - `algorand-tests/Utils/Deeplinks/Routing/DeeplinkQRTests.swift` — deeplink-style QR routing.
  - `algorand-tests/Migration/PasswordMigrationTests.swift` — password/PIN migration.
- Gap: the `QRResolverManager` chain ordering and the no-match `.jsonSerialization` fallback, and `ChoosePasswordViewModel`'s 6-digit completion behavior, are not yet covered by unit tests.

## Manual QA checklist

### QR scan & resolution
- [ ] Scan a WalletConnect QR → session-connect flow starts (not treated as an address).
- [ ] Scan a Liquid Auth QR → Liquid Auth flow handled.
- [ ] Scan a plain Algorand address → routed to address handling (send/add contact options).
- [ ] Scan a backup QR and an app deeplink QR → each resolves to its own handler.
- [ ] Scan an unrecognized/garbage code → error surfaced and the camera re-arms (rescan works).
- [ ] Deny camera permission → no crash; no result emitted.
- [ ] QR creation screen renders a scannable code with the correct address label.

### PIN entry (`ChoosePasswordViewController`)
- [ ] Each mode (setup / verify / login / reset / confirm / verify-old) shows the correct localized title.
- [ ] Entering 6 digits fires verification; entering 5 does nothing.
- [ ] Delete key removes the last digit and clears the corresponding circle.
- [ ] Wrong PIN puts circles into the `.error` state and resets on next entry.

### Asset opt-out (`OptOutAssetCoordinator`)
- [ ] Opt out of a zero-balance asset → confirmation sheet → success starts opt-out monitoring.
- [ ] Opt out of a non-zero-balance asset → transfer-balance sheet shown first.
- [ ] Ledger account → Ledger connection + sign-with-ledger screens appear; cancel cleans up monitoring.
- [ ] Joint account → routed through the joint-account transaction coordinator.
- [ ] Attempt opt-out as the asset creator → `asset-creator-opt-out-error-message` banner.

### Shared components
- [ ] `AlertScreen` renders image/title/body/actions and dismisses on each action.
- [ ] `BottomWarningViewController` shows warning copy and secondary action.
- [ ] Empty/loading/error states (`NoContentView`, `LoadingView`, `ErrorView`, shimmer cells) render and animate.
- [ ] Light/dark mode: colors come from `Colors` tokens and adapt correctly.

## Edge cases

- QR resolver order is load-bearing: a string accepted by an earlier resolver must never fall through to a later one (e.g. a WalletConnect URI must not be parsed as a generic URL).
- PIN circle index math (`password.count - 1`) assumes exactly 6 inputs; verify no out-of-range access when deleting at boundaries.
- Opt-out teardown: ensure `cancelMonitoringOptOutUpdates` runs on every failure/cancel path so monitoring registrations are not leaked.
- Scanner backgrounding/foregrounding: capture session must stop/restart cleanly without duplicate WC connections.
