import XCTest
import Foundation
import Algorand
import AlgoChat
import AlgoKit
import MessagingCore

/// LocalNet integration test: proves the full AlgoChat path Pera's Messaging
/// feature wraps actually works on-chain — using seed-derived identities from
/// the real `MessagingKeyDerivation`.
///
/// Skips automatically when no AlgoKit LocalNet is reachable, so it is safe in
/// CI without one. Run a LocalNet (`algokit localnet start`) to exercise it.
final class LocalNetTests: XCTestCase {

    private let algodURL = "http://localhost:4001"
    private let algodToken = String(repeating: "a", count: 64)
    private let algodContainer = "algokit_sandbox_algod"

    func testEndToEndEncryptedExchangeOnLocalNet() async throws {
        let reachable = await localnetReachable()
        try XCTSkipUnless(reachable, "AlgoKit LocalNet not reachable on :4001")
        let dispenser = try XCTUnwrap(try? discoverDispenser(), "no funded localnet account found")

        // Two messaging identities derived from wallet seeds via the real bridge.
        let alice = try Account(privateKey: MessagingKeyDerivation.messagingKey(fromSeed: Data("it-alice-seed".utf8)))
        let bob = try Account(privateKey: MessagingKeyDerivation.messagingKey(fromSeed: Data("it-bob-seed".utf8)))

        try fund(address: alice.address.description, from: dispenser)
        try fund(address: bob.address.description, from: dispenser)

        let chatA = try await AlgoChat(network: .localnet, account: alice)
        let chatB = try await AlgoChat(network: .localnet, account: bob)

        try await waitUntil(timeout: 15) {
            let a = try await chatA.balance().value
            let b = try await chatB.balance().value
            return a > 0 && b > 0
        }

        _ = try await chatB.publishKeyAndWait(timeout: 30)
        try await waitUntil(timeout: 40) {
            ((try? await chatA.fetchPublicKey(for: bob.address)) != nil)
        }

        let secret = "localnet-xctest-proof"
        _ = try await chatA.send(secret, to: bob.address, options: .indexed)

        var received: Message?
        try await waitUntil(timeout: 30) {
            let conversations = try await chatB.conversations()
            received = conversations
                .first { $0.participant.description == alice.address.description }?
                .receivedMessages.first { $0.content == secret }
            return received != nil
        }

        let message = try XCTUnwrap(received, "Bob never received/decrypted the message")
        XCTAssertEqual(message.content, secret)
        XCTAssertEqual(message.direction, .received)
    }

    // MARK: - Helpers

    private func localnetReachable() async -> Bool {
        var request = URLRequest(url: URL(string: "\(algodURL)/v2/status")!)
        request.setValue(algodToken, forHTTPHeaderField: "X-Algo-API-Token")
        request.timeoutInterval = 3
        guard let (_, response) = try? await URLSession.shared.data(for: request) else { return false }
        return (response as? HTTPURLResponse)?.statusCode == 200
    }

    private func discoverDispenser() throws -> String {
        let out = try shell(["docker", "exec", algodContainer, "goal", "account", "list", "-d", "/algod/data"])
        // Pick the address with the largest balance (the dispenser).
        let best = out.split(separator: "\n").compactMap { line -> (String, Int)? in
            let cols = line.split(whereSeparator: { $0 == "\t" })
            guard cols.count >= 3 else { return nil }
            let addr = String(cols[1])
            let amount = Int(cols[2].split(separator: " ").first.map(String.init) ?? "") ?? 0
            return (addr, amount)
        }.max(by: { $0.1 < $1.1 })
        return try XCTUnwrap(best?.0)
    }

    private func fund(address: String, from dispenser: String) throws {
        _ = try shell(["docker", "exec", algodContainer, "goal", "clerk", "send",
                       "-a", "10000000", "-f", dispenser, "-t", address, "-d", "/algod/data"])
    }

    private func waitUntil(timeout seconds: Int, _ condition: () async throws -> Bool) async throws {
        for _ in 0..<seconds {
            if try await condition() { return }
            try await Task.sleep(nanoseconds: 1_000_000_000)
        }
        XCTFail("condition not met within \(seconds)s")
    }

    @discardableResult
    private func shell(_ args: [String]) throws -> String {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        task.arguments = args
        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe
        try task.run()
        task.waitUntilExit()
        let out = String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8) ?? ""
        guard task.terminationStatus == 0 else {
            throw NSError(domain: "shell", code: Int(task.terminationStatus),
                          userInfo: [NSLocalizedDescriptionKey: out])
        }
        return out
    }
}
