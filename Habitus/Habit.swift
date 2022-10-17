//
//  Habit.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import Foundation

struct Habit: Identifiable, Codable, Equatable {
    var icon = "blank"
    var id = UUID()
    let title: String
    var description: String = ""
    var endGoal: Int
    var currentValue = 0
    var unitOfMeasurement = ""
}
