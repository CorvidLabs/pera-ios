# PeraWallet_Classes_Messaging — Context

## Overview
Encrypted-messaging feature, AlgoChat-style. Core logic in the `Messaging` spec; UI in `PeraWallet_Classes_Messaging`.

## Architecture
Service (`PeraMessagingServicing`) -> `MessagingTransport` seam -> `AlgoChatTransport` (only SDK importer). UI is MVVM with a flow coordinator.

## Status
Feature-flagged OFF (`enable_messaging`). SDK adapter + SPM wiring NOT build-verified.
