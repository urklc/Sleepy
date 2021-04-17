//
//  UILabel+Styling.swift
//  Sleepy
//
//  Created by Ugur Kilic on 16.04.2021.
//

import UIKit

enum SleepyFont {
    case book, light

    var fontName: String {
        switch self {
        case .book:
            return "Hanken-Book"
        case .light:
            return "Hanken-Light"
        }
    }
}

extension UILabel {

    func applyDefaultStyling(sleepyFont: SleepyFont = .light, style: UIFont.TextStyle = .body) {
        let customFont = UIFont(name: sleepyFont.fontName, size: 17)!
        adjustsFontForContentSizeCategory = true
        font = UIFontMetrics(forTextStyle: style).scaledFont(for: customFont)

        textColor = .sleepyText
    }
}
