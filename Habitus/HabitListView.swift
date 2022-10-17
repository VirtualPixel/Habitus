//
//  HabitView.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import SwiftUI

struct HabitListView: View {
    let title: String
    let habits: [Habit]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section {
            ForEach(habits) { item in
                HStack {
                    Image(item.icon)
                        .resizable()
                        .frame(width: 40, height: 40)
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
                //.background() place background here
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: 0.3)
                )
                
            }
            .onDelete(perform: deleteItems)
        }
        .padding()
    }
}

struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListView(title: "Example", habits: [Habit(title: "Walk", description: "Just strolling on by", endGoal: 2000, unitOfMeasurement: "steps")]) { _ in }
    }
}
