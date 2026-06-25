# PeraWallet_Classes_InAppBrowser — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Remove or gate the `alert(...)` debug calls in the `peraConnect` script
      (`Scripts.peraConnect`) before shipping — they surface JS alert panels to users.
- [ ] Replace the force-unwrap `api!.network` in `openPaymentRequest(_:)`
      (`InAppBrowserHelpers.swift`) with a safe `guard let`.
- [ ] `handleNotifyUser` `.haptic` and `.sound` cases are no-ops — implement haptic /
      sound feedback or document that they are intentionally unsupported.
- [ ] Audit duplicated `pushWebView` / `openSystemBrowser` / `closeWebView` logic shared
      between `handleFund` and `handlePublicWebview`; consider extracting a common dispatcher.
- [ ] Confirm 30s `timeoutInterval` on `load(url:)` is appropriate for slow dApps.

## Done
- [x] Spec and companion files scaffolded.
- [x] Abstract host enforces subclass-only instantiation via `fatalError`.
- [x] Loading/error/content state machine implemented in `InAppBrowserNoContentView`.
- [x] Secure script-message registration via `add(secureScriptMessageHandler:forName:)`
      and handler cleanup on `deinit`.
- [x] Per-surface bridge handlers (Discover, Cards, Staking, Bidali, Fund, Public Webview).
