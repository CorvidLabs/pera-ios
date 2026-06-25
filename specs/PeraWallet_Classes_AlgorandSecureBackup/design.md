# PeraWallet_Classes_AlgorandSecureBackup — Design

## Navigation hierarchy

```
Home (HomeViewController)
└─ Algorand Secure Backup — EXPORT (AlgorandSecureBackupFlowCoordinator)
   └─ Instructions          (push, fullScreen present at launch)
      └─ ChoosePassword     (push, only when session.hasPassword())
         └─ Mnemonics       (push) — 12-word backup passphrase
            ├─ Success       (push) — save / share / copy the backup
            └─ Error         (set)  — "Try again" pops back

Recover Account (RecoverAccountViewController)
└─ Import from backup — IMPORT (AlgorandSecureBackupImportFlowCoordinator)
   └─ ImportBackup          (push) — file picker / paste base64
      └─ RecoverMnemonic    (push) — enter 12-word passphrase to decrypt
         └─ ImportSuccess    (push) — imported / missing account summary
            └─ → AppDelegate.launchMain() (main tab bar)
```

## Screens & components

- **Instructions** (`AlgorandSecureBackupInstructionsScreen`): large-title nav, header label,
  ordered instruction items (`AlgorandSecureBackupInstructionItemView` driven by
  StoreKeys / SaveBackupFile / SelectAccounts view models), a note, and a "Start" footer button
  with a gradient footer background. Hides the tab bar. Hyperlink opens
  `AlgorandWeb.algorandSecureBackup`.
- **Mnemonics** (`AlgorandSecureBackupMnemonicsScreen`): header, "Pera learn" hyperlink label,
  `PassphraseView` collection (two columns, `PassphraseCell`/`PassphraseCellViewModel`), Copy
  and Regenerate-key action buttons in a `VStackView`, and a "Store" footer button. Regenerate
  and Store use `BottomWarningView` confirmation sheets.
- **Success** (`AlgorandSecureBackupSuccessScreen`): `ResultWithHyperlinkView` header
  (`AlgorandSecureBackupSuccessHeaderViewModel`), `FileInfoView` row
  (`FileInfoViewModel`/`FileInfoViewTheme`) with copy, plus Save and Done footer buttons.
  Close bar-button and disabled interactive pop-gesture. Save opens the system share sheet.
- **ImportBackup** (`AlgorandSecureBackupImportBackupScreen`): header, `AlgorandSecureBackupFileView`
  (`AlgorandSecureBackupFileViewModel` states: empty / uploaded / uploadFailed) tappable to open
  the text document picker, a Paste action, and a disabled-until-valid "Next" footer button.
- **RecoverMnemonic** (`AlgorandSecureBackupRecoverMnemonicScreen`): `AccountRecoverView` with 12
  `RecoverInputView`s, `InputSuggestionViewController` accessory, `MacaroonForm` keyboard handling,
  and a "Next" footer button enabled only when all 12 words are filled.
- **ImportSuccess**: shared web-import success screen fed by
  `AlgorandSecureBackupImportSuccessScreenLocalDataController` with ASB-specific header
  (`AlgorandSecureBackupImportSuccessHeaderViewModel`) and missing-accounts
  (`AlgorandSecureBackupImportSuccessInfoBoxViewModel`) list items.

## Design tokens

- Each screen has a paired `*Theme` (e.g. `AlgorandSecureBackupMnemonicsScreenTheme`,
  `AlgorandSecureBackupSuccessScreenTheme`) holding paddings, insets, offsets, heights, and
  `customizeAppearance` styles — no inline magic numbers in the controllers.
- Background uses `Colors.Defaults.background`; footers use a `LinearGradientEffect`
  (`Gradient`) fading from transparent to the background color so content scrolls under the
  pinned action button(s).
- Typography via shared helpers (e.g. `.bodyRegular()`); copy is localized via
  `String(localized:)` keys prefixed `algorand-secure-backup-*`.

## Assets

- `algorand-secure-backup-big-key` — regenerate-key confirmation sheet image.
- `icon-info-green` — store/done confirmation sheet image.
- Localized strings under the `algorand-secure-backup-*` keyspace.
- External link: `AlgorandWeb.algorandSecureBackup`.
