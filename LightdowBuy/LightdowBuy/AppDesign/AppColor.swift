//
//  AppColor.swift
//  LightdowBuy
//
//  Created by Nick on 2022/10/20.
//

import Foundation
import UIKit

struct AppColor {
    
    enum Color {
        case selectedColor
        
        var color: UIColor {
            switch self {
            case .selectedColor:
                return #colorLiteral(red: 0.147773236, green: 0.5032078028, blue: 0.9226492047, alpha: 1)
            }
        }
    }
    
    static func color(color: Color) -> UIColor {
        return color.color
    }
    
    
}

extension UIColor {
    
    convenience init(hexString: String) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        let scanner = Scanner(string:hexString)
        
        if (hexString.hasPrefix("#")) {
            if #available(iOS 13.0, *) {
                scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
            } else {
                scanner.scanLocation = 1
            }
        }
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        
        var a = Int(color >> 24) & mask;
        if hexString.count <= 8 {
            a = 255;
        }
        
        let alpha = CGFloat(a) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
        
    }
    
    
    
    
}


