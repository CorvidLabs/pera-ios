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
//   Nevermore lifetime pass and the flagship app (Quill); if any account in the
//   wallet holds the pass, the hero flips to "Pro unlocked" and the perks open up.
//
//   Fully on the CorvidLabs design system: every color is a `Colors.*` token
//   (automatic light/dark via the asset catalog) and every font is `Fonts.DMSans`.

import UIKit
import SnapKit
import MacaroonUIKit
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
    private lazy var heroSectionLabel = UILabel()
    private lazy var heroContainer = UIView()
    private lazy var moreSectionLabel = UILabel()
    private lazy var moreStack = UIStackView()
    private lazy var footerCard = UIView()

    // MARK: - Design-system tokens

    private var accent: UIColor { Colors.Button.Primary.background.uiColor }
    private var onAccent: UIColor { Colors.Button.Primary.text.uiColor }
    private var paper: UIColor { Colors.Defaults.background.uiColor }
    private var surface: UIColor { Colors.Layer.grayLightest.uiColor }
    private var well: UIColor { Colors.Layer.grayLighter.uiColor }
    private var ink: UIColor { Colors.Text.main.uiColor }
    private var inkMuted: UIColor { Colors.Text.gray.uiColor }
    private var inkFaint: UIColor { Colors.Text.grayLighter.uiColor }
    private var hairline: UIColor { Colors.Layer.gray.uiColor }
    private var onDark: UIColor { Colors.Text.white.uiColor }

    /// The Nevermore pass keeps a signature gradient — a branded card artifact —
    /// anchored on the design-system primary so the mid-stop always reads on-brand.
    private let passEdgeTop = UIColor(red: 0x0B / 255, green: 0x16 / 255, blue: 0x22 / 255, alpha: 1)
    private let passEdgeBottom = UIColor(red: 0x3A / 255, green: 0x1F / 255, blue: 0x47 / 255, alpha: 1)

    private func dm(_ size: CGFloat, _ face: Fonts.DMSans = .regular) -> UIFont {
        face.make(size).uiFont
    }

    // MARK: - Lifecycle

    override func configureAppearance() {
        super.configureAppearance()
        title = "Nevermore"
        view.backgroundColor = paper
    }

    override func customizeTabBarAppearence() {
        // Keep the main tab bar visible — this screen is a root tab, not a pushed screen.
        tabBarHidden = false
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
        isMember = NevermoreMembership.isMember(in: configuration.sharedDataController)
        applyState()
    }

    private func applyState() {
        if isMember {
            statusPill.text = "  ●  ACTIVE  "
            statusPill.textColor = onAccent
            statusPill.backgroundColor = accent
            headlineLabel.text = "You're a lifetime member."
            heroSectionLabel.text = "YOUR FLAGSHIP — PRO UNLOCKED"
            footerCard.isHidden = true
        } else {
            statusPill.text = "  NOT IN WALLET  "
            statusPill.textColor = onDark.withAlphaComponent(0.9)
            statusPill.backgroundColor = UIColor(white: 1, alpha: 0.12)
            headlineLabel.text = "Free apps for everyone. Pro for pass holders."
            heroSectionLabel.text = "THE FLAGSHIP"
            footerCard.isHidden = false
        }

        rebuildHero()
        rebuildMore()
    }

    // MARK: - Layout

    private func buildLayout() {
        view.addSubview(scrollView)
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        // Pin to the safe area so the content never underlaps the custom tab bar
        // (TabBarContainer pads the screen's bottom safe area by the tab-bar height).
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }

        scrollView.addSubview(contentStack)
        contentStack.axis = .vertical
        contentStack.spacing = 18
        contentStack.isLayoutMarginsRelativeArrangement = true
        contentStack.layoutMargins = UIEdgeInsets(top: 16, left: 24, bottom: 40, right: 24)
        contentStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        buildPassCard()
        contentStack.addArrangedSubview(passCard)

        headlineLabel.numberOfLines = 0
        headlineLabel.font = dm(22, .bold)
        headlineLabel.textColor = ink
        contentStack.addArrangedSubview(headlineLabel)

        heroSectionLabel.font = dm(12, .bold)
        heroSectionLabel.textColor = inkFaint
        contentStack.setCustomSpacing(8, after: headlineLabel)
        contentStack.addArrangedSubview(heroSectionLabel)

        contentStack.addArrangedSubview(heroContainer)

        moreSectionLabel.text = "MORE UNLOCKING SOON"
        moreSectionLabel.font = dm(12, .bold)
        moreSectionLabel.textColor = inkFaint
        contentStack.setCustomSpacing(22, after: heroContainer)
        contentStack.addArrangedSubview(moreSectionLabel)

        moreStack.axis = .vertical
        moreStack.spacing = 10
        contentStack.addArrangedSubview(moreStack)

        buildFooterCard()
        contentStack.setCustomSpacing(22, after: moreStack)
        contentStack.addArrangedSubview(footerCard)
    }

    private func buildPassCard() {
        passCard.layer.cornerRadius = 22
        passCard.layer.cornerCurve = .continuous
        passCard.clipsToBounds = true
        passCard.snp.makeConstraints { $0.height.equalTo(196) }

        passGradient.colors = [
            passEdgeTop.cgColor,
            accent.cgColor,
            passEdgeBottom.cgColor
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
        kicker.font = dm(11, .bold)
        kicker.textColor = onDark.withAlphaComponent(0.75)
        passCard.addSubview(kicker)
        kicker.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.leading.equalToSuperview().inset(22)
        }

        passTitleLabel.text = "Nevermore"
        passTitleLabel.font = dm(34, .bold)
        passTitleLabel.textColor = onDark
        passCard.addSubview(passTitleLabel)
        passTitleLabel.snp.makeConstraints {
            $0.top.equalTo(kicker.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(22)
        }

        passSubtitleLabel.text = "Early access today. Pro on everything, for life."
        passSubtitleLabel.font = dm(13, .medium)
        passSubtitleLabel.textColor = onDark.withAlphaComponent(0.8)
        passSubtitleLabel.numberOfLines = 2
        passCard.addSubview(passSubtitleLabel)
        passSubtitleLabel.snp.makeConstraints {
            $0.top.equalTo(passTitleLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(22)
            $0.trailing.lessThanOrEqualToSuperview().inset(22)
        }

        statusPill.font = dm(11, .bold)
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

    // MARK: - Hero (Quill)

    private func rebuildHero() {
        heroContainer.subviews.forEach { $0.removeFromSuperview() }
        heroContainer.addSubview(makeHeroCard(NevermoreMembership.hero))
        heroContainer.subviews.first?.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    private func makeHeroCard(_ product: NevermoreMembership.Product) -> UIView {
        let card = UIView()
        card.backgroundColor = surface
        card.layer.cornerRadius = 20
        card.layer.cornerCurve = .continuous
        card.layer.borderWidth = isMember ? 1.5 : 1
        card.layer.borderColor = (isMember ? accent.withAlphaComponent(0.55) : hairline).cgColor

        let iconWell = UIView()
        iconWell.backgroundColor = well
        iconWell.layer.cornerRadius = 14
        iconWell.layer.cornerCurve = .continuous
        card.addSubview(iconWell)
        iconWell.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(18)
            $0.width.height.equalTo(52)
        }

        let icon = UIImageView(image: UIImage(systemName: product.symbol))
        icon.tintColor = accent
        icon.contentMode = .scaleAspectFit
        iconWell.addSubview(icon)
        icon.snp.makeConstraints { $0.center.equalToSuperview(); $0.width.height.equalTo(26) }

        let nameLabel = UILabel()
        nameLabel.text = product.name
        nameLabel.font = dm(20, .bold)
        nameLabel.textColor = ink

        let stagePill = makeStagePill(product.stage)
        card.addSubview(stagePill)
        stagePill.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(18)
        }

        card.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(iconWell.snp.trailing).offset(14)
            $0.top.equalToSuperview().inset(22)
            $0.trailing.lessThanOrEqualTo(stagePill.snp.leading).offset(-8)
        }

        let taglineLabel = UILabel()
        taglineLabel.text = product.tagline
        taglineLabel.font = dm(13.5, .regular)
        taglineLabel.textColor = inkMuted
        taglineLabel.numberOfLines = 0
        card.addSubview(taglineLabel)
        taglineLabel.snp.makeConstraints {
            $0.leading.equalTo(iconWell.snp.trailing).offset(14)
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().inset(18)
        }

        let divider = UIView()
        divider.backgroundColor = hairline
        card.addSubview(divider)
        divider.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(taglineLabel.snp.bottom).offset(16)
            $0.top.greaterThanOrEqualTo(iconWell.snp.bottom).offset(16)
            $0.height.equalTo(1)
        }

        let perkIcon = UIImageView(
            image: UIImage(systemName: isMember ? "checkmark.circle.fill" : "lock.fill")
        )
        perkIcon.tintColor = isMember ? accent : inkFaint
        perkIcon.contentMode = .scaleAspectFit
        card.addSubview(perkIcon)
        perkIcon.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(18)
            $0.top.equalTo(divider.snp.bottom).offset(14)
            $0.bottom.equalToSuperview().inset(18)
            $0.width.height.equalTo(18)
        }

        let perkLabel = UILabel()
        perkLabel.text = isMember ? NevermoreMembership.heroMemberPerk : NevermoreMembership.heroPublicPerk
        perkLabel.font = dm(14, .medium)
        perkLabel.textColor = isMember ? accent : inkMuted
        perkLabel.numberOfLines = 1
        perkLabel.adjustsFontSizeToFitWidth = true
        perkLabel.minimumScaleFactor = 0.85
        card.addSubview(perkLabel)
        perkLabel.snp.makeConstraints {
            $0.leading.equalTo(perkIcon.snp.trailing).offset(8)
            $0.centerY.equalTo(perkIcon)
            $0.trailing.equalToSuperview().inset(18)
        }

        return card
    }

    private func makeStagePill(_ stage: NevermoreMembership.Stage) -> UILabel {
        let pill = PaddedLabel()
        pill.text = stage.label
        pill.font = dm(10, .bold)
        pill.layer.cornerRadius = 9
        pill.layer.cornerCurve = .continuous
        pill.clipsToBounds = true
        switch stage {
        case .live:
            pill.textColor = accent
            pill.backgroundColor = well
        case .beta:
            pill.textColor = onAccent
            pill.backgroundColor = accent
        case .soon:
            pill.textColor = inkFaint
            pill.backgroundColor = well
        }
        return pill
    }

    // MARK: - More

    private func rebuildMore() {
        moreStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for product in NevermoreMembership.more {
            moreStack.addArrangedSubview(makeMoreRow(product))
        }
    }

    private func makeMoreRow(_ product: NevermoreMembership.Product) -> UIView {
        let row = UIView()
        row.backgroundColor = surface
        row.layer.cornerRadius = 16
        row.layer.cornerCurve = .continuous
        row.layer.borderWidth = 1
        row.layer.borderColor = hairline.cgColor

        let isLive = product.stage == .live

        let iconWell = UIView()
        iconWell.backgroundColor = well
        iconWell.layer.cornerRadius = 10
        iconWell.layer.cornerCurve = .continuous
        row.addSubview(iconWell)
        iconWell.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(40)
        }

        let icon = UIImageView(image: UIImage(systemName: product.symbol))
        icon.tintColor = isLive ? accent : inkFaint
        icon.contentMode = .scaleAspectFit
        iconWell.addSubview(icon)
        icon.snp.makeConstraints { $0.center.equalToSuperview(); $0.width.height.equalTo(20) }

        let nameLabel = UILabel()
        nameLabel.text = product.name
        nameLabel.font = dm(15, .medium)
        nameLabel.textColor = ink

        let detailLabel = UILabel()
        detailLabel.text = product.tagline
        detailLabel.font = dm(12.5, .regular)
        detailLabel.textColor = inkMuted
        detailLabel.numberOfLines = 2

        let textStack = UIStackView(arrangedSubviews: [nameLabel, detailLabel])
        textStack.axis = .vertical
        textStack.spacing = 2
        row.addSubview(textStack)

        let stagePill = makeStagePill(product.stage)
        row.addSubview(stagePill)
        stagePill.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
        }

        textStack.snp.makeConstraints {
            $0.leading.equalTo(iconWell.snp.trailing).offset(12)
            $0.trailing.lessThanOrEqualTo(stagePill.snp.leading).offset(-10)
            $0.top.equalToSuperview().inset(14)
            $0.bottom.equalToSuperview().inset(14)
        }

        return row
    }

    private func buildFooterCard() {
        footerCard.backgroundColor = well
        footerCard.layer.cornerRadius = 16
        footerCard.layer.cornerCurve = .continuous

        let title = UILabel()
        title.text = "Get the pass"
        title.font = dm(15, .bold)
        title.textColor = ink

        let body = UILabel()
        body.text = "Nevermore is a one-time lifetime pass — not a mint. Every app stays free for everyone; the pass unlocks Pro and gets you into each beta first."
        body.font = dm(13, .regular)
        body.textColor = inkMuted
        body.numberOfLines = 0

        let link = UILabel()
        link.text = "corvidlabs.com"
        link.font = dm(13, .medium)
        link.textColor = accent

        let stack = UIStackView(arrangedSubviews: [title, body, link])
        stack.axis = .vertical
        stack.spacing = 6
        footerCard.addSubview(stack)
        stack.snp.makeConstraints { $0.edges.equalToSuperview().inset(16) }
    }
}

// MARK: - Padded label (stage pills)

private final class PaddedLabel: UILabel {
    private let inset = UIEdgeInsets(top: 3, left: 8, bottom: 3, right: 8)

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: inset))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + inset.left + inset.right,
                      height: size.height + inset.top + inset.bottom)
    }
}
