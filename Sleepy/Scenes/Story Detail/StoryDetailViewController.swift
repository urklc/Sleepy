//
//  StoryDetailViewController.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

final class StoryDetailViewController: UIViewController {

    var viewModel: StoryDetailViewModel!

    var router: GenericRouting?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.stateChangeHandler = { [weak self] change in
            self?.apply(change)
        }
    }

    private func apply(_ change: StoryDetailViewModel.Change) {
        switch change {
        case .initial:
            // TODO: Display story
            break
        }
    }
}
