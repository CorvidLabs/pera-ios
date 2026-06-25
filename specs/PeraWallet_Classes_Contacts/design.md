# PeraWallet_Classes_Contacts — Design

## Screens & components

- **Contacts (List)** — `UICollectionView` of `ContactCell`s (each built from
  `ContactContextView`: avatar + name + short address, plus a QR display
  button). Top `SearchInputView`, pull-to-refresh `UIRefreshControl`, and two
  content states: `ContactsNoContentWithActionView` (empty list, with an
  "add" CTA) and a top-attached `NoContentView` (no search results). An "add"
  bar button sits in the navigation bar. Row height is fixed (68pt).
- **Add Contact** — scroll form with a `BadgedImageView` (avatar + add/edit
  badge), two `FloatingTextInputFieldView`s (name, address), an in-field QR-scan
  affordance, and an add button. Keyboard managed by `KeyboardController`.
- **Contact Detail** — `ContactInformationView` (avatar, name, address, QR
  button) above a `UICollectionView` of `AssetPreviewActionCell`s showing the
  contact account's Algo + asset balances with per-row send buttons. Edit and
  share bar buttons. A loading indicator covers the asset fetch.
- **Edit Contact** — same form layout as Add (`EditContactView`) plus a delete
  button; save is a navigation-bar "done" button. Delete confirmation uses a
  `BottomWarningView` bottom sheet.

## Navigation hierarchy

```
Contacts (List)
├── + (bar button)         → Add Contact            (push)
├── tap cell QR            → QR Generator           (present)
└── tap row
    ├── picker mode        → dismiss + delegate callback
    └── default            → Contact Detail         (push)
        ├── edit (bar)     → Edit Contact           (push)
        │   ├── QR scan    → QR Scanner             (push)
        │   └── delete     → Bottom Warning sheet → pop to List
        ├── share (bar)    → system share sheet     (present)
        ├── QR button      → QR Generator           (present)
        ├── tap asset row  → ASA Discovery          (present)
        └── send (asset)   → Account List sheet → Send Transaction (present)
Add Contact
└── QR scan                → QR Scanner             (push)
```

## Design tokens

- Each view has a paired `*ViewTheme` (e.g. `AddContactViewTheme`,
  `ContactDetailViewTheme`, `ContactContextViewTheme`,
  `ContactInformationViewTheme`) that pulls colors/typography/spacing from the
  app design system (Macaroon UIKit `LayoutSheet` / `StyleSheet`).
- Colors are referenced via the `Colors` palette, e.g.
  `Colors.Text.main.uiColor` for the Edit "done" button; screen backgrounds are
  set from each `Theme`'s `backgroundColor`.

## Assets

- `icon-user-placeholder` — default contact avatar (also the
  `ContactImageProcessor` fallback).
- `icon-circle-add` / `icon-circle-edit` — `BadgedImageView` badge states on
  the Add/Edit avatar.
- `icon-contacts-empty` — empty-list illustration.
- `icon-trash-red` — delete-confirmation sheet icon.

Localization keys used by this module include `contacts-title`,
`contacts-add`, `contacts-empty-text`, `contacts-empty-detail-text`,
`contacts-info-edit`, `contacts-name-validation-error`,
`contacts-address-validation-error`, `contacts-delete-contact`,
`contacts-delete-contact-alert-explanation`, and `contacts-approve-delete-contact`.
</content>
