//
//  AppDelegate.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var mainWindow: UIWindow!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        mainWindow = UIWindow(frame: UIScreen.main.bounds)
        mainWindow.rootViewController = UIViewController()
        mainWindow.makeKeyAndVisible()
        return true
    }
}

