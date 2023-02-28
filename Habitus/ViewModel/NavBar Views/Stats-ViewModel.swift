//
//  Stats-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import Foundation

extension Stats {
    @MainActor class ViewModel: ObservableObject {
        @Published var startDate: Date
        @Published var endDate: Date
        @Published var percentComplete = 0.0
        
        init() {
            let calendar = Calendar.current
            let currentDate = Date()
            
            startDate = calendar.date(byAdding: .day, value: -8, to: currentDate)!
            endDate = calendar.date(byAdding: .day, value: -1, to: currentDate)!
        }
        
        func calculateStats(habitProgress: [HabitProgress]) {
            calculateAverageCompletionRange(habitProgress: habitProgress)
        }
        
        private func calculateAverageCompletionRange(habitProgress: [HabitProgress]) {
            let totalProgress = habitProgress.reduce(0.0, { $0 + $1.amount })
            let totalTarget = habitProgress.reduce(0.0, { $0 + $1.habit!.targetValue })
            
            if totalTarget == 0 {
                return
            }
            
            percentComplete = totalProgress / totalTarget * 100
        }
    }
}
