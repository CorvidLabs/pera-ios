# PeraWallet_Classes_Backup — Design

## Layout & components

Back-up account-selection list, hosted in the generic `AccountSelectionListScreen` (nav title `title-select-account`, `listContentTopInset = 16`):

- **Header** (`BackUpAccountSelectionListHeader`) — single description line bound from `BackUpAccountSelectionListHeaderViewModel` (`title-back-up-account-selection-header`, `bodyRegular`). Supplementary view, sized via `calculatePreferredSize`.
- **Account row** (`BackUpAccountSelectionListAccountListItemCell`) — reuses `AccountListItemViewTheme`; shows account icon, title, subtitle, and portfolio value from `AccountListItemViewModel`. Bottom separator inset for alignment under the title.
- **Loading state** — three `AccountSelectionListLoadingAccountItemCell` placeholders (shared from the Accounts module).
- **Empty state** — `AccountSelectionListNoContentCell` bound from `AccountSelectionListNoContentViewModel` when no accounts need backing up.

## Navigation hierarchy

```
presentingScreen
  └─ BackUpAccountFlowCoordinator.launch(...)
       ├─ (multiple accounts) AccountSelectionListScreen<BackUpAccountSelectionListLocalDataController>   // .backUpAccountSelection route
       │      └─ select account ─┐
       └─ (single / selected) ───┴─ .tutorial(...)               // full-screen modal
              ├─ HD account  → .backUpBip39 (flow .addBip39Wallet)
              └─ Algo25      → .backUp       (flow .addAlgo25Account)
                     └─ on success posts didBackUpAccount → coordinator dismisses
```

All tutorial presentation uses `customPresent` with `presentationStyle: .fullScreen`.

## Design tokens

- **Account cell** (`BackUpAccountSelectionListAccountListItemCellTheme`): `contextEdgeInsets = (14, 24, 14, 24)`; separator `Colors.Layer.grayLighter`, size 1, bottom position `(80, 24)`.
- **Header** (`BackUpAccountSelectionListHeaderTheme`): text color `Colors.Text.gray`, `FittingText()` overflow, `contextEdgeInsets = (0, 24, 0, 24)`.
- **Layout** (`BackUpAccountSelectionListLayout`): section inset top 24 / bottom 8 for accounts & loading sections; `minimumLineSpacing = 0`; content width derived from list bounds minus content + section insets. Per-reuse-identifier `sizeCache`.

## Assets

- `icon-standard-account` (sample/placeholder icon used for cell-size measurement in the layout).
- Account icons are supplied at runtime by `AccountListItemViewModel` from shared account data, not by this module's asset catalog.
