//
//  DashboardDetailViewController.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

final class DashboardDetailViewController: UIViewController {

    var viewModel: DashboardDetailViewModel!

    var router: GenericRouting?

    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var playImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

        viewModel.stateChangeHandler = { [weak self] change in
            self?.apply(change)
        }
    }

    private func setupViews() {
        backgroundImageView.image = UIImage(named: "img_story_background")
        backgroundImageView.contentMode = .scaleAspectFill

        playImageView.image = UIImage(named: "ic_play")

        titleLabel.numberOfLines = 2
        titleLabel.applyDefaultStyling(weight: .bold, style: .title3)

        descriptionLabel.numberOfLines = 0
        descriptionLabel.applyDefaultStyling(style: .body)

        dateLabel.applyDefaultStyling(style: .caption1)
    }

    private func apply(_ change: DashboardDetailViewModel.Change) {
        switch change {
        case let .initial(item):
            titleLabel.text = item.title
            descriptionLabel.text = item.content
            dateLabel.text = DateUtility.string(from: item.date)
        }
    }

    // MARK: - Actions

    @IBAction func backButtonTapped() {
        router?.pop(context: self)
    }
}
