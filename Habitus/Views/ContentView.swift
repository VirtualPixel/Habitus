//
//  ContentView.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    @StateObject private var viewModel = ViewModel(habits: Habits())
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Today")
                    .font(.system(size: 35).bold())
                
                ZStack {
                    ScrollView {
                        HabitListView(habits: habits.items, habit: habits, deleteItems: viewModel.removeHabits)
                    }
                    .navigationTitle("")
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                                                        
                            NavigationLink {
                                AddView(habits: habits)
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(Color(red: 0.88, green: 0.40, blue: 0.49))
                                    .font(.system(size: 35))
                                    .padding(50)
                                    .frame(width: 50, height: 50)
                                    .background(.white)
                                    .cornerRadius(38.5)
                                    .padding()
                                    .shadow(color: Color.black.opacity(1),
                                            radius: 1,
                                            x: 0,
                                            y: 0)
                            }
                            
                        }
                    }
                }
                .toolbar {
                    Button {
                        //How to pop up
                        print("How to prompt!")
                    } label: {
                        Text("?")
                            .foregroundColor(Color(red: 0.88, green: 0.40, blue: 0.49))
                            .font(.system(size: 35).bold())
                            .padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
