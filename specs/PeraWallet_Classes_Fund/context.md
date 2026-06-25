# PeraWallet_Classes_Fund — Context

## Overview

The Fund module backs the **Fund** tab. Instead of native screens, it embeds Pera's
hosted fund/buy/swap web experience in a `WKWebView` and wires a JavaScript ↔ native
bridge. The authoritative contract is `PeraWallet_Classes_Fund.spec.md`.

## Key files

- `PeraWallet/Classes/Fund/FundInAppBrowserScreen.swift` — the Fund tab view controller.
  Subclasses `InAppBrowserScreen`; manages lifecycle (hide nav bar, load URL on appear,
  consume one-shot `selectedAddress`), observes app-active / currency-change / deep-link
  notifications, pushes `updateTheme`/`updateCurrency` JS, and routes incoming
  `FundInAppBrowserScriptMessage.handleRequest` messages. Also declares the
  `FundInAppBrowserScriptMethod` enum (the JS method vocabulary) and the
  `.didReceiveDeepLink` notification name.
- `PeraWallet/Classes/Fund/Utils/FundURLGenerator.swift` — pure URL builder. Roots the
  URL at `AppEnvironment.current.fundBaseUrl`, appends `version/theme/platform/currency/
  language/region` (and optional `address`) query items, applies the optional `/test`
  page override (`PeraUserDefaults.enableTestXOSwapPage`), and appends a deep-link path.

## Collaborators (outside this module)

- `InAppBrowser/InAppBrowserScreen.swift` (base class) and `InAppBrowserHelpers.swift`
  (the actual `handleFund`, `handleAddresses`, `handleSettings` implementations).
- `Application/Core/Container/TabBar/TabBarController.swift` — `launchFund(with:)` and
  `launchFundFromDeeplink(with:and:)` entry points.
- `Application/Core/Root/RootViewController.swift` — constructs the Fund VC.
- `Routing/Router.swift` — push web views, system browser, Fund-URL detection.

## Architecture

- Thin screen subclass over a shared in-app-browser shell; no view model — state is the
  web page itself plus a transient `selectedAddress`.
- Native ↔ web communication is message-based: JS posts `handleRequest`, native decodes
  an array of `{ method, params }` entries and dispatches per `FundInAppBrowserScriptMethod`.
- Cross-cutting state (theme, currency) is propagated into the page by evaluating JS.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
