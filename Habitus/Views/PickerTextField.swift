//
//  PickerTextField.swift
//  Habitus
//
//  Created by Justin Wells on 11/3/22.
//

import SwiftUI

struct PickerTextField: View {
    @Binding var selectedUnit: String
    @State private var showingUnits = true
    
    let units: [String]
    let color: Color
    var groupedUnits: [[String]] = [[String]]()
    let screenWidth = UIScreen.main.bounds.width
    
    init(selection: Binding<String>, units: [String], color: Color) {
        self._selectedUnit = selection
        self.units = units
        self.color = color
        
        self.groupedUnits = createGroupedUnits(units)
    }
    
    private func createGroupedUnits(_ units: [String]) -> [[String]] {
        var groupedUnits: [[String]] = [[String]]()
        var tempUnits: [String] = [String]()
        var width: CGFloat = 0
        
        for unit in units {
            let label = UILabel()
            label.text = unit
            label.sizeToFit()
            
            let labelWidth = label.frame.size.width + 32
            
            if (width + labelWidth + 32) < screenWidth {
                width += labelWidth
                tempUnits.append(unit)
            } else {
                width = labelWidth
                groupedUnits.append(tempUnits)
                tempUnits.removeAll()
                tempUnits.append(unit)
            }
        }
        
        groupedUnits.append(tempUnits)
        return groupedUnits
    }
    
    var body: some View {
        VStack {
            HStack {
                if showingUnits { TextField(selectedUnit.isEmpty ? "Unit" : "\(selectedUnit)", text: $selectedUnit) } else {
                    Text(selectedUnit.isEmpty ? "Unit" : selectedUnit )
                        .font(.headline)
                }
                                
                Image(systemName: showingUnits ? "chevron.down" : "chevron.right")
                    .onTapGesture {
                        showingUnits.toggle()
                    }
            }
            .fixedSize()
            
            if showingUnits {
                VStack(alignment: .leading) {
                    ForEach(groupedUnits, id:\.self) { subUnits in
                        HStack {
                            ForEach(subUnits, id:\.self) { unit in
                                Text(unit)
                                    .fixedSize()
                                    .padding(10)
                                    .background(color)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .onTapGesture {
                                        selectedUnit = unit
                                    }
                            }
                        }
                    }
                }
                .padding()
                .background(.thinMaterial)
                .cornerRadius(15)
            }
        }
    }
}

struct PickerTextField_Previews: PreviewProvider {
    static var previews: some View {
        PickerTextField(selection: .constant("Unit"), units: ["count", "steps", "m", "km", "mile", "second", "minute", "hour", "ml", "oz", "Cal"], color: Color.babyBlue)
    }
}
