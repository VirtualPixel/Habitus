//
//  Units.swift
//  Habitus
//
//  Created by Justin Wells on 1/27/23.
//

import Foundation

enum Unit: String, Equatable, CaseIterable {
    case steps, minutes, hours, calories, reps, sets, weight, ounces, glasses, miles, kilometers, pages, chapters
    
    var incrementalValues: [Double] {
        switch self {
        case .steps:
            return generateValues(start: 500, increment: 500, total: 15000)
        case .minutes:
            return generateValues(start: 1, increment: 1, total: 60)
        case .hours:
            return generateValues(start: 1, increment: 0.5, total: 24)
        case .calories:
            return generateValues(start: 100, increment: 100, total: 5000)
        case .reps:
            return generateValues(start: 1, increment: 1, total: 100)
        case .sets:
            return generateValues(start: 1, increment: 1, total: 20)
        case .weight:
            return generateValues(start: 1, increment: 1, total: 300)
        case .ounces:
            return generateValues(start: 4, increment: 4, total: 128)
        case .glasses:
            return generateValues(start: 1, increment: 1, total: 12)
        case .miles:
            return generateValues(start: 0.5, increment: 0.5, total: 26)
        case .kilometers:
            return generateValues(start: 1, increment: 1, total: 42)
        case .pages:
            return generateValues(start: 1, increment: 50, total: 5000)
        case .chapters:
            return generateValues(start: 1, increment: 1, total: 20)
        }

    }

    var displayName: String {
        switch self {
        case .steps:
            return "Steps"
        case .ounces:
            return "Ounces"
        case .minutes:
            return "Minutes"
        case .hours:
            return "Hours"
        case .miles:
            return "Miles"
        case .kilometers:
            return "Kilometers"
        case .reps:
            return "Reps"
        case .sets:
            return "Sets"
        case .weight:
            return "Weight"
        case .calories:
            return "Calories"
        case .glasses:
            return "Glasses"
        case .pages:
            return "Pages"
        case .chapters:
            return "Chapters"
        }
    }
    
    private func generateValues(start: Double, increment: Double, total: Double) -> [Double] {
        var values = (0..<Int(total/increment)).map { start + increment*Double($0) }
        
        let remainder = total.truncatingRemainder(dividingBy: increment)
        if remainder != 0 {
            values.append(values.last ?? 0.0 + remainder)
        }
        return values
    }
}
