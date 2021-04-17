//
//  MeditationsCollectionViewCell.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

final class MeditationsCollectionViewCell: UICollectionViewCell {

    var meditationsListView: MeditationsListView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        meditationsListView = MeditationsListView(frame: .zero)
        meditationsListView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(meditationsListView)
        NSLayoutConstraint.activate([
            meditationsListView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            meditationsListView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            meditationsListView.topAnchor.constraint(equalTo: contentView.topAnchor),
            meditationsListView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
