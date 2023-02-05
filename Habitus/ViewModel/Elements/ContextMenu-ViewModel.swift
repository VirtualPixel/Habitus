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
        let deviceSize = UIScreen.main.bounds
        let position: CGPoint
        let buttonColor: Color
        let buttonText: Color
        
        init(showingMenu: Binding<Bool>, showingHabitList: Binding<Bool>, colorSchemeIsDark: Bool) {
            self._showingMenu = showingMenu
            self._showingHabitList = showingHabitList
            
            self.colorSchemeIsDark = colorSchemeIsDark
            
            self.buttonColor = colorSchemeIsDark ? Color.darkModeButton : Color.lightModeButton
            self.buttonText = colorSchemeIsDark ? .white : Color.lightModeSubtext
            
            self.position = CGPoint(x: deviceSize.width * 0.86, y: 250)
        }
        
        func closeMenu() {
            withAnimation(.easeInOut(duration: 0.3)) {
                showingMenu = false
            }
        }
        
        func showList() {
            withAnimation(.easeInOut) {
                showingHabitList = true
            }
        }
    }
}
