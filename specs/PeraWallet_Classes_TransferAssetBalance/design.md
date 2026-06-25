# PeraWallet_Classes_TransferAssetBalance — Design

## Layout & components

`TransferAssetBalanceScreen` is a `ScrollScreen` presented as a `BottomSheetScrollPresentable` (compressed modal height). Top-to-bottom content:

1. **Title** — `PrimaryTitleView`, bound by `TransferAssetBalanceNameViewModel`: asset name + verification accessory icon, optional deleted/destroyed marker, unit name as secondary title.
2. **Separator** — bottom-positioned `Separator` between title and rows.
3. **Asset ID row** — `SecondaryListItemView` (theme `AssetIDSecondaryListItemViewTheme`) with a tappable accessory that copies the asset ID to the clipboard.
4. **Separator**.
5. **Account row** — `SecondaryListItemView` (theme `SecondaryListItemCommonViewTheme`) showing the holding account.
6. **Description** — warning `Label` (`asset-remove-warning`, `FittingText` overflow).

Footer (over a linear-gradient background, `Colors.Defaults.background` fading in):
- **Primary action** — "Transfer balance" (`asset-transfer-balance`), primary button style → `.performApprove`.
- **Secondary action** — "Keep" (`title-keep`), secondary button style → `.performClose`.

## Navigation hierarchy

Presented modally as a bottom sheet from its caller. Constructed via `Screen.transferAssetBalance(draft:theme:eventHandler:)` and instantiated in `Router.swift`. The screen does not push/pop or dismiss itself for its decision; callers (`OptOutAssetCoordinator`, `ASADiscoveryScreen`, `ManageAssetListViewController`, `CollectibleDetailViewController`) handle dismissal and onward routing in response to `.performApprove` / `.performClose`.

## Design tokens

Defined in `TransferAssetBalanceScreenTheme` (`StyleSheet`/`LayoutSheet`):

- **Colors** — `Colors.Defaults.background` (screen + footer gradient), `Colors.Layer.grayLighter` (separators), `Colors.Button.Primary.text` / `Colors.Button.Secondary.text` (button titles), `Colors.Helpers.negative` (suspicious/destroyed title states).
- **Typography** — `Typography.bodyMedium()` (buttons), `Typography.titleSmallMediumAttributes` (title), `bodyRegular()` (warning/secondary title).
- **Spacing/insets** — content edge insets `(36, 24, 32, 24)`; separator-to-item spacing `10`; title-to-separator `20`; description top padding `22`; spacing between actions `16`; action content/edge insets `(16, 24, 16, 24)`.

## Assets

- Verification accessory icons: `icon-trusted`, `icon-verified`, `icon-suspicious` (unverified shows none).
- Button background images: `components/buttons/primary/bg`(+`-highlighted`), `components/buttons/secondary/bg`(+`-highlighted`).
