//
//  Home-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import Foundation

extension Home {
    @MainActor class ViewModel: ObservableObject {
        @Published var selectedDay = Date()
        @Published var selectedSort: SortTypes = .suggested
        @Published var showingSort = false
        @Published var showingSettings = false
        @Published var showingAddMood = false
        @Published var showingAddNewHabit = false
        @Published var showContextButtons = false
        
        func blurRadius() -> CGFloat {
            showContextButtons ? 5 : 0
        }
    }
}

enum SortTypes: String, CaseIterable, Identifiable {
    case suggested = "Suggested"
    case reminderTime = "Reminder Time"
    case alphabeticalAscend = "Alphabetical"
    
    var id: SortTypes { self }
}
