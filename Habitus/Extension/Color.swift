//
//  Color.swift
//  Habitus
//
//  Created by Justin Wells on 10/19/22.
//

#if os(iOS)
import SwiftUI
#elseif os(watchOS)
import WatchKit
#elseif os(macOS)
import AppKit
#endif

fileprivate extension Color {
    #if os(macOS)
    typealias SystemColor = NSColor
    #else
    typealias SystemColor = UIColor
    #endif
    
    var colorComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        #if os(macOS)
        SystemColor(self).getRed(&r, green: &g, blue: &b, alpha: &a)
        // Note that non RGB color will raise an exception, that I don't now how to catch because it is an Objc exception.
        #else
        guard SystemColor(self).getRed(&r, green: &g, blue: &b, alpha: &a) else {
            // Pay attention that the color should be convertible into RGB format
            // Colors using hue, saturation and brightness won't work
            return nil
        }
        #endif
        
        return (r, g, b, a)
    }
}

extension Color: Codable {
    enum CodingKeys: String, CodingKey {
        case red, green, blue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let r = try container.decode(Double.self, forKey: .red)
        let g = try container.decode(Double.self, forKey: .green)
        let b = try container.decode(Double.self, forKey: .blue)
        
        self.init(red: r, green: g, blue: b)
    }

    public func encode(to encoder: Encoder) throws {
        guard let colorComponents = self.colorComponents else {
            return
        }
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(colorComponents.red, forKey: .red)
        try container.encode(colorComponents.green, forKey: .green)
        try container.encode(colorComponents.blue, forKey: .blue)
    }
}

extension Color {
    
    public static var babyBlue: Color {
        return Color(UIColor(red: 0.54, green: 0.81, blue: 0.94, alpha: 0.7))
    }
    
    public static var pastelGreen: Color {
        return Color(UIColor(red: 0.47, green: 0.87, blue: 0.47, alpha: 0.7))
    }
    
    public static var pastelBrown: Color {
        return Color(UIColor(red: 0.51, green: 0.41, blue: 0.33, alpha: 0.7))
    }
    
    public static var pastelTurquoise: Color {
        return Color(UIColor(red: 0.60, green: 0.77, blue: 0.77, alpha: 0.7))
    }
    
    public static var blueGreen: Color {
        return Color(UIColor(red: 0.60, green: 0.87, blue: 0.86, alpha: 0.7))
    }
    
    public static var pastelPersian: Color {
        return Color(UIColor(red: 0.67, green: 0.58, blue: 0.60, alpha: 0.7))
    }
    
    public static var magicMint: Color {
        return Color(UIColor(red: 0.67, green: 0.94, blue: 0.82, alpha: 0.7))
    }
    
    public static var lightGreen: Color {
        return Color(UIColor(red: 0.70, green: 0.98, blue: 0.65, alpha: 0.7))
    }
    
    public static var pastelPurple: Color {
        return Color(UIColor(red: 0.70, green: 0.62, blue: 0.71, alpha: 0.7))
    }
    
    public static var pastelLilac: Color {
        return Color(UIColor(red: 0.74, green: 0.69, blue: 0.82, alpha: 0.7))
    }
    
    public static var pastelPea: Color {
        return Color(UIColor(red: 0.75, green: 0.91, blue: 0.65, alpha: 0.7))
    }
    
    public static var lightLime: Color {
        return Color(UIColor(red: 0.75, green: 0.99, blue: 0.45, alpha: 0.7))
    }
    
    public static var lightPeriwinkle: Color {
        return Color(UIColor(red: 0.70, green: 0.62, blue: 0.71, alpha: 0.7))
    }
    
    public static var paleMauve: Color {
        return Color(UIColor(red: 0.78, green: 0.64, blue: 0.64, alpha: 0.7))
    }
    
    public static var pastelViolet: Color {
        return Color(UIColor(red: 0.80, green: 0.60, blue: 0.79, alpha: 0.7))
    }
    
    public static var pastelRed: Color {
        return Color(UIColor(red: 1.00, green: 0.41, blue: 0.38, alpha: 0.7))
    }
}
