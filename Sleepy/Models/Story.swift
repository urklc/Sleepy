//
//  Story.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

struct Story: Decodable {

    let name: String
    let category: String
    let image: SleepyImageModel
    let date: Date
    let content: String?
}
