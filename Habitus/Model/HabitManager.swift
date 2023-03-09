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
        habit.dateOfLastCompletionStreak = habit.currentStreak == 0 ? Date() : habit.dateOfLastCompletionStreak
        habit.currentCompletionValue = 0
        habit.timeCompleted = nil
    }
    
    func addLowerBoundToValue(habit: Habit) {
        habit.currentCompletionValue += Unit.lowerBound(string: habit.wrappedUnitType)
        markTimeCompleted(habit: habit)
    }
    
    func addUpperBoundToValue(habit: Habit) {
        habit.currentCompletionValue += Unit.upperBound(string: habit.wrappedUnitType)
        markTimeCompleted(habit: habit)
    }
    
    func completeHabit(habit: Habit) {
        guard habit.currentCompletionValue < habit.targetValue else { return }
        
        habit.currentCompletionValue = habit.targetValue
        markTimeCompleted(habit: habit)
    }
    
    func isTodayDifferentFromLastOpenDate() -> Bool {
        let lastOpenDate = UserDefaults.standard.lastOpenDate
        let today = Date()
        
        if !Calendar.current.isDate(today, inSameDayAs: lastOpenDate) {
            UserDefaults.standard.lastOpenDate = Date()
            print("Different day")
            return true
        } else {
            print("Not a different day")
            return false
        }
    }
    
    private func markTimeCompleted(habit: Habit) {
        guard habit.timeCompleted == nil else { return }
        guard habit.currentCompletionValue >= habit.targetValue else { return }
        habit.timeCompleted = Date()
    }
}
