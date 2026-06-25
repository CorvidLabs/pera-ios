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
/// NFT we issue. Every CorvidLabs app stays free for everyone; the pass unlocks
/// the Pro tier and gets holders into each product's beta first. This models who
/// holds the pass and what it surfaces.
enum NevermoreMembership {
    /// The Nevermore pass ASA.
    ///
    /// Release: set to the real mainnet asset ID once the collection is locked.
    /// LocalNet/Debug: the demo can flip the member state via `CORVID_FORCE_MEMBER=1`
    /// (the in-app account can't be made to hold an external asset without an opt-in
    /// we can't sign from here), so this can stay `0` until the real ID is wired.
    static let assetID: AssetID = 0

    /// Where a product sits on the CorvidLabs release ladder.
    enum Stage: Hashable {
        case live
        case beta
        case soon

        var label: String {
            switch self {
            case .live: return "LIVE"
            case .beta: return "BETA"
            case .soon: return "SOON"
            }
        }
    }

    /// A CorvidLabs product surfaced on the pass screen.
    struct Product: Hashable {
        let symbol: String
        let name: String
        let tagline: String
        let stage: Stage
    }

    /// The flagship, featured big. Quill — github.com/CorvidLabs/quill.
    static let hero = Product(
        symbol: "waveform",
        name: "Quill",
        tagline: "Local-first voice dictation. Whisper STT, on-device LLM polish, and system-wide text injection.",
        stage: .beta
    )

    /// What the pass gives a Quill holder — base app is free for everyone.
    static let heroMemberPerk = "Quill Pro — unlocked for life"
    static let heroPublicPerk = "Free to use · Pro unlocks with the pass"

    /// "More unlocking soon" — honest about what's live vs. coming.
    static let more: [Product] = [
        Product(
            symbol: "checkmark.seal.fill",
            name: "Verification",
            tagline: "On-chain wallet & asset ownership — it's checking your pass right now.",
            stage: .live
        ),
        Product(
            symbol: "square.grid.2x2.fill",
            name: "Apps, tools & sites",
            tagline: "More CorvidLabs apps, websites, and client releases as they ship.",
            stage: .soon
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
