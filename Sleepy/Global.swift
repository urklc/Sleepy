//
//  Global.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

enum Global {

    static let baseURL = URL(string: "https://jsonblob.com/")!

    static let mainStoryboad = UIStoryboard(name: "Main",
                                            bundle: Bundle.main)
}

enum Margin {

    static let small: CGFloat = 8
    static let medium: CGFloat = 16
    static let large: CGFloat = 24
    static let xlarge: CGFloat = 48
}
