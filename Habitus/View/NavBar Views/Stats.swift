//
//  Stats.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import CoreData
import SwiftUI

struct Stats: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var habitsProgress: FetchedResults<HabitProgress>
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("Percent complete: \(viewModel.percentComplete.formatted())%")
            Text("Highest Streak: \(viewModel.highestStreak)")
            Text("Average time to complete: \(viewModel.averageTimeToComplete.formatted()) hours")
            Text("Habits Completed Today: \(viewModel.habitsCompleted)")
        }
        .padding()
        .onAppear {
            calculateStats()
        }
    }
    
    func calculateStats() {
        let fetchRequest: NSFetchRequest<HabitProgress> = HabitProgress.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date >= %@ AND date <= %@", viewModel.startDate as NSDate, viewModel.endDate as NSDate)
        let habitProgresses = try? moc.fetch(fetchRequest)
        
        guard let progress = habitProgresses else {
            return
        }
        
        viewModel.updateStats(habitProgress: progress)
    }
}//
/*
struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
    }
}
*/
