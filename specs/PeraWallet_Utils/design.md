# PeraWallet_Utils — Design

This is a utility module; most files are infrastructure with no UI. The user-visible surface is the shared-account signing flow and the log-export action, plus the UIKit↔SwiftUI bridges other screens build on.

## Layout & components

- **Joint-account pending-transaction overlay** (`JointAccountPendingTransactionOverlayViewController`, built by `JointAccountPendingTransactionOverlayConstructor`): shows the proposed transaction, per-signer status (`SignRequestInfo`), threshold, and deadline; offers Cancel and Sign-with-Ledger actions.
- **Cancel-transaction confirmation**: a `BottomWarningViewConfigurator` bottom sheet (`iconIncomingAsaError`, localized `shared-account-cancel-transaction-confirmation-*` strings) with primary/secondary actions.
- **Ledger signing screens** (presented by `SharedAccountSignWithLedgerHandler`): `LedgerConnectionScreen` (BLE pairing, cancellable) → `SignWithLedgerProcessScreen` (per-device approval progress via `SignWithLedgerProcessDraft`). Pairing failures show a `ledger-pairing-issue-error-title` bottom warning.
- **Bridging containers**: `SwiftUICompatibilityBaseViewController` pins a hosting controller's view to all four edges of a `BaseViewController`; `SwiftUICompatibilityView` wraps a SwiftUI `View` in a clear-background, self-sizing `UIView` (`systemLayoutSizeFitting`).
- **No bespoke visuals**: `FileArchiver`, loggers, `PollingService`, formatters, `CurrencyFormatterSettings`, and `ViewIdentifier` are non-UI.

## Navigation hierarchy

```
Feature screen (sender)
  └─ JointAccountTransactionCoordinator.handleTransaction(presenter:)
       ├─ [if all-Ledger] action .connectionWithLedgerNeeded
       └─ present JointAccountPendingTransactionOverlay (modal)
            ├─ Cancel → BottomSheetTransition → BottomWarning (confirm)
            └─ Sign with Ledger → SharedAccountSignWithLedgerHandler
                 └─ BottomSheetTransition → LedgerConnectionScreen
                      └─ SignWithLedgerProcessScreen
```

Overlays/sheets are presented via `BottomSheetTransition` (`.presentWithoutNavigationController` / `.present`); coordinator state is published through `@Published action` for the caller to observe.

## Design tokens

- **Icons**: `.iconIncomingAsaError`, `.iconInfoGreen` from the app asset catalog.
- **Strings**: localized via `String(localized:)` — `shared-account-cancel-transaction-confirmation-*`, `ledger-pairing-issue-error-title`, `ble-error-fail-ble-connection-repairing`, `asset-min-transaction-error-*`, `title-error`/`title-ok`, `time-ago-just-now`.
- **Currency formatting**: `CurrencyFormatter` with `AlgoLocalCurrency` for minimum-amount error messages; `CurrencyFormatterSettings` carries `CurrencyID`/symbol.
- **Automation IDs**: `ViewIdentifier` (`home.animation.confetti`, `settings.button.back`) for accessibility/UI-test targeting.

## Assets

- App asset catalog icons referenced above; no asset catalogs are owned by this module.
