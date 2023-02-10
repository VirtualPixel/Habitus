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
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.moc = managedObjectContext
    }
    
    func loadNewDay(habits: [Habit]) {
        archiveHabits(habits: habits)
        resetAllHabitProgress(habits: habits)
    }
    
    func addOneToValue(habit: Habit) {
        habit.currentCompletionValue += 1
        
        saveChanges()//habit: habit)
    }
    
    func completeHabit(habit: Habit) {
        guard habit.currentCompletionValue < habit.targetValue else { return }
        
        habit.currentCompletionValue = habit.targetValue
        saveChanges()//habit: habit)
    }
    
    func deleteHabit(habit: Habit) {
        withAnimation {
            moc.delete(habit)
        }
        //saveChanges()
    }
    
    private func resetHabitProgress(habit: Habit, saveHabit: Bool = true) {
        habit.currentCompletionValue = 0
        if saveHabit {
            saveChanges()//habit: habit)
        }
    }
    
    private func resetAllHabitProgress(habits: [Habit]) {
        for habit in habits {
            resetHabitProgress(habit: habit)
        }
    }
    
    private func archiveHabits(habits: [Habit]) {
        
    }
    
    private func saveChanges() {//habit: Habit) {
        do {
            //try habit.managedObjectContext?.save()
            try moc.save()
        } catch {
            print("Error in saving changes. \(error)")
        }
    }
}
