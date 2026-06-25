import Foundation
import CryptoKit
@_implementationOnly import AlgoChat
@_implementationOnly import Algorand
@_implementationOnly import AlgoKit

/// Foundation-only facade over swift-algochat. Seals the SDK (and its
/// swift-crypto) inside this framework so the host app never imports them.
public final class ACKClient {

    private let chat: AlgoChat
    public let address: String

    /// Builds a client from a wallet seed. A dedicated messaging key is derived
    /// from the seed (HKDF-SHA256) so the spending key is never used.
    public init(seed: Data, network: ACKNetwork) async throws {
        let key = ACKClient.messagingKey(fromSeed: seed)
        let account = try Account(privateKey: key)
        self.chat = try await AlgoChat(network: network.sdk, account: account)
        self.address = account.address.description
    }

    /// Publishes this account's encryption key on-chain.
    public func publishKey() async throws {
        _ = try await chat.publishKeyAndWait(timeout: 30)
    }

    /// Decrypted message history with `peer`.
    public func messages(withPeer peer: String) async throws -> [ACKMessage] {
        let recipient = try Address(string: peer)
        let conversation = try await chat.refresh(try await chat.conversation(with: recipient))
        return conversation.messages.map {
            ACKMessage(
                id: UUID(),
                body: $0.content,
                isOutgoing: $0.direction == .sent,
                timestamp: $0.timestamp
            )
        }
    }

    /// Sends an end-to-end-encrypted message to `peer`.
    public func send(_ body: String, toPeer peer: String) async throws {
        let recipient = try Address(string: peer)
        _ = try await chat.send(body, to: recipient, options: .indexed)
    }

    static func messagingKey(fromSeed seed: Data) -> Data {
        let derived = HKDF<SHA256>.deriveKey(
            inputKeyMaterial: SymmetricKey(data: seed),
            salt: Data("pera-algochat".utf8),
            info: Data("messaging-account-v1".utf8),
            outputByteCount: 32
        )
        return derived.withUnsafeBytes { Data($0) }
    }
}
