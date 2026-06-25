# PeraWallet_Views — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Replace the temporary `PasskeyListCell` layout with the final design
      (file carries an explicit `TODO: This is a temporary placeholder - update
      when we have final designs`).
- [ ] Revisit the `Rectangle`-as-separator workaround in `PasskeyListCell` once
      `Divider` rendering is fixed; consolidate on a single separator style.
- [ ] `PassKeyModel.lastUsedDisplay` uses a hard-coded `"MMM d, yyyy, h:mm a"`
      format — confirm it should be locale-aware rather than fixed.
- [ ] Consider de-duplicating back-navigation: `PasskeyListView` reimplements a
      leading toolbar back button instead of reusing
      `BackButtonModifier`/`.withPeraBackButton`.
- [ ] Audit components for fixed point sizes (e.g. `RoundedButton` height 52,
      icon frames 24) against Dynamic Type / accessibility scaling.

## Done
- [x] Spec and companion files scaffolded.
- [x] Passkeys Settings feature implemented: list, empty, disabled states, and
      delete-with-confirmation flow.
- [x] Reusable component set (buttons, text fields, rows, labels, search field,
      share sheet, web view, navigation modifiers) in place and consuming design
      tokens.
