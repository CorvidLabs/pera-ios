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

//   ChatMessage.swift

import Foundation

/// A single decrypted message in a conversation.
///
/// This is a Pera-facing value type, deliberately decoupled from the AlgoChat
/// SDK types so that the UI and service layers never import the SDK directly.
public struct ChatMessage: Identifiable, Equatable {
    /// Stable identifier (the on-chain transaction id of the message).
    public let id: String
    /// The address of the other party in the conversation.
    public let peerAddress: String
    /// The decrypted plain-text body.
    public let body: String
    /// `true` when this account sent the message, `false` when it was received.
    public let isOutgoing: Bool
    /// The block time the message was recorded on-chain.
    public let date: Date

    public init(id: String, peerAddress: String, body: String, isOutgoing: Bool, date: Date) {
        self.id = id
        self.peerAddress = peerAddress
        self.body = body
        self.isOutgoing = isOutgoing
        self.date = date
    }
}
