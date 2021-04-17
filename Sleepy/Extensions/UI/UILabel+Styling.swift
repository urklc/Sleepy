//
//  UILabel+Styling.swift
//  Sleepy
//
//  Created by Ugur Kilic on 16.04.2021.
//

import UIKit

enum SleepyFontWeight {

    case bold, regular
}

extension UILabel {

    func applyDefaultStyling(weight: SleepyFontWeight = .regular, style: UIFont.TextStyle = .body) {
        let preferredFont = UIFont.preferredFont(forTextStyle: style)
        switch weight {
        case .bold:
            font = UIFont.systemFont(ofSize: preferredFont.pointSize, weight: .bold)
        default:
            font = preferredFont
        }
        adjustsFontForContentSizeCategory = true
        textColor = .sleepyText
    }
}
