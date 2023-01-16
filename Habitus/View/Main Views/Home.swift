//
//  Home.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import SwiftUI

struct Home: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                QuickWeek(viewModel: .init(selectedDay: $viewModel.selectedDay))

                Spacer()
                
                VStack {
                    Image(decorative: colorScheme == .dark ? "darkClipboards" : "empty")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.7)
                    Text("Your habit journey begins here! Add your first one by clicking the plus button.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.lightModeSubtext)
                        .opacity(0.5)
                }
                .frame(width: 300)
                .toolbar() {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            // sort bottom sheet
                        } label: {
                            Image(systemName: "arrow.up.arrow.down")
                                .foregroundColor(Color(UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)))
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            // settings sheet
                        } label: {
                            Image(systemName: "gearshape")
                                .foregroundColor(Color(UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)))
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
