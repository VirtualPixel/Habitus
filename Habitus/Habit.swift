//
//  Habit.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import Foundation

struct Habit: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    var description: String = ""
    var viewable: Bool = false
}
