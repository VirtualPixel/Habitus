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
    var frequency: FrequencySelection = .daily
    
    var percentComplete: Int {
        let result = Double(currentValue) / Double(endGoal) * 100
        
        return result < 100 ? Int(result) : 100
    }
    
    var progressBar: CGFloat {
        let trimAmount = (Double(percentComplete)/100) / 2
        
        return trimAmount < 0.5 ? trimAmount : 0.5
    }
    
    var isValidHabit: Bool {
        if icon.isEmpty || unitOfMeasurement.isEmpty || title.isEmpty || endGoal == 0 { return false }
        
        return true
    }
    
    var isUnitSingular: Bool {
        (endGoal == 1 || endGoal == 0) || unitOfMeasurement.isEmpty
    }
    
    static let example = Habit(icon: "🚶", title: "Walk", color: .lightGreen, endGoal: 2000)
}

enum FrequencySelection: String, CaseIterable, Codable, Identifiable {
    var id: Self { self }
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
}
