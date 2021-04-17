//
//  DashboardViewModel.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

final class DashboardViewModel {

    enum Change {

        case loading(Bool)
        case error(SleepyError?)
        case items
    }

    var stateChangeHandler: ((Change) -> Void)?

    private(set) var isBannerEnabled = false

    private(set) var meditations: [Meditation] = []

    private(set) var stories: [Story] = []

    private let dataProvider: DashboardNetworkProvider?

    private var error: SleepyError? {
        didSet {
            stateChangeHandler?(.error(error))
        }
    }

    private var isLoading: Bool = false {
        didSet {
            stateChangeHandler?(.loading(isLoading))
        }
    }

    init(dataProvider: DashboardNetworkProvider? = DashboardNetworkController()) {
        self.dataProvider = dataProvider
    }

    func retrieveDashboard(blobID: String) {
        isLoading = true
        dataProvider?.retrieveDashboard(blobID: blobID) { [weak self] response, error in
            guard let self = self else {
                return
            }
            self.isLoading = false
            self.error = error
            if let response = response {
                self.isBannerEnabled = response.isBannerEnabled
                self.meditations = response.meditations
                self.stories = response.stories
                self.stateChangeHandler?(.items)
            }
        }
    }
}
