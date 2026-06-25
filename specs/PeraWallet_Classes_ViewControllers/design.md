# PeraWallet_Classes_ViewControllers — Design

UI design notes for the Ledger hardware-wallet feature. All layout is code-driven (`MacaroonUIKit`),
with one `*Theme` per screen/view holding insets, spacing, and styled appearances.

## Screens & components

- **LedgerConnectionScreen** — `MacaroonBottomSheet` scroll sheet (`.compressed` height): animated
  `LottieImageView` (`light-ledger`/`dark-ledger`), title, body, and a Cancel button in a
  gradient-faded footer.
- **LedgerDeviceListViewController** — scanning illustration + animated indicator and a collection view
  of `LedgerDeviceCell` rows (one per `CBPeripheral`); a troubleshoot bar button opens the tutorial.
- **LedgerAccountSelectionViewController / LedgerAccountSelectionView** — list of derived accounts
  (`SingleSelectionLedgerAccountCell` or `MultipleSelectionLedgerAccountCell`), with loading/normal/error
  states and a contextual "Add (n)" action.
- **LedgerAccountDetailViewController** — sectioned detail (header `LedgerAccountDetailSectionHeaderView`)
  of a derived account's assets and rekeyed accounts.
- **LedgerAccountVerificationViewController** — vertical stack of `LedgerAccountVerificationStatusView`
  rows cycling through `awaiting → pending → verified/unverified`, plus a bottom "Add" button.
- **Rekey flow** — `RekeyInstructionsScreen` (parallax illustration + numbered `InstructionItemView`s),
  `RekeyConfirmationScreen` (large-title nav bar, `RekeyInfoView` summary, fee/currently-rekeyed
  `SecondaryListItemView`s), `RekeySuccessScreen`/`UndoRekeySuccessScreen` result screens, and the
  `OverwriteRekeyConfirmationSheet` / `UndoRekeyConfirmationSheet` bottom sheets.
- **SignWithLedgerProcessScreen** — progress sheet (`ALGProgress`) showing per-transaction signing.
- **Tutorial / Troubleshoot** — `LedgerTutorialInstructionListViewController`, `TutorialStepsViewController`
  with numbered `TutorialNumberView`/`TutorialStepsView`, and the Bluetooth/open-app/install-app
  troubleshooting controllers.

## Navigation hierarchy

```
Tutorial → DeviceList → (LedgerConnectionScreen sheet) → AccountSelection
                                                              ├─ AccountDetail (present)
                                                              ├─ Verification → Home / failure tutorial   [initialize/add]
                                                              └─ RekeyConfirmation → (OverwriteRekey sheet)
                                                                     → LedgerConnection + SignWithLedger sheets
                                                                     → RekeySuccess                         [rekey]
UndoRekeyScreen → (UndoRekeyConfirmation sheet) → SignWithLedger → UndoRekeySuccess
```

## Design tokens

- Colors via the app design system (`Colors.Defaults.background`, semantic palette), applied through
  `customizeAppearance`/`customizeBaseAppearance`. Footers use `LinearGradientEffect`/`Gradient` to fade
  scroll content into the action button area.
- Typography via app text styles (`bodyLargeMedium`, `bodyRegular`, `footnoteHeadingMedium`, etc.).
- Spacing/insets are centralized in each `*Theme` (e.g. `contextEdgeInsets`, `actionEdgeInsets`,
  `illustrationMaxHeight/MinHeight`), with cell sizing computed via `calculatePreferredSize`.

## Assets

- Lottie animations `light-ledger` / `dark-ledger` (connection screen).
- Image assets such as `icon-info-green` (warning sheets) and rekey instruction illustrations referenced
  by the rekey `*Draft` types.
