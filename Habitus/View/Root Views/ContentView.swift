//
//  ContentView.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ViewModel()
    
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
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
