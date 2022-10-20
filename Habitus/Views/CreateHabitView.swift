//
//  CreateHabitView.swift
//  Habitus
//
//  Created by Justin Wells on 10/17/22.
//

import SwiftUI

struct CreateHabitView: View {
    let customHabit: Bool
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habit: Habits
    
    @State var newHabit = Habit(title: "", color: .pastelRed, endGoal: 0)
    @State private var message = "Unkown error"
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Name:")
                        .font(.headline)
                    TextField("Name (Required)", text: $newHabit.title)
                    
                    Text("Description:")
                        .font(.headline)
                    TextField("Description (Optional)", text: $newHabit.description)
                }
            }
            
            Text("Preview")
                .font(.title.bold())
            HabitListView(habits: [newHabit], habit: habit, deleteItems: {_ in })
            
            Button {
                if newHabit.isValidHabit {
                    habit.items.append(newHabit)
                    dismiss()
                } else {
                    message = "You must have a valid name, icon, goal, and unit of measurement to continue."
                    showingAlert = true
                }
            } label: {
                Image("brain")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(newHabit.color)
                    .padding(10)
                    .overlay(
                        Circle()
                        .stroke(newHabit.color, lineWidth: 6)
                    )
            }
            .alert("Error!", isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(message)
            }
            .frame(width: 60, height: 60)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            if customHabit {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.gray)
                                Image(systemName: "plus")
                                    .foregroundColor(.pastelTurquoise)
                                    .font(.system(size: 20))
                                Text("Custom Habit")
                                    .foregroundColor(.black)
                            } else {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.gray)
                                Text("\(newHabit.icon) \(newHabit.title)")
                                    .foregroundColor(.gray)
                            }
                        }
                })
    }
        
}

struct CreateHabitView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHabitView(customHabit: true, habit: Habits())
    }
}
