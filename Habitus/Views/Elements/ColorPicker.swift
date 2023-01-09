//
//  ColorPicker.swift
//  Habitus
//
//  Created by Justin Wells on 10/22/22.
//

import SwiftUI

struct ColorPicker: View {
    @Binding var selectedColor: Color
    private let colors: [Color] = [.babyBlue, .blueGreen, .lightGreen, .lightLime, .lightPeriwinkle, .magicMint, .paleMauve, .pastelBrown, .pastelGreen, .pastelLilac, .pastelPea, .pastelPersian, .pastelPurple, .pastelRed, .pastelTurquoise, .pastelViolet]
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(
                            AngularGradient(gradient: Gradient(colors: colors), center: .center)
                        )
                    
                Text("?")
                    .foregroundColor(.gray)
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.01)
            }
            .frame(width: 45, height: 45)
            .onTapGesture {
                selectedColor = colors.randomElement()!
            }
            Text("|")
                .foregroundColor(.gray)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(colors, id: \.self) { color in
                        Circle()
                            .foregroundColor(color)
                            .frame(width: 45, height: 45)
                            .opacity(2.0)
                            .scaleEffect(color == selectedColor ? 1.2 : 1.0)
                            .onTapGesture {
                                selectedColor = color
                            }
                            .padding(5)
                    }
                }
            }
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker(selectedColor: .constant(.pastelTurquoise))
    }
}
