//
//  PickerTextField.swift
//  Habitus
//
//  Created by Justin Wells on 11/3/22.
//

import SwiftUI

struct PickerTextField: View {
    @Binding var selectedUnit: String
    @State private var showingUnits = false
    
    let units: [String]
    
    var body: some View {
        VStack {
            HStack {
                if showingUnits { TextField(selectedUnit.isEmpty ? "Unit" : "\(selectedUnit)", text: $selectedUnit) } else {
                    Text(selectedUnit.isEmpty ? "Unit" : selectedUnit )
                }
                                
                Image(systemName: showingUnits ? "chevron.down" : "chevron.right")
                    .onTapGesture {
                        showingUnits.toggle()
                    }
            }
            .fixedSize()
            ZStack {
                
            }
        }
    }
}

struct PickerTextField_Previews: PreviewProvider {
    static var previews: some View {
        PickerTextField(selectedUnit: .constant("Unit"), units: ["Food", "Beer", "Test"])
    }
}
