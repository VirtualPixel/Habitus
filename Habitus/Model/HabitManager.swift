//
//  HabitManager.swift
//  Habitus
//
//  Created by Justin Wells on 2/6/23.
//

import CoreData
import SwiftUI

class HabitManager {
    let moc: NSManagedObjectContext
    @FetchRequest(sortDescriptors: []) var habits: FetchedResults<Habit>
    
    func resetHabitProgress(habit: Habit, saveHabit: Bool = true) {
        habit.currentCompletionValue = 0
        if saveHabit {
            save(habit: habit)
        }
    }
    
    func resetAllHabitsProgress(habits: [Habit]) {
        for habit in habits {
            resetHabitProgress(habit: habit, saveHabit: false)
        }
    }
    
    func addOneToValue(habit: Habit) {
        habit.currentCompletionValue += 1
        
        save(habit: habit)
    }
    
    func completeHabit(habit: Habit) {
        guard habit.currentCompletionValue < habit.targetValue else { return }
        
        habit.currentCompletionValue = habit.targetValue
        save(habit: habit)
    }
    
    func save(habit: Habit) {
        do {
            try habit.managedObjectContext?.save()
        } catch {
            print("Error in saving changes. \(error)")
        }
    }
    
    func resetDailyHabits() {
        
    }
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.moc = managedObjectContext
    }
}
