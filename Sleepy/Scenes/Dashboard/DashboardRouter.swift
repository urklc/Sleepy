//
//  DashboardRouter.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

protocol DashboardRouting {

    func routeToDetail(context: UIViewController, item: DashboardItem)
}

final class DashboardRouter: DashboardRouting, GenericRouting {

    func routeToDetail(context: UIViewController, item: DashboardItem) {
        let controller = StoryDetailViewController.loadFromStoryboard()
        controller.viewModel = StoryDetailViewModel(item: item)
        controller.router = self
        context.navigationController?.pushViewController(controller, animated: true)
    }
}
