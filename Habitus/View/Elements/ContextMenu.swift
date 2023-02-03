//
//  ContextMenu.swift
//  Habitus
//
//  Created by Justin Wells on 1/17/23.
//

import SwiftUI

struct ContextMenu: View {
    @ObservedObject private var viewModel: ViewModel
    
    var body: some View {
        if viewModel.showingMenu {
            ZStack {
                backgroundView
                
                VStack {
                    Button {
                        viewModel.closeMenu()
                        viewModel.showList()
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(viewModel.buttonColor)
                            .frame(width: 80, height: 80)
                            .shadow(radius: 4, y: 4)
                            .overlay(
                                Text("New Habit")
                                    .font(.title2.bold())
                                    .foregroundColor(viewModel.buttonText)
                                    .multilineTextAlignment(.center)
                            )
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .shadow(radius: 4, y: 4)
                            .foregroundColor(viewModel.buttonColor)
                        
                        VStack {
                            Button {
                                viewModel.closeMenu()
                            } label: {
                                Image("veryHappy")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            Button {
                                viewModel.closeMenu()
                            } label: {
                                Image("happyEmoji")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            Button {
                                viewModel.closeMenu()
                            } label: {
                                Image("meh")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            Button {
                                viewModel.closeMenu()
                            } label: {
                                Image("unhappy")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            Button {
                                viewModel.closeMenu()
                            } label: {
                                Image("veryUnhappy")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        .padding([.top, .bottom], 5)
                    }
                    .frame(width: 80, height: 300)
                }
                .position(viewModel.position)
            }
        }
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    private var backgroundView: some View {
        Color.black.opacity(0.001)
            .ignoresSafeArea()
            .onTapGesture {
                viewModel.closeMenu()
            }
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu(viewModel: .init(showingMenu: .constant(true), showingHabitList: .constant(false), colorSchemeIsDark: false))
    }
}
