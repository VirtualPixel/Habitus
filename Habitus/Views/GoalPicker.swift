//
//  GoalPicker.swift
//  Habitus
//
//  Created by Justin Wells on 11/7/22.
//

import SwiftUI

struct GoalPicker: View {
    @Binding var frequency: FrequencySelection
    let color: Color
    
    var body: some View {
        
        VStack {
            Picker("Frequency", selection: $frequency) {
                ForEach(FrequencySelection.allCases) { option in
                    Text(option.rawValue)
                        .font(.headline.weight(.bold))
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .colorMultiply(color)
        }
    }
}

struct GoalPicker_Previews: PreviewProvider {
    static var previews: some View {
        GoalPicker(frequency: .constant(.daily), color: .babyBlue)
    }
}
