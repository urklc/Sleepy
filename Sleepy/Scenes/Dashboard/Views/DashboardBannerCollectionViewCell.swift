//
//  DashboardItemCollectionViewCell.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit
import Ugur

final class DashboardBannerCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        backgroundColor = UIColor.purple

        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = UIImage(named: "ic_night")
        contentView.addSubview(iconImageView)

        let titleLabel = UILabel()
        // TODO: Styling
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        // TODO: Localization
        titleLabel.text = "Look. Pretty, isn’t it? Perfectly balanced. As all things should be."
        contentView.addSubview(titleLabel)

        iconImageView.setContentCompressionResistancePriority(.required, for: .horizontal)

        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
