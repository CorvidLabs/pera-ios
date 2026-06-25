import Foundation
@_implementationOnly import Algorand

/// The Algorand network an `ACKClient` connects to.
public enum ACKNetwork: Sendable, Hashable {
    case localnet
    case testnet
    case mainnet

    var sdk: AlgorandConfiguration.Network {
        switch self {
        case .localnet: return .localnet
        case .testnet: return .testnet
        case .mainnet: return .mainnet
        }
    }
}
