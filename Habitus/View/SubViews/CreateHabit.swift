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
             ZStack {
                VStack {
                    HStack {
                        VStack {
                            IconPicker(selectedIcon: $viewModel.selectedIcon, color: $viewModel.selectedColor)
                                .zIndex(1)
                            CustomColorPicker(selectedColor: $viewModel.selectedColor)
                                .zIndex(-2)
                        }
                        
                        Spacer()
                        
                        VStack {
                            TextField("Name", text: $viewModel.name)
                                .frame(height: 50)
                                .padding(5)
                            Divider()
                            TextField("Description (Optional)", text: $viewModel.description, axis: .vertical)
                                .lineLimit(6)
                                .frame(height: 160)
                                .padding(5)
                                
                        }
                        .background (
                            RoundedRectangle(cornerRadius: 12)
                                .fill(colorScheme == .dark ?  Color.darkModeButton : .white)
                        )
                        .zIndex(-3)
                    }
                    
                    Spacer()
                    
                }
                .toolbar() {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .foregroundColor(viewModel.selectedColor)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Save")
                                .foregroundColor(viewModel.selectedColor)
                        }
                        .disabled(viewModel.disableButton())
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(colorScheme == .dark ? .black : Color.lightModeFormBackground)
                
            }
        }
    }
}

struct CreateHabit_Previews: PreviewProvider {
    static var previews: some View {
        CreateHabit()
    }
}
