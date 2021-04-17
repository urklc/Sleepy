//
//  StoryboardLoadable.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

protocol StoryboardLoadable {

    static var defaultStoryboardName: String { get }

    static func loadFromStoryboard() -> Self
}

extension StoryboardLoadable where Self: UIViewController {

    static func loadFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: defaultStoryboardName, bundle: Bundle.main)
        guard let viewController = storyboard
                .instantiateViewController(withIdentifier: String(describing: self)) as? Self else {
            fatalError("")
        }
        return viewController
    }
}
