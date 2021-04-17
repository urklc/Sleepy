//
//  DateUtility.swift
//  Sleepy
//
//  Created by Ugur Kilic on 17.04.2021.
//

import Foundation

final class DateUtility {

    static var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy, E"
        return formatter
    }()

    static func string(from date: Date) -> String {
        return DateUtility.formatter.string(from: date)
    }
}
