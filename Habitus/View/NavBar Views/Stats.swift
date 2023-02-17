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
            Text("Percent complete: \(viewModel.percentComplete)")
        }
        .padding()
        .onAppear {
            viewModel.percentComplete = calculateAverageCompletionPercentage(startDate: viewModel.startDate, endDate: viewModel.endDate)
        }
    }
    
    func calculateAverageCompletionPercentage(startDate: Date, endDate: Date) -> Double {
        let fetchRequest: NSFetchRequest<HabitProgress> = HabitProgress.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date >= %@ AND date <= %@", startDate as NSDate, endDate as NSDate)
        let habitProgresses = try? moc.fetch(fetchRequest)
        
        guard let progresses = habitProgresses else {
            return 0.0
        }
        
        let totalProgress = progresses.reduce(0.0, { $0 + $1.amount })
        let totalTarget = progresses.reduce(0.0, { $0 + $1.habit!.targetValue })
        
        if totalTarget == 0 {
            return 0.0
        }
        
        return totalProgress / totalTarget * 100
    }
}
/*
struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
    }
}
*/
