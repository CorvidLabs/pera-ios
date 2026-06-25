# PeraWallet_Classes_Utils — Context

## Overview

Shared app-target utility layer under `PeraWallet/Classes/Utils`. It is the plumbing that feature screens build on: transaction composing/signing, in-app banners, navigation/presentation infrastructure, dependency-injection containers, validators, and a large set of UIKit/Foundation/Macaroon/WebKit extensions. The authoritative contract is `PeraWallet_Classes_Utils.spec.md`; the covered source files are listed in that spec's `files:` frontmatter.

## Architecture

- **MVVM + controllers, not coordinators.** UI sub-areas (Banner, Tooltip, NavigationBar) follow View / ViewModel / ViewTheme triples from the Macaroon styling system (`customize(theme)`, `bindData(viewModel)`). Flow/orchestration lives in plain controller classes.
- **Delegate-driven transaction engine.** `TransactionController` is a stateful, callback-based engine that fans transaction types out to per-type `TransactionDataBuildable` builders, picks a signer (Algo25 / HD-wallet / Ledger BLE), calculates fees, uploads, and reports back through `TransactionControllerDelegate`. `BaseViewController` gets default no-op delegate methods.
- **ARC-59 send.** `ARC59TransactionSendController` + `ARC59SendTransactionSigner` + `ARC59SendTransactionDataBuilder` implement grouped, sequentially-uploaded transactions (using `OperationQueue` dependencies) for sending to accounts not yet opted in.
- **Dependency injection.** `ViewControllerConfiguration` is the service bag (API, session, `SharedDataController`, banner/loading controllers, `PeraConnect`, analytics, feature flags, HD wallet services) handed to every screen; `AppConfiguration` holds app-level singletons.
- **Presentation.** `BottomSheetTransition`/`BottomSheetTransitionController` provide interactive bottom sheets; `UIViewController+Flow` exposes `open(_:by:)` / `dismissScreen()`; `BannerController` (atop `MacaroonBanner`) enqueues transient messages.

## Key files

- `Transaction/TransactionController.swift` — central transaction compose/sign/upload engine.
- `Transaction/DataBuilder/*` — per-type unsigned-transaction builders behind `TransactionDataBuildable`.
- `Transaction/Fee/TransactionFeeCalculator.swift` — fee computation (has unit tests).
- `ARC59/*` — ARC-59 inbox send controller/signer/builder.
- `Banner/BannerController.swift` + `Banner/Banner*ViewModel.swift` — in-app banner system.
- `Configuration/ViewControllerConfiguration.swift`, `Configuration/AppConfiguration.swift` — DI containers.
- `Validators/*` — Rekeying, TransactionSignature, NoteSize, SlippageTolerance validators.
- `WalletConnect/Present/WalletConnectSingleTransactionRequestPresentable.swift` — WC single-txn routing.
- `Transition/BottomSheet/*`, `NavigationBar/*`, `Tooltip/*`, `UI/Keyboard/KeyboardController.swift` — presentation/nav infra.
- `MediaCleaner/MediaCleaner.swift`, `ImagePicker/ImagePicker.swift`, `AppStoreReview/*` — misc helpers.
- `Extensions/**` — UIKit/Foundation/Macaroon/WebKit conveniences.

## Architectural decisions / trade-offs

- `TransactionController` uses completion handlers / `CheckedContinuation` bridging rather than a fully async API, reflecting the underlying Magpie + Ledger BLE callback model. Marked in source as flow pending refactor (see `transactionControllerDidResetLedgerOperationOnSuccess` note).
- Rekeyed accounts: the controller substitutes the auth account's ledger/HD detail before signing (`updateLedgerDetailOfRekeyedAccountIfNeeded`).
- Joint accounts short-circuit signature validation and stop composing before signing (handled by their participants).

## Current status

Spec status: `active`. Enforced by `specsync check --strict` in CI.
