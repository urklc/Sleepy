//
//  SleepyError.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

enum SleepyError: Error, CustomStringConvertible {

    case noData
    case invalidResponse(Error)
    case network(Error)
    case general(String)

    var description: String {
        switch self {
        case .noData:
            return "Received no data!"
        case .invalidResponse(let error):
            return "Response is invalid \(error.localizedDescription)"
        case let .network(error):
            return error.localizedDescription
        case let .general(message):
            return message
        }
    }
}

extension SleepyError: Equatable {

    public static func == (lhs: SleepyError, rhs: SleepyError) -> Bool {
        switch (lhs, rhs) {
        case (.noData, .noData):
            return true
        case let (.invalidResponse(lhsValue), .invalidResponse(rhsValue)):
            return lhsValue.localizedDescription == rhsValue.localizedDescription
        case let (.network(lhsValue), .network(rhsValue)):
            return lhsValue.localizedDescription == rhsValue.localizedDescription
        case let (.general(lhsValue), .general(rhsValue)):
            return lhsValue == rhsValue
        default:
            return false
        }
    }
}
