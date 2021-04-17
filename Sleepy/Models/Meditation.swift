//
//  Meditation.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

struct Meditation: Decodable {

    let title: String
    let subtitle: String
    let image: SleepyImageModel
    let releaseDate: Date
    let content: String?
}
