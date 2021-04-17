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
        let controller = DashboardViewController()
        controller.viewModel = DashboardViewModel()
        controller.router = DashboardRouter()

        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: controller)
        window.makeKeyAndVisible()
    }
}
