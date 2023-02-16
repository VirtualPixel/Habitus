//
//  HabitManager.swift
//  Habitus
//
//  Created by Justin Wells on 2/6/23.
//

import CoreData
import SwiftUI

class HabitManager: ObservableObject {
    func resetHabit(habit: Habit) {
        habit.currentStreak = habit.isTodayComplete ? habit.currentStreak + 1 : 0
        habit.bestCompletionStreak = max(habit.currentStreak, habit.bestCompletionStreak)
        habit.currentCompletionValue = 0
    }
    
    func addOneToValue(habit: Habit) {
        habit.currentCompletionValue += 1
    }
    
    func addTwentyToValue(habit: Habit) {
        habit.currentCompletionValue += 20
    }
    
    func completeHabit(habit: Habit) {
        guard habit.currentCompletionValue < habit.targetValue else { return }
        
        habit.currentCompletionValue = habit.targetValue
    }
    
    func isTodayDifferentFromLastOpenDate() -> Bool {
        let lastOpenDate = UserDefaults.standard.lastOpenDate
        let today = Date()
        
        if !Calendar.current.isDate(today, inSameDayAs: lastOpenDate) {
            UserDefaults.standard.lastOpenDate = Date()
            return true
        } else {
            return false
        }
    }
}
