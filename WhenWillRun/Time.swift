//
//  Time.swift
//  WhenWillRun
//
//  Created by Mauro Romito on 15/07/22.
//

struct Time {
    // nil values are equivalent to wildcards
    let specificMinute: Int?
    let specificHour: Int?
}

extension Time {
    private static func isValidMinute(_ value: Int) -> Bool {
        return value >= 0 && value <= 59
    }
    
    private static func isValidHour(_ value: Int) -> Bool {
        return value >= 0 && value <= 23
    }
    
    init?(minuteString: String, minuteHour: String) {
        if minuteString == "*" {
            specificMinute = nil
        } else if let value = Int(minuteString),
                  Time.isValidMinute(value) {
            specificMinute = value
        } else {
            return nil
        }
        
        if minuteHour == "*" {
            specificHour = nil
        } else if let value = Int(minuteHour),
                  Time.isValidHour(value) {
            specificHour = value
        } else {
            return nil
        }
    }
    
    init(simulatedTimeString: String) throws {
        let components = simulatedTimeString.components(separator: ":")
        guard components.count >= 2,
              let hour = Int(components[0]),
              let minute = Int(components[1]),
              Self.isValidHour(hour),
              Self.isValidMinute(minute) else {
            throw WWRError.invalidSimualatedTime
        }
        self.specificMinute = minute
        self.specificHour = hour
    }
    
    func toString() -> String {
        var result = ""
        if let specificHour = specificHour {
            result += "\(specificHour)"
        } else {
            result += "HH"
        }
        result += ":"
        if let specificMinute = specificMinute {
            result += specificMinute < 10 ? "0\(specificMinute)" : "\(specificMinute)"
        } else {
            result += "MM"
        }
        return result
    }
}
