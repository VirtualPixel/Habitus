//
//  ContentView.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    @State var showingAddView = false
    
    
    var body: some View {
        NavigationView {
            List {
                HabitView(title: "Habits", habits: habits.viewedHabits, deleteItems: removeViewedHabits)
            }
            .navigationTitle("Habitus")
            .toolbar {
                Button {
                    showingAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddView) {
                    AddView()
            }
        }
        
    }
    
    func removeViewedHabits(at offsets: IndexSet) {
        removeItems(at: offsets, in: habits.viewedHabits)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
