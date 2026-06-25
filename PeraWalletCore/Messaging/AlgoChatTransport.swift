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
//   │  This file is NOT build-verified. It is written against the          │
//   │  documented swift-algochat README API. Lines marked `VERIFY:` use    │
//   │  SDK symbols whose exact names/signatures must be confirmed against   │
//   │  the resolved package and an Xcode build before shipping.            │
//   │                                                                       │
//   │  The account/key bridge (see `ClientResolver`) is the key open       │
//   │  question: Pera signs via XHDWalletAPI.rawSign and never exposes a    │
//   │  raw private key, while AlgoChat needs an `Account` it can use for    │
//   │  X25519 key agreement + transaction signing. Resolving that requires │
//   │  either (a) swift-algochat accepting an external signer, or          │
//   │  (b) deriving a dedicated messaging key from the HD-wallet seed       │
//   │  (available via PassKeyService.makeSigningSDK's seed path).          │
//   └─────────────────────────────────────────────────────────────────────┘

import Foundation
import AlgoChat

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
            let conversations = try await chat.conversations() // VERIFY: AlgoChat.conversations()
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
            let recipient = try Address(string: peerAddress) // VERIFY: AlgoChat `Address(string:)`
            let conversation = try await chat.conversation(with: recipient)
            let refreshed = try await chat.refresh(conversation) // VERIFY: refresh(_:)
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
            // VERIFY: send(_:to:options:) — `.indexed` guarantees visibility on refresh.
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
            try await chat.publishKeyAndWait() // VERIFY: publishKeyAndWait()
        } catch let error as MessagingError {
            throw error
        } catch {
            throw MessagingError.transportFailure(cause: error)
        }
    }

    // MARK: - Mapping (SDK -> Pera models)

    private static func makeSummary(from conversation: Conversation) -> ConversationSummary {
        // VERIFY: Conversation.peerAddress / .lastMessage property names.
        let last = conversation.messages.last
        return ConversationSummary(
            peerAddress: conversation.peerAddress,
            peerName: nil,
            lastMessagePreview: last?.content,
            lastMessageDate: last?.timestamp,
            isLastMessageOutgoing: last.map { Self.isOutgoing($0) } ?? false
        )
    }

    private static func makeMessage(from message: Message, peerAddress: String) -> ChatMessage {
        // VERIFY: Message.id / .content / .timestamp / .direction property names.
        ChatMessage(
            id: message.id,
            peerAddress: peerAddress,
            body: message.content,
            isOutgoing: isOutgoing(message),
            date: message.timestamp
        )
    }

    private static func isOutgoing(_ message: Message) -> Bool {
        // VERIFY: Message.direction enum (`.sent` / `.received`).
        message.direction == .sent
    }
}
