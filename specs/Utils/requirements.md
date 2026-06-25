# Utils — Requirements

## Overview

The Utils module provides the shared infrastructure and helper primitives that the
rest of PeraWalletCore composes: formatting, cryptography/SDK bridging, HD-wallet
derivation, persistence, transaction signing, and the WalletConnect coordinator stack.
It is a foundation library with no user-facing screens of its own.

## User Stories

### US-1: Display monetary amounts correctly and privately
As a wallet user, I want balances and prices formatted in my preferred currency,
with the option to hide values, so that I can read amounts accurately while keeping
my holdings private in public.

**Acceptance Criteria**
- Currency amounts are formatted via `CurrencyFormatter` using the active context.
- When privacy mode is enabled, amounts render as the masked `*****` placeholder.
- Algo amounts respect the 6-decimal fraction and microAlgo conversion constants.

### US-2: Connect a dApp via WalletConnect
As a wallet user, I want to connect to a dApp by scanning a WalletConnect URI and
approve or reject the session, so that I can interact with web3 apps safely.

**Acceptance Criteria**
- A scanned URI is validated by the matching v1/v2 session validator before use.
- The protocol resolver selects exactly one protocol (v1 or v2) per session.
- The user can approve, reject, update, extend, and disconnect sessions through the
  coordinator/PeraConnect facade.

### US-3: Sign transactions with the right key source
As a wallet user, I want my transactions signed by the appropriate signer (SDK,
HD wallet, or Ledger hardware), so that I retain control of my keys.

**Acceptance Criteria**
- SDK, HD-wallet, and Ledger signers all conform to a common signing abstraction.
- Secrets (mnemonics, private keys) are read from the keychain, never from plaintext.
- Invalid transactions are rejected before signing, and Ledger rejections surface an error.

## Non-Functional Requirements

- Secrets must be stored only in the keychain via `Session`/`Storable`.
- Address validity is determined solely by the Algorand SDK.
- Feature-gated behavior must be controllable through `FeatureFlagService` / remote config.
