# PeraWallet_Classes_Routing — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Run via the Xcode test action (see `BUILDING.md`).
- The deep-link parsing types (`AppEndpoint`, `AppDeeplinkParser`, `DeeplinkQR`,
  and `DeepLinkParser`'s pure `discover(...)` resolution) are the most
  unit-testable surface here: they take URLs / notifications and return values
  (`QRText`, `DeepLinkParser.Result`) with no UIKit side effects.
- `Router` itself is UIKit-bound (presents/pushes real controllers against a
  `RootViewController`) and is primarily exercised through manual/UI QA.

## Manual QA checklist

Navigation / transitions:
- [ ] Cold launch with no session opens onboarding full-screen
      (`launchOnboarding`) and tabs are terminated underneath.
- [ ] Cold launch with a session opens the password/login screen
      (`launchAuthorization`) and does not double-present if already on it.
- [ ] `push` / `present` / `presentWithoutNavigationController` / `launch` /
      `set` / `root` each land on the correct controller and the back/dismiss
      gesture returns correctly.
- [ ] Presenting from a deep tab + navigation stack still targets the topmost
      visible screen (`findVisibleScreen`).

Deep links / QR / notifications:
- [ ] `perawallet://app/asset-transfer?...` with `assetId=0` opens an ALGO send
      flow; with a non-zero `assetId` opens an asset send flow.
- [ ] `asset-opt-in`, `keyreg`, `add-contact`, `add-watch-account`,
      `wallet-connect`, `buy`, `sell`, `swap`, `web-import`, `account-detail`,
      `joint-account-import` endpoints each route to the right screen.
- [ ] Universal links and custom-scheme (`perawallet://`) deep links produce the
      same destinations as their app-endpoint equivalents.
- [ ] Scanning a WalletConnect QR opens the session-connection flow.
- [ ] Tapping an `asset/opt-in` / `asset/transactions` push notification opens
      the matching screen.

## Edge cases

- [ ] Unrecognized scheme / malformed URL → input is ignored (no crash, no
      navigation).
- [ ] App-endpoint URL missing a required query param (e.g. opt-in without
      `assetId`, contact without `address`) → parser returns `nil`, no screen.
- [ ] Deep link arrives before accounts/assets are loaded → buffered as
      `pendingDeeplinkSource`; resolved once `sharedDataController.isAvailable`
      (`waitingForAccountsToBeAvailable` / `waitingForAssetsToBeAvailable`).
- [ ] Opt-in deep link targeting a watch or no-auth local account → localized
      error banner, no transaction screen.
- [ ] Asset with a pending opt-in/opt-out request → localized "ongoing request"
      error.
- [ ] Account/asset/transaction referenced by a deep link not found →
      `accountNotFound` / `assetNotFound` / `transactionNotFound` error.
- [ ] Rapid repeated deep links / re-presentation while a transition is in
      flight (note: `ongoingTransitions` are retained and not yet cleaned up —
      watch for leaks).
