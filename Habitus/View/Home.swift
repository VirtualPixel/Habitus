//
//  Home.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import SwiftUI

struct Home: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ZStack {
                    VStack {
                        QuickWeek(viewModel: .init(selectedDay: $viewModel.selectedDay, showingContextButtons: $viewModel.showingContextButtons, blurAmount: viewModel.blurRadius()))
                        
                        Spacer()
                        
                        VStack {
                            Image(decorative: colorScheme == .dark ? "darkClipboards" : "empty")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .opacity(0.7)
                            Text("Your habit journey begins here! Add your first one by clicking the plus button.")
                                .multilineTextAlignment(.center)
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.lightModeSubtext)
                                .opacity(0.5)
                        }
                        .blur(radius: viewModel.blurRadius())
                        .frame(width: 300)
                        
                        Spacer()
                    }
                    
                    ContextMenu(viewModel: .init(showingMenu: $viewModel.showingContextButtons, showingHabitList: $viewModel.showingHabitList, screehWidth: geo.size.width, screenHeight: geo.size.height))
                }
                .sheet(isPresented: $viewModel.showingSort) {
                    VStack(alignment: .center) {
                        Text("Habits Order")
                            .font(.title2.bold())
                            .padding(.top)
                        
                        Spacer()
                        
                        Picker("Sort habits", selection: $viewModel.selectedSort) {
                            ForEach(SortTypes.allCases) { sort in
                                Text(sort.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    .presentationDetents([.fraction(0.25), .medium])
                }
                .sheet(isPresented: $viewModel.showingSettings) {
                    Settings()
                    .presentationDetents([.large, .large])
                }
                .sheet(isPresented: $viewModel.showingHabitList) {
                    HabitList(showingView: $viewModel.showingCreateHabit)
                        .sheet(isPresented: $viewModel.showingCreateHabit) {
                            CreateHabit()
                        }
                }
                .toolbar() {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            viewModel.showingSort = true
                        } label: {
                            Image(systemName: "arrow.up.arrow.down")
                                .foregroundColor(Color(UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)))
                        }
                        .blur(radius: viewModel.blurRadius())
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.showingSettings = true
                        } label: {
                            Image(systemName: "gearshape")
                                .foregroundColor(Color(UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)))
                        }
                        .blur(radius: viewModel.blurRadius())
                    }
                }
            }
        }
    }
    
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct HabitList: View {
    @Binding var showingView: Bool
    var body: some View {
        VStack {
            ScrollView {
                
            }
            Spacer()
            Button {
                showingView = true
            } label: {
                Text("Create your own")
                    .pinkButton()
            }
            .padding(.bottom, 30)
        }
    }
}
