//
//  Habit.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import SwiftUI

struct Habit: Identifiable, Codable, Equatable {
    var icon = ""
    var id = UUID()
    var title: String
    var description: String = ""
    var color: Color
    var endGoal: Int
    var currentValue = 0
    var unitOfMeasurement = ""
    
    var percentComplete: Int {
        currentValue / endGoal * 100
    }
    
    var isValidHabit: Bool {
        if icon.isEmpty || unitOfMeasurement.isEmpty || title.isEmpty || endGoal == 0 { return false }
        
        return true
    }
}
