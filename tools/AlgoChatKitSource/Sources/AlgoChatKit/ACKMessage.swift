import Foundation

/// One decrypted AlgoChat message.
public struct ACKMessage: Sendable, Identifiable {
    public let id: UUID
    public let body: String
    public let isOutgoing: Bool
    /// When the message was confirmed on-chain.
    public let timestamp: Date

    public init(body: String, isOutgoing: Bool, timestamp: Date = Date()) {
        self.id = UUID()
        self.body = body
        self.isOutgoing = isOutgoing
        self.timestamp = timestamp
    }

    init(id: UUID, body: String, isOutgoing: Bool, timestamp: Date) {
        self.id = id
        self.body = body
        self.isOutgoing = isOutgoing
        self.timestamp = timestamp
    }
}
