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
        Habit(icon: "brain", title: "Walking", endGoal: 2000, unitOfMeasurement: "steps"),
        Habit(title: "Running", endGoal: 30, unitOfMeasurement: "minutes"),
        Habit(title: "Learning a language", endGoal: 1, unitOfMeasurement: "hour"),
        Habit(title: "Practicing an instrument", endGoal: 1, unitOfMeasurement: "hour"),
        Habit(title: "Exercising", endGoal: 1, unitOfMeasurement: "hour")
    ]
    
    init() {
        items = defaultItems
    }
}
