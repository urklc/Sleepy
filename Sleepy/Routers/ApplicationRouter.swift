//
//  ApplicationRouter.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation
import UIKit

final class ApplicationRouter: GenericRouting {

    private var window: UIWindow!

    func initialize() {
        let controller = DashboardViewController.loadFromStoryboard()
        controller.viewModel = DashboardViewModel()
        controller.router = DashboardRouter()

        window = UIWindow(frame: UIScreen.main.bounds)

        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.isNavigationBarHidden = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
