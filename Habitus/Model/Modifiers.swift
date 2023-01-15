//
//  Modifiers.swift
//  Habitus
//
//  Created by Justin Wells on 1/14/23.
//

import SwiftUI

struct PinkButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 70)
            .font(Font.custom("Poppins-Italic", size: 32))
            .background(Color.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .foregroundColor(.white)
    }
}

extension View {
    func pinkButton() -> some View {
        modifier(PinkButton())
    }
}
