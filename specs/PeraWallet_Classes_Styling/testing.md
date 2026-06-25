# PeraWallet_Classes_Styling — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`. Run via the Xcode test action (see
  `BUILDING.md`).
- This module is pure tokens/helpers with no dedicated unit-test target; it is exercised
  indirectly wherever consuming screens are tested. The most test-worthy logic is
  `Layout<Constants>.current` (device/orientation selection) and `Fonts...make(_:_:)`.

## Manual QA checklist

- [ ] **Light/dark appearance** — toggle iOS appearance and confirm color tokens flip
      correctly across buttons, banners, text, layers, and shadows (asset catalog
      light/dark variants resolve).
- [ ] **Button styling** — primary and secondary buttons render with the correct
      background, title color (normal and disabled), and `DMSans` medium 15pt font.
- [ ] **Fonts loaded** — `DMSans` and `DMMono` faces render (regular/medium/bold/italic);
      no Helvetica/system fallback appears where a custom face is expected.
- [ ] **Adaptive layout** — on iPad and iPhone, in portrait and landscape, screens using
      `Layout<Constants>` apply the device/orientation-appropriate constants and re-read
      them on rotation.
- [ ] **ASA / Wallet / status tokens** — verified/trusted/suspicious ASA banners and the
      per-wallet accent colors render with their distinct tokens.

## Edge cases

- A color token assigned a raw value with no matching asset in `AppColors.xcassets`
  resolves to a missing/clear color at runtime (no compile-time check) — watch for
  blank/invisible UI after renaming assets or tokens.
- `AdaptiveLayoutConstants.unknownConstant` returns `CGFloat.greatestFiniteMagnitude` and
  is documented to break the layout system — it is a sentinel, never a real value.
- Transitional orientation states fall through to `LayoutOrientation.undefined`.
- `Colors` and `AppColors` overlap (e.g. both define `Dapp`, `Layer`, `Helpers`); confirm
  the intended catalog is used when both expose a similar token.
