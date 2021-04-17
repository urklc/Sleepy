//
//  DashboardViewController.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

final class DashboardViewController: UIViewController {

    var viewModel: DashboardViewModel!

    var router: DashboardRouting?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.stateChangeHandler = { [weak self] change in
            self?.apply(change)
        }

        viewModel.retrieveDashboard(blobID: "a07152f5-775c-11eb-a533-c90b9d55001f")
    }

    private func apply(_ change: DashboardViewModel.Change) {
        switch change {
        case .loading:
            // TODO: Display loading
            break
        case .error:
            // TODO: Display error
            break
        case let .items(isBannerEnabled, meditations, stories):
            // TODO: Display items
            break
        }
    }
}
