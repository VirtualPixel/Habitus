//
//  HabitView.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import SwiftUI

struct HabitView: View {
    let title: String
    let habits: [Habit]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section {
            ForEach(habits) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        Text(item.description)
                    }
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(title: "Example", habits: []) { _ in }
    }
}
