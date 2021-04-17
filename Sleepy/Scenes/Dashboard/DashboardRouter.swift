//
//  DashboardRouter.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

protocol DashboardRouting {

    func routeToDetail(context: UIViewController, story: Story)
}

final class DashboardRouter: DashboardRouting, GenericRouting {

    func routeToDetail(context: UIViewController, story: Story) {
        let controller = StoryDetailViewController()
        controller.viewModel = StoryDetailViewModel(story: story)
        controller.router = self
        context.navigationController?.pushViewController(controller, animated: true)
    }
}
