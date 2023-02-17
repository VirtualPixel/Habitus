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
        @Published var endDate = Date()
        @Published var percentComplete = 0.0
        
        init() {
            let calendar = Calendar.current
            let currentDate = Date()
            startDate = calendar.date(byAdding: .day, value: -7, to: currentDate)!
        }
    }
}
