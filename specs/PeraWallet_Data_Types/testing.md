# PeraWallet_Data_Types — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Run via the Xcode test action (see `BUILDING.md`).
- `ImageType` is a pure value type — its `Hashable` equality and the static factories
  (`placeholderUserIconData`, `placeholderGroupIconData`, `accountTypeIcon(for:)`) are
  cheap to unit-test without UI. `AccountIconProvider.iconData(account:)` mapping
  (type → glyph/tint/background, plus nil/invalid/rekeyed branches) is also unit-testable.

## Manual QA checklist

- [ ] Account rows (accounts list, joint-account detail, inbox, incoming ASA) show the
      correct type glyph: algo25/universal/watch/ledger/joint each render their own icon.
- [ ] A rekeyed account shows the rekeyed glyph (overrides its base type icon).
- [ ] An invalid account/auth shows the negative-styled (red) glyph + background.
- [ ] A contact/profile with a downloaded image (`.data`) renders that image, cropped to a circle.
- [ ] Group/joint placeholders use the group icon; user placeholders use the user icon,
      both with the expected wallet color tokens.
- [ ] Icons are circular (corner radius = size/2) at every call-site size.

## Edge cases

- [ ] `.data` bytes that fail `UIImage(data:)` → row renders blank (`EmptyView()`), not a crash.
- [ ] `AccountIconProvider.iconData(account: nil)` → question glyph with neutral gray tokens.
- [ ] Same account rendered on two screens (one via `accountTypeIcon(for:)`/`typeImage`,
      one via `AccountIconProvider`) — verify the visuals do not diverge.
- [ ] Very small / very large `size` values keep correct padding and circular clipping.
