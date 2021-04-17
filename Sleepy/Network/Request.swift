//
//  Request.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

protocol Request {

    var httpMethod: String { get }
    var endpoint: Endpoint { get }
}

extension Request {

    var httpMethod: String {
        return "GET"
    }
}
