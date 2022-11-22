//
//  HabitView.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import SwiftUI

struct HabitListView: View {
    let habits: [Habit]
    @ObservedObject var habit: Habits
    let deleteItems: (IndexSet) -> Void
    
    @State private var selected = 0
    @State private var deleteAlert = false
        
    var body: some View {
        Section {
            ForEach(Array(habits.enumerated()), id:\.offset) { index, item in
                NavigationLink {
                    HabitDetailView(habit: item)
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text(item.icon)
                            .frame(width: 50, height: 50)
                            .font(.system(size: 500))
                            .minimumScaleFactor(0.01)
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                                .foregroundColor(.black)
                            Text(item.description)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        VStack {
                            Text("\(item.currentValue) / \(item.endGoal)")
                                .foregroundColor(.black)
                            Text("\(item.isUnitSingular ? item.unitOfMeasurement : item.unitOfMeasurement + "s")")
                                .foregroundColor(.black)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(item.color
                        .opacity(0.7))
                    .cornerRadius(15)
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
            }
            .onDelete(perform: deleteItems)
            .transition(.move(edge: .trailing))
            
        }
        .padding()
        
    }
}

struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListView(habits: [Habit(icon: "🏃‍♂️", title: "Walk", description: "Just strolling on by", color: .paleMauve, endGoal: 2000, unitOfMeasurement: "step")], habit: Habits()) { _ in }
    }
}
