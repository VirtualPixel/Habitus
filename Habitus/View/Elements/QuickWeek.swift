//
//  QuickWeek.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import SwiftUI

struct QuickWeek: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var viewModel: ViewModel
    
    var body: some View {
        HStack {
            ForEach(0..<7) { index in
                Button(action: {
                    self.viewModel.selectedDay = self.viewModel.days[index]
                }) {
                    ZStack {
                        Text("\(self.viewModel.days[index].weekdayNarrow)")
                            .frame(width: 40, height: 40)
                            .font(.title3.bold())
                            .opacity(colorScheme == .dark ? 0.8 : 0.6)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .background(
                                Circle()
                                    .strokeBorder(lineWidth: 3)
                                    .foregroundColor(.mainColor)
                                    .opacity(0.3)
                            )
                        if viewModel.isSelected(index: index) {
                            Divider()
                                .frame(width: 20, height: 3)
                                .background(Color.mainColor)
                                .cornerRadius(15)
                                .opacity(0.6)
                                .offset(y: 25)
                        }
                    }
                    
                }
                .tag(self.viewModel.days[index])
            }
            .blur(radius: viewModel.blurAmount)
            
            Divider()
                .frame(width: 1, height: 25)
                .background(colorScheme == .dark ? .white : .black)
                .opacity(0.3)
                .blur(radius: viewModel.blurAmount)
            
            Button {
                withAnimation {
                    viewModel.showingContextButtons = true
                }
            } label: {
                Text("+")
                    .frame(width: 40, height: 40)
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.01)
                    .font(.title3.bold())
                    .offset(y: -2)
                    .opacity(colorScheme == .dark ? 0.8 : 0.6)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .background(
                        Circle()
                            .strokeBorder(lineWidth: 3)
                            .foregroundColor(.mainColor)
                            .opacity(0.3)
                    )
            }
        }
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}

struct QuickWeek_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = QuickWeek.ViewModel(selectedDay: .constant(Date()), showingContextButtons: .constant(false), blurAmount: 0)
            return QuickWeek(viewModel: viewModel)
        }
}
