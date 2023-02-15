//
//  HabitListView-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 2/11/23.
//

import SwiftUI

extension HabitListView {
    class ViewModel: ObservableObject {
        let deviceSize: CGRect = UIScreen.main.bounds
        //@Published var habit: HabitExample
        @ObservedObject var habit: Habit
        /*
        init() {
            let habit = HabitExample()
            self.habit = habit
        }*/
        
        init(habit: Habit) {
            self.habit = habit
        }
    }
}

struct HabitExample {
    let wrappedTitle: String = "Walk"
    let wrappedAbout: String = "about"
    let wrappedIcon: String = "walking"
    let wrappedColor: Color = Color.purple
    let wrappedCurrentCompletionValue: Double = 5_000
    let wrappedTargetValue: Double = 10_000
    let wrappedUnitType: String = "Steps"
    let wrappedCurrentStreak: Int = 3
    
    var percentComplete: Double {
        wrappedCurrentCompletionValue / wrappedTargetValue
    }
}
