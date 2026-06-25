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

//   NevermoreViewController.swift
//
//   The Nevermore tab: a token-gated membership screen. It always shows the
//   Nevermore lifetime pass; if any account in the wallet holds it, the screen
//   flips to the "member" state and unlocks the CorvidLabs tool shelf.

import UIKit
import SnapKit
import pera_wallet_core

final class NevermoreViewController: BaseViewController {

    // MARK: - State

    private var isMember = false

    // MARK: - Views

    private lazy var scrollView = UIScrollView()
    private lazy var contentStack = UIStackView()

    private lazy var passCard = UIView()
    private lazy var passGradient = CAGradientLayer()
    private lazy var passTitleLabel = UILabel()
    private lazy var passSubtitleLabel = UILabel()
    private lazy var passGlyph = UIImageView()
    private lazy var statusPill = UILabel()

    private lazy var headlineLabel = UILabel()
    private lazy var sectionLabel = UILabel()
    private lazy var perksStack = UIStackView()
    private lazy var footerCard = UIView()

    // MARK: - Palette (CorvidLabs, light/dark)

    private static func dyn(_ light: UInt, _ dark: UInt) -> UIColor {
        UIColor { $0.userInterfaceStyle == .dark ? UIColor(nvHex: dark) : UIColor(nvHex: light) }
    }
    private let accent     = dyn(0x0E6F66, 0x45D0BC)
    private let paper      = dyn(0xFAF9F6, 0x131619)
    private let surface    = dyn(0xFFFFFF, 0x1B1F23)
    private let well       = dyn(0xEFEDE7, 0x272C31)
    private let ink        = dyn(0x15181B, 0xF4F3EF)
    private let inkMuted   = dyn(0x34383D, 0xC8C6BE)
    private let inkFaint   = dyn(0x6A6E74, 0x8E928A)
    private let accentSoft = dyn(0xE2EFEC, 0x183A35)
    private let hairline   = dyn(0xE7E4DD, 0x2C3137)
    private let onDark     = UIColor(nvHex: 0xFAF9F6)

    // MARK: - Lifecycle

    override func configureAppearance() {
        super.configureAppearance()
        title = "Nevermore"
        view.backgroundColor = paper
    }

    override func prepareLayout() {
        super.prepareLayout()
        buildLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshMembership()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        passGradient.frame = passCard.bounds
    }

    // MARK: - Membership

    private func refreshMembership() {
        let nowMember = NevermoreMembership.isMember(in: configuration.sharedDataController)
        isMember = nowMember
        applyState()
    }

    private func applyState() {
        if isMember {
            statusPill.text = "  ●  ACTIVE  "
            statusPill.textColor = UIColor(nvHex: 0x0A1410)
            statusPill.backgroundColor = UIColor(nvHex: 0x45D0BC)
            headlineLabel.text = "You're a lifetime member."
            sectionLabel.text = "UNLOCKED FOR YOU"
            footerCard.isHidden = true
        } else {
            statusPill.text = "  NOT IN WALLET  "
            statusPill.textColor = onDark.withAlphaComponent(0.9)
            statusPill.backgroundColor = UIColor(white: 1, alpha: 0.12)
            headlineLabel.text = "One pass. Every CorvidLabs tool, for life."
            sectionLabel.text = "WHAT THE PASS UNLOCKS"
            footerCard.isHidden = false
        }

        perksStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for perk in NevermoreMembership.perks {
            perksStack.addArrangedSubview(makePerkRow(perk))
        }
    }

    // MARK: - Layout

    private func buildLayout() {
        view.addSubview(scrollView)
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.snp.makeConstraints { $0.edges.equalToSuperview() }

        scrollView.addSubview(contentStack)
        contentStack.axis = .vertical
        contentStack.spacing = 20
        contentStack.isLayoutMarginsRelativeArrangement = true
        contentStack.layoutMargins = UIEdgeInsets(top: 16, left: 24, bottom: 40, right: 24)
        contentStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        buildPassCard()
        contentStack.addArrangedSubview(passCard)

        headlineLabel.numberOfLines = 0
        headlineLabel.font = .systemFont(ofSize: 22, weight: .bold)
        headlineLabel.textColor = ink
        contentStack.addArrangedSubview(headlineLabel)

        sectionLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        sectionLabel.textColor = inkFaint
        sectionLabel.setContentHuggingPriority(.required, for: .vertical)
        contentStack.setCustomSpacing(8, after: headlineLabel)
        contentStack.addArrangedSubview(sectionLabel)

        perksStack.axis = .vertical
        perksStack.spacing = 10
        contentStack.addArrangedSubview(perksStack)

        buildFooterCard()
        contentStack.addArrangedSubview(footerCard)
    }

    private func buildPassCard() {
        passCard.layer.cornerRadius = 22
        passCard.layer.cornerCurve = .continuous
        passCard.clipsToBounds = true
        passCard.snp.makeConstraints { $0.height.equalTo(196) }

        passGradient.colors = [
            UIColor(nvHex: 0x0B1622).cgColor,
            UIColor(nvHex: 0x0E6F66).cgColor,
            UIColor(nvHex: 0x3A1F47).cgColor
        ]
        passGradient.locations = [0.0, 0.55, 1.0]
        passGradient.startPoint = CGPoint(x: 0, y: 0)
        passGradient.endPoint = CGPoint(x: 1, y: 1)
        passCard.layer.addSublayer(passGradient)

        passGlyph.image = UIImage(systemName: "bird.fill")
        passGlyph.tintColor = onDark.withAlphaComponent(0.16)
        passGlyph.contentMode = .scaleAspectFit
        passCard.addSubview(passGlyph)
        passGlyph.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.height.equalTo(64)
        }

        let kicker = UILabel()
        kicker.text = "CORVIDLABS · LIFETIME PASS"
        kicker.font = .systemFont(ofSize: 11, weight: .heavy)
        kicker.textColor = onDark.withAlphaComponent(0.75)
        passCard.addSubview(kicker)
        kicker.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.leading.equalToSuperview().inset(22)
        }

        passTitleLabel.text = "Nevermore"
        passTitleLabel.font = UIFont(name: "Georgia-Bold", size: 40) ?? .systemFont(ofSize: 40, weight: .bold)
        passTitleLabel.textColor = onDark
        passCard.addSubview(passTitleLabel)
        passTitleLabel.snp.makeConstraints {
            $0.top.equalTo(kicker.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(22)
        }

        passSubtitleLabel.text = "Members-only access to the CorvidLabs toolchain."
        passSubtitleLabel.font = .systemFont(ofSize: 13, weight: .medium)
        passSubtitleLabel.textColor = onDark.withAlphaComponent(0.8)
        passSubtitleLabel.numberOfLines = 2
        passCard.addSubview(passSubtitleLabel)
        passSubtitleLabel.snp.makeConstraints {
            $0.top.equalTo(passTitleLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(22)
            $0.trailing.lessThanOrEqualToSuperview().inset(22)
        }

        statusPill.font = .systemFont(ofSize: 11, weight: .heavy)
        statusPill.layer.cornerRadius = 11
        statusPill.layer.cornerCurve = .continuous
        statusPill.clipsToBounds = true
        statusPill.textAlignment = .center
        passCard.addSubview(statusPill)
        statusPill.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(22)
        }
    }

    private func makePerkRow(_ perk: NevermoreMembership.Perk) -> UIView {
        let row = UIView()
        row.backgroundColor = surface
        row.layer.cornerRadius = 16
        row.layer.cornerCurve = .continuous
        row.layer.borderWidth = 1
        row.layer.borderColor = hairline.cgColor

        let iconWell = UIView()
        iconWell.backgroundColor = isMember ? accentSoft : well
        iconWell.layer.cornerRadius = 10
        iconWell.layer.cornerCurve = .continuous
        row.addSubview(iconWell)
        iconWell.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(40)
        }

        let icon = UIImageView(image: UIImage(systemName: perk.symbol))
        icon.tintColor = isMember ? accent : inkFaint
        icon.contentMode = .scaleAspectFit
        iconWell.addSubview(icon)
        icon.snp.makeConstraints { $0.center.equalToSuperview(); $0.width.height.equalTo(20) }

        let nameLabel = UILabel()
        nameLabel.text = perk.name
        nameLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        nameLabel.textColor = ink
        nameLabel.numberOfLines = 1
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.8

        let detailLabel = UILabel()
        detailLabel.text = perk.detail
        detailLabel.font = .systemFont(ofSize: 12.5, weight: .regular)
        detailLabel.textColor = inkMuted
        detailLabel.numberOfLines = 2

        let textStack = UIStackView(arrangedSubviews: [nameLabel, detailLabel])
        textStack.axis = .vertical
        textStack.spacing = 2
        row.addSubview(textStack)

        let trailing = UIImageView(
            image: UIImage(systemName: isMember ? "checkmark.circle.fill" : "lock.fill")
        )
        trailing.tintColor = isMember ? accent : inkFaint.withAlphaComponent(0.6)
        trailing.contentMode = .scaleAspectFit
        row.addSubview(trailing)
        trailing.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
        }

        textStack.snp.makeConstraints {
            $0.leading.equalTo(iconWell.snp.trailing).offset(12)
            $0.trailing.equalTo(trailing.snp.leading).offset(-12)
            $0.top.equalToSuperview().inset(14)
            $0.bottom.equalToSuperview().inset(14)
        }

        return row
    }

    private func buildFooterCard() {
        footerCard.backgroundColor = accentSoft
        footerCard.layer.cornerRadius = 16
        footerCard.layer.cornerCurve = .continuous

        let title = UILabel()
        title.text = "Get the pass"
        title.font = .systemFont(ofSize: 15, weight: .bold)
        title.textColor = ink

        let body = UILabel()
        body.text = "Nevermore is a one-time lifetime pass — not a mint. Hold it in this wallet and every tool above unlocks automatically."
        body.font = .systemFont(ofSize: 13, weight: .regular)
        body.textColor = inkMuted
        body.numberOfLines = 0

        let link = UILabel()
        link.text = "corvidlabs.com/nevermore"
        link.font = .systemFont(ofSize: 13, weight: .semibold)
        link.textColor = accent

        let stack = UIStackView(arrangedSubviews: [title, body, link])
        stack.axis = .vertical
        stack.spacing = 6
        footerCard.addSubview(stack)
        stack.snp.makeConstraints { $0.edges.equalToSuperview().inset(16) }
    }
}

// MARK: - Color helper

private extension UIColor {
    convenience init(nvHex: UInt) {
        self.init(
            red: CGFloat((nvHex >> 16) & 0xFF) / 255,
            green: CGFloat((nvHex >> 8) & 0xFF) / 255,
            blue: CGFloat(nvHex & 0xFF) / 255,
            alpha: 1
        )
    }
}
