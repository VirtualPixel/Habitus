//
//  HabitView.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import SwiftUI

struct HabitListView: View {
    let habits: [Habit]
    let deleteItems: (IndexSet) -> Void
    @State private var selected = 0
    
    @State private var deleteAlert = false
        
    var body: some View {
        Section {
            ForEach(Array(habits.enumerated()), id:\.offset) { index, item in
                HStack {
                    Text(item.icon)
                        .frame(width: 50, height: 50)
                        .font(.system(size: 500))
                        .minimumScaleFactor(0.01)
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        Text(item.description)
                    }
                    Spacer()
                    VStack {
                        Text("\(item.currentValue) / \(item.endGoal)")
                        Text("\(item.unitOfMeasurement)")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(item.color)
                .cornerRadius(15)
                .onTapGesture {
                    //Navigate to edit habit
                }
                .onLongPressGesture {
                    selected = index
                    deleteAlert = true
                }
                .alert("Confirmation", isPresented: $deleteAlert, actions: {
                    Button("Delete", role: .destructive, action: {
                        withAnimation {
                            deleteItems([selected])
                        }
                    })
                }, message: {
                    Text("Are you sure you want to delete this habit?")
                })

                
            }
            .onDelete(perform: deleteItems)
            .transition(.move(edge: .trailing))
            
        }
        .padding()
        
    }
}

struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListView(habits: [Habit(icon: "🏃‍♂️", title: "Walk", description: "Just strolling on by", color: .paleMauve, endGoal: 2000, unitOfMeasurement: "steps")]) { _ in }
    }
}
