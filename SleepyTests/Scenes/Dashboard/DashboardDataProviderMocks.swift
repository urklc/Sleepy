//
//  DashboardDataProviderMocks.swift
//  SleepyTests
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation
@testable import Sleepy

class DashboardDataProviderSpy: DashboardNetworkProvider {

    var isRetrieveDashboardCallCount = 0
    var retrieveDashboardBlobID: String?

    func retrieveDashboard(blobID: String,
                           completion: @escaping (DashboardResponse?, SleepyError?) -> Void) {
        isRetrieveDashboardCallCount += 1
        retrieveDashboardBlobID = blobID
        completion(nil, nil)
    }
}

class DashboardDataProviderMock: DashboardNetworkProvider {

    var retrieveDashboardResponse: DashboardResponse?
    var retrieveDashboardError: SleepyError?

    func retrieveDashboard(blobID: String,
                           completion: @escaping (DashboardResponse?, SleepyError?) -> Void) {
        completion(retrieveDashboardResponse, retrieveDashboardError)
    }
}
