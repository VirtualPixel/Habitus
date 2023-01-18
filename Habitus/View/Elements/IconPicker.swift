//
//  IconPicker.swift
//  Habitus
//
//  Created by Justin Wells on 1/18/23.
//

import SwiftUI

struct IconPicker: View {
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        Image("heart")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .blending(color: Color(.systemPink))
    }
}

struct IconPicker_Previews: PreviewProvider {
    static var previews: some View {
        IconPicker()
    }
}
