# PeraWallet_Classes_Authentication — Testing

## Automated tests

- App/library test bundle: `algorand-tests/`.
- Run via the Xcode test action (see `BUILDING.md`).
- Note: these onboarding screens are largely UIKit view controllers wired to `pera_wallet_core` services; coverage is primarily manual QA. Pure logic worth unit-testing if/when extracted: `AccountRecoverDataController.composeAccount` (duplicate / rekeyed / watch upgrade branches), `MnemonicsParser` parsing in `AccountRecoverViewController`, and `PinLimitStore` countdown math.

## Manual QA checklist

Create (BIP39 & Algo25):
- [ ] Welcome → Create generates a wallet, names it, backs up the phrase, and verifying the correct words registers a backed-up account.
- [ ] Wrong words in Passphrase Verify vibrate, show the error banner, reset the cards, and do NOT commit the account.
- [ ] Screenshot warning appears on the back-up screen.
- [ ] HD Wallet Setup lists existing wallets; "create new wallet" and "derive new address" both reach Address Name Setup with back/close disabled appropriately.

Recover:
- [ ] Typing 24/25 valid words enables Recover; suggestions appear as an input accessory and tapping fills the current field.
- [ ] Paste / QR import fills all fields; invalid paste/QR shows the correct error banner.
- [ ] Recovering an account that is rekeyed shows the Rekeyed Account Selection List; one with no rekeyed accounts goes straight to Account Name Setup.
- [ ] Recovering an existing standard account shows "already exists"; recovering a watch/rekeyed/no-auth account upgrades it to standard.
- [ ] BIP39 import failure routes to the import-error screen and recovers gracefully.

Watch account:
- [ ] Valid address (typed / pasted / scanned) enables Add; invalid address shows the error banner.
- [ ] `.algo` / name-service input shows result rows; selecting one fills the address; no results / failure shows the incorrect input state.
- [ ] Adding an already-present address is blocked.

Pin limit:
- [ ] After exhausted PIN attempts the lockout screen counts down and dismisses at zero.
- [ ] Backgrounding/foregrounding pauses and resumes the countdown without losing time.
- [ ] "Reset all data" presents the logout warning and wipes data.

## Edge cases

- Camera permission denied → QR scan shows the camera-unavailable alert instead of crashing.
- App backgrounded mid-create: `"temp"` staged secrets should not leak into a committed account.
- Interactive pop gesture must stay disabled on screens that disable the close button (Address Name Setup after create).
- Keyboard show/hide must keep the Recover and Add buttons anchored above the keyboard.
- Name-service lookup race: rapid edits should reset/replace prior results rather than stack rows.
