# PassKeyExtension — Design

## Layout & components

Single-screen extension UI hosted inside the system AutoFill sheet.

- **`CredentialProviderViewController`** (`ASCredentialProviderViewController`): presents as `.popover`; embeds the SwiftUI view via `UIHostingController` pinned to all edges (top/bottom/left/right anchors). Background `.white`.
- **`PassKeyCredentialView`** (SwiftUI): centered `VStack` (spacing 20, padding 24) with two states:
  - **Loading state:** large `ProgressView` (circular, tinted `Color.Link.primary`) + `passkeys-signing-request` label.
  - **Error state:** `iconTrashRed` image (36×36), the error message, a `passkeys-error` subtitle, and a full-width 52pt **Dismiss** button (`title-dismiss`).

There is no navigation hierarchy — the system owns presentation; the only user action is Dismiss, which cancels the request (`ASExtensionError.userCanceled`).

## Design tokens

- **Typography:** custom font `DMMono-Medium` — 19pt for titles, 15pt for subtitle/button copy.
- **Colors (app design system):**
  - Text: `Color.Text.main`, `Color.Text.gray`
  - Button: `Color.ButtonPrimary.bg`, `Color.ButtonPrimary.text`
  - Accent/spinner: `Color.Link.primary`
  - Background: `Color.Defaults.bg`
- **Spacing / shape:** VStack spacing 20, content padding 24, button height 52, corner radius 4.

## Assets

- `iconTrashRed` (error icon) from the asset catalog.
- Localized strings: `passkeys-signing-request`, `passkeys-error`, `title-dismiss`, plus error descriptions from `LiquidAuthError` (`liquid-auth-error`, `liquid-auth-passkey-already-exists`, `liquid-auth-no-passkey-found`, `liquid-auth-invalid-passkey-found`, `local-authentication-failed`, `liquid-auth-authentication-required-prompt`).
