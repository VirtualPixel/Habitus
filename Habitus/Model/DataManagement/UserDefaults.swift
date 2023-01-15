//
//  UserDefaults.swift
//  Habitus
//
//  Created by Justin Wells on 1/13/23.
//

import Foundation

extension UserDefaults {
    var welcomeShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "welcomeShown") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomeShown")
        }
    }
    
    var firstName: String {
        get {
            return (UserDefaults.standard.value(forKey: "firstName") as? String) ?? ""
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "firstName")
        }
    }
    
    var lastName: String {
        get {
            return (UserDefaults.standard.value(forKey: "lastName") as? String) ?? ""
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "lastName")
        }
    }
    
    var wakeUpTime: Date {
        get {
            return (UserDefaults.standard.value(forKey: "wakeTime") as? Date) ?? Date.now
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "wakeTime")
        }
    }
    
    var dateOfBirth: Date {
        get {
            return (UserDefaults.standard.value(forKey: "dateOfBirth") as? Date) ?? Date.now
        }
        set {
            return (UserDefaults.standard.setValue(newValue, forKey: "dateOfBirth"))
        }
    }
}
