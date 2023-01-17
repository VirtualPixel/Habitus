//
//  Home-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import SwiftUI

extension Home {
    @MainActor class ViewModel: ObservableObject {
        @Published var selectedDay = Date()
        @Published var selectedSort: SortTypes = .suggested
        @Published var showingSort = false
        @Published var showingSettings = false
        @Published var showingAddMood = false
        @Published var showingHabitList = false
        @Published var showingCreateHabit = false
        @Published var showingContextButtons = false
        
        func blurRadius() -> CGFloat {
            showingContextButtons ? 5 : 0
        }
        
        @ViewBuilder func showContextButtons(x: Double, y: Double, colorSchemeDark: Bool) -> some View {
            if showingContextButtons {
                RoundedRectangle(cornerRadius: 12)
                    .background(colorSchemeDark == true ? .black : .white)
                    .ignoresSafeArea()
                    .opacity(0.01)
                    .onTapGesture {
                        withAnimation {
                            self.showingContextButtons = false
                        }
                    }
                
                VStack {
                    Button {
                        withAnimation {
                            self.showingContextButtons = false
                        }
                        self.showingHabitList = true
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(
                                colorSchemeDark == true ? Color.darkModeButton : Color.lightModeButton
                            )
                            .frame(width: 70, height: 70)
                            .shadow(radius: 4, y: 4)
                            .overlay(
                                Text("New Habit")
                                    .font(.title2.bold())
                                    .foregroundColor(colorSchemeDark == true ? .white : Color.lightModeSubtext)
                                    .multilineTextAlignment(.center)
                            )
                    }
                    
                    Button {
                        withAnimation {
                            self.showingContextButtons = false
                        }
                        self.showingHabitList = true
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(
                                colorSchemeDark == true ? Color.darkModeButton : Color.lightModeButton
                            )
                            .frame(width: 70, height: 170)
                            .shadow(radius: 4, y: 4)
                            .overlay(
                                Text("New Habit")
                                    .font(.title2.bold())
                                    .foregroundColor(colorSchemeDark == true ? .white : Color.lightModeSubtext)
                                    .multilineTextAlignment(.center)
                            )
                    }
                }
                .position(x: x * 0.86, y: y * 0.24)
            }
        }
    }
}

enum SortTypes: String, CaseIterable, Identifiable {
    case suggested = "Suggested"
    case reminderTime = "Reminder Time"
    case alphabeticalAscend = "Alphabetical"
    
    var id: SortTypes { self }
}
