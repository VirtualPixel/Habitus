//
//  CreateHabitView.swift
//  Habitus
//
//  Created by Justin Wells on 1/17/23.
//

import SwiftUI

struct CreateHabit: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    VStack {
                        IconPicker(selectedIcon: $viewModel.selectedIcon, color: $viewModel.selectedColor)
                        CustomColorPicker(selectedColor: $viewModel.selectedColor)
                    }
                    Image(viewModel.selectedIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .blending(color: viewModel.selectedColor)
                }
                
                Spacer()
            }
            .toolbar() {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
            .background(colorScheme == .dark ? .black : Color.lightModeFormBackground)
        }
    }
}

struct CreateHabit_Previews: PreviewProvider {
    static var previews: some View {
        CreateHabit()
    }
}
