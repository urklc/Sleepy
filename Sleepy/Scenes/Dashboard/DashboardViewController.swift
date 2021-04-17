//
//  DashboardViewController.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit
import Ugur

enum DashboardSection: Int, CaseIterable {

    case meditation, banner, story

    var title: String {
        switch self {
        case .meditation:
            return "Meditations"
        case .story:
            return "Stories"
        default:
            return ""
        }
    }
}

final class DashboardViewController: UIViewController, StoryboardLoadable {

    static let defaultStoryboardName = "Main"

    var viewModel: DashboardViewModel!

    var router: DashboardRouting?

    private var gradientBackgroundLayer: CAGradientLayer?
    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

        viewModel.stateChangeHandler = { [weak self] change in
            self?.apply(change)
        }

        viewModel.retrieveDashboard(blobID: "a07152f5-775c-11eb-a533-c90b9d55001f")
    }
    private func setupViews() {
        view.backgroundColor = .primaryBackground

        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.backgroundColor = .clear
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = Margin.xlarge
        collectionViewLayout.minimumInteritemSpacing = Margin.large
        collectionView.collectionViewLayout = collectionViewLayout

        collectionView.uk_registerSupplementarySectionHeaderView(DashboardSectionHeaderView.self)
        collectionView.uk_registerCell(DashboardItemCollectionViewCell.self)
        collectionView.uk_registerCell(DashboardItemListCollectionViewCell.self)
        collectionView.uk_registerCell(DashboardBannerCollectionViewCell.self)
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
        case .banner:
            return viewModel.isBannerEnabled ? 1 : 0
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
            cell.itemsListView.delegate = self
            cell.itemsListView.items = viewModel.meditations
            return cell

        case .banner:
            let cell: DashboardBannerCollectionViewCell = collectionView
                .uk_dequeueReusableCell(indexPath: indexPath)
            return cell

        case .story:
            let cell: DashboardItemCollectionViewCell = collectionView
                .uk_dequeueReusableCell(indexPath: indexPath)
            cell.item = viewModel.stories[indexPath.row]
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let view: DashboardSectionHeaderView = collectionView
            .uk_dequeueSupplementarySectionHeaderView(indexPath: indexPath)
        view.text = DashboardSection(rawValue: indexPath.section)!.title
        return view
    }
}

// MARK: - UICollectionViewDelegate
extension DashboardViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == DashboardSection.story.rawValue {
            router?.routeToDetail(context: self, item: viewModel.stories[indexPath.row])
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
            return CGSize(width: collectionView.frame.width, height: 300)

        case .banner:
            return CGSize(width: collectionView.frame.width, height: 150)

        case .story:
            let columnCount: CGFloat = 2
            let width = (collectionView.frame.width - ((columnCount + 1) * Margin.large)) / columnCount
            return CGSize(width: width, height: width * 1.3)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let horizontalMargin = DashboardSection.story.rawValue == section ? Margin.large : 0
        return UIEdgeInsets(top: Margin.small,
                            left: horizontalMargin,
                            bottom: Margin.small,
                            right: horizontalMargin)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard DashboardSection(rawValue: section)!.title.count > 0 else {
            return CGSize.zero
        }
        return CGSize(width: collectionView.frame.width,
                      height: DashboardSectionHeaderView.expectedHeight)
    }
}

// MARK: - DashboardItemListViewDelegate
extension DashboardViewController: DashboardItemListViewDelegate {

    func dashboardItemListView(_ dashboardItemListView: DashboardItemListView,
                               didSelect item: DashboardItem) {
        router?.routeToDetail(context: self, item: item)
    }
}
