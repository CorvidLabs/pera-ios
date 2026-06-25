---
module: PeraWallet_Classes_Messaging
version: 1
status: active
files:
  - PeraWallet/Classes/Messaging/Chat/ChatViewController.swift
  - PeraWallet/Classes/Messaging/List/ConversationListItemViewModel.swift
  - PeraWallet/Classes/Messaging/List/ConversationListViewController.swift
  - PeraWallet/Classes/Messaging/MessagingFlowCoordinator.swift
db_tables: []
depends_on:
  - specs/Messaging/Messaging.spec.md
---

# PeraWallet_Classes_Messaging

## Purpose

App-target UI for the encrypted-messaging feature. `MessagingFlowCoordinator`
launches a `ConversationListViewController` (the conversation list for the active
account) and pushes a `ChatViewController` (a single thread with a compose bar)
when a conversation is tapped. All data flows through the core
`PeraMessagingServicing`; the UI never touches the AlgoChat SDK. The feature is
gated by the `messagingEnabled` flag and self-contained (it pushes directly,
without edits to the shared `Router`).

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (view controllers, view models, the flow
coordinator) are consumed only within the app target.

## Invariants

1. The coordinator is a no-op unless `messagingService.isAvailable` is true (`messagingEnabled` flag on).
2. Screens are constructed with a `ViewControllerConfiguration` and a `PeraMessagingServicing`, mirroring existing feature screens.
3. The UI imports `pera_wallet_core` but never the AlgoChat SDK.
4. Compose sends are ignored for empty/whitespace input before calling the service.

## Behavioral Examples

### Scenario: Open conversations

- **Given** messaging is enabled and a signing account
- **When** the coordinator's `launch()` runs
- **Then** the conversation list is pushed and populated via `conversations(for:)`

### Scenario: Send from a thread

- **Given** an open `ChatViewController`
- **When** the user types text and taps Send
- **Then** the service sends it and the thread reloads

## Error Cases

| Condition | Behavior |
|-----------|----------|
| Service throws `MessagingError` | An alert is shown with the localized description |
| Feature flag off | `launch()` returns without pushing any screen |
| Empty compose input | Send is ignored |

## Dependencies

| Module | Usage |
|--------|-------|
| Messaging (`PeraMessagingServicing`) | Loads conversations/messages and sends |
| Models (`AccountInformation`) | The acting account passed into screens |
| Application (`BaseViewController`, `ViewControllerConfiguration`) | Base screen + DI container |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
