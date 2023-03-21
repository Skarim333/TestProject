//
//  UIFotn + Extension.swift
//  TestTask
//
//  Created by Карим Садыков on 21.03.2023.
//

import UIKit

extension UIFont {
    
    enum MontserratWeight: Int {
        case plain = 400
        case medium = 500
        case semibold
        case bold = 700
        case heavy = 800
        
        var nameFont: String {
            switch self {
            case .plain:
                return "Montserrat"
            case .semibold:
                return "Montserrat"
            case .medium:
                return "Montserrat"
            case .bold:
                return "Montserrat"
            case .heavy:
                return "Montserrat"
            }
        }
    }
    
    static func montserrat(size fontSize: CGFloat, weight fontWeight: MontserratWeight) -> UIFont? {
        UIFont(name: fontWeight.nameFont, size: fontSize)
    }
}
