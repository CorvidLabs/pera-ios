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
//   messages via `CorvidChatService` (AlgoChatKit facade). Theme-aware UIKit.

import UIKit
import SnapKit
import MacaroonUIKit
import pera_wallet_core

final class AlgoChatMessagesViewController: BaseViewController {

    // MARK: - Properties

    private let account: AccountInformation
    private var service: CorvidChatService?

    private var messages: [CorvidChatMessage] = []
    private var myAddress: String?

    // MARK: - Views

    private lazy var scrollDimmer = UIView()
    private lazy var addressCard = UIControl()
    private lazy var addressTitleLabel = UILabel()
    private lazy var addressValueLabel = UILabel()
    private lazy var copyHintLabel = UILabel()

    private lazy var toLabel = UILabel()
    private lazy var peerContainer = UIView()
    private lazy var peerField = UITextField()
    private lazy var qrButton = UIButton(type: .system)
    private lazy var pasteButton = UIButton(type: .system)

    private lazy var statusLabel = UILabel()

    private lazy var tableView = UITableView(frame: .zero, style: .plain)
    private lazy var emptyStateView = UIView()
    private lazy var emptyTitleLabel = UILabel()
    private lazy var emptyBodyLabel = UILabel()

    private lazy var composeBar = UIView()
    private lazy var composeContainer = UIView()
    private lazy var composeField = UITextField()
    private lazy var sendButton = UIButton(type: .system)

    // MARK: - Design-system tokens

    private var accent: UIColor { Colors.Button.Primary.background.uiColor }
    private var onAccent: UIColor { Colors.Button.Primary.text.uiColor }
    private var paper: UIColor { Colors.Defaults.background.uiColor }
    private var surface: UIColor { Colors.Layer.grayLightest.uiColor }
    private var well: UIColor { Colors.Layer.grayLighter.uiColor }
    private var ink: UIColor { Colors.Text.main.uiColor }
    private var inkMuted: UIColor { Colors.Text.gray.uiColor }
    private var inkFaint: UIColor { Colors.Text.grayLighter.uiColor }

    private func dm(_ size: CGFloat, _ face: Fonts.DMSans = .regular) -> UIFont {
        face.make(size).uiFont
    }
    private func mono(_ size: CGFloat, _ face: Fonts.DMMono = .regular) -> UIFont {
        face.make(size).uiFont
    }

    // MARK: - Initializers

    init(account: AccountInformation, configuration: ViewControllerConfiguration) {
        self.account = account
        // The service is created lazily off the main thread in `bootstrap()` —
        // its init derives a BIP39 seed (PBKDF2, 2048 rounds), which would jank
        // the screen if done here on the main thread.
        self.service = nil
        super.init(configuration: configuration)
    }

    /// Derives the messaging service off the main thread (heavy seed derivation).
    private static func makeService(walletId: String?) async -> CorvidChatService? {
        await Task.detached(priority: .userInitiated) {
            guard
                let walletId,
                let wallet = try? HDWalletStorage().wallet(id: walletId),
                let seed = HDWalletUtils.generateSeed(fromEntropy: wallet.entropy)
            else { return nil }
            return CorvidChatService(seed: seed)
        }.value
    }

    // MARK: - Lifecycle

    override func configureAppearance() {
        super.configureAppearance()
        title = "Messages"
        view.backgroundColor = paper

        // Address card (tap to copy)
        addressCard.backgroundColor = surface
        addressCard.layer.cornerRadius = 16
        addressCard.layer.borderWidth = 1
        addressCard.layer.borderColor = accent.withAlphaComponent(0.18).cgColor

        addressTitleLabel.text = "YOUR ALGOCHAT ADDRESS"
        addressTitleLabel.font = dm(11, .bold)
        addressTitleLabel.textColor = accent
        addressTitleLabel.setContentHuggingPriority(.required, for: .vertical)

        addressValueLabel.text = "Deriving your encrypted identity…"
        addressValueLabel.font = mono(13, .medium)
        addressValueLabel.textColor = ink
        addressValueLabel.numberOfLines = 2
        addressValueLabel.lineBreakMode = .byTruncatingMiddle

        copyHintLabel.text = "Tap to copy"
        copyHintLabel.font = dm(11, .medium)
        copyHintLabel.textColor = inkFaint

        // Recipient
        toLabel.text = "TO"
        toLabel.font = dm(11, .bold)
        toLabel.textColor = inkFaint

        peerContainer.backgroundColor = well
        peerContainer.layer.cornerRadius = 14

        peerField.placeholder = "Recipient's messaging address"
        peerField.font = mono(13, .regular)
        peerField.textColor = ink
        peerField.autocapitalizationType = .allCharacters
        peerField.autocorrectionType = .no
        peerField.clearButtonMode = .whileEditing
        peerField.returnKeyType = .done
        peerField.attributedPlaceholder = NSAttributedString(
            string: "Recipient's messaging address",
            attributes: [.foregroundColor: inkFaint, .font: dm(14)]
        )

        let qrConfig = UIImage.SymbolConfiguration(pointSize: 19, weight: .regular)
        qrButton.setImage(UIImage(systemName: "qrcode.viewfinder", withConfiguration: qrConfig), for: .normal)
        qrButton.tintColor = accent

        pasteButton.setTitle("Paste", for: .normal)
        pasteButton.titleLabel?.font = dm(14, .medium)
        pasteButton.setTitleColor(accent, for: .normal)

        statusLabel.font = dm(13, .medium)
        statusLabel.textColor = inkFaint
        statusLabel.numberOfLines = 2

        // Thread
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.keyboardDismissMode = .interactive
        tableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.reuseID)
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 12, right: 0)

        emptyTitleLabel.text = "No messages yet"
        emptyTitleLabel.font = dm(17, .medium)
        emptyTitleLabel.textColor = inkMuted
        emptyTitleLabel.textAlignment = .center

        emptyBodyLabel.text = "Paste a recipient's address above to\nstart an end-to-end encrypted,\non-chain conversation."
        emptyBodyLabel.font = dm(14, .regular)
        emptyBodyLabel.textColor = inkFaint
        emptyBodyLabel.numberOfLines = 0
        emptyBodyLabel.textAlignment = .center

        // Compose bar
        composeBar.backgroundColor = surface

        composeContainer.backgroundColor = well
        composeContainer.layer.cornerRadius = 22

        composeField.placeholder = "Message"
        composeField.font = dm(16)
        composeField.textColor = ink
        composeField.returnKeyType = .send
        composeField.attributedPlaceholder = NSAttributedString(
            string: "Message",
            attributes: [.foregroundColor: inkFaint, .font: dm(16)]
        )

        let arrowConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
        sendButton.setImage(UIImage(systemName: "arrow.up", withConfiguration: arrowConfig), for: .normal)
        sendButton.tintColor = onAccent
        sendButton.backgroundColor = accent
        sendButton.layer.cornerRadius = 21
        sendButton.imageView?.contentMode = .center

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
        pasteButton.addTarget(self, action: #selector(pasteTapped), for: .touchUpInside)
        qrButton.addTarget(self, action: #selector(scanQRTapped), for: .touchUpInside)
        addressCard.addTarget(self, action: #selector(copyAddressTapped), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    override func prepareLayout() {
        super.prepareLayout()

        view.addSubview(addressCard)
        addressCard.addSubview(addressTitleLabel)
        addressCard.addSubview(copyHintLabel)
        addressCard.addSubview(addressValueLabel)
        view.addSubview(toLabel)
        view.addSubview(peerContainer)
        peerContainer.addSubview(peerField)
        peerContainer.addSubview(qrButton)
        peerContainer.addSubview(pasteButton)
        view.addSubview(statusLabel)
        view.addSubview(tableView)
        tableView.addSubview(emptyStateView)
        emptyStateView.addSubview(emptyTitleLabel)
        emptyStateView.addSubview(emptyBodyLabel)
        view.addSubview(composeBar)
        composeBar.addSubview(composeContainer)
        composeContainer.addSubview(composeField)
        composeBar.addSubview(sendButton)

        addressCard.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(14)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        addressTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(14)
        }
        copyHintLabel.snp.makeConstraints {
            $0.centerY.equalTo(addressTitleLabel)
            $0.trailing.equalToSuperview().inset(14)
        }
        addressValueLabel.snp.makeConstraints {
            $0.top.equalTo(addressTitleLabel.snp.bottom).offset(6)
            $0.leading.trailing.bottom.equalToSuperview().inset(14)
        }

        toLabel.snp.makeConstraints {
            $0.top.equalTo(addressCard.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(20)
        }
        peerContainer.snp.makeConstraints {
            $0.top.equalTo(toLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
        pasteButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(46)
        }
        qrButton.snp.makeConstraints {
            $0.trailing.equalTo(pasteButton.snp.leading).offset(-2)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(30)
        }
        peerField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(qrButton.snp.leading).offset(-6)
        }
        statusLabel.snp.makeConstraints {
            $0.top.equalTo(peerContainer.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(statusLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(composeBar.snp.top)
        }
        emptyStateView.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(tableView).offset(-30)
            $0.leading.trailing.equalTo(view).inset(40)
        }
        emptyTitleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        emptyBodyLabel.snp.makeConstraints {
            $0.top.equalTo(emptyTitleLabel.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        composeBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.height.equalTo(74)
        }
        sendButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(42)
        }
        composeContainer.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.trailing.equalTo(sendButton.snp.leading).offset(-10)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(44)
        }
        composeField.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bootstrap()
    }

    private func updateEmptyState() {
        emptyStateView.isHidden = !messages.isEmpty
    }

    // MARK: - Boot

    private func bootstrap() {
        updateEmptyState()
        statusLabel.text = "Connecting to AlgoChat on LocalNet…"
        let walletId = account.hdWalletAddressDetail?.walletId
        Task { [weak self] in
            guard let self else { return }
            // Build the service off the main thread (seed derivation is heavy).
            let service = await Self.makeService(walletId: walletId)
            await MainActor.run { self.service = service }
            guard let service else {
                await MainActor.run { self.statusLabel.text = "This account can't message — no HD-wallet seed." }
                return
            }
            do {
                let address = try await service.messagingAddress()
                await MainActor.run {
                    self.myAddress = address
                    self.addressValueLabel.text = address
                    self.statusLabel.text = "Publishing your encryption key…"
                }
            } catch {
                await MainActor.run { self.statusLabel.text = "AlgoChat error: \(error.localizedDescription)" }
                return
            }
            do {
                try await service.publishKey()
                await MainActor.run { self.statusLabel.text = "Ready — your key is published. Paste a recipient to chat." }
            } catch {
                await MainActor.run {
                    self.statusLabel.text = "Address ready. Fund it to publish your key."
                }
            }
            let peer = await MainActor.run { self.peerField.text ?? "" }
            if !peer.isEmpty, let loaded = try? await service.messages(with: peer) {
                await MainActor.run {
                    self.messages = loaded
                    self.tableView.reloadData()
                    self.updateEmptyState()
                    self.statusLabel.text = self.summary(for: loaded.count)
                    self.scrollToBottom()
                }
            }
        }
    }

    private func summary(for count: Int) -> String {
        count == 0 ? "No messages yet with this recipient." : "\(count) encrypted message\(count == 1 ? "" : "s")."
    }

    // MARK: - Actions

    @objc private func copyAddressTapped() {
        guard let myAddress else { return }
        UIPasteboard.general.string = myAddress
        statusLabel.text = "Your address was copied to the clipboard."
    }

    @objc private func pasteTapped() {
        guard let clip = UIPasteboard.general.string?.trimmingCharacters(in: .whitespacesAndNewlines), !clip.isEmpty else {
            statusLabel.text = "Clipboard is empty — copy a recipient's address first."
            return
        }
        peerField.text = clip
        refreshTapped()
    }

    @objc private func scanQRTapped() {
        view.endEditing(true)
        guard let scanner = open(.qrScanner(canReadWCSession: false), by: .push) as? QRScannerViewController else { return }
        scanner.delegate = self
    }

    @objc private func refreshTapped() {
        guard let service, let peer = peerField.text, !peer.isEmpty else { return }
        view.endEditing(true)
        statusLabel.text = "Loading conversation…"
        Task { [weak self] in
            guard let self else { return }
            do {
                let loaded = try await service.messages(with: peer)
                await MainActor.run {
                    self.messages = loaded
                    self.tableView.reloadData()
                    self.updateEmptyState()
                    self.statusLabel.text = self.summary(for: loaded.count)
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
            statusLabel.text = "Enter a recipient and a message."
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
                    self.updateEmptyState()
                    self.statusLabel.text = "Sent — confirmed on LocalNet."
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
            cell.configure(
                with: messages[indexPath.row],
                outgoing: accent,
                onOutgoing: onAccent,
                incomingBg: well,
                incomingText: ink
            )
        }
        return cell
    }
}

// MARK: - QRScannerViewControllerDelegate

extension AlgoChatMessagesViewController: QRScannerViewControllerDelegate {
    func qrScannerViewController(
        _ controller: QRScannerViewController,
        didRead qrText: QRText,
        completionHandler: EmptyHandler?
    ) {
        guard qrText.mode == .address, let scanned = qrText.address, !scanned.isEmpty else {
            statusLabel.text = "That QR code isn't an Algorand address."
            completionHandler?()
            return
        }
        peerField.text = scanned
        refreshTapped()
    }

    func qrScannerViewController(
        _ controller: QRScannerViewController,
        didFail error: QRScannerError,
        completionHandler: EmptyHandler?
    ) {
        statusLabel.text = "Couldn't read that QR code."
        completionHandler?()
    }
}

// MARK: - MessageCell

private final class MessageCell: UITableViewCell {
    static let reuseID = "AlgoChatMessageCell"

    private static let timeFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "h:mm a"
        return f
    }()

    private let bubble = UIView()
    private let label = UILabel()
    private let timeLabel = UILabel()
    private var leadingConstraint: Constraint?
    private var trailingConstraint: Constraint?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        bubble.layer.cornerRadius = 18
        bubble.layer.cornerCurve = .continuous
        label.numberOfLines = 0
        label.font = Fonts.DMSans.regular.make(15.5).uiFont
        timeLabel.font = Fonts.DMSans.medium.make(11).uiFont
        timeLabel.textAlignment = .right
        contentView.addSubview(bubble)
        bubble.addSubview(label)
        bubble.addSubview(timeLabel)
        bubble.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(4)
            $0.width.lessThanOrEqualTo(270)
            self.leadingConstraint = $0.leading.equalToSuperview().inset(16).constraint
            self.trailingConstraint = $0.trailing.equalToSuperview().inset(16).constraint
        }
        label.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9)
            $0.leading.trailing.equalToSuperview().inset(14)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(3)
            $0.trailing.equalToSuperview().inset(14)
            $0.leading.greaterThanOrEqualToSuperview().inset(14)
            $0.bottom.equalToSuperview().inset(8)
        }
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    func configure(
        with message: CorvidChatMessage,
        outgoing: UIColor,
        onOutgoing: UIColor,
        incomingBg: UIColor,
        incomingText: UIColor
    ) {
        label.text = message.body
        timeLabel.text = Self.timeFormatter.string(from: message.date)
        if message.isOutgoing {
            bubble.backgroundColor = outgoing
            label.textColor = onOutgoing
            timeLabel.textColor = onOutgoing.withAlphaComponent(0.75)
            leadingConstraint?.deactivate()
            trailingConstraint?.activate()
        } else {
            bubble.backgroundColor = incomingBg
            label.textColor = incomingText
            timeLabel.textColor = incomingText.withAlphaComponent(0.55)
            trailingConstraint?.deactivate()
            leadingConstraint?.activate()
        }
    }
}
