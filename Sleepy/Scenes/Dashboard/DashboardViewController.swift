//
//  DashboardViewController.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit
import Ugur

enum DashboardSection: Int, CaseIterable {
    case meditation
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
        collectionView.collectionViewLayout = collectionViewLayout

        collectionView.uk_registerCell(MeditationsCollectionViewCell.self)
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
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch DashboardSection(rawValue: indexPath.section)! {
        case .meditation:
            let cell: MeditationsCollectionViewCell = collectionView
                .uk_dequeueReusableCell(indexPath: indexPath)
            cell.meditationsListView.meditations = viewModel.meditations
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
        }
    }
}
