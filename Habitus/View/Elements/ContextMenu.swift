//
//  ContextMenu.swift
//  Habitus
//
//  Created by Justin Wells on 1/17/23.
//

import SwiftUI

struct ContextMenu: View {
    @ObservedObject private var viewModel: ViewModel
    private var buttonColor: Color
    private var buttonText: Color
    private var position: CGPoint
    
    var body: some View {
        if viewModel.showingMenu {
            RoundedRectangle(cornerRadius: 12)
                .background(viewModel.colorSchemeIsDark ? .black : .white)
                .ignoresSafeArea()
                .opacity(0.01)
                .onTapGesture {
                    withAnimation {
                        viewModel.showingMenu = false
                    }
                }
            
            VStack {
                MenuButton(label: "New Habit", buttonColor: buttonColor, buttonText: buttonText, width: 70, height: 70, action: {
                   withAnimation {
                       viewModel.showingMenu = false
                   }
                })
                
                MenuButton(label: "Select Mood", buttonColor: buttonColor, buttonText: buttonText, width: 70, height: 170, action: {
                    withAnimation {
                        viewModel.showingMenu = false
                    }
                })
            }
            .position(position)
        }
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.buttonColor = viewModel.colorSchemeIsDark ? Color.darkModeButton : Color.lightModeButton
        self.buttonText = viewModel.colorSchemeIsDark ? .white : Color.lightModeSubtext
        self.position = CGPoint(x: viewModel.screenWidth * 0.86, y: viewModel.screenHeight * 0.24)
    }
}

struct MenuButton: View {
    var label: String
    let buttonColor: Color
    let buttonText: Color
    let width: CGFloat
    let height: CGFloat
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(buttonColor)
                .frame(width: width, height: height)
                .shadow(radius: 4, y: 4)
                .overlay(
                    Text(label)
                        .font(.title2.bold())
                        .foregroundColor(buttonText)
                        .multilineTextAlignment(.center)
                )
        }
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu(viewModel: .init(showingMenu: .constant(true), showingHabitList: .constant(false), screehWidth: 420, screenHeight: 720, colorSchemeIsDark: false))
    }
}
