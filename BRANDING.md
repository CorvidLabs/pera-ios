# Branding — CorvidLabs fork

This is a CorvidLabs-branded fork of Pera Wallet (Apache 2.0). Branding follows
the [CorvidLabs design system](https://github.com/CorvidLabs/design-system):
accent is the teal **"sheen" `#0E6F66`** (light) / `#45D0BC` (dark) — never purple.

## Done

- **License compliance**: added `NOTICE` (attribution to Pera Wallet, LDA + a
  Section 4.b summary of changes); retained all per-file copyright headers and
  `LICENSE`. Rebrand removes the *trademarked* Pera product identity only.
- **App display name**: `Pera Algo Wallet` → `Corvid Wallet` (Store/Beta/Staging
  Info.plists).
- **Primary CTA color**: rebranded `ButtonPrimary` background/focus from Pera's
  purple `#6B46FE` to CorvidLabs teal (`bg`, `newBg`, `focusBg`, `newFocusBg`).
- **README**: rebranded with attribution + trademark notice.

## Remaining (follow-up)

- **App icon**: generate via `fledge run icons` in the design-system repo
  (CorvidLabs topography preset), replace `AppIcon`.
- **Full color sweep**: remaining accent usages (links, secondary buttons,
  in-app `turquoise*` shades) to design-system tokens.
- **Bundle identifiers / URL schemes**: still `*.perawallet.*` — change for a
  separate distribution.
- **Fonts**: adopt Schibsted Grotesk / Spline Sans Mono.
- **In-app copy**: remaining "Pera" product strings (keep code/API identifiers).
