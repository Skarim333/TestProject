//
//  Product.swift
//  TestTask
//
//  Created by Карим Садыков on 12.03.2023.
//

import Foundation

struct Product: Codable {
    let category: String
    let name: String
    let price: Double
    let imageUrl: URL
    
    private enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageUrl = "image_url"
    }
}

struct LatestResponse: Codable {
    let latest: [Product]
}
