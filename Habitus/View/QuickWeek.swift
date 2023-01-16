//
//  QuickWeek.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import SwiftUI

struct QuickWeek: View {
    @ObservedObject private var viewModel: ViewModel
    
    var body: some View {
        VStack {
            ForEach(0..<7) { index in
                Button(action: {
                    self.viewModel.selectedDay = self.viewModel.days[index]
                }) {
                    Text("\(self.viewModel.days[index].weekdayNarrow)")
                }
                .tag(self.viewModel.days[index])
            }
        }
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}

struct QuickWeek_Previews: PreviewProvider {
    static var previews: some View {
            let viewModel = QuickWeek.ViewModel(selectedDay: .constant(Date()))
            return QuickWeek(viewModel: viewModel)
        }
}
