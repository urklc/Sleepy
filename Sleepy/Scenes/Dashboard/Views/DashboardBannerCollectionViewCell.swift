//
//  DashboardItemCollectionViewCell.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit
import Ugur

final class DashboardBannerCollectionViewCell: UICollectionViewCell {

    private var containerView: UIView!

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        containerView.layer.uk_applyShadow()
        containerView.layer.cornerRadius = Margin.medium
    }

    private func setupView() {
        contentView.backgroundColor = .clear

        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .sleepyPurple

        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = UIImage(named: "ic_night")
        containerView.addSubview(iconImageView)

        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.applyDefaultStyling(style: .headline)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        // TODO: Localization
        titleLabel.text = "Look. Pretty, isn’t it? Perfectly balanced. As all things should be."
        containerView.addSubview(titleLabel)

        contentView.addSubview(containerView)

        iconImageView.setContentCompressionResistancePriority(.required, for: .horizontal)

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                 constant: -Margin.large),
            contentView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                  constant: Margin.large),
            contentView.topAnchor.constraint(equalTo: containerView.topAnchor,
                                             constant: -Margin.large),
            contentView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,
                                                constant: Margin.large),
            iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                   constant: Margin.medium),
            iconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor,
                                                constant: Margin.medium),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                 constant: -Margin.medium),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
