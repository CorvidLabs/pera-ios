# PeraWallet_Classes_OptOutAsset — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Run via the Xcode test action (see `BUILDING.md`).
- No dedicated tests currently target this module's view models. The highest-value
  additions are `OptOutAssetViewModel` and `OptOutAssetNameViewModel` unit tests,
  since both are pure, draft-driven, and branch on asset type / verification state.

## Manual QA checklist

- [ ] From a standard ASA with **zero balance**, trigger remove → confirmation sheet
      shows "Remove asset" title, asset name, asset ID, account, minimum fee,
      and "Remove" / "Keep" buttons.
- [ ] From a **collectible/NFT**, trigger opt-out → title/description use collectible
      wording and buttons read "Opt-out" / "Cancel".
- [ ] Tap the asset-ID row accessory → the asset ID is copied to the clipboard.
- [ ] Tap "Remove"/"Opt-out" → sheet dismisses and the opt-out transaction proceeds
      (banner/monitoring), eventually removing the asset from the account.
- [ ] Tap "Keep"/"Cancel" → sheet dismisses with no balance/state change.
- [ ] From an asset with a **non-zero balance**, trigger remove → the
      transfer-balance screen appears instead of this confirmation sheet.
- [ ] Opt-out from a **Ledger** account → Ledger connection + sign-with-ledger
      screens appear; cancelling stops scanning and cancels opt-out monitoring.
- [ ] Opt-out from a **joint account** → routes through the joint-account
      transaction flow rather than direct signing.

## Edge cases

- [ ] Asset has no `creator` or account cannot sign → opt-out is blocked
      (`isAssetOptOutable` false); confirm no signing is attempted.
- [ ] Opt-out attempted against the asset's own **creator account** → error banner
      ("asset-creator-opt-out-error-message").
- [ ] **Destroyed** asset → name shows a red "(deleted)" prefix.
- [ ] **Suspicious** asset → name renders in negative color with the suspicious badge.
- [ ] Asset with missing name/unit name → falls back to the "Unknown" localized string
      in title, description, and subtitle.
- [ ] Long asset names truncate by tail without breaking layout.
