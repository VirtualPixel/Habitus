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
        ScrollView(.vertical, showsIndicators: false) {
            
            HStack {
                VStack(alignment: .leading) {
                    NavigationLink {
                        CreateHabitView(customHabit: true, habit: habits)
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
                        //.font(.system(.title2))
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(height: 30)
                    
                    ForEach(habits.defaultItems, id: \.id) { habit in
                        let habitsContains = habits.items.contains(habit)
                        
                        if habitsContains {
                            AddHabitListView(habit: habit, contains: habitsContains, habits: habits)
                        } else {
                            NavigationLink {
                                CreateHabitView(customHabit: false, habit: habits, newHabit: habit)
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
        .navigationBarTitle(Text("Add habit"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.gray)
                        }
                })
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
