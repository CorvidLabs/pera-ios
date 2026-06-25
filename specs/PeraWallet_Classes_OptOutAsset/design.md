# PeraWallet_Classes_OptOutAsset — Design

## Layout & components

Single screen presented as a **compressed-height bottom sheet**
(`OptOutAssetScreen`, a `ScrollScreen` conforming to `BottomSheetScrollPresentable`).
Top-to-bottom content stack:

1. **Title view** (`PrimaryTitleView`, bound by `OptOutAssetNameViewModel`):
   asset name + verification-tier accessory (trusted / verified / suspicious),
   optional favorite icon, optional red "(deleted)" prefix for destroyed assets,
   and a unit-name subtitle.
2. **Asset ID row** (`SecondaryListItemView`, `AssetIDSecondaryListItemViewModel`)
   with a copy accessory → copies the asset ID via `CopyToClipboardController`.
3. **Account row** (`SecondaryListItemView`, `AccountSecondaryListItemViewModel`).
4. **Transaction fee row** (`SecondaryListItemView`,
   `TransactionFeeSecondaryListItemViewModel`) — always the minimum fee.
5. **Description label** — contextual warning text (collectible opt-out vs. standard
   asset removal wording).
6. **Footer** with a top→bottom gradient backdrop containing the primary
   **approve** button and the secondary **close** button.

Rows are separated by 1px bottom separators (`Colors.Layer.grayLighter`).

## Navigation hierarchy

Entered as a modal bottom sheet via `BottomSheetTransition.perform(.present)` from
`OptOutAssetCoordinator`, routed through `Screen.optOutAsset(...)`. Callers include
asset detail / `ASADiscoveryScreen`, `CollectibleDetailViewController`, and
`ManageAssetListViewController`. The screen emits `.performApprove` / `.performClose`;
the coordinator dismisses it and either continues to transaction signing
(Ledger / joint-account sub-flows) or stops.

## Design tokens

- **Colors:** `Colors.Defaults.background` (sheet + gradient), `Colors.Layer.grayLighter`
  (separators), `Colors.Text.main` / `Colors.Text.gray` (title/subtitle),
  `Colors.Helpers.negative` (suspicious/destroyed name), `Colors.Button.Primary.text`
  and `Colors.Button.Secondary.text` (action labels).
- **Typography:** `Typography.titleSmallMediumAttributes` (asset name),
  `Typography.bodyMedium` (buttons), body-regular for description/subtitle.
- **Spacing (from `OptOutAssetScreenTheme`):** content insets `(36, 24, 32, 24)`;
  title→separator `20`; list-item↔separator `10`; description top padding `22`;
  spacing between actions `16`; action content insets `(16, 24, 16, 24)`.

## Assets

- Verification badges: `icon-trusted`, `icon-verified`, `icon-suspicious`.
- Favorite badge: `icon-asset-favorite`.
- Button backgrounds: `components/buttons/primary/bg(-highlighted)` and
  `components/buttons/secondary/bg(-highlighted)`.
- Warning dialog (coordinator error path): `icon-info-green`.
