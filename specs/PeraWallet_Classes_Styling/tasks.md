# PeraWallet_Classes_Styling — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Remove the `ButtonStyles` enum (`ButtonStyles.swift`) — it carries a `<todo>` to be
      deleted from the project; migrate any remaining callers to per-screen button themes.
- [ ] Complete the `Colors` → `AppColors` migration. `AppColors` was introduced with a
      `<note>` that its naming is "temporary to not coincide with current `Colors` file";
      consolidate the two parallel token catalogs and the duplicated `Dapp`/`Layer`/
      `Helpers`/`Modality`/`Switch` groups.
- [ ] Keep `Colors.swift` entries in the documented alphabetical order as tokens are added.
- [ ] Consider lightweight validation that every color-token raw value has a matching
      asset in `AppColors.xcassets` (mismatches currently fail silently at runtime).

## Done
- [x] Spec and companion files scaffolded.
- [x] Color tokens split into role/component groups under `Colors` and `AppColors`.
- [x] `DMSans` / `DMMono` font families wired through `Fonts` + `FontMaker`.
- [x] Adaptive layout protocol family (`AdaptiveLayout`, `AdaptiveLayoutConstants`,
      `Layout<Constants>`, `LayoutOrientation`) in place for device/orientation constants.
