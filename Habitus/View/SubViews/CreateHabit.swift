//
//  CreateHabitView.swift
//  Habitus
//
//  Created by Justin Wells on 1/17/23.
//

import SwiftUI

struct CreateHabit: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    VStack {
                        IconPicker()
                    }
                }
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
        }
    }
}

struct CreateHabit_Previews: PreviewProvider {
    static var previews: some View {
        CreateHabit()
    }
}
