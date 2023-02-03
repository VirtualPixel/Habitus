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
        @Binding var showingContextButtons: Bool
        @Published var blurAmount: CGFloat
        let days = (0...6).reversed().map { Calendar.current.date(byAdding: .day, value: -$0, to: Date())! }
        let circleSize: CGFloat = UIScreen.main.bounds.width * 0.1005
        let padding: CGFloat = UIScreen.main.bounds.width > 400 ? 0 : -1
        
        func isSelected(index: Int) -> Bool {
            selectedDay.formatted(date: .complete, time: .omitted) == days[index].formatted(date: .complete, time: .omitted)
        }
        
        init(selectedDay: Binding<Date>, showingContextButtons: Binding<Bool>, blurAmount: CGFloat) {
            self._selectedDay = selectedDay
            self._showingContextButtons = showingContextButtons
            self.blurAmount = blurAmount
        }
    }
}
