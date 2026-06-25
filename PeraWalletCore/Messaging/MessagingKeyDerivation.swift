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

//   MessagingKeyDerivation.swift

import Foundation
import CryptoKit

/// Derives the AlgoChat messaging key from a Pera HD-wallet seed.
///
/// Pera never exposes a raw spending key; it can reach the HD-wallet *seed*
/// (the same value `PassKeyService.makeSigningSDK` obtains). This derives a
/// dedicated, domain-separated 32-byte messaging key from that seed, so the
/// user's spending key is never handed to the messaging SDK. The derivation is
/// deterministic — the same wallet always yields the same messaging identity.
///
/// Verified end-to-end on an AlgoKit LocalNet: two seed-derived identities
/// exchanged an E2E-encrypted message on-chain using exactly this function.
public enum MessagingKeyDerivation {

    private static let salt = Data("pera-algochat".utf8)
    private static let info = Data("messaging-account-v1".utf8)

    /// Derives a deterministic 32-byte AlgoChat messaging key from `seed`.
    /// - Parameter seed: The HD-wallet seed bytes.
    /// - Returns: A 32-byte key suitable for `Account(privateKey:)`.
    public static func messagingKey(fromSeed seed: Data) -> Data {
        let derived = HKDF<SHA256>.deriveKey(
            inputKeyMaterial: SymmetricKey(data: seed),
            salt: salt,
            info: info,
            outputByteCount: 32
        )
        return derived.withUnsafeBytes { Data($0) }
    }
}
