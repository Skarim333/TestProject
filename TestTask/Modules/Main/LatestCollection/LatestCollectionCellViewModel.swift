//
//  LatestCollectionCellViewModel.swift
//  TestTask
//
//  Created by Карим Садыков on 13.03.2023.
//

import UIKit

protocol LatestCollectionCellViewModelProtocol {
    var category: String { get }
    var name: String { get }
    var price: String { get }
    var imageUrl: URL { get }
    var image: UIImage? { get }
    
    init(product: Product, networkManager: NetworkManager)
    
    func addCart()
    func loadImageData(completion: @escaping () -> Void)
}

class LatestCollectionCellViewModel: LatestCollectionCellViewModelProtocol {
    
    private let product: Product
    private let networkManager: NetworkManager
    var image: UIImage? = nil
    
    required init(product: Product, networkManager: NetworkManager) {
        self.product = product
        self.networkManager = networkManager
    }
    
    var category: String {
        product.category
    }
    
    var name: String {
        product.name
    }
    
    var price: String {
        String(format: "%.3f", product.price).replacingOccurrences(of: ".", with: ",")
    }
    
    var imageUrl: URL {
        product.imageUrl
    }
    
    func loadImageData(completion: @escaping () -> Void) {
            networkManager.getImage(from: imageUrl) { [weak self] image in
                self?.image = image
                completion()
            }
        }
    
    func addCart() {
        print("ADD")
        
    }
}
