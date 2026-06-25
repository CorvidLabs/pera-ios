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

//   ConversationListItemViewModel.swift

import Foundation
import pera_wallet_core

/// Presentation model for one row in the conversation list.
struct ConversationListItemViewModel {
    let peerAddress: String
    let title: String
    let subtitle: String
    let dateText: String?

    init(_ summary: ConversationSummary) {
        peerAddress = summary.peerAddress
        title = summary.peerName ?? ConversationListItemViewModel.shorten(summary.peerAddress)
        let preview = summary.lastMessagePreview ?? "No messages yet"
        subtitle = summary.isLastMessageOutgoing ? "You: \(preview)" : preview
        dateText = summary.lastMessageDate.map(ConversationListItemViewModel.format)
    }

    private static func shorten(_ address: String) -> String {
        guard address.count > 12 else { return address }
        return "\(address.prefix(6))…\(address.suffix(6))"
    }

    private static func format(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
