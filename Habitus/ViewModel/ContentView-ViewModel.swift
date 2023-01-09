//
//  ContentView-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 11/22/22.
//

import Foundation

extension ContentView {
    class ViewModel: ObservableObject {
        var habits: Habits
        
        init(habits: Habits) {
            self.habits = habits
        }
        
        func removeHabits(at offsets: IndexSet) {
            removeItems(at: offsets, in: habits.items)
        }
        
        func removeItems(at offsets: IndexSet, in inputArray: [Habit]) {
            var objectsToDelete = IndexSet()
            
            for offset in offsets {
                let item = inputArray[offset]
                
                if let index = habits.items.firstIndex(of: item) {
                    objectsToDelete.insert(index)
                }
            }
            habits.items.remove(atOffsets: objectsToDelete)
        }
    }
}
