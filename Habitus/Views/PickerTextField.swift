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
                TextField(selectedUnit.isEmpty ? "Unit" : "\(selectedUnit)", text: $selectedUnit)
                    .disabled(showingUnits ? false : true )
                Image(systemName: showingUnits ? "chevron.down" : "chevron.right")
                    .onTapGesture {
                        showingUnits.toggle()
                    }
            }
            .fixedSize()
            ZStack {/*
                     if showingUnits {
                     HStack {
                     //Text(newHabit.unitOfMeasurement.isEmpty ? "Unit" : "\(newHabit.unitOfMeasurement)")
                     TextField(newHabit.unitOfMeasurement.isEmpty ? "Unit" : "\(newHabit.unitOfMeasurement)", text: $newHabit.unitOfMeasurement)
                     .font(.headline)
                     .frame(width: 35)
                     Image(systemName: "chevron.down")
                     .onTapGesture {
                     showingUnits.toggle()
                     }
                     Spacer()
                     }
                     } else {
                     HStack {
                     Text(newHabit.unitOfMeasurement.isEmpty ? "Unit" : "\(newHabit.unitOfMeasurement)")
                     .font(.headline)
                     Image(systemName: "chevron.right")
                     Spacer()
                     }
                     .onTapGesture {
                     showingUnits.toggle()
                     }
                     }*/
            }
        }
    }
}

struct PickerTextField_Previews: PreviewProvider {
    static var previews: some View {
        PickerTextField(selectedUnit: .constant("Unit"), units: ["Food", "Beer", "Test"])
    }
}
