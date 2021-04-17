//
//  DashboardItemListCollectionViewCell.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

final class DashboardItemListCollectionViewCell: UICollectionViewCell {

    var itemsListView: DashboardItemListView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        itemsListView = DashboardItemListView(frame: .zero)
        itemsListView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(itemsListView)
        NSLayoutConstraint.activate([
            itemsListView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemsListView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemsListView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemsListView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
