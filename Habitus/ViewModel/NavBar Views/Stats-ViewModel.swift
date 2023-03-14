//
//  Stats-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import SwiftUI

extension Stats {
    @MainActor class ViewModel: ObservableObject {
        @Published var startDate: Date
        @Published var endDate: Date
        @Published var percentComplete = 0.0
        @Published var highestStreak = 0
        @Published var averageTimeToComplete = 0.0
        @Published var habitsCompleted = ""
        @Published var progresses: [HabitProgress] = []
        @Published var allProgresses: [HabitProgress] = []
        
        init() {
            let calendar = Calendar.current
            let currentDate = Date()
            
            startDate = calendar.date(byAdding: .day, value: -6, to: currentDate)!
            endDate = calendar.date(byAdding: .day, value: 0, to: currentDate)!
        }
        
        func displayDateRange() -> some View {
            HStack {
                VStack {
                    displayDate(date: startDate)
                        .font(.subheadline)
                    displayDate(date: endDate)
                        .font(.title3.bold())
                }
                Spacer()
            }
        }
        
        func updateStats(habitProgress: [HabitProgress]) {
            updateAverageCompletionRange(habitProgress: habitProgress)
            updateHighestStreak(habitProgress: habitProgress)
            updateAverageTimeToComplete(habitProgress: habitProgress)
            updateHabitsCompleted(habitProgress: habitProgress)
        }
        
        private func displayDate(date: Date) -> some View {
            Text("\(date.formatted(.dateTime.day().month(.wide))), \(date.formatted(.dateTime.weekday(.wide)))")
        }
        
        private func updateAverageCompletionRange(habitProgress: [HabitProgress]) {
            let totalProgress = habitProgress.reduce(0.0, { $0 + $1.amount })
            let totalTarget = habitProgress.reduce(0.0, { $0 + $1.habit!.targetValue })
            
            if totalTarget == 0 {
                return
            }
            
            percentComplete = floor(totalProgress / totalTarget * 100)
        }
        
        private func updateHighestStreak(habitProgress: [HabitProgress]) {
            highestStreak = habitProgress.map({ Int($0.habit?.bestCompletionStreak ?? 0) }).max() ?? 0
        }
        
        private func updateAverageTimeToComplete(habitProgress: [HabitProgress]) {
            let completedHabitProgress = habitProgress.filter { $0.completed }
            
            guard !completedHabitProgress.isEmpty else { return }
            
            var totalCompletionTime = 0.0
            var completedHabitCount = 0
            
            let calendar = Calendar.current
            
            for habitProgress in completedHabitProgress {
                guard let habit = habitProgress.habit,
                      let timeCompleted = habit.timeCompleted,
                      let completionDate = habitProgress.date else { continue }
                
                let completionDateStartOfDay = calendar.startOfDay(for: completionDate)
                let timeComponents = calendar.dateComponents([.hour, .minute], from: timeCompleted)
                
                if let completionTime = calendar.date(byAdding: timeComponents, to: completionDateStartOfDay),
                   completionTime >= completionDate {
                    
                    let timeDifference = completionTime.timeIntervalSince(completionDateStartOfDay)
                    totalCompletionTime += timeDifference
                    completedHabitCount += 1
                }
            }
            
            guard completedHabitCount > 0 else { return }
            
            averageTimeToComplete = floor(totalCompletionTime / Double(completedHabitCount) / 3600)
        }
        
        private func updateHabitsCompleted(habitProgress: [HabitProgress]) {
            let completedCount = (habitProgress.filter { $0.completed }).count
            let habitCount = habitProgress.count
            
            habitsCompleted = "\(completedCount)/\(habitCount)"
        }
    }
}
