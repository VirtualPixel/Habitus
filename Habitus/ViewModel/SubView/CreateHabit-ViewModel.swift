//
//  CreateHabit-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/17/23.
//

import CoreData
import SwiftUI

extension CreateHabit {
    class ViewModel: ObservableObject {
        @Published var isIconPickerSelected = false
        
        // habit attributes
        @Published var selectedIcon: String
        @Published var selectedColor: Color
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
        @Published var unitAmount = 1.0
        @Published var hasNotifications = false
        @Published var notificationTime: Date
        @Published var unit: Unit = .steps
        
        init() {
            self.selectedIcon = ConstantContainers().iconNames.randomElement()!
            self.selectedColor = ConstantContainers().colorNames.randomElement()!
            self.notificationTime = UserDefaults().wakeUpTime.addingTimeInterval(60 * 60)
        }
        
        func disableButton() -> Bool {
            name.isEmpty
        }
        
        
    }
}
