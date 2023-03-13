//
//  TabBarPages.swift
//  TestTask
//
//  Created by Карим Садыков on 11.03.2023.
//

import UIKit

enum TabBarPages: String {
    case main
    case favourite
    case cart
    case chat
    case profile
    
    func pageImageValue() -> UIImage {
        switch self {
        case .main:
            return #imageLiteral(resourceName: "explorerTab").withRenderingMode(.alwaysOriginal)
        case .favourite:
            return #imageLiteral(resourceName: "explorerTab").withRenderingMode(.alwaysOriginal)
        case .cart:
            return #imageLiteral(resourceName: "explorerTab").withRenderingMode(.alwaysOriginal)
        case .chat:
            return #imageLiteral(resourceName: "explorerTab").withRenderingMode(.alwaysOriginal)
        case .profile:
            return #imageLiteral(resourceName: "explorerTab").withRenderingMode(.alwaysOriginal)
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .main:
            return 0
        case .favourite:
            return 1
        case .cart:
            return 2
        case .chat:
            return 3
        case .profile:
            return 4
        }
    }
}
