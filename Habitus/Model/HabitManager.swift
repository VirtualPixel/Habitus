//
//  HabitManager.swift
//  Habitus
//
//  Created by Justin Wells on 2/6/23.
//

import Foundation

class HabitManager {
    func resetHabitProgress(habit: Habit) {
        let currentDate = Date()
        
        if currentDate > habit.wrappedStreakEndDate {
            habit.currentStreak = 0
            //habit
        }
    }
}
