//
//  CustomColorPicker.swift
//  Habitus
//
//  Created by Justin Wells on 1/19/23.
//

import SwiftUI

struct CustomColorPicker: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            if viewModel.showingMenu {
                menuView
                    .padding([.top, .bottom], 200)
            } else {
                selectedColorView
            }
        }
    }
    
    private var menuView: some View {
        ZStack {
            backgroundView
            VStack {
                colorView(viewModel.selectedColor)
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
                            ColorButton(isSelected: viewModel.selectedColor == color, color: color, onSelection: {
                                viewModel.selectedColor = color
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
                .foregroundColor(viewModel.selectedColor)
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
                .foregroundColor(viewModel.selectedColor)
                .padding()
        }
        .frame(width: 120, height: 120)
    }
    
    init(selectedColor: Binding<Color>) {
        _viewModel = StateObject(wrappedValue: ViewModel(selectedColor: selectedColor))
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
                    print("Button tapped")
                }
        }
    }
}

struct CustomColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomColorPicker(selectedColor: .constant(.accentColor))
    }
}
