//
//  IconPicker.swift
//  Habitus
//
//  Created by Justin Wells on 1/18/23.
//

import SwiftUI

struct IconPicker: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel = ViewModel()
    @Binding var selectedIcon: String
    @Binding private var color: Color
    
    var body: some View {
        selectedIconView
        .overlay(
            viewModel.showingMenu ?
            menuView
                .position(x: viewModel.deviceSize.width / 2.15, y: viewModel.deviceSize.height / 2)
            :
            nil
        )
    }
    
    private var menuView: some View {
        ZStack {
            backgroundView
            VStack {
                iconView(selectedIcon)
                    .padding([.bottom, .top], 10)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            viewModel.showingMenu = false
                        }
                    }
                
                Divider()
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 4)) {
                        ForEach(viewModel.icons, id: \.self) { icon in
                            IconButton(icon: icon, isSelected: selectedIcon == icon, color: color, onSelection: {
                                selectedIcon = icon
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
    
    private var selectedIconView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(colorScheme == .dark ? Color.darkModeButton : .white)
            
            Image(selectedIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .blending(color: color)
        }
        .zIndex(0)
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
    
    private func iconView(_ icon: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(colorScheme == .dark ? Color.darkModeButton : .white)
            
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .blending(color: color)
        }
        .frame(width: 120, height: 120)
    }
    
    init(selectedIcon: Binding<String>, color: Binding<Color>) {
        self._selectedIcon = selectedIcon
        self._color = color
    }
}

struct IconButton: View {
    @Environment(\.colorScheme) var colorScheme
    let icon: String
    let isSelected: Bool
    let color: Color
    let onSelection: () -> Void

    var body: some View {
        ZStack {
            if isSelected {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(colorScheme == .dark ?  Color.darkModeSelected : Color.lightModeButton)
            }

            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .blending(color: color)
                .onTapGesture {
                    onSelection()
                }
        }
    }
}


struct IconPicker_Previews: PreviewProvider {
    static var previews: some View {
        IconPicker(selectedIcon: .constant("heart"), color: .constant(Color(.systemPink)))
    }
}
