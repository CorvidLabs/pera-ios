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

//   ConversationSummary.swift

import Foundation

/// A row in the conversation list: one peer plus a preview of the latest message.
public struct ConversationSummary: Identifiable, Equatable {
    /// The peer address uniquely identifies the conversation.
    public var id: String { peerAddress }
    /// The address of the other party.
    public let peerAddress: String
    /// Optional display name resolved from the user's contacts.
    public let peerName: String?
    /// Preview of the most recent message body, if any.
    public let lastMessagePreview: String?
    /// Timestamp of the most recent message, if any.
    public let lastMessageDate: Date?
    /// `true` when the most recent message was sent by this account.
    public let isLastMessageOutgoing: Bool

    public init(
        peerAddress: String,
        peerName: String? = nil,
        lastMessagePreview: String? = nil,
        lastMessageDate: Date? = nil,
        isLastMessageOutgoing: Bool = false
    ) {
        self.peerAddress = peerAddress
        self.peerName = peerName
        self.lastMessagePreview = lastMessagePreview
        self.lastMessageDate = lastMessageDate
        self.isLastMessageOutgoing = isLastMessageOutgoing
    }
}
