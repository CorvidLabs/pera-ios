# PeraWallet_Classes_Settings — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Reimplement `CurrencySelectionViewController` on top of the shared base list
      screen (the file carries a `<todo>` to that effect).
- [ ] Replace `fatalError("Index path is out of bounds")` paths in
      `SecuritySettingsViewController` / `DeveloperSettingsViewController` /
      `AppearanceSelectionViewController` with non-crashing guards.
- [ ] De-duplicate the diffable-data-source/loading/no-content wiring shared between
      Currency selection and the `SingleSelection` list used by Appearance/Node.
- [ ] Audit force-unwraps of `session!`/`api!` in `SecuritySettings`, `NodeSettings`,
      and `DeveloperSettings` controllers for safe handling when unauthenticated.
- [ ] Confirm the hardcoded `IndexPath(item: 1, section: 1)` / `(1, 0)` lookups in the
      Security biometric-revert paths stay correct as section layout evolves.

## Done
- [x] Spec and companion files scaffolded.
- [x] Currency selection: async load with throttled search, loading/no-content/error
      states, and selected-currency observation wired through the data controller.
- [x] Node switching with atomic rollback on push re-registration failure.
- [x] Security toggles (PIN, biometrics, rekey) with `choosePassword` flow integration.
- [x] Developer menu migrated to SwiftUI via `UIHostingController`.
