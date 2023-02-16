//
//  ContentView.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject private var viewModel = ViewModel()
    @EnvironmentObject var habitManager: HabitManager
    
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("", systemImage: "house.fill")
                }
                .tag(0)
            Stats()
                .tabItem {
                    Label("", systemImage: "gauge.high")
                }
                .tag(1)
            Profile()
                .tabItem {
                    Label("", systemImage: "person.fill")
                }
                .tag(2)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            do {
                let habitsList = try moc.fetch(viewModel.fetchRequest)
                habitManager.loadNewDay(habits: habitsList)
                
                try moc.save()
            } catch {
                print("There was an error loading a new day: \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
