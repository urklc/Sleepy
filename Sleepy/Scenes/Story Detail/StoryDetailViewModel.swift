//
//  StoryDetailViewModel.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

final class StoryDetailViewModel {

    enum Change {

        case initial(Story)
    }

    var stateChangeHandler: ((Change) -> Void)? {
        didSet {
            stateChangeHandler?(.initial(story))
        }
    }

    private let story: Story

    init(story: Story) {
        self.story = story
    }
}
