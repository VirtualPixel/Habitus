//
//  ContextMenu-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/17/23.
//

import SwiftUI

extension ContextMenu {
    class ViewModel: ObservableObject {
        @Binding var showingMenu: Bool
        @Binding var showingHabitList: Bool
        let colorSchemeIsDark: Bool
        let screenWidth: CGFloat
        let screenHeight: CGFloat
        
        init(showingMenu: Binding<Bool>, showingHabitList: Binding<Bool>, screehWidth: CGFloat, screenHeight: CGFloat, colorSchemeIsDark: Bool) {
            self._showingMenu = showingMenu
            self._showingHabitList = showingHabitList
            
            self.screenWidth = screehWidth
            self.screenHeight = screenHeight
            self.colorSchemeIsDark = colorSchemeIsDark
        }
    }
}
