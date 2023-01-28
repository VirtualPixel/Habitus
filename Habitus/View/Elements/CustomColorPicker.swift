//
//  CustomColorPicker.swift
//  Habitus
//
//  Created by Justin Wells on 1/19/23.
//

import SwiftUI

struct CustomColorPicker: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel = ViewModel()
    @Binding var selectedColor: Color
    
    var body: some View {
        selectedColorView
        .overlay(
            viewModel.showingMenu ?
            menuView
                .position(x: viewModel.deviceSize.width / 2.15, y: viewModel.deviceSize.height / 2.6)
                .frame(height: 400)
            :
            nil
        )
    }
    
    private var menuView: some View {
        ZStack {
            backgroundView
            VStack {
                colorView(selectedColor)
                    .padding([.bottom, .top], 10)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            viewModel.showingMenu = false
                        }
                    }
                
                Divider()
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 4)) {
                        ForEach(viewModel.colors, id: \.self) { color in
                            ColorButton(isSelected: selectedColor == color, color: color, onSelection: {
                                selectedColor = color
                                withAnimation(.easeInOut) {
                                    viewModel.showingMenu = false
                                }
                            })
                        }
                    }
                    .padding()
                }
                .padding()

            }
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(colorScheme == .dark ? Color.darkModeButton : .white)
            )
            .frame(width: viewModel.deviceSize.width * 0.95, height: viewModel.deviceSize.height * 0.6)
        }
        .transition(AnyTransition.scale.animation(.easeInOut(duration: viewModel.showingMenu ? 0.2 : 0.5)))
    }
    
    private var selectedColorView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(colorScheme == .dark ? Color.darkModeButton : .white)
            
            Circle()
                .foregroundColor(selectedColor)
                .padding()
        }
        .frame(width: 120, height: 120)
        .onTapGesture {
            withAnimation(.easeInOut) {
                viewModel.showingMenu = true
            }
        }
        .transition(AnyTransition.scale.animation(.easeInOut(duration: viewModel.showingMenu ? 0.2 : 0.5)))
    }
    
    private var backgroundView: some View {
        Color.black.opacity(0.001)
            .edgesIgnoringSafeArea(.all)
            .frame(width: viewModel.deviceSize.width, height: viewModel.deviceSize.height)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    viewModel.showingMenu = false
                }
            }
    }
    
    private func colorView(_ color: Color) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(colorScheme == .dark ? Color.darkModeButton : .white)
            
            Circle()
                .foregroundColor(selectedColor)
                .padding()
        }
        .frame(width: 120, height: 120)
    }
    
    init(selectedColor: Binding<Color>) {
        self._selectedColor = selectedColor
    }
}

struct ColorButton: View {
    @Environment(\.colorScheme) var colorScheme
    let isSelected: Bool
    let color: Color
    let onSelection: () -> Void

    var body: some View {
        ZStack {
            if isSelected {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(colorScheme == .dark ?  Color.darkModeSelected : Color.lightModeButton)
            }

            Circle()
                .foregroundColor(color)
                .padding(10)
                .onTapGesture {
                    onSelection()
                }
        }
    }
}

struct CustomColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomColorPicker(selectedColor: .constant(.accentColor))
    }
}
