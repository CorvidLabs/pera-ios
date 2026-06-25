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

//   MessagingFlowCoordinator.swift

import UIKit
import pera_wallet_core

/// Drives the messaging flow: conversation list -> chat thread.
///
/// Self-contained (pushes directly onto the presenting screen's navigation
/// controller) so it does not require edits to the shared `Screen`/`Router`.
/// Launch it from the Menu — see `makeService(configuration:)` and the
/// integration note in the Messaging spec for the one-line menu hook.
final class MessagingFlowCoordinator {

    private let configuration: ViewControllerConfiguration
    private let presentingScreen: UIViewController
    private let account: AccountInformation
    private let messagingService: PeraMessagingServicing

    init(
        configuration: ViewControllerConfiguration,
        presentingScreen: UIViewController,
        account: AccountInformation,
        messagingService: PeraMessagingServicing
    ) {
        self.configuration = configuration
        self.presentingScreen = presentingScreen
        self.account = account
        self.messagingService = messagingService
    }

    func launch() {
        guard messagingService.isAvailable else { return }
        let list = ConversationListViewController(
            account: account,
            messagingService: messagingService,
            configuration: configuration
        )
        list.delegate = self
        presentingScreen.navigationController?.pushViewController(list, animated: true)
    }

    private func openChat(peerAddress: String, from controller: UIViewController) {
        let chat = ChatViewController(
            account: account,
            peerAddress: peerAddress,
            messagingService: messagingService,
            configuration: configuration
        )
        controller.navigationController?.pushViewController(chat, animated: true)
    }

    /// Builds the production messaging service.
    ///
    /// NOTE: the `AlgoChatTransport` client resolver is the unresolved bridge
    /// between Pera's HD-wallet accounts and the AlgoChat SDK account/signer.
    /// Until that is implemented, the resolver throws, so the feature must stay
    /// behind the `messagingEnabled` flag (default off).
    static func makeService(
        featureFlagService: FeatureFlagServicing
    ) -> PeraMessagingServicing {
        let transport = AlgoChatTransport { _ in
            // TODO: construct an AlgoChat client from the user's HD-wallet account.
            throw MessagingError.transportFailure()
        }
        return PeraMessagingService(featureFlagService: featureFlagService, transport: transport)
    }
}

extension MessagingFlowCoordinator: ConversationListViewControllerDelegate {
    func conversationList(
        _ controller: ConversationListViewController,
        didSelectPeerAddress peerAddress: String
    ) {
        openChat(peerAddress: peerAddress, from: controller)
    }
}
