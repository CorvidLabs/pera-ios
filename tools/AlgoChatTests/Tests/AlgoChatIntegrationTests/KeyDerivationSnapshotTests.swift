import XCTest
import Foundation
import Algorand
import MessagingCore

/// Snapshot (golden) tests for the messaging key bridge.
///
/// These lock the derivation `MessagingKeyDerivation.messagingKey(fromSeed:)`:
/// a given wallet seed must always map to the same AlgoChat messaging address.
/// If a golden changes, every user's messaging identity would change — so the
/// snapshot guards against accidental drift in the HKDF params or key handling.
final class KeyDerivationSnapshotTests: XCTestCase {

    /// seed → derived messaging address (recorded golden values).
    private let goldens: [(seed: String, address: String)] = [
        ("pera-hdwallet-seed::alice::entropy-sample",
         "XGDTAESESUUNE5ZETHA2J5WHZZ3YU4DP62ZZVHGDORFMUH7HJIGSQAR5JE"),
        ("pera-hdwallet-seed::bob::entropy-sample",
         "KDZUDCBRKUOU3IXTIJA4OJFEGO2WEAKNI2Y4TNRPHA6KG776UED65CETTA"),
    ]

    func testDerivationMatchesGoldenSnapshot() throws {
        for golden in goldens {
            let key = MessagingKeyDerivation.messagingKey(fromSeed: Data(golden.seed.utf8))
            XCTAssertEqual(key.count, 32, "messaging key must be 32 bytes")
            let account = try Account(privateKey: key)
            XCTAssertEqual(
                account.address.description,
                golden.address,
                "derivation drifted for seed \"\(golden.seed)\""
            )
        }
    }

    func testDerivationIsDeterministic() {
        let seed = Data("determinism-check".utf8)
        XCTAssertEqual(
            MessagingKeyDerivation.messagingKey(fromSeed: seed),
            MessagingKeyDerivation.messagingKey(fromSeed: seed)
        )
    }

    func testDistinctSeedsProduceDistinctKeys() {
        XCTAssertNotEqual(
            MessagingKeyDerivation.messagingKey(fromSeed: Data("seed-a".utf8)),
            MessagingKeyDerivation.messagingKey(fromSeed: Data("seed-b".utf8))
        )
    }
}
