//
//  DashboardItemListView.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

protocol DashboardItemListViewDelegate: class {

    func dashboardItemListView(_ dashboardItemListView: DashboardItemListView,
                               didSelect item: DashboardItem)
}

final class DashboardItemListView: UIView {

    weak var delegate: DashboardItemListViewDelegate?

    var items: [DashboardItem] = [] {
        didSet {
            reloadItems()
            collectionView.scrollRectToVisible(CGRect.zero, animated: true)
        }
    }

    private var collectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = Margin.medium
        collectionViewLayout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0,
                                                   left: Margin.large,
                                                   bottom: 0,
                                                   right: Margin.large)
        collectionView.uk_registerCell(DashboardItemCollectionViewCell.self)
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func reloadItems() {
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension DashboardItemListView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DashboardItemCollectionViewCell = collectionView
            .uk_dequeueReusableCell(indexPath: indexPath)
        cell.item = items[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension DashboardItemListView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.dashboardItemListView(self, didSelect: items[indexPath.row])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DashboardItemListView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height * 0.6,
                      height: collectionView.frame.height)
    }
}
