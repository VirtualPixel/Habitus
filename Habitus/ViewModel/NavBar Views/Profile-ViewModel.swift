//
//  Profile-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import SwiftUI

extension Profile {
    @MainActor class ViewModel: ObservableObject {
        let profilePicture: Image
        
        init() {
            let savePath = FileManager.documentsDirectory.appendingPathComponent("profilePicture")
            
            do {
                let imageData = try Data(contentsOf: savePath)
                profilePicture = Image(uiImage: UIImage(data: imageData)!)
            } catch {
                print("Error loading profile picture: \(error)")
                profilePicture = Image("avatar")
            }
        }
    }
}
