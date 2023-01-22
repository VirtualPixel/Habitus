//
//  HabitusApp.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import SwiftUI

@main
struct HabitusApp: App {
    @StateObject private var dataController = DataController()
    @State private var welcome = UserDefaults.standard.welcomeShown
    
    var body: some Scene {
        /*WindowGroup {
            switch welcome {
            case true:
                ContentView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                    .transition(.scale)
                    .onAppear {
                        if !UserDefaults.standard.welcomeShown { UserDefaults.standard.welcomeShown = true }
                    }
            case false:
                Welcome(welcome: $welcome)
            }
        }*/
        WindowGroup {
            //IconPicker(color: Color(.systemPink))
            CreateHabit()
        }
    }
}
