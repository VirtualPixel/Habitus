//
//  Home-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import Foundation

extension Home {
    @MainActor class ViewModel: ObservableObject {
        @Published var selectedDay = Date()
    }
}
