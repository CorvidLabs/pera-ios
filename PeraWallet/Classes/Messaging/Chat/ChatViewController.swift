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

//   ChatViewController.swift

import UIKit
import pera_wallet_core

/// A single conversation thread: message history + a compose bar.
///
/// Build-safe `UITableView` implementation; the production version should adopt
/// the app's MacaroonUIKit message-bubble cells.
final class ChatViewController: BaseViewController {

    private let messagingService: PeraMessagingServicing
    private let account: AccountInformation
    private let peerAddress: String

    private lazy var tableView = UITableView(frame: .zero, style: .plain)
    private lazy var inputField = UITextField()
    private lazy var sendButton = UIButton(type: .system)
    private lazy var inputBar = UIView()

    private var messages: [ChatMessage] = []

    init(
        account: AccountInformation,
        peerAddress: String,
        messagingService: PeraMessagingServicing,
        configuration: ViewControllerConfiguration
    ) {
        self.account = account
        self.peerAddress = peerAddress
        self.messagingService = messagingService
        super.init(configuration: configuration)
    }

    override func configureAppearance() {
        super.configureAppearance()
        title = "Chat"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "message")
        tableView.separatorStyle = .none
        inputField.placeholder = "Message"
        inputField.borderStyle = .roundedRect
        sendButton.setTitle("Send", for: .normal)
    }

    override func linkInteractors() {
        super.linkInteractors()
        tableView.dataSource = self
        sendButton.addTarget(self, action: #selector(didTapSend), for: .touchUpInside)
    }

    override func prepareLayout() {
        super.prepareLayout()
        layoutViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }

    private func reload() {
        Task { [weak self] in
            guard let self else { return }
            do {
                let history = try await self.messagingService.messages(with: self.peerAddress, for: self.account)
                self.messages = history
                await MainActor.run { self.tableView.reloadData() }
            } catch {
                await MainActor.run { self.present(error) }
            }
        }
    }

    @objc private func didTapSend() {
        let text = inputField.text ?? ""
        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        inputField.text = ""
        Task { [weak self] in
            guard let self else { return }
            do {
                try await self.messagingService.send(text, to: self.peerAddress, from: self.account)
                self.reload()
            } catch {
                await MainActor.run { self.present(error) }
            }
        }
    }

    private func present(_ error: Error) {
        let message = (error as? MessagingError)?.errorDescription ?? error.localizedDescription
        let alert = UIAlertController(title: "Messaging", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    private func layoutViews() {
        inputBar.translatesAutoresizingMaskIntoConstraints = false
        inputField.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)
        view.addSubview(inputBar)
        inputBar.addSubview(inputField)
        inputBar.addSubview(sendButton)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: inputBar.topAnchor),

            inputBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            inputBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            inputBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            inputField.leadingAnchor.constraint(equalTo: inputBar.leadingAnchor, constant: 16),
            inputField.topAnchor.constraint(equalTo: inputBar.topAnchor, constant: 8),
            inputField.bottomAnchor.constraint(equalTo: inputBar.bottomAnchor, constant: -8),
            inputField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -8),

            sendButton.trailingAnchor.constraint(equalTo: inputBar.trailingAnchor, constant: -16),
            sendButton.centerYAnchor.constraint(equalTo: inputField.centerYAnchor)
        ])
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "message", for: indexPath)
        let message = messages[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = message.body
        content.textProperties.alignment = message.isOutgoing ? .natural : .natural
        content.secondaryText = message.isOutgoing ? "You" : nil
        cell.contentConfiguration = content
        return cell
    }
}
