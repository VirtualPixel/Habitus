//
//  HabitView.swift
//  Habitus
//
//  Created by Justin Wells on 10/17/22.
//

import SwiftUI

struct HabitDetailView: View {
    @ObservedObject var habits: Habits
    var index: Int
    
    var body: some View {
        Text(habits.items[index].title)
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView(habits: Habits(), index: 0)
    }
}
