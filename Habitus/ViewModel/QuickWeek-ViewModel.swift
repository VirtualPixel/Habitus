//
//  QuickWeek.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import SwiftUI

extension QuickWeek {
    class ViewModel: ObservableObject {
        @Binding var selectedDay: Date
        let days = (0...6).reversed().map { Calendar.current.date(byAdding: .day, value: -$0, to: Date())! }
        
        func isSelected(index: Int) -> Bool {
            selectedDay.formatted(date: .complete, time: .omitted) == days[index].formatted(date: .complete, time: .omitted)
        }
        
        init(selectedDay: Binding<Date>) {
            self._selectedDay = selectedDay
        }
    }
}
