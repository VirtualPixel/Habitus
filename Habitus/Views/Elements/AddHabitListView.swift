//
//  AddHabitListView.swift
//  Habitus
//
//  Created by Justin Wells on 10/19/22.
//

import SwiftUI

struct AddHabitListView: View {
    let habit: Habit
    let contains: Bool
    @ObservedObject var habits: Habits
    
    var body: some View {
        HStack {
            Text(habit.icon)
                .font(.system(size: 500))
                .minimumScaleFactor(0.01)
            
            Text(habit.title)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: contains ? "checkmark" : "chevron.right")
                .foregroundColor(contains ? .green : .gray)
        }
        .frame(width: .infinity, height: 40)
    }
}

struct AddHabitListView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitListView(habit: Habit(icon: "🚶", title: "Walking", color: .pastelTurquoise, endGoal: 10000), contains: false, habits: Habits())
    }
}
