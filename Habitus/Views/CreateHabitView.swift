//
//  CreateHabitView.swift
//  Habitus
//
//  Created by Justin Wells on 10/17/22.
//

import SwiftUI

struct CreateHabitView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habit: Habits
    
    var newHabit = Habit(title: "", color: .pastelRed, endGoal: 0)
    
    var body: some View {
        VStack {
            ScrollView {
                Text("Hellow")
                Text("Hellow")
            }
            
            Text("Preview")
                .font(.title.bold())
            HabitListView(habits: [newHabit], deleteItems: {_ in })
            
            Button {
                
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
            
            .frame(width: 60, height: 60)
        }
    }
}

struct CreateHabitView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHabitView(habit: Habits())
    }
}
