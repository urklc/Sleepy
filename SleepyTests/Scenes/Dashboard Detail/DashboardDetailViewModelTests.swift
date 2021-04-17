//
//  DashboardDetailViewModelTests.swift
//  SleepyTests
//
//  Created by Ugur Kilic on 15.04.2021.
//

import XCTest
@testable import Sleepy

class DashboardDetailViewModelTests: XCTestCase {

    class Box {

        let model: DashboardDetailViewModel
        var changes: [DashboardDetailViewModel.Change] = []

        init(item: DashboardItem) {
            model = DashboardDetailViewModel(item: item)
            model.stateChangeHandler = { self.changes.append($0) }
        }
    }

    private var box: Box!

    func testModelNotifiesWithInitialStory() {
        let dummyStory = Story.random(suffix: 1)
        box = Box(item: dummyStory)

        switch box.changes[0] {
        case let .initial(item):
            XCTAssertEqual(item.title,
                           dummyStory.title,
                           "Model should notify with initial story after binding!")
        }
    }
}
