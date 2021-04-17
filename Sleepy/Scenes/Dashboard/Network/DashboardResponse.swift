//
//  DashboardResponse.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

struct DashboardResponse: Decodable {

    let isBannerEnabled: Bool
    let meditations: [Meditation]
    let stories: [Story]
}
