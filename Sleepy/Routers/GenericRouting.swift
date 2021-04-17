//
//  GenericRouting.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import UIKit

protocol GenericRouting { }

extension GenericRouting {

    func pop(context: UIViewController) {
        context.navigationController?.popViewController(animated: true)
    }
}
