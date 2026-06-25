# PeraWallet_Classes_Demo — Design

## Layout & components

### Home tab (`Home/`)
Single scrolling screen backed by a diffable data source. Sections, in order:

1. **Portfolio** — total value, charts (`ChartViewData`), tendencies, and the
   quick-actions row. View: `HomePortfolioView` /
   `HomePortfolioNavigationView` (+ themes); models: `HomePortfolioViewModel`,
   `HomePortfolioNavigationViewModel`, `TotalPortfolioItem`, `NewPortfolio`.
2. **Announcement** — dismissible announcement card (`AnnouncementViewModel`).
3. **Carousel / spot banners** — `CarouselBannerItemModel` list.
4. **Accounts** — section header (`HomeAccountsHeader`,
   `TitleWithAccessorySupplementaryCell`) + account cells (`HomeAccountCell`,
   `AccountListItemViewModel`).
5. **Empty / loading** — `HomeNoContentViewModel`, `HomeLoadingCell` /
   `HomeLoadingView`.

### Tab bar (`TabBarItems.swift`, `TabBarButtonItem.swift`)
Items: Home, Discover, Swap, Collectibles, Stake, Fund, Menu — each a
`TabBarItem` with normal/selected/disabled icon assets and a localized title.

### Transaction options sheet (`TransactionOptions/`)
`TransactionOptionsView` bottom sheet listing actions via
`*TransactionOptionListItemButtonViewModel` (send, receive, buy/sell, swap,
scan QR, staking, cards, browse dApps, add asset, copy/show address, more).

### Account action buttons / sheets
`ListItemButton` + `ListItemButtonTheme` render the `*ListItemButtonViewModel`
family used in context menus and action sheets (rekey, rename, remove,
copy address, view passphrase, mute notifications, ASA report, undo rekey,
sort, filter, arrange, paste passphrase, etc.). `UISheet` /
`UISheetActionScreen` provide the generic action-sheet container (image, title,
body, info, actions).

### Shared overlays
- **Toast** — `ToastPresentationController` + `ToastView`/`ToastViewModel`.
- **Copy-to-clipboard** — `ALGCopyToClipboardController` (copies, then toasts).
- **Alerts** — `AlertPresenter` shows intro/promo alerts
  (`SwapIntroductionAlertItem`, `CopyAddressIntroductionAlertItem`,
  `BuyGiftCardsWithCryptoIntroductionAlertItem`).
- **Portfolio calc info** — `PortfolioCalculationInfoViewController` /
  `PortfolioCalculationInfoView` explain how totals are computed / why partial.

## Navigation hierarchy

```
AppLaunchUIHandler.launchUI(state)
├─ onboarding
├─ authorization (passcode / biometrics)
└─ main → TabBar
   ├─ Home  ──quick actions──> Send / Receive / ScanQR coordinators
   │                           └─ account select → asset select → transaction
   ├─ Discover · Swap · Collectibles · Stake · Fund · Menu
   └─ deeplink / remote-notification overlays (resolved from DeeplinkSource)
```

Quick-action and scan-QR coordinators present modally over the visible screen
and use `BottomSheetTransition` for opt-in, Ledger connection, and sign-process
sheets.

## Design tokens

- Colors via the app `Colors` namespace (e.g. `Colors.TabBar.iconActive`,
  `Colors.Text.main`, `Colors.TabBar.iconDisabled`) applied through `*Theme`
  structs (`HomePortfolioViewTheme`, `ListItemButtonTheme`, `ToastViewTheme`,
  `UISheetActionScreenTheme`, `PortfolioCalculationInfoViewTheme`, ...).
- Typography / spacing supplied by Macaroon `*Theme` `LayoutConstants`.
- Light/dark/system appearance switched by `UserInterfaceStyleController`.

## Assets

- Tab bar icons: `tabbar-icon-{accounts,discover,swap,collectibles,stake,fund,menu}`
  with `-selected` / `-disabled` variants.
- Status/info imagery: `icon-info-green` and other catalog images referenced by
  bottom-warning and sheet configurators.
