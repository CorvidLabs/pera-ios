// Copyright 2025 CorvidLabs

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//    http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//   NevermoreMembership.swift

import Foundation
import pera_wallet_core

/// Nevermore is the CorvidLabs lifetime-membership pass — a single, non-mintable
/// NFT that unlocks every CorvidLabs tool. This models who holds it and what it unlocks.
enum NevermoreMembership {
    /// The Nevermore pass ASA.
    ///
    /// Release: set to the real mainnet asset ID once the collection is locked.
    /// LocalNet/Debug: the demo can flip the member state via `CORVID_FORCE_MEMBER=1`
    /// (the in-app account can't be made to hold an external asset without an opt-in
    /// we can't sign from here), so this can stay `0` until the real ID is wired.
    static let assetID: AssetID = 0

    /// A CorvidLabs tool unlocked by the pass.
    struct Perk: Hashable {
        let symbol: String
        let name: String
        let detail: String
    }

    /// Everything the pass unlocks.
    static let perks: [Perk] = [
        Perk(
            symbol: "lock.open.fill",
            name: "AlgoChat",
            detail: "On-chain, end-to-end encrypted messaging"
        ),
        Perk(
            symbol: "arrow.triangle.2.circlepath",
            name: "spec-sync",
            detail: "Spec ↔ code validation that gates every change"
        ),
        Perk(
            symbol: "bird.fill",
            name: "fledge",
            detail: "Dev-lifecycle CLI — release, changelog, lanes"
        ),
        Perk(
            symbol: "chart.bar.fill",
            name: "augur",
            detail: "Graded trust — risk-scores every diff"
        ),
        Perk(
            symbol: "checkmark.seal.fill",
            name: "attest",
            detail: "Signed provenance ledger in git notes"
        ),
        Perk(
            symbol: "swift",
            name: "swift-algochat · algokit · algorand",
            detail: "The CorvidLabs Algorand Swift stack"
        )
    ]

    /// Whether any of the wallet's accounts holds the Nevermore pass.
    static func isMember(in sharedDataController: SharedDataController) -> Bool {
        #if DEBUG
        if ProcessInfo.processInfo.environment["CORVID_FORCE_MEMBER"] == "1" {
            return true
        }
        #endif

        guard assetID != 0 else { return false }

        return sharedDataController.sortedAccounts().contains { handle in
            handle.value.isOwner(of: assetID)
        }
    }
}
