//
//  AppDelegate.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let router = ApplicationRouter()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        router.initialize()
        return true
    }
}
