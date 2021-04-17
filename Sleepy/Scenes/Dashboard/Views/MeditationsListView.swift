//
//  MeditationsListView.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

final class MeditationsListView: UIView {

    var meditations: [Meditation] = [] {
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
        collectionViewLayout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 0,
                                                   left: Dimen.defaultMargin,
                                                   bottom: 0,
                                                   right: Dimen.defaultMargin)
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
extension MeditationsListView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meditations.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DashboardItemCollectionViewCell = collectionView
            .uk_dequeueReusableCell(indexPath: indexPath)
        cell.item = meditations[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MeditationsListView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
}
