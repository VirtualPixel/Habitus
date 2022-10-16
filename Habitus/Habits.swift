//
//  Habits.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import Foundation

class Habits: ObservableObject {
    @Published var items = [Habit]()
    
    let defaultItems: [Habit] = [
        Habit(title: "Walking", viewable: true),
        Habit(title: "Running"),
        Habit(title: "Learning a language"),
        Habit(title: "Practicing an instrumnet"),
        Habit(title: "Exercising")
    ]
    
    var viewedHabits: [Habit] {
        items.filter { $0.viewable == true }
    }
    
    var nonViewedHabits: [Habit] {
        items.filter { $0.viewable == false }
    }
    
    init() {
        items.append(contentsOf: defaultItems)
    }
}
