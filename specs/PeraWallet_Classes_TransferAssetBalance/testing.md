# PeraWallet_Classes_TransferAssetBalance — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Run via the Xcode test action (see `BUILDING.md`).
- No dedicated unit tests currently target `TransferAssetBalanceScreen` / `TransferAssetBalanceViewModel`. The view model is the easiest unit-test surface (deterministic mapping from `TransferAssetBalanceDraft` to title/rows/copy) and is a candidate for coverage.

## Manual QA checklist

Reach the screen by triggering an opt-out / asset removal on an asset that still holds a non-zero balance (via Manage Assets, ASA detail/discovery, or a collectible's opt-out).

- [ ] Fungible asset: title shows the asset name with the correct verification accessory (trusted/verified/none/suspicious) and the asset-remove confirmation title.
- [ ] Collectible: title uses the collectible opt-out title and the unit name; `isTransferingCollectibleAssetBalance` branch is hit.
- [ ] Asset-ID row shows the correct ID; tapping the accessory copies the ID to the clipboard and shows the toast, without dismissing the sheet.
- [ ] Account row shows the correct holding account (primary display name).
- [ ] Warning text interpolates the asset name and account name (`asset-remove-warning`).
- [ ] Primary "Transfer balance" button emits `.performApprove` and routes into the send/transfer flow.
- [ ] Secondary "Keep" button emits `.performClose` and dismisses, leaving the asset opted in.
- [ ] Bottom sheet uses compressed height and the footer gradient renders over the buttons.

## Edge cases

- Asset with no name → title and warning fall back to `title-unknown`.
- Collectible with no unit name → collectible title falls back to `title-unknown`.
- Destroyed/deleted asset → `title-deleted-with-parantheses` marker prepended in the negative color.
- Suspicious asset → negative-color title and `icon-suspicious` accessory.
- Long asset/account names → `byTruncatingTail` truncation in the title; verify warning body wraps (`FittingText`).
- Repeated taps on the asset-ID accessory should not stack toasts or affect the sheet.
