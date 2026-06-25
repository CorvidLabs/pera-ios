# PeraWallet_Classes_Collectibles — Testing

## Automated tests

- App/library test bundle: `algorand-tests/` (run via the Xcode test action; see `BUILDING.md`).
- This module is UI-heavy and currently exercised primarily via manual QA; shared infrastructure it depends on is mockable (e.g. `algorand-tests/Mock/MockSharedDataController.swift`). New view-model logic (sizing/formatting in `*ViewModel` files) is the most unit-testable surface.

## Manual QA checklist

### Gallery / list
- [ ] Gallery loads collectibles for a standard account; switching grid ⇄ list re-lays out without duplicate/missing items.
- [ ] Search filters items; empty results show the no-content state.
- [ ] Empty gallery shows the no-content-with-action state; its receive action and the "+" bar button both open the receive flow.
- [ ] Opt-in bar button appears/hides correctly as the list header scrolls in/out of view.
- [ ] Sort sub-screen reorders the gallery.
- [ ] Pull-to-refresh / fetch error shows the bottom banner with retry; retry recovers.

### Detail
- [ ] Each media type renders and pages correctly: image, video (play/pause), audio, GIF, WebP, 3D card.
- [ ] Tapping media opens full-screen image/video; transitions animate back correctly.
- [ ] Description show-more / show-less expands and re-measures the cell.
- [ ] Copy media (image) and Save-to-photos work; copy asset ID / address long-press works.
- [ ] Creator account accessory opens the explorer; asset ID accessory opens ASA detail (opted-in) or ASA discovery (rejected).
- [ ] Opt-in and opt-out quick actions appear only for the matching `accountCollectibleStatus`; after success the action is removed and the gallery reloads.
- [ ] Share button shares explorer/download URL.

### Receive
- [ ] Select-account → select-asset → opt-in completes; opted-in collectible later appears in the gallery.

### Send
- [ ] Valid receiver → approve sheet → confirm broadcasts and pops on completion.
- [ ] Receiver not opted in → ask-receiver-to-opt-in sheet appears instead of broadcasting.

### Ledger & accounts
- [ ] Ledger account triggers connect + sign-with-Ledger sheets for opt-in/out/send; cancel cleans up loading and monitoring.
- [ ] No-auth / watch account: state-changing actions are blocked with the "action not available" banner; watch gallery is read-only.

### Filter
- [ ] Toggling "show opted-in" and "show watch-account" options persists and re-filters the gallery on completion.

## Edge cases

- Asset-creator opt-out (should be rejected with creator error message).
- Transaction amount below minimum (formatted-minimum error banner).
- Media download failures (image-copy and media-save) with retry.
- Rapid grid/list toggling while a fetch is in flight (`canPerformUpdates`).
- Pure vs non-pure collectible send amount (amount forced to 1 for pure assets).
- Joint / shared account opt-in/send paths via `JointAccountTransactionCoordinator`.
