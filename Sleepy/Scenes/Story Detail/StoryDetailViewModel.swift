//
//  StoryDetailViewModel.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

final class StoryDetailViewModel {

    enum Change {

        case initial(DashboardItem)
    }

    var stateChangeHandler: ((Change) -> Void)? {
        didSet {
            stateChangeHandler?(.initial(item))
        }
    }

    private let item: DashboardItem

    init(item: DashboardItem) {
        self.item = item
    }
}
