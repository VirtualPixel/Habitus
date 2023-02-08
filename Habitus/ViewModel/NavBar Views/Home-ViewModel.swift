//
//  Home-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import CoreData
import SwiftUI

extension Home {
    class ViewModel: ObservableObject {
        @Published var selectedDay = Date()
        @Published var selectedSort: SortTypes = .suggested
        @Published var showingSort = false
        @Published var showingSettings = false
        @Published var showingAddMood = false
        @Published var showingHabitList = false
        @Published var showingCreateHabit = false
        @Published var showingContextButtons = false
        
        func blurRadius() -> CGFloat {
            showingContextButtons ? 5 : 0
        }
        
        func checkIfNeedsToResetHabits(managedObjectContext: NSManagedObjectContext) {
            let defaults = UserDefaults.standard
            let lastOpenDate = defaults.object(forKey: "lastOpenDateKey") as? Date ?? Date()
            let today = Date()
                        
            guard !Calendar.current.isDate(today, inSameDayAs: lastOpenDate) else { return }
            
            let fetchRequest = NSFetchRequest<Habit>(entityName: "Habit")
            do {
                let habits = try managedObjectContext.fetch(fetchRequest)
                HabitManager(managedObjectContext: managedObjectContext).resetAllHabitsProgress(habits: habits)
            } catch let error as NSError {
                print("Error fetching habits: \(error)")
            }
        }
    }
}

enum SortTypes: String, CaseIterable, Identifiable {
    case suggested = "Suggested"
    case reminderTime = "Reminder Time"
    case alphabeticalAscend = "Alphabetical"
    
    var id: SortTypes { self }
}
