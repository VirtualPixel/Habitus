//
//  FileManager-DocumentsDirectory.swift
//  Habitus
//
//  Created by Justin Wells on 1/15/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
