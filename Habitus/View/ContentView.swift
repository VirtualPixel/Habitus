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
        Text("Content View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
