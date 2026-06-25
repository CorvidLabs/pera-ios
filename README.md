# Corvid Wallet

A CorvidLabs-branded Algorand wallet for iOS — a fork of the open-source
[Pera Wallet](https://github.com/perawallet/pera-wallet), released by Pera
Wallet, LDA under the Apache License 2.0.

## Attribution & license

This project is a derivative work of **Pera Wallet** (Copyright 2022–2025 Pera
Wallet, LDA), used under the Apache License, Version 2.0. The full license is in
[`LICENSE`](LICENSE) and attribution + a summary of CorvidLabs's changes are in
[`NOTICE`](NOTICE).

> "Pera" and "Pera Wallet" are trademarks of Pera Wallet, LDA. This fork is **not**
> affiliated with, endorsed by, or sponsored by Pera Wallet, LDA, and does not use
> the Pera name or logos to identify itself. Per-file copyright notices from the
> original authors are retained as the license requires.

## CorvidLabs additions

- **Brand**: identity and palette from the [CorvidLabs design system](https://github.com/CorvidLabs/design-system) (teal "sheen" `#0E6F66`, not purple).
- **spec-sync**: bidirectional spec-to-code validation across the codebase (CI-enforced).
- **fledge**: task runner (`fledge run spec-check`, lanes).
- **AlgoChat messaging** (experimental, feature-flagged off): end-to-end encrypted on-chain messaging.

## Building

The app builds with no extra setup — see [`BUILDING.md`](BUILDING.md).

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md). Contributions are accepted under the
Apache License 2.0.
