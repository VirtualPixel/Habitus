//
//  CircularProgressBar.swift
//  Habitus
//
//  Created by Justin Wells on 3/14/23.
//

import SwiftUI

struct CircularProgressBar: View {
    @ObservedObject private var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.accentColor.opacity(0.2),
                    lineWidth: 15
                )
            
            Circle()
                .trim(from: 0, to: viewModel.progress / 100)
                .stroke(
                    Color.accentColor,
                    style: StrokeStyle (
                        lineWidth: 15,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: viewModel.progress)
            
            Text("\(viewModel.progress.formatted())%")
                .bold()
                .padding(50)
                .font(.system(size: 500))
                .minimumScaleFactor(0.01)
                
        }
        .padding()
    }
    
    init(progress: Double) {
        _viewModel = ObservedObject(wrappedValue: ViewModel(progress: progress))
    }
}

struct CircularProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBar(progress: 50)
    }
}
