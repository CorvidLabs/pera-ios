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

//   CorvidChatService.swift
//
//   The ONLY app-facing file that touches the AlgoChat SDK. It talks to the
//   vendored `AlgoChatKit.framework` Foundation-only facade (ACKClient), which
//   internally derives a dedicated messaging key from the wallet seed via HKDF
//   and runs the X25519 + ChaCha20-Poly1305 on-chain encrypted transport. The
//   spending key is never exposed here.

@preconcurrency import Foundation
import AlgoChatKit
import pera_wallet_core

/// A single decrypted message in a Corvid (AlgoChat) conversation.
public struct CorvidChatMessage: Sendable, Identifiable {
    public let id: UUID
    public let body: String
    public let isOutgoing: Bool

    public init(id: UUID, body: String, isOutgoing: Bool) {
        self.id = id
        self.body = body
        self.isOutgoing = isOutgoing
    }
}

/// Errors surfaced by ``CorvidChatService``.
public enum CorvidChatError: Error, LocalizedError, Sendable {
    case noSigningSeed
    case transport(String)

    public var errorDescription: String? {
        switch self {
        case .noSigningSeed:
            return "This account has no HD-wallet seed, so it can't derive a messaging key."
        case .transport(let detail):
            return detail
        }
    }
}

/// Actor-isolated wrapper around the AlgoChat facade for one signing account.
///
/// The messaging identity is derived from the account's HD-wallet seed, so it
/// is stable per account and independent of the spending key.
public actor CorvidChatService {

    // MARK: - Properties

    private let seed: Data
    private let network: ACKNetwork
    private var client: ACKClient?

    // MARK: - Initializers

    /// Builds a service for a raw HD-wallet seed.
    public init(seed: Data, network: ACKNetwork = .localnet) {
        self.seed = seed
        self.network = network
    }

    /// Builds a service for a Pera account by reading its HD-wallet seed from
    /// the keychain. Returns `nil` if the account is not an HD-wallet account.
    public init?(account: AccountInformation, network: ACKNetwork = .localnet) {
        guard
            let walletId = account.hdWalletAddressDetail?.walletId,
            let wallet = try? HDWalletStorage().wallet(id: walletId),
            let seed = HDWalletUtils.generateSeed(fromEntropy: wallet.entropy)
        else {
            return nil
        }
        self.seed = seed
        self.network = network
    }

    // MARK: - Public Methods

    /// This account's on-chain messaging address (derived, not the spending address).
    public func messagingAddress() async throws(CorvidChatError) -> String {
        try await ensureClient().address
    }

    /// Publishes this account's messaging public key so others can start a conversation.
    public func publishKey() async throws(CorvidChatError) {
        let client = try await ensureClient()
        do {
            try await client.publishKey()
        } catch {
            throw CorvidChatError.transport(error.localizedDescription)
        }
    }

    /// Decrypted message history with `peer`.
    public func messages(with peer: String) async throws(CorvidChatError) -> [CorvidChatMessage] {
        let client = try await ensureClient()
        do {
            let messages = try await client.messages(withPeer: peer)
            return messages.map { CorvidChatMessage(id: $0.id, body: $0.body, isOutgoing: $0.isOutgoing) }
        } catch {
            throw CorvidChatError.transport(error.localizedDescription)
        }
    }

    /// Sends an end-to-end-encrypted message to `peer`.
    public func send(_ body: String, to peer: String) async throws(CorvidChatError) {
        let client = try await ensureClient()
        do {
            try await client.send(body, toPeer: peer)
        } catch {
            throw CorvidChatError.transport(error.localizedDescription)
        }
    }

    // MARK: - Private Methods

    private func ensureClient() async throws(CorvidChatError) -> ACKClient {
        if let client { return client }
        do {
            let client = try await ACKClient(seed: seed, network: network)
            self.client = client
            return client
        } catch {
            throw CorvidChatError.transport(error.localizedDescription)
        }
    }
}
