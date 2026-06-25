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

//   AlgoChatClientFactory.swift
//
//   SDK glue: builds an AlgoChat client from a Pera HD-wallet account.
//   The key step (seed -> MessagingKeyDerivation -> Account) was verified
//   end-to-end on an AlgoKit LocalNet. Needs the swift-algochat SPM package
//   (see INTEGRATION.md); imports the SDK, like AlgoChatTransport.

import Foundation
import AlgoChat
import Algorand
import AlgoKit

/// Builds AlgoChat clients for Pera accounts by deriving a dedicated messaging
/// key from each account's HD-wallet seed.
public final class AlgoChatClientFactory {

    /// Returns the HD-wallet seed bytes for a given account address.
    public typealias SeedProvider = @Sendable (_ address: String) async throws -> Data

    private let network: AlgorandConfiguration.Network
    private let seedProvider: SeedProvider

    public init(
        network: AlgorandConfiguration.Network,
        seedProvider: @escaping SeedProvider
    ) {
        self.network = network
        self.seedProvider = seedProvider
    }

    /// Builds an `AlgoChat` client for `address`, deriving its messaging key
    /// from the wallet seed (the spending key is never exposed).
    public func makeClient(forAddress address: String) async throws -> AlgoChat {
        let seed = try await seedProvider(address)
        let key = MessagingKeyDerivation.messagingKey(fromSeed: seed)
        let account = try Account(privateKey: key)
        return try await AlgoChat(network: network, account: account)
    }

    /// A `ClientResolver` suitable for `AlgoChatTransport`.
    /// Captures the immutable config locally so the `@Sendable` closure does not
    /// capture `self`.
    public func clientResolver() -> AlgoChatTransport.ClientResolver {
        let network = self.network
        let seedProvider = self.seedProvider
        return { address in
            let seed = try await seedProvider(address)
            let key = MessagingKeyDerivation.messagingKey(fromSeed: seed)
            let account = try Account(privateKey: key)
            return try await AlgoChat(network: network, account: account)
        }
    }

    /// Composes the full, ready-to-use messaging service.
    ///
    /// The `seedProvider` mirrors `PassKeyService.makeSigningSDK`'s seed path:
    /// look up the account's HD wallet by `walletId`, then derive the seed from
    /// its entropy. Kept here (the SDK module) so the UI never imports the SDK.
    public static func makeMessagingService(
        featureFlagService: FeatureFlagServicing,
        network: AlgorandConfiguration.Network,
        seedProvider: @escaping SeedProvider
    ) -> PeraMessagingServicing {
        let factory = AlgoChatClientFactory(network: network, seedProvider: seedProvider)
        let transport = AlgoChatTransport(resolveClient: factory.clientResolver())
        return PeraMessagingService(featureFlagService: featureFlagService, transport: transport)
    }
}
