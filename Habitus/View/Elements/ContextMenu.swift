//
//  ContextMenu.swift
//  Habitus
//
//  Created by Justin Wells on 1/17/23.
//

import SwiftUI

struct ContextMenu: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var viewModel: ViewModel
    
    var body: some View {
        if viewModel.showingMenu {
            RoundedRectangle(cornerRadius: 12)
                .background(colorScheme == .dark ? .black : .white)
                .ignoresSafeArea()
                .opacity(0.01)
                .onTapGesture {
                    withAnimation {
                        viewModel.showingMenu = false
                    }
                }
            
            VStack {
                Button {
                    withAnimation {
                        viewModel.showingMenu = false
                    }
                    viewModel.showingHabitList = true
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(
                            colorScheme == .dark ? Color.darkModeButton : Color.lightModeButton
                        )
                        .frame(width: 70, height: 70)
                        .shadow(radius: 4, y: 4)
                        .overlay(
                            Text("New Habit")
                                .font(.title2.bold())
                                .foregroundColor(colorScheme == .dark ? .white : Color.lightModeSubtext)
                                .multilineTextAlignment(.center)
                        )
                }
                
                Button {
                    withAnimation {
                        viewModel.showingMenu = false
                    }
                    viewModel.showingHabitList = true
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(
                            colorScheme == .dark ? Color.darkModeButton : Color.lightModeButton
                        )
                        .frame(width: 70, height: 170)
                        .shadow(radius: 4, y: 4)
                        .overlay(
                            Text("New Habit")
                                .font(.title2.bold())
                                .foregroundColor(colorScheme == .dark ? .white : Color.lightModeSubtext)
                                .multilineTextAlignment(.center)
                        )
                }
            }
            .position(x: viewModel.screenWidth * 0.86, y: viewModel.screenHeight * 0.24)
        }
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu(viewModel: .init(showingMenu: .constant(true), showingHabitList: .constant(false), screehWidth: 420, screenHeight: 720))
    }
}
