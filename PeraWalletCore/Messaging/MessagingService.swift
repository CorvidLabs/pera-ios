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

//   MessagingService.swift

import Foundation

/// High-level entry point for the encrypted-messaging feature.
///
/// Mirrors the shape of `LiquidAuthServicing`: a feature-flag-gated, protocol
/// based service that validates the acting account and delegates the actual
/// encrypted transport to a `MessagingTransport`.
public protocol PeraMessagingServicing {
    /// Whether messaging is currently available (feature flag on).
    var isAvailable: Bool { get }

    /// Conversations for the given signing account.
    func conversations(
        for account: AccountInformation
    ) async throws(MessagingError) -> [ConversationSummary]

    /// Message history with `peerAddress` for the given signing account.
    func messages(
        with peerAddress: String,
        for account: AccountInformation
    ) async throws(MessagingError) -> [ChatMessage]

    /// Sends `body` from `account` to `peerAddress`.
    func send(
        _ body: String,
        to peerAddress: String,
        from account: AccountInformation
    ) async throws(MessagingError)

    /// Publishes `account`'s messaging key so others can start a conversation.
    func publishKey(
        for account: AccountInformation
    ) async throws(MessagingError)
}

public final class PeraMessagingService: PeraMessagingServicing {

    // MARK: - Properties

    private let featureFlagService: FeatureFlagServicing
    private let transport: MessagingTransport

    public var isAvailable: Bool {
        featureFlagService.isEnabled(.messagingEnabled)
    }

    // MARK: - Initializers

    public init(
        featureFlagService: FeatureFlagServicing,
        transport: MessagingTransport
    ) {
        self.featureFlagService = featureFlagService
        self.transport = transport
    }

    // MARK: - Public Methods

    public func conversations(
        for account: AccountInformation
    ) async throws(MessagingError) -> [ConversationSummary] {
        let address = try validatedAddress(for: account)
        return try await transport.loadConversations(forAddress: address)
    }

    public func messages(
        with peerAddress: String,
        for account: AccountInformation
    ) async throws(MessagingError) -> [ChatMessage] {
        let address = try validatedAddress(for: account)
        guard !peerAddress.isEmpty else {
            throw MessagingError.invalidAddress(peerAddress)
        }
        return try await transport.loadMessages(forAddress: address, peerAddress: peerAddress)
    }

    public func send(
        _ body: String,
        to peerAddress: String,
        from account: AccountInformation
    ) async throws(MessagingError) {
        let address = try validatedAddress(for: account)
        guard !peerAddress.isEmpty else {
            throw MessagingError.invalidAddress(peerAddress)
        }
        let trimmed = body.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            throw MessagingError.invalidMessage("Message is empty.")
        }
        try await transport.send(body: trimmed, forAddress: address, peerAddress: peerAddress)
    }

    public func publishKey(
        for account: AccountInformation
    ) async throws(MessagingError) {
        let address = try validatedAddress(for: account)
        try await transport.publishKey(forAddress: address)
    }

    // MARK: - Private Methods

    /// Ensures messaging is enabled and the account can sign (HD-wallet, standard type),
    /// returning its address. Mirrors the gating in `LiquidAuthService`.
    private func validatedAddress(for account: AccountInformation) throws(MessagingError) -> String {
        guard isAvailable else {
            throw MessagingError.notEnabled
        }
        guard account.hdWalletAddressDetail != nil, account.type == .standard else {
            throw MessagingError.signingAccountNotFound
        }
        return account.address
    }
}
