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
        @Binding var selectedColor: Color
        
        let deviceSize = UIScreen.main.bounds.size
        let colors = ConstantContainers().colorNames
        
        init(selectedColor: Binding<Color>) {
            self._selectedColor = selectedColor
        }
    }
}
