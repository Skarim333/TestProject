//
//  Shoe.swift
//  TestTask
//
//  Created by Карим Садыков on 17.03.2023.
//

import Foundation

struct Shoe: Codable {
    let name: String
    let description: String
    let rating: Double
    let numberOfReviews: Int
    let price: Double
    let colors: [String]
    let imageUrls: [URL]
    enum CodingKeys: String, CodingKey {
            case name, description, rating, price, colors
            case numberOfReviews = "number_of_reviews"
            case imageUrls = "image_urls"
        }
}
