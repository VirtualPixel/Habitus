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
                        HStack {
                            QuickWeek(viewModel: .init(selectedDay: $viewModel.selectedDay))
                                .blur(radius: viewModel.blurRadius())
                            
                            Button {
                                withAnimation {
                                    viewModel.showContextButtons = true
                                    print("Width: \(geo.size.width) Height: \(geo.size.height)")
                                }
                            } label: {
                                Text("+")
                                    .frame(width: 40, height: 40)
                                    .font(.system(size: 500))
                                    .minimumScaleFactor(0.01)
                                    .font(.title3.bold())
                                    .offset(y: -2)
                                    .opacity(colorScheme == .dark ? 0.8 : 0.6)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                    .background(
                                        Circle()
                                            .strokeBorder(lineWidth: 3)
                                            .foregroundColor(.mainColor)
                                            .opacity(0.3)
                                    )
                            }
                        }
                        
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
                        Spacer()
                    }
                    if viewModel.showContextButtons {
                        RoundedRectangle(cornerRadius: 12)
                            .background(colorScheme == .dark ? .black : .white)
                            .ignoresSafeArea()
                            .opacity(0.01)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.showContextButtons = false
                                }
                            }
                        
                        VStack {
                            Button {
                                withAnimation {
                                    viewModel.showContextButtons = false
                                }
                                viewModel.showingAddNewHabit = true
                            } label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundColor(
                                        Color(UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00))
                                    )
                                    .frame(width: 70, height: 70)
                                    .shadow(radius: 4, y: 4)
                                    .overlay(
                                        Text("New Habit")
                                            .font(.title2.bold())
                                            .foregroundColor(Color(UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.00)))
                                            .multilineTextAlignment(.center)
                                    )
                            }
                            
                            Button {
                                withAnimation {
                                    viewModel.showContextButtons = false
                                }
                                viewModel.showingAddNewHabit = true
                            } label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundColor(
                                        Color(UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00))
                                    )
                                    .frame(width: 70, height: 170)
                                    .shadow(radius: 4, y: 4)
                                    .overlay(
                                        Text("New Habit")
                                            .font(.title2.bold())
                                            .foregroundColor(Color(UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.00)))
                                            .multilineTextAlignment(.center)
                                    )
                            }
                        }
                        .position(x: geo.size.width * 0.86, y: geo.size.height * 0.24)
                        
                    }
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
                    VStack(alignment: .center) {
                        Text("Settings")
                            .font(.title2.bold())
                            .padding(.top)
                        
                        Spacer()
                        
                        
                    }
                    .presentationDetents([.large, .large])
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

