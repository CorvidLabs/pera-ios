import Foundation
@_implementationOnly import AlgoChat
@_implementationOnly import Algorand

/// Top-level AlgoChatKit facade metadata + stateless helpers.
public enum AlgoChatKit {
    /// Facade version.
    public static let version = "1.0.0"

    /// Maximum plaintext message size, in bytes.
    public static let maxMessageBytes = ChatEnvelope.maxPayloadSize

    /// Derives the on-chain messaging address from a wallet seed, without
    /// constructing a client. Useful as a cheap "is the SDK linked & working"
    /// check and for previewing an account's messaging identity.
    public static func messagingAddress(fromSeed seed: Data) throws -> String {
        let key = ACKClient.messagingKey(fromSeed: seed)
        let account = try Account(privateKey: key)
        return account.address.description
    }
}
