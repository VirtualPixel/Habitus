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
                
                Spacer()
                
                Group {
                    HStack {
                        Group {
                            StatBlock(
                                image: "trophy",
                                title: "Highest Streak",
                                dataText: "\(viewModel.highestStreak) \(viewModel.highestStreak == 1 ? "Day" : "Days")",
                                geo: geo
                            )
                            
                            StatBlock(
                                image: "tick",
                                title: "Habits Completed",
                                dataText: "\(viewModel.habitsCompleted)",
                                geo: geo
                            )
                        }
                        .padding()
                    }
                    
                    HStack {
                        Group {
                            StatBlock(
                                image: "veryHappy",
                                title: "Current Mood",
                                dataText: "Happy",
                                geo: geo
                            )
                            
                            StatBlock(
                                image: "hourglass-1",
                                title: "Average Completion Time",
                                dataText: "\(viewModel.averageTimeToComplete.formatted()) hours",
                                geo: geo
                            )
                        }
                        .padding()
                    }
                }
                
                Spacer()
            }
        }
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

struct StatBlock: View {
    let image: String
    let title: String
    let dataText: String
    let geo: GeometryProxy
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geo.size.width * 0.2)
            Text(title)
                .padding(.vertical, 1)
                .multilineTextAlignment(.center)
                .frame(height: 45)
            Text(dataText)
                .font(.title.bold())
        }
        .frame(width: geo.size.width * 0.4)
    }
}
