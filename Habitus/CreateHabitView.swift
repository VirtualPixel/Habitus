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
    
    var newHabit = Habit(title: "", endGoal: 0)
    
    var body: some View {
        Text("Create a habit")
    }
}

struct CreateHabitView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHabitView(habit: Habits())
    }
}
