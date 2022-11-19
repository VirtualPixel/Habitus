//
//  Habits.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import Foundation

class Habits: ObservableObject {
    @Published var items = [Habit]()
    
    let defaultItems: [Habit] = [
        Habit(icon: "🚶", title: "Walking", color: .paleMauve, endGoal: 2000, unitOfMeasurement: "step"),
        Habit(icon: "💧", title: "Drink Water", color: .babyBlue, endGoal: 5, unitOfMeasurement: "cup"),
        Habit(icon: "🏃‍♂️", title: "Running", color: .pastelRed, endGoal: 30, unitOfMeasurement: "minute"),
        Habit(icon: "🗺", title: "Learning a language", color: .pastelGreen, endGoal: 1, unitOfMeasurement: "hour"),
        Habit(icon: "🎼", title: "Practicing an instrument", color: .magicMint, endGoal: 1, unitOfMeasurement: "hour"),
        Habit(icon: "🏋️", title: "Exercising", color: .pastelBrown, endGoal: 1, unitOfMeasurement: "hour"),
        Habit(icon: "🧘", title: "Meditate", color: .lightGreen, endGoal: 30, unitOfMeasurement: "minute"),
        Habit(icon: "😴", title: "Get enough sleep", color: .pastelLilac, endGoal: 8, unitOfMeasurement: "hour"),
        
    ]
    
    init() {
        items.append(defaultItems[0])
        items.append(defaultItems[1])
        items.append(defaultItems[2])
        //items = defaultItems
    }
}
