# PeraWallet_Data_Types — Tasks

Work items for this module. Check off (`- [x]`) as completed; add new ones as discovered.

## Open
- [ ] Consider giving the `.data` decode-failure case a real fallback (placeholder icon)
      in `RoundedIconView` instead of `EmptyView()`, so broken contact images don't render blank.
- [ ] Decide whether `ImageType` should be `Sendable` / where it crosses concurrency
      boundaries (it currently carries `UIImage`/`Data` and is `Hashable` only).
- [ ] Audit duplicate placeholder construction across joint-account/inbox view models —
      route avatar building through `AccountIconProvider` + `placeholder*IconData` consistently.
- [ ] Confirm `accountTypeIcon(for:)` (uses `account.typeImage`) and
      `AccountIconProvider.iconData` (asset-glyph + tokens) are not producing divergent
      visuals for the same account on different screens.

## Done
- [x] Spec and companion files scaffolded.
- [x] `ImageType` enum defined with `.data` / `.icon(IconData)` / `.uiImage` sources.
- [x] Placeholder factories (`placeholderUserIconData`, `placeholderGroupIconData`) added.
- [x] `RoundedIconView` renderer and `AccountIconProvider` color/glyph mapping in place.
