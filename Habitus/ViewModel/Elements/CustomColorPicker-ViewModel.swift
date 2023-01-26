//
//  CustomColorPicker.swift
//  Habitus
//
//  Created by Justin Wells on 1/19/23.
//

import SwiftUI

extension CustomColorPicker {
    class ViewModel: ObservableObject {
        @Published var showingMenu = false
        
        let deviceSize = UIScreen.main.bounds.size
        let colors = ConstantContainers().colorNames
    }
}
