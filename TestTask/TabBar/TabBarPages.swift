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
            return UIImage(systemName: "heart")!
        case .favourite:
            return UIImage(systemName: "heart")!
        case .cart:
            return UIImage(systemName: "heart")!
        case .chat:
            return UIImage(systemName: "heart")!
        case .profile:
            return UIImage(systemName: "heart")!
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
