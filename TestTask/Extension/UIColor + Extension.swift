//
//  UIColor + Extension.swift
//  TestTask
//
//  Created by Карим Садыков on 18.03.2023.
//

import UIKit

extension UIColor {
    
    static func mainBackView() -> UIColor {
        return UIColor(hex: "#FAF9FF")!
    }
    
    static func mainGrey() -> UIColor {
        return UIColor(hex: "#808080")!
    }
    
    static func lightGrey() -> UIColor {
        return #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7647058824, alpha: 1)
    }
    
    static func backDark() -> UIColor {
        return UIColor(hex: "#181726")!
    }
    
    static func mainBlack() -> UIColor {
        return UIColor(hex: "#161826")!
    }
    
    static func mainDark() -> UIColor {
        return UIColor(hex: "#040402")!
    }
    
    static func mainBrown() -> UIColor {
        return #colorLiteral(red: 0.4666666667, green: 0.1764705882, blue: 0.01176470588, alpha: 1)
    }
    
    static func mainBlue() -> UIColor {
        return UIColor(hex: "#4E55D7")!
    }
    
    convenience init?(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
