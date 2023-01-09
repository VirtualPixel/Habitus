//
//  HabitDetailView-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/9/23.
//

import SwiftUI

extension HabitDetailView {
    class ViewModel: ObservableObject {
        @Published var progressBarValue: CGFloat = 0
        @Published var rotateDegree: CGFloat = 0
        
        func animateProgressBar(progressBar: CGFloat) {
            withAnimation(.easeInOut(duration: 1.5)) {
                progressBarValue = progressBar
            }
        }
        
        func editAction() {
            // edit current selected Habit
        }
        
        func deleteHabit() {
            // delete current selected Habit
        }
    }
}
