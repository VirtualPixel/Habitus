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
        let fetchRequest = NSFetchRequest<Habit>(entityName: "Habit")
        
        func blurRadius() -> CGFloat {
            showingContextButtons ? 5 : 0
        }
    }
}

enum SortTypes: String, CaseIterable, Identifiable {
    case suggested = "Suggested"
    case reminderTime = "Reminder Time"
    case alphabeticalAscend = "Alphabetical"
    
    var id: SortTypes { self }
}
