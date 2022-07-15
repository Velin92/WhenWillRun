//
//  Task.swift
//  WhenWillRun
//
//  Created by Mauro Romito on 15/07/22.
//

struct Task {
    
    private enum ExpectedDay: String {
        case today
        case tomorrow
    }
    
    private let schedule: Time
    private let day: ExpectedDay?
    private let name: String
}

extension Task {
    
    init?(from input: String) {
        let components = input.components(separator: " ")
        guard components.count == 3,
              let schedule = Time(minuteString: components[0], minuteHour: components[1]) else {
            return nil
        }
        self.schedule = schedule
        name = components[2]
        day = nil
    }
    
    func firstSchedule(simulatedTime: Time) throws -> Task {
        guard let simulatedHour  = simulatedTime.specificHour,
              let simulatedMinute = simulatedTime.specificMinute else {
            throw WWRError.invalidSimualatedTime
        }
        
        var day = ExpectedDay.today
        var firstHour = simulatedHour
        var firstMinute = simulatedMinute
        
        // Both time values are specified
        if let scheduledHour = schedule.specificHour,
           let scheduledMinute = schedule.specificMinute {
            firstHour = scheduledHour
            firstMinute = scheduledMinute
            let isLate = scheduledHour < simulatedHour ||
            (scheduledHour == simulatedHour && scheduledMinute < simulatedMinute)
            day = isLate ? .tomorrow : .today
            
            // Only hour value is specified
        } else if let scheduledHour = schedule.specificHour {
            firstHour = scheduledHour
            day = scheduledHour < simulatedHour ? .tomorrow : .today
            firstMinute = scheduledHour == simulatedHour ? simulatedMinute : 0
            
            // Only the minute value is specified
        } else if let scheduledMinute = schedule.specificMinute {
            firstMinute = scheduledMinute
            if scheduledMinute < simulatedMinute {
                let nextHour = (simulatedHour + 1) % 24
                day = nextHour == 0 ? .tomorrow : .today
                firstHour = nextHour
            }
        }
        
        let schedule = Time(specificMinute: firstMinute, specificHour: firstHour)
        return Task(schedule: schedule, day: day, name: name)
    }
    
    func toString() -> String {
        return "\(schedule.toString()) \(day?.rawValue ?? "undefined") \(name)"
    }
}
