//
//  StoryDetailViewModelTests.swift
//  SleepyTests
//
//  Created by Ugur Kilic on 15.04.2021.
//

import XCTest
@testable import Sleepy

class StoryDetailViewModelTests: XCTestCase {

    class Box {

        let model: StoryDetailViewModel
        var changes: [StoryDetailViewModel.Change] = []

        init(story: Story) {
            model = StoryDetailViewModel(story: story)
            model.stateChangeHandler = { self.changes.append($0) }
        }
    }

    private var box: Box!

    func testModelNotifiesWithInitialStory() {
        let dummyStory = Story.random(suffix: 1)
        box = Box(story: dummyStory)

        switch box.changes[0] {
        case let .initial(story):
            XCTAssertEqual(story.name,
                           dummyStory.name,
                           "Model should notify with initial story after binding!")
        }
    }
}
