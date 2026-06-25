# PeraWallet_Classes_Cards — Context

## Overview

Architectural context for the `PeraWallet_Classes_Cards` module. The authoritative contract is `PeraWallet_Classes_Cards.spec.md`; the source files it covers are listed in that spec's `files:` frontmatter.

The Cards module is a native shell around a `WKWebView` that hosts Pera's
hosted cards web application. Native code generates the URL (with context query
params), pushes appearance changes into the page, and bridges a few JavaScript
messages to native wallet flows.

## Key files

- `Utils/CardsFlowCoordinator.swift` — entry point; `launch()` routes to
  `.cards(path: nil)` presented full-screen without a navigation controller.
- `CardsScreen.swift` — concrete screen; subclass of `CardsInAppBrowserScreen`,
  keeps the tab bar visible and pins the web view scroll to top (no bounce).
- `CardsInAppBrowserScreen.swift` — in-app-browser behavior: builds/loads the
  cards URL, theme sync (`updateTheme`), and dispatches
  `CardsInAppBrowserScriptMessage` bridge messages to `handleCards`. Defines
  the script-message enum (`getAuthorizedAddresses`, `openSystemBrowser`,
  `closePeraCards`, `peraconnect`, `getDeviceId`).
- `Utils/CardsURLGenerator.swift` — URL construction from
  `AppEnvironment.current.cardsBaseUrl(network:)` + in-house query items; also
  defines `CardsDestination` (`.welcome` / `.other(path:)`).
- `Models/CardsAccounts.swift` — `JSONModel` payload returned to the web app
  for the authorized-addresses request.

## Related (outside this module)

- `PeraWallet/Classes/InAppBrowser/InAppBrowserScreen.swift` — base class.
- `PeraWallet/Classes/InAppBrowser/InAppBrowserHelpers.swift` — `handleCards`
  and shared handlers (`handleRequestAuthorizedAddresses`,
  `handleOpenSystemBrowser`, `handlePeraConnectAction`, `handleDeviceIDRequest`).
- `PeraWallet/Classes/Discover/.../BrowserAuthorizedAddressEventHandler.swift` —
  builds the `CardsAccounts` response.

## Architectural decisions

- MVC/shell pattern (not MVVM): the screen is a UIKit `UIViewController`
  subclass; business logic is the web app's. There is no view model.
- Coordinator-launched, presented modally full-screen without a nav controller.
- Native/web contract is one-directional config via URL query params plus a
  small JS message bridge; message handlers live in the shared InAppBrowser
  module so they are reused across Cards/Stake/Fund/Discover screens.

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI. Note: the
menu `.cards` selection currently logs `print("cards pressed")` rather than
launching the coordinator (see tasks.md).
