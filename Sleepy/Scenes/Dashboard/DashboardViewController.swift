//
//  DashboardViewController.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit
import Ugur

enum DashboardSection: Int, CaseIterable {
    case meditation, story
}

final class DashboardViewController: UIViewController, StoryboardLoadable {

    static let defaultStoryboardName = "Main"

    var viewModel: DashboardViewModel!

    var router: DashboardRouting?

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

        viewModel.stateChangeHandler = { [weak self] change in
            self?.apply(change)
        }

        viewModel.retrieveDashboard(blobID: "a07152f5-775c-11eb-a533-c90b9d55001f")
    }

    private func setupViews() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = Margin.medium
        collectionViewLayout.minimumInteritemSpacing = Margin.medium
        collectionView.collectionViewLayout = collectionViewLayout

        collectionView.uk_registerCell(DashboardItemCollectionViewCell.self)
        collectionView.uk_registerCell(DashboardItemListCollectionViewCell.self)
    }

    private func apply(_ change: DashboardViewModel.Change) {
        switch change {
        case .loading:
            // TODO: Display loading
            break
        case .error:
            // TODO: Display error
            break
        case .items:
            collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension DashboardViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return DashboardSection.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch DashboardSection(rawValue: section)! {
        case .meditation:
            return 1
        case .story:
            return viewModel.stories.count
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch DashboardSection(rawValue: indexPath.section)! {
        case .meditation:
            let cell: DashboardItemListCollectionViewCell = collectionView
                .uk_dequeueReusableCell(indexPath: indexPath)
            cell.itemsListView.items = viewModel.meditations
            return cell
        case .story:
            let cell: DashboardItemCollectionViewCell = collectionView
                .uk_dequeueReusableCell(indexPath: indexPath)
            cell.item = viewModel.stories[indexPath.row]
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DashboardViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch DashboardSection(rawValue: indexPath.section)! {
        case .meditation:
            return CGSize(width: collectionView.frame.width, height: 200)
        case .story:
            let width = (collectionView.frame.width - Margin.medium) / 2
            return CGSize(width: width, height: width)
        }
    }
}
