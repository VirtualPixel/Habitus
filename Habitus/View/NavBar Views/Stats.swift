//
//  Stats.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import SwiftUI

struct Stats: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var habitsProgress: FetchedResults<HabitProgress>
    
    var body: some View {
        List {
            ForEach(habitsProgress, id: \.id) { habit in
                Text("\(habit.wrappedAmount)")
            }
        }
    }
}

struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
    }
}
