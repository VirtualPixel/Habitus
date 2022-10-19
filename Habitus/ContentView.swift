//
//  ContentView.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    @State var isActive = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Today")
                    .font(.system(size: 35).bold())
                
                ZStack {
                    ScrollView {
                        HabitListView(title: "Habits", habits: habits.items, deleteItems: removeHabits)
                    }
                    .navigationTitle("")
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                                                        
                            NavigationLink {
                                AddView(habits: habits)
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(Color(red: 0.88, green: 0.40, blue: 0.49))
                                    .font(.system(size: 35))
                                    .padding(50)
                            }
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .cornerRadius(38.5)
                            .padding()
                            .shadow(color: Color.black.opacity(1),
                                    radius: 1,
                                    x: 0,
                                    y: 0)
                        }
                    }
                }
                .toolbar {
                    Button {
                        //How to pop up
                        print("How to prompt")
                    } label: {
                        Text("?")
                            .foregroundColor(Color(red: 0.88, green: 0.40, blue: 0.49))
                            .font(.system(size: 35).bold())
                            .padding()
                    }
                }
        }
        }
        
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
