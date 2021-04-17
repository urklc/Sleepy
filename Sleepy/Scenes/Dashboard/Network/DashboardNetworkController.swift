//
//  DashboardNetworkController.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

protocol DashboardNetworkProvider {

    func retrieveDashboard(blobID: String,
                           completion: @escaping (DashboardResponse?, SleepyError?) -> Void)
}

class DashboardNetworkController: DashboardNetworkProvider {

    func retrieveDashboard(blobID: String,
                           completion: @escaping (DashboardResponse?, SleepyError?) -> Void) {
        let controller = NetworkController(baseURL: Global.baseURL)
        controller.send(request: DashboardRequest(blobID: blobID),
                        completion: completion)
    }
}
