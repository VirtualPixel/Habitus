//
//  AddView.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habits: Habits
    
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                HStack {
                    VStack(alignment: .leading) {
                        NavigationLink {
                            CreateHabitView(habit: habits)
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            HStack {
                                Image(systemName: "plus")
                                    .foregroundColor(.pastelTurquoise)
                                    .font(.system(size: 30))
                                Text("Custom Habit")
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                        }
                    }
                        Text("Habits")
                            .font(.system(.title2, weight: .semibold))
                            .frame(height: 30)
                        
                        ForEach(habits.defaultItems, id: \.id) { habit in
                            let habitsContains = habits.items.contains(habit)
                            
                            if habitsContains {
                                AddHabitListView(habit: habit, contains: habitsContains, habits: habits)
                            } else {
                                NavigationLink {
                                    CreateHabitView(habit: habits, newHabit: habit)
                                        .navigationBarBackButtonHidden(true)
                                } label: {
                                    AddHabitListView(habit: habit, contains: habitsContains, habits: habits)
                                }
                            }
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
            
        }
        .navigationBarTitle(Text("Add habit"), displayMode: .inline)
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
