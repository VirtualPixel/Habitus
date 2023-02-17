//
//  Units.swift
//  Habitus
//
//  Created by Justin Wells on 1/27/23.
//

import Foundation

enum Unit: String, Equatable, CaseIterable {
    case steps, minutes, hours, calories, reps, sets, weight, ounces, glasses, miles, kilometers, pages, chapters
    
    var incrementalValue: Double {
        switch self {
        case .steps:
            return 500
        case .minutes:
            return 1
        case .hours:
            return 0.5
        case .calories:
            return 100
        case .reps:
            return 1
        case .sets:
            return 1
        case .weight:
            return 1
        case .ounces:
            return 4
        case .glasses:
            return 1
        case .miles:
            return 0.5
        case .kilometers:
            return 1
        case .pages:
            return 50
        case .chapters:
            return 1
        }
    }
    
    var incrementalValues: [Double] {
        var values: [Double] = []
        var currentValue = 0.0
        while currentValue < total {
            values.append(currentValue)
            currentValue += incrementalValue
        }
        return values
    }
    
    var total: Double {
        switch self {
        case .steps:
            return 15000
        case .minutes:
            return 60
        case .hours:
            return 24
        case .calories:
            return 5000
        case .reps:
            return 100
        case .sets:
            return 20
        case .weight:
            return 300
        case .ounces:
            return 128
        case .glasses:
            return 12
        case .miles:
            return 26
        case .kilometers:
            return 42
        case .pages:
            return 5000
        case .chapters:
            return 20
        }
    }
    
    var displayName: String {
        switch self {
        case .steps:
            return "Steps"
        case . ounces:
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
    
    static func from(string: String) -> Unit {
        Unit.allCases.first { $0.displayName == string } ?? .steps
    }
    
    static func lowerBound(string: String) -> Double {
        let unit = from(string: string)
        return unit.incrementalValue
    }
    
    static func upperBound(string: String) -> Double {
        let unit = from(string: string)
        return unit.incrementalValue * 2
    }
}
