//
//  CreateHabit-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/17/23.
//

import SwiftUI

extension CreateHabit {
    class ViewModel: ObservableObject {
        @Published var showImagePicker = false
        @Published var showColorPicker = false
        @Published var selectedColor: Color = Color.accentColor
        @Published var selectedIcon: String
        
        init() {
            self.selectedIcon = ConstantContainers().iconNames.randomElement() ?? "heart"
            self.selectedColor = ConstantContainers().colorNames.randomElement() ?? .purple
        }
    }
}
