//
//  CreateHabit-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/17/23.
//

import SwiftUI

extension CreateHabit {
    class ViewModel: ObservableObject {
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
        
        init() {
            self.selectedIcon = ConstantContainers().iconNames.randomElement() ?? "heart"
            self.selectedColor = ConstantContainers().colorNames.randomElement() ?? .purple
        }
        
        func disableButton() -> Bool {
            name.isEmpty
        }
    }
}
