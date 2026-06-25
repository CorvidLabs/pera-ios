// Copyright 2022-2025 Pera Wallet, LDA

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//    http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//   AlgoChatTransport.swift
//
//   ┌─────────────────────────────────────────────────────────────────────┐
//   │  SDK ADAPTER — the ONLY file that imports the AlgoChat SDK.           │
//   │                                                                       │
//   │  Every SDK call below was verified against swift-algochat: a headless │
//   │  harness drove this exact API (conversations/conversation/refresh/    │
//   │  send/fetchPublicKey/publishKeyAndWait + Conversation.participant +   │
//   │  Message.id/.content/.timestamp/.direction) through a full end-to-end │
//   │  encrypted exchange on an AlgoKit LocalNet. (`Conversation.peerAddress│
//   │  → .participant` was fixed as a result.)                             │
//   │                                                                       │
//   │  The ONE remaining open item is the account/key bridge (see           │
//   │  `ClientResolver`): Pera signs via XHDWalletAPI.rawSign and never     │
//   │  exposes a raw private key, while AlgoChat needs an `Account` for     │
//   │  X25519 key agreement + transaction signing. Resolve via either       │
//   │  (a) swift-algochat accepting an external signer, or (b) deriving a   │
//   │  dedicated messaging key from the HD-wallet seed (the seed is         │
//   │  reachable via PassKeyService.makeSigningSDK). See INTEGRATION.md.    │
//   └─────────────────────────────────────────────────────────────────────┘

import Foundation
import AlgoChat
import Algorand

/// `MessagingTransport` backed by the on-chain, end-to-end-encrypted AlgoChat SDK.
public final class AlgoChatTransport: MessagingTransport {

    /// Resolves a ready-to-use `AlgoChat` client for a given Pera account address.
    ///
    /// Injected so that the (unresolved) account/key bridge lives at the app
    /// wiring site rather than in this mapping layer. The app is expected to
    /// build the SDK account from the user's HD wallet and return a client.
    public typealias ClientResolver = @Sendable (_ address: String) async throws -> AlgoChat

    private let resolveClient: ClientResolver

    public init(resolveClient: @escaping ClientResolver) {
        self.resolveClient = resolveClient
    }

    // MARK: - MessagingTransport

    public func loadConversations(
        forAddress address: String
    ) async throws(MessagingError) -> [ConversationSummary] {
        do {
            let chat = try await resolveClient(address)
            let conversations = try await chat.conversations() // confirmed: AlgoChat.conversations()
            return conversations.map { Self.makeSummary(from: $0) }
        } catch let error as MessagingError {
            throw error
        } catch {
            throw MessagingError.transportFailure(cause: error)
        }
    }

    public func loadMessages(
        forAddress address: String,
        peerAddress: String
    ) async throws(MessagingError) -> [ChatMessage] {
        do {
            let chat = try await resolveClient(address)
            let recipient = try Address(string: peerAddress) // confirmed: Address(string:)
            let conversation = try await chat.conversation(with: recipient)
            let refreshed = try await chat.refresh(conversation) // confirmed: refresh(_:)
            return refreshed.messages.map { Self.makeMessage(from: $0, peerAddress: peerAddress) }
        } catch let error as MessagingError {
            throw error
        } catch {
            throw MessagingError.transportFailure(cause: error)
        }
    }

    public func send(
        body: String,
        forAddress address: String,
        peerAddress: String
    ) async throws(MessagingError) {
        do {
            let chat = try await resolveClient(address)
            let recipient = try Address(string: peerAddress)
            let conversation = try await chat.conversation(with: recipient)
            // confirmed: send(_:to:options:) -> SendResult; .indexed waits for the indexer.
            try await chat.send(body, to: conversation, options: .indexed)
        } catch let error as MessagingError {
            throw error
        } catch {
            throw MessagingError.transportFailure(cause: error)
        }
    }

    public func publishKey(
        forAddress address: String
    ) async throws(MessagingError) {
        do {
            let chat = try await resolveClient(address)
            _ = try await chat.publishKeyAndWait() // confirmed: publishKeyAndWait()
        } catch let error as MessagingError {
            throw error
        } catch {
            throw MessagingError.transportFailure(cause: error)
        }
    }

    // MARK: - Mapping (SDK -> Pera models)

    private static func makeSummary(from conversation: Conversation) -> ConversationSummary {
        // Confirmed against swift-algochat: Conversation.participant (Address), .lastMessage.
        let last = conversation.lastMessage
        return ConversationSummary(
            peerAddress: conversation.participant.description,
            peerName: nil,
            lastMessagePreview: last?.content,
            lastMessageDate: last?.timestamp,
            isLastMessageOutgoing: last.map { Self.isOutgoing($0) } ?? false
        )
    }

    private static func makeMessage(from message: Message, peerAddress: String) -> ChatMessage {
        // Confirmed against swift-algochat: Message.id / .content / .timestamp / .direction.
        ChatMessage(
            id: message.id,
            peerAddress: peerAddress,
            body: message.content,
            isOutgoing: isOutgoing(message),
            date: message.timestamp
        )
    }

    private static func isOutgoing(_ message: Message) -> Bool {
        // confirmed: Message.Direction { .sent, .received }
        message.direction == .sent
    }
}
