//
//  User.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import Foundation

struct User: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    var countProducts: Int?
}
