//
//  FlashSale.swift
//  TestTask
//
//  Created by Карим Садыков on 12.03.2023.
//

import Foundation

struct FlashSale: Codable {
    let category: String
    let name: String
    let price: Double
    let discount: Int
    let imageUrl: URL
    
    private enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageUrl = "image_url"
    }
}

struct FlashSaleResponse: Codable {
    let flashSale: [FlashSale]
    
    private enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}
