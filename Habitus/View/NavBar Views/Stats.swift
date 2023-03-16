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
    @Environment(\.colorScheme) var colorScheme
    @FetchRequest(sortDescriptors: []) var habitsProgress: FetchedResults<HabitProgress>
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                viewModel.displayDateRange()
                
                Spacer()
                
                CircularProgressBar(progress: viewModel.percentComplete)
                    .frame(width: 200, height: 200)
                
                HStack {
                    VStack {
                        Image("trophy")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("Highest Streak")
                        Text("\(viewModel.highestStreak) \(viewModel.highestStreak == 1 ? "day" : "days")")
                            .font(.title.bold())
                    }
                    .frame(width: geo.size.width * 0.3)
                    
                    VStack {
                        
                    }
                }
                
                HStack {
                    
                }
                
                Spacer()
            } }
        .padding()
        .onAppear {
            //calculateStats()
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
        let habitProgresses = try? moc.fetch(fetchRequest)
        
        do {
            viewModel.progresses = try moc.fetch(fetchRequest)
        } catch {
            print("Error: Nothing found in fetch request: \(error)")
        }
        
        guard let progress = habitProgresses else {
            return
        }
        
        viewModel.updateStats(habitProgress: progress)
    }
}

struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
    }
}

