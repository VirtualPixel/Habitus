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
        let trimAmount = (Double(percentComplete) / 100) / 2
        return trimAmount < 0.5 ? trimAmount : 0.5
    }
    
    var isValidHabit: Bool {
        if icon.isEmpty || unitOfMeasurement.isEmpty || title.isEmpty || endGoal == 0 {
            return false
        }
        
        return true
    }
    
    var correctUnitOfMeasurement: String {
        let isUnitSingular = (endGoal == 1 || endGoal == 0) || unitOfMeasurement.isEmpty
        return isUnitSingular ? unitOfMeasurement : unitOfMeasurement + "s"
    }
    
    var rotationSpeed: CGFloat {
        switch percentComplete {
        case 0...9:
            return 10
        case 10...19:
            return 9
        case 20...29:
            return 8
        case 30...39:
            return 7
        case 40...49:
            return 6
        case 50...59:
            return 5
        case 60...69:
            return 4
        case 70...79:
            return 3
        case 80...89:
            return 2
        case 90...99:
            return 1
        default:
            return 0.5
        }
    }
    
    static let example = Habit(icon: "🚶", title: "Walk", color: .lightGreen, endGoal: 2000)
}


enum FrequencySelection: String, CaseIterable, Codable, Identifiable {
    var id: Self { self }
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
}
