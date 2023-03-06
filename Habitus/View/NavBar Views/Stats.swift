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
            
            Text("Dated Progress Count: \(viewModel.progresses.count)")
                .padding(.top)
            Text("All Progress Count: \(viewModel.allProgresses.count)")
            
            List {
                ForEach(viewModel.progresses, id: \.id) { progress in
                    VStack {
                        Text("Progress: \(progress.habit?.currentCompletionValue.formatted() ?? "") / \(progress.habit?.targetValue.formatted() ?? "") for \(progress.habit?.title ?? "NO NAME")")
                        Text("Date: \(progress.wrappedDate.formatted())")
                    }
                }
            }
            
            List {
                ForEach(viewModel.allProgresses, id: \.id) { progress in
                    VStack {
                        Text("Progress: \(progress.habit?.currentCompletionValue.formatted() ?? "") / \(progress.habit?.targetValue.formatted() ?? "") for \(progress.habit?.title ?? "NO NAME")")
                        Text("Date: \(progress.wrappedDate.formatted())")
                    }
                }
            }
        }
        .padding()
        .onAppear {
            calculateStats()
        }
    }
    
    func calculateStats() {
        let fetchRequest: NSFetchRequest<HabitProgress> = HabitProgress.fetchRequest()
        
        do {
            viewModel.allProgresses = try moc.fetch(fetchRequest)
        } catch {
            print("Error: Nothing found in fetch request: \(error)")
        }
        
        fetchRequest.predicate = NSPredicate(format: "date >= %@ AND date <= %@", viewModel.startDate as NSDate, viewModel.endDate as NSDate)
        //let habitProgresses = try? moc.fetch(fetchRequest)
        
        do {
            viewModel.progresses = try moc.fetch(fetchRequest)
        } catch {
            print("Error: Nothing found in fetch request: \(error)")
        }
        
        //guard let progress = habitProgresses else {
        //    return
        //}
        
        //viewModel.updateStats(habitProgress: progress)
    }
}//
/*
struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
    }
}
*/
