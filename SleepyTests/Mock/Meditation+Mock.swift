//
//  Meditation+Mock.swift
//  SleepyTests
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation
@testable import Sleepy

extension Meditation {

    static func random(suffix: Int) -> Meditation {
        Meditation(title: "meditation\(suffix)",
                   subtitle: "",
                   image: SleepyImageModel(small: "", large: ""),
                   releaseDate: Date(),
                   content: nil)
    }
}
