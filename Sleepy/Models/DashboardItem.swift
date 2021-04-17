//
//  DashboardItem.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

protocol DashboardItem {

    var title: String { get }
    var subtitle: String { get }
    var content: String? { get }
    var imageUrl: String { get }
    var date: Date { get }
}
