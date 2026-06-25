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

//   AlgoChatMessagesViewController.swift
//
//   Self-contained AlgoChat screen: shows this account's derived messaging
//   address, lets you pick a peer, and exchange end-to-end-encrypted on-chain
//   messages via `CorvidChatService` (AlgoChatKit facade). Plain UIKit so it
//   has no dependency on the shared cell/theme infrastructure.

import UIKit
import SnapKit
import pera_wallet_core

final class AlgoChatMessagesViewController: BaseViewController {

    // MARK: - Properties

    private let account: AccountInformation
    private let service: CorvidChatService?

    private var messages: [CorvidChatMessage] = []
    private var myAddress: String?

    // MARK: - Views

    private lazy var addressCard = UIView()
    private lazy var addressTitleLabel = UILabel()
    private lazy var addressValueLabel = UILabel()
    private lazy var statusLabel = UILabel()
    private lazy var peerField = UITextField()
    private lazy var tableView = UITableView(frame: .zero, style: .plain)
    private lazy var composeBar = UIView()
    private lazy var composeField = UITextField()
    private lazy var sendButton = UIButton(type: .system)

    private let accent = UIColor(red: 14/255, green: 111/255, blue: 102/255, alpha: 1)
    private let paper = UIColor(red: 250/255, green: 249/255, blue: 246/255, alpha: 1)

    // MARK: - Initializers

    init(account: AccountInformation, configuration: ViewControllerConfiguration) {
        self.account = account
        self.service = CorvidChatService(account: account)
        super.init(configuration: configuration)
    }

    // MARK: - Lifecycle

    override func configureAppearance() {
        super.configureAppearance()
        title = "Messages"
        view.backgroundColor = paper

        addressCard.backgroundColor = UIColor.white
        addressCard.layer.cornerRadius = 14
        addressCard.layer.borderWidth = 1
        addressCard.layer.borderColor = UIColor.black.withAlphaComponent(0.06).cgColor

        addressTitleLabel.text = "YOUR ALGOCHAT ADDRESS"
        addressTitleLabel.font = .systemFont(ofSize: 11, weight: .semibold)
        addressTitleLabel.textColor = accent

        addressValueLabel.text = "Deriving…"
        addressValueLabel.font = .monospacedSystemFont(ofSize: 12, weight: .regular)
        addressValueLabel.textColor = UIColor(white: 0.1, alpha: 1)
        addressValueLabel.numberOfLines = 2
        addressValueLabel.adjustsFontSizeToFitWidth = true
        addressValueLabel.minimumScaleFactor = 0.7

        statusLabel.font = .systemFont(ofSize: 12, weight: .regular)
        statusLabel.textColor = UIColor(white: 0.4, alpha: 1)
        statusLabel.numberOfLines = 2

        peerField.placeholder = "Recipient messaging address"
        peerField.font = .monospacedSystemFont(ofSize: 12, weight: .regular)
        peerField.autocapitalizationType = .allCharacters
        peerField.autocorrectionType = .no
        peerField.clearButtonMode = .whileEditing
        peerField.borderStyle = .roundedRect
        peerField.returnKeyType = .done

        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.keyboardDismissMode = .interactive
        tableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.reuseID)
        tableView.allowsSelection = false

        composeBar.backgroundColor = UIColor.white
        composeBar.layer.borderWidth = 1
        composeBar.layer.borderColor = UIColor.black.withAlphaComponent(0.06).cgColor

        composeField.placeholder = "Message"
        composeField.font = .systemFont(ofSize: 15)
        composeField.borderStyle = .roundedRect
        composeField.returnKeyType = .send

        sendButton.setTitle("Send", for: .normal)
        sendButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        sendButton.setTitleColor(.white, for: .normal)
        sendButton.backgroundColor = accent
        sendButton.layer.cornerRadius = 10
        sendButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(refreshTapped)
        )
    }

    override func linkInteractors() {
        super.linkInteractors()
        tableView.dataSource = self
        sendButton.addTarget(self, action: #selector(sendTapped), for: .touchUpInside)
        composeField.addTarget(self, action: #selector(sendTapped), for: .editingDidEndOnExit)
        peerField.addTarget(self, action: #selector(refreshTapped), for: .editingDidEndOnExit)
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    override func prepareLayout() {
        super.prepareLayout()

        view.addSubview(addressCard)
        addressCard.addSubview(addressTitleLabel)
        addressCard.addSubview(addressValueLabel)
        view.addSubview(statusLabel)
        view.addSubview(peerField)
        view.addSubview(tableView)
        view.addSubview(composeBar)
        composeBar.addSubview(composeField)
        composeBar.addSubview(sendButton)

        addressCard.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        addressTitleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(12)
        }
        addressValueLabel.snp.makeConstraints {
            $0.top.equalTo(addressTitleLabel.snp.bottom).offset(4)
            $0.leading.trailing.bottom.equalToSuperview().inset(12)
        }
        statusLabel.snp.makeConstraints {
            $0.top.equalTo(addressCard.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        peerField.snp.makeConstraints {
            $0.top.equalTo(statusLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(peerField.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(composeBar.snp.top)
        }
        composeBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.height.equalTo(60)
        }
        composeField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(sendButton.snp.leading).offset(-10)
        }
        sendButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
        // Dev/demo: pre-fill peer + message via env so UI automation can drive a
        // send without focusing text fields (synthetic taps can't focus fields).
        if let peer = ProcessInfo.processInfo.environment["CORVID_CHAT_PEER"], !peer.isEmpty {
            peerField.text = peer
        }
        if let message = ProcessInfo.processInfo.environment["CORVID_CHAT_MSG"], !message.isEmpty {
            composeField.text = message
        }
        #endif
        bootstrap()
    }

    // MARK: - Actions

    private func bootstrap() {
        guard let service else {
            statusLabel.text = "This account can't message — no HD-wallet seed."
            return
        }
        statusLabel.text = "Connecting to AlgoChat on LocalNet…"
        Task { [weak self] in
            guard let self else { return }
            // 1) Derive + show the messaging address (no transaction required).
            do {
                let address = try await service.messagingAddress()
                await MainActor.run {
                    self.myAddress = address
                    self.addressValueLabel.text = address
                    self.statusLabel.text = "Publishing key…"
                }
            } catch {
                await MainActor.run { self.statusLabel.text = "AlgoChat error: \(error.localizedDescription)" }
                return
            }
            // 2) Publish the key (a transaction; needs this messaging account funded).
            do {
                try await service.publishKey()
                await MainActor.run {
                    self.statusLabel.text = "Key published. Share this address to receive messages."
                }
            } catch {
                await MainActor.run {
                    self.statusLabel.text = "Address ready. Fund it to publish your key: \(error.localizedDescription)"
                }
            }
            // 3) If a peer is already set (e.g. dev/demo pre-fill), load the thread.
            let peer = await MainActor.run { self.peerField.text ?? "" }
            if !peer.isEmpty, let loaded = try? await service.messages(with: peer) {
                await MainActor.run {
                    self.messages = loaded
                    self.tableView.reloadData()
                    self.statusLabel.text = "\(loaded.count) message(s) with peer."
                    self.scrollToBottom()
                }
            }
        }
    }

    @objc private func refreshTapped() {
        guard let service, let peer = peerField.text, !peer.isEmpty else { return }
        statusLabel.text = "Loading conversation…"
        Task { [weak self] in
            guard let self else { return }
            do {
                let loaded = try await service.messages(with: peer)
                await MainActor.run {
                    self.messages = loaded
                    self.tableView.reloadData()
                    self.statusLabel.text = "\(loaded.count) message(s) with peer."
                    self.scrollToBottom()
                }
            } catch {
                await MainActor.run { self.statusLabel.text = "AlgoChat error: \(error.localizedDescription)" }
            }
        }
    }

    @objc private func sendTapped() {
        guard
            let service,
            let peer = peerField.text, !peer.isEmpty,
            let body = composeField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !body.isEmpty
        else {
            statusLabel.text = "Enter a recipient address and a message."
            return
        }
        composeField.text = nil
        view.endEditing(true)
        statusLabel.text = "Encrypting & sending on-chain…"
        Task { [weak self] in
            guard let self else { return }
            do {
                try await service.send(body, to: peer)
                let loaded = try await service.messages(with: peer)
                await MainActor.run {
                    self.messages = loaded
                    self.tableView.reloadData()
                    self.statusLabel.text = "Sent. Confirmed on LocalNet."
                    self.scrollToBottom()
                }
            } catch {
                await MainActor.run { self.statusLabel.text = "Send failed: \(error.localizedDescription)" }
            }
        }
    }

    private func scrollToBottom() {
        guard !messages.isEmpty else { return }
        tableView.scrollToRow(at: IndexPath(row: messages.count - 1, section: 0), at: .bottom, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension AlgoChatMessagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.reuseID, for: indexPath)
        if let cell = cell as? MessageCell {
            cell.configure(with: messages[indexPath.row], accent: accent)
        }
        return cell
    }
}

// MARK: - MessageCell

private final class MessageCell: UITableViewCell {
    static let reuseID = "AlgoChatMessageCell"

    private let bubble = UIView()
    private let label = UILabel()
    private var leadingConstraint: Constraint?
    private var trailingConstraint: Constraint?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        bubble.layer.cornerRadius = 14
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        contentView.addSubview(bubble)
        bubble.addSubview(label)
        bubble.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.width.lessThanOrEqualTo(260)
            self.leadingConstraint = $0.leading.equalToSuperview().inset(16).constraint
            self.trailingConstraint = $0.trailing.equalToSuperview().inset(16).constraint
        }
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 9, left: 13, bottom: 9, right: 13))
        }
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    func configure(with message: CorvidChatMessage, accent: UIColor) {
        label.text = message.body
        if message.isOutgoing {
            bubble.backgroundColor = accent
            label.textColor = .white
            leadingConstraint?.deactivate()
            trailingConstraint?.activate()
        } else {
            bubble.backgroundColor = UIColor(white: 0.9, alpha: 1)
            label.textColor = UIColor(white: 0.1, alpha: 1)
            trailingConstraint?.deactivate()
            leadingConstraint?.activate()
        }
    }
}
