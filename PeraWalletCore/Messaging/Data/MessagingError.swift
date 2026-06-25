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

//   MessagingError.swift

import Foundation

/// Errors surfaced by the encrypted-messaging feature.
public enum MessagingError: LocalizedError {
    /// The feature flag (`enable_messaging`) is off.
    case notEnabled
    /// No account capable of signing (HD-wallet, standard type) is available.
    case signingAccountNotFound
    /// The supplied address could not be used to start or load a conversation.
    case invalidAddress(String)
    /// The message body was empty or exceeded the on-chain size limit.
    case invalidMessage(String)
    /// The underlying messaging transport (AlgoChat SDK / network) failed.
    case transportFailure(cause: Error? = nil)

    public var errorDescription: String? {
        switch self {
        case .notEnabled:
            return "Messaging is not available."
        case .signingAccountNotFound:
            return "No account is available to send or receive messages."
        case .invalidAddress(let address):
            return "Invalid address: \(address)"
        case .invalidMessage(let detail):
            return "Message could not be sent: \(detail)"
        case .transportFailure(let cause):
            return cause?.localizedDescription ?? "Messaging is temporarily unavailable."
        }
    }
}
