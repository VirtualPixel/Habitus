//
//  Home.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import SwiftUI

struct Home: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var habits: FetchedResults<Habit>
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    QuickWeek(viewModel: .init(selectedDay: $viewModel.selectedDay, showingContextButtons: $viewModel.showingContextButtons, blurAmount: viewModel.blurRadius()))
                    
                    Spacer()
                    
                    if habits.isEmpty {
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
                        .transition(AnyTransition.scale)
                    } else {
                        VStack {
                            List {
                                ForEach(habits, id:\.id) { habit in
                                    HStack {
                                        Image(habit.wrappedIcon)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .blending(color: habit.wrappedColor)
                                            .frame(width: 60, height: 60)
                                            .padding(.horizontal, 5)
                                        Text(habit.wrappedTitle)
                                        Spacer()
                                        VStack {
                                            Text("\(habit.currentValue) /")
                                            Text("\(habit.targetValue.formatted())")
                                            Text("\(habit.wrappedUnitType)")
                                        }
                                    }
                                    .padding()
                                    .onTapGesture {
                                        print(habit.)
                                    }
                                }
                                .onDelete { indexSet in
                                    let deletedHabit = self.habits[indexSet.first!]
                                    self.moc.delete(deletedHabit)
                                    
                                    do {
                                        try self.moc.save()
                                    } catch {
                                        print("Error saving context: \(error)")
                                    }
                                }
                            }
                            
                        }
                        .background(.white)
                        
                    }
                    Spacer()
                }
                .zIndex(-1)
                
                
                ContextMenu(viewModel: .init(showingMenu: $viewModel.showingContextButtons, showingHabitList: $viewModel.showingHabitList, colorSchemeIsDark: colorScheme == .dark))
                    .zIndex(500)
            }
            .sheet(isPresented: $viewModel.showingSort) {
                VStack(alignment: .center) {
                    Text("Habits Order")
                        .font(.title2.bold())
                        .padding(.top)
                    
                    Spacer()
                    
                    Picker("Sort habits", selection: $viewModel.selectedSort) {
                        ForEach(SortTypes.allCases) { sort in
                            HStack {
                                Spacer()
                                Spacer()
                                Text(sort.rawValue.capitalized)
                                Spacer()
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.accentColor)
                                    .padding(.horizontal)
                                    .opacity(viewModel.selectedSort == sort ? 1.0 : 0.0)
                                
                            }
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
                    }
                    .blur(radius: viewModel.blurRadius())
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingSettings = true
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    .blur(radius: viewModel.blurRadius())
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
