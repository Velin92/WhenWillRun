//
//  WWRError.swift
//  WhenWillRun
//
//  Created by Mauro Romito on 15/07/22.
//

enum WWRError: Error, CustomStringConvertible {
    var description: String {
        var cause: String
        switch self {
        case .argumentsError: cause = "Missing argument"
        case .invalidSimualatedTime: cause = "Invalid simulated time"
        }
        return "\(cause), please insert the simulated time as HH:MM on a 24 hour format"
    }
    
    case argumentsError
    case invalidSimualatedTime
}
