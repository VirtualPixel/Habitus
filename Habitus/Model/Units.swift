//
//  Units.swift
//  Habitus
//
//  Created by Justin Wells on 1/27/23.
//

import Foundation

enum Unit: String {
    case ounces = "ounce"
    case steps = "step"
    case minutes = "minute"
    case hours = "hour"
    case miles = "mile"
    case kilometers = "kilometer"
    case reps = "rep"
    case sets = "set"
    case weight = "weight"
    case calories = "calorie"
    case glasses = "glass"
    case pages = "page"
    
    var incrementValues: [Double] {
        switch self {
        case .steps:
            return generateValues(start: 500, increment: 500, total: 40)
        case .ounces:
            return generateValues(start: 4, increment: 4, total: 32)
        case .minutes:
            return generateValues(start: 1, increment: 1, total: 60)
        case .hours:
            return generateValues(start: 1, increment: 1, total: 0.5)
        case .miles:
            return generateValues(start: 0.5, increment: 0.5, total: 52)
        case .kilometers:
            return generateValues(start: 1, increment: 1, total: 20)
        case .reps:
            return generateValues(start: 1, increment: 1, total: 100)
        case .sets:
            return generateValues(start: 1, increment: 1, total: 10)
        case .weight:
            return generateValues(start: 1, increment: 1, total: 300)
        case .calories:
            return generateValues(start: 100, increment: 100, total: 5000)
        case .glasses:
            return generateValues(start: 1, increment: 1, total: 8)
        case .pages:
            return generateValues(start: 1, increment: 1, total: 300)
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
        }
    }
    
    private func generateValues(start: Double, increment: Double, total: Double) -> [Double] {
        var values = (0..<Int(total/increment)).map { start + increment*Double($0) }
        let remainder = total.truncatingRemainder(dividingBy: increment)
        if remainder != 0 {
            values.append(values.last! + remainder)
        }
        return values
    }
}
