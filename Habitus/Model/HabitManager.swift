//
//  HabitManager.swift
//  Habitus
//
//  Created by Justin Wells on 2/6/23.
//

import CoreData
import SwiftUI

class HabitManager: ObservableObject {
    func loadNewDay(habits: [Habit]) {
        guard isTodayDifferentFromLastOpenDate() else { return }
        archiveHabits(habits: habits)
        resetAllHabitProgress(habits: habits)
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
    
    func resetHabit(habit: Habit) {
        habit.currentCompletionValue = 0
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
    
    private func resetHabitProgress(habit: Habit) {
        habit.currentCompletionValue = 0
    }
    
    private func resetAllHabitProgress(habits: [Habit]) {
        for habit in habits {
            resetHabitProgress(habit: habit)
        }
    }
    
    private func archiveHabits(habits: [Habit]) {
        
    }
}