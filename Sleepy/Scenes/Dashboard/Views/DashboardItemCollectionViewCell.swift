//
//  DashboardItemCollectionViewCell.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit
import Ugur

final class DashboardItemCollectionViewCell: UICollectionViewCell {

    var item: DashboardItem? {
        didSet {
            titleLabel.text = item?.title
            subtitleLabel.text = item?.subtitle

            // TODO: Add caching
//            downloadSafeImage(view: itemImageView, urlString: item?.imageUrl)
            // TODO: Remove this
            let rand = arc4random() % 10000
            downloadSafeImage(view: itemImageView, urlString: "https://picsum.photos/600/400?random=\(rand)")
        }
    }

    private var itemImageView: UIImageView!
    private var titleLabel: UILabel!
    private var subtitleLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
        itemImageView.image = nil

        item = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        itemImageView.clipsToBounds = true
        itemImageView.layer.cornerRadius = Margin.medium
    }

    private func setupView() {
        contentView.clipsToBounds = true

        itemImageView = UIImageView()
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.contentMode = .scaleAspectFill
        contentView.addSubview(itemImageView)

        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.applyDefaultStyling(weight: .bold, style: .callout)
        contentView.addSubview(titleLabel)

        subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.applyDefaultStyling(style: .footnote)
        contentView.addSubview(subtitleLabel)

        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)

        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor,
                                                  constant: -Margin.medium),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor,
                                               constant: -Margin.small),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

// MARK: - AsyncImageContainingCell
extension DashboardItemCollectionViewCell: AsyncImageContainingCell {

    var controlValue: String? {
        return item?.title
    }
}
