//
//  CircularProgressView-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 3/14/23.
//

import Foundation

extension CircularProgressBar {
    class ViewModel: ObservableObject {
        @Published var progress: Double
        
        init(progress: Double) {
            self.progress = progress
        }
    }
}
