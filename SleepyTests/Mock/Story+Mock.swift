//
//  Story+Mock.swift
//  SleepyTests
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation
@testable import Sleepy

extension Story {

    static func random(suffix: Int) -> Story {
        Story(name: "story\(suffix)",
              category: "",
              image: SleepyImageModel(small: "", large: ""),
              date: Date(),
              content: nil)
    }
}
