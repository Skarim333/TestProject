//
//  CategoryProduct.swift
//  TestTask
//
//  Created by Карим Садыков on 12.03.2023.
//

import UIKit

enum CategoryProduct: String, CaseIterable {
    case Phones, Headphones, Games, Cars, Furniture, Kids
    
    var nameImage: String {
        switch self {
        case .Phones:
            return "phones"
        case .Headphones:
            return "headphones"
        case .Games:
            return "games"
        case .Cars:
            return "cars"
        case .Furniture:
            return "furniture"
        case .Kids:
            return "kids"
        }
    }
    
}
