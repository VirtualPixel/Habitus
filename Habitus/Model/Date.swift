//
//  Date.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import Foundation

extension Date {
    var weekdayNarrow: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        return String(formatter.string(from: self).prefix(1))
    }
}
