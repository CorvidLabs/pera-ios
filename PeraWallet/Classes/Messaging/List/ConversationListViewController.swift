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

//   ConversationListViewController.swift

import UIKit
import pera_wallet_core

protocol ConversationListViewControllerDelegate: AnyObject {
    func conversationList(
        _ controller: ConversationListViewController,
        didSelectPeerAddress peerAddress: String
    )
}

/// Lists the encrypted conversations for the active signing account.
///
/// Uses a plain `UITableView` to keep the slice build-safe; the production
/// version should adopt the MacaroonUIKit cell pattern used elsewhere
/// (`BaseCollectionViewCell<ContextView>`), as in `ContactsViewController`.
final class ConversationListViewController: BaseViewController {

    weak var delegate: ConversationListViewControllerDelegate?

    private let messagingService: PeraMessagingServicing
    private let account: AccountInformation

    private lazy var tableView = UITableView(frame: .zero, style: .plain)
    private var items: [ConversationListItemViewModel] = []

    init(
        account: AccountInformation,
        messagingService: PeraMessagingServicing,
        configuration: ViewControllerConfiguration
    ) {
        self.account = account
        self.messagingService = messagingService
        super.init(configuration: configuration)
    }

    override func configureAppearance() {
        super.configureAppearance()
        title = "Messages"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "conversation")
    }

    override func linkInteractors() {
        super.linkInteractors()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepareLayout() {
        super.prepareLayout()
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }

    private func reload() {
        Task { [weak self] in
            guard let self else { return }
            do {
                let summaries = try await self.messagingService.conversations(for: self.account)
                self.items = summaries.map(ConversationListItemViewModel.init)
                await MainActor.run { self.tableView.reloadData() }
            } catch {
                await MainActor.run { self.presentMessagingError(error) }
            }
        }
    }

    private func presentMessagingError(_ error: Error) {
        let message = (error as? MessagingError)?.errorDescription ?? error.localizedDescription
        let alert = UIAlertController(title: "Messaging", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension ConversationListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "conversation", for: indexPath)
        let item = items[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = item.title
        content.secondaryText = item.subtitle
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.conversationList(self, didSelectPeerAddress: items[indexPath.row].peerAddress)
    }
}
