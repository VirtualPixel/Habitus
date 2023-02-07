//
//  Colors.swift
//  Habitus
//
//  Created by Justin Wells on 1/13/23.
//

import SwiftUI

extension Color {
    public static var mainColor: Color {
        Color(UIColor(red: 0.88, green: 0.40, blue: 0.49, alpha: 1.00))
    }
    
    public static var notificationsButton: Color {
        Color(UIColor(red: 0.77, green: 0.48, blue: 0.80, alpha: 1.00))
    }
    
    public static var lightModeSubtext: Color {
        Color(UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.00))
    }
    
    public static var lightModeButton: Color {
        Color(UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00))
    }
    
    public static var darkModeButton: Color {
        Color(UIColor(red: 0.21, green: 0.21, blue: 0.21, alpha: 1.00))
    }
    
    public static var darkModeSelected: Color {
        Color(UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00))
    }
    
    public static var lightModeFormBackground: Color {
        Color(UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00))
    }
}

// color components
extension Color {
    var components: (r: Double, g: Double, b: Double, a: Double) {
        #if canImport(UIKit)
        typealias NativeColor = UIColor
        #elseif canImport(AppKit)
        typealias NativeCOlor = NSColor
        #endif
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &a) else { return (0, 0, 0, 0) }
        
        return (Double(r), Double(g), Double(b), Double(a))
    }
}
