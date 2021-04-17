//
//  ApplicationRouter.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation
import UIKit
import Ugur

final class ApplicationRouter: GenericRouting {

    private var window: UIWindow!

    func initialize() {
        let controller: DashboardViewController = Global.mainStoryboad.load()
        controller.viewModel = DashboardViewModel()
        controller.router = DashboardRouter()

        window = UIWindow(frame: UIScreen.main.bounds)

        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.isNavigationBarHidden = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
