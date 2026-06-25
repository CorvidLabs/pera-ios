# PeraWallet_Classes_InAppBrowser — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action
  (see `BUILDING.md`). No dedicated unit tests target the abstract `InAppBrowserScreen`
  directly; coverage is exercised through concrete subclass flows (Discover, Cards, etc.).

## Manual QA checklist

Loading / error / content states:
- [ ] Opening any in-app browser surface shows the animated logo loading view first.
- [ ] On a successful load the web view cross-dissolves in and the spinner disappears.
- [ ] With airplane mode / no network, the connection error view appears with retry copy.
- [ ] Tapping retry reloads the last URL and returns to the loading state.
- [ ] Pull-to-refresh reloads the current page (where `allowsPullToRefresh` is true).

Navigation interception:
- [ ] Tapping a `mailto:` link opens the system mail app (browser stays in place).
- [ ] Tapping a social-media link opens the native app/external browser, not in-view.
- [ ] A WalletConnect link triggers the native session-request flow.
- [ ] A non-web scheme link is rejected and does not navigate.
- [ ] `target=_blank` links load in the same web view (no orphan window).

Bridge / native handoffs:
- [ ] Discover swap/buy links open the Swap flow / Meld buy flow with correct assets.
- [ ] dApp viewer / asset detail / generic pushes navigate to the right native screens.
- [ ] Pera Connect from web content opens the native connect flow.
- [ ] Bidali payment request presents the send-transaction preview; completing it sends
      `paymentSent`, dismissing sends `paymentCancelled`.
- [ ] Fund/Public webview `getSettings` returns theme/network/language/currency (and
      device/app metadata for `getSettings`).
- [ ] `closeWebView` / `onBackPressed` dismisses if presented, otherwise pops.
- [ ] Notify-user `banner`/`toast` variants show the success/info banner.

## Edge cases

- [ ] Cancelled navigations (`URLError.cancelled`) must NOT show the error view.
- [ ] Light/dark mode toggles propagate the correct `theme` value to `getSettings`.
- [ ] Account with no matching Bidali asset triggers the generic error banner, no crash.
- [ ] Joint accounts are excluded from `getAddresses` results.
- [ ] Instantiating `InAppBrowserScreen` directly traps (`fatalError`) — debug-only guard.
- [ ] Rapid retry taps do not stack overlapping transitions in the no-content view.
