//
//  TabBarPages.swift
//  TestTask
//
//  Created by Карим Садыков on 11.03.2023.
//

import UIKit

enum TabBarPages: String {
    case main
    case favorite
    case cart
    case chat
    case profile
    
    func pageImageValue() -> UIImage {
        switch self {
        case .main:
            if let image = UIImage(named: "home") {
                let newImage = image.withRenderingMode(.alwaysOriginal)
                return newImage.resized(to: CGSize(width: 15, height: 15))
            }
            return UIImage()
        case .favorite:
            if let image = UIImage(named: "favorite") {
            let newImage = image.withRenderingMode(.alwaysOriginal)
            return newImage.resized(to: CGSize(width: 18, height: 15))
        }
            return UIImage()
        case .cart:
            if let image = UIImage(named: "cart") {
                let newImage = image.withRenderingMode(.alwaysOriginal)
                return newImage.resized(to: CGSize(width: 15, height: 15))
            }
            return UIImage()
        case .chat:
            if let image = UIImage(named: "chat") {
                let newImage = image.withRenderingMode(.alwaysOriginal)
                return newImage.resized(to: CGSize(width: 15, height: 15))
            }
            return UIImage()
        case .profile:
            if let image = UIImage(named: "person") {
                let newImage = image.withRenderingMode(.alwaysOriginal)
                return newImage.resized(to: CGSize(width: 15, height: 15))
            }
            return UIImage()
        }
    }
    
    func pageSelectImageValue() -> UIImage {
        switch self {
        case .main:
            if let image = UIImage(named: "backHome") {
                let newImage = image.resized(to: CGSize(width: 40, height: 40))
                return newImage.withRenderingMode(.alwaysOriginal)
            }
            return UIImage()
        case .favorite:
            if let image = UIImage(named: "backFavorite") {
                let newImage = image.resized(to: CGSize(width: 40, height: 40))
                return newImage.withRenderingMode(.alwaysOriginal)
            }
            return UIImage()
        case .cart:
            if let image = UIImage(named: "backCart") {
                let newImage = image.resized(to: CGSize(width: 40, height: 40))
                return newImage.withRenderingMode(.alwaysOriginal)
            }
            return UIImage()
        case .chat:
            if let image = UIImage(named: "backChat") {
                let newImage = image.resized(to: CGSize(width: 40, height: 40))
                return newImage.withRenderingMode(.alwaysOriginal)
            }
            return UIImage()
        case .profile:
            if let image = UIImage(named: "backProfile") {
                let newImage = image.resized(to: CGSize(width: 40, height: 40))
                return newImage.withRenderingMode(.alwaysOriginal)
            }
            return UIImage()
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .main:
            return 0
        case .favorite:
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
