//
//  String+components.swift
//  WhenWillRun
//
//  Created by Mauro Romito on 15/07/22.
//

// Since I am not using Foundation I am writing a version of this function myself
extension String {
    func components(separator: Character) -> [String] {
        self.split(separator: separator).map { String($0) }
    }
}
