//
//  main.swift
//  WhenWillRun
//
//  Created by Mauro Romito on 15/07/22.
//

do {
    guard CommandLine.arguments.count >= 2 else {
        throw WWRError.argumentsError
    }
    
    let simulatedTimeString = CommandLine.arguments[1]
    let simulatedTime = try Time(simulatedTimeString: simulatedTimeString)
    
    var inputs: [String] = []
    while let line = readLine() {
        inputs.append(line)
    }
    
    print()
    
    for input in inputs {
        guard let task = Task(from: input) else {
            print("invalid input: \(input)")
            continue
        }
        let firstScheduledTask = try task.firstSchedule(simulatedTime: simulatedTime)
        print(firstScheduledTask.toString())
    }
} catch {
    print(error)
}

