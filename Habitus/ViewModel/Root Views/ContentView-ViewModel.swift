//
//  ContentView-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/15/23.
//

import CoreData
import SwiftUI

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var image: Image
        @Published var timer: Timer?
        let fetchRequest = NSFetchRequest<Habit>(entityName: "Habit")
        
        func loadImage() {
           do {
                let data = try Data(contentsOf: FileManager.documentsDirectory.appendingPathComponent("profilePicture"))
                let loaded = UIImage(data: data)
                self.image = Image(uiImage: loaded!)
            } catch {
                self.image = Image("avatar")
            }
        }
        
        
        init() {
            self.image = Image("avatar")
            loadImage()
        }
    }
}
