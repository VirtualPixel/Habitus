//
//  CreateHabit-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/17/23.
//

import SwiftUI

extension CreateHabit {
    class ViewModel: ObservableObject {
        @Published var isIconPickerSelected = false
        
        // habit attributes
        @Published var selectedIcon: String
        @Published var selectedColor: Color = Color.accentColor
        @Published var name: String = "" {
            didSet {
                if name.count > 20 {
                    name = String(name.prefix(20))
                }
            }
        }
        @Published var description: String = "" {
            didSet {
                if description.count > 120 {
                    description = String(description.prefix(80))
                }
            }
        }
        @Published var unit: Unit = .hours
        @Published var unitAmount = 0.5
        
        init() {
            self.selectedIcon = ConstantContainers().iconNames.randomElement()!
            self.selectedColor = ConstantContainers().colorNames.randomElement()!
        }
        
        func disableButton() -> Bool {
            name.isEmpty
        }
    }
}
