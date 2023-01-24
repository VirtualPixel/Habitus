//
//  IconPicker-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/18/23.
//

import SwiftUI

extension IconPicker {
    class ViewModel: ObservableObject {        
        let deviceSize = UIScreen.main.bounds
        let icons = ConstantContainers().iconNames
        
        func randomIcon() -> String{
            icons.randomElement() ?? "heart"
        }
    }
}
