---
module: Messaging
version: 1
status: active
files:
  - PeraWalletCore/Messaging/AlgoChatTransport.swift
  - PeraWalletCore/Messaging/Data/ChatMessage.swift
  - PeraWalletCore/Messaging/Data/ConversationSummary.swift
  - PeraWalletCore/Messaging/Data/MessagingError.swift
  - PeraWalletCore/Messaging/MessagingService.swift
  - PeraWalletCore/Messaging/MessagingTransport.swift
db_tables: []
depends_on: []
---

# Messaging

## Purpose

Core layer for an AlgoChat-style end-to-end encrypted, on-chain messaging
feature. Exposes a feature-flag-gated `PeraMessagingServicing` that validates the
acting account and delegates encrypted send/receive to a `MessagingTransport`.
The only SDK-aware component is `AlgoChatTransport`, which adapts the
[swift-algochat](https://github.com/CorvidLabs/swift-algochat) client to the
Pera-defined transport seam. Pera-facing value types (`ChatMessage`,
`ConversationSummary`) keep the SDK out of the service and UI layers.

## Public API

| Export | Description |
|--------|-------------|
| `MessagingError` | Typed error enum for the messaging feature (not enabled, no signing account, invalid address/message, transport failure). |
| `errorDescription` | `LocalizedError` text for each `MessagingError` case. |
| `ChatMessage` | Pera-facing decrypted message value type. |
| `id` | Stable id of a message (the on-chain transaction id). |
| `peerAddress` | Address of the other party in a message/conversation. |
| `body` | Decrypted plain-text message body. |
| `isOutgoing` | True when the acting account sent the message. |
| `date` | Block time the message was recorded on-chain. |
| `ConversationSummary` | One conversation-list row: a peer plus a latest-message preview. |
| `peerName` | Optional contact-resolved display name for the peer. |
| `lastMessagePreview` | Preview text of the most recent message, if any. |
| `lastMessageDate` | Timestamp of the most recent message, if any. |
| `isLastMessageOutgoing` | True when the most recent message was sent by this account. |
| `MessagingTransport` | Pera-defined protocol abstracting the encrypted backend (load/send/publish). |
| `loadConversations` | Transport call returning all conversations for an address. |
| `loadMessages` | Transport call returning the message history with a peer. |
| `send` | Encrypts and sends a body from an address to a peer. |
| `publishKey` | Publishes an address's public messaging key so others can message it first. |
| `PeraMessagingServicing` | High-level, feature-flag-gated messaging service protocol. |
| `isAvailable` | Whether messaging is currently enabled (the `enable_messaging` flag). |
| `conversations` | Conversations for a given signing account. |
| `messages` | Message history with a peer for a given signing account. |
| `init` | Initializers for the value types, service, and transport adapter. |
| `ClientResolver` | Closure type resolving a ready `AlgoChat` client for an address (the account/key bridge seam). |

## Invariants

1. Every entry point is gated on the `messagingEnabled` feature flag; when off it throws `MessagingError.notEnabled`.
2. Only HD-wallet, `.standard`-type accounts may send/receive; others throw `signingAccountNotFound`.
3. Empty peer addresses and empty/whitespace message bodies are rejected before reaching the transport.
4. The AlgoChat SDK is imported in exactly one file (`AlgoChatTransport`); the service and UI never import it.
5. Message bodies are end-to-end encrypted by the transport; plain text never leaves the device unencrypted.

## Behavioral Examples

### Scenario: Send a message

- **Given** messaging is enabled and a standard HD-wallet account
- **When** `send(_:to:from:)` is called with non-empty text and peer
- **Then** the transport encrypts and submits it on-chain

### Scenario: Feature disabled

- **Given** the `messagingEnabled` flag is off
- **When** any service method is called
- **Then** `MessagingError.notEnabled` is thrown

### Scenario: Watch-only account

- **Given** a watch-only or ledger account
- **When** `conversations(for:)` is called
- **Then** `MessagingError.signingAccountNotFound` is thrown

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Feature flag off | Throws `MessagingError.notEnabled` |
| Non-signing account | Throws `MessagingError.signingAccountNotFound` |
| Empty peer address | Throws `MessagingError.invalidAddress` |
| Empty message body | Throws `MessagingError.invalidMessage` |
| SDK / network failure | Throws `MessagingError.transportFailure(cause:)` |

## Dependencies

| Module | Usage |
|--------|-------|
| FeatureFlag (`FeatureFlagServicing`) | Gates the feature on `messagingEnabled` |
| Models (`AccountInformation`) | Identifies the acting account and its signing capability |
| swift-algochat (`AlgoChat`) | End-to-end encrypted on-chain transport (via `AlgoChatTransport` only) |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
