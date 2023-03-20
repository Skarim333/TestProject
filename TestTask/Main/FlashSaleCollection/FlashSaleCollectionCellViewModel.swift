//
//  FlashSaleCollectionCellViewModel.swift
//  TestTask
//
//  Created by Карим Садыков on 14.03.2023.
//

import UIKit

protocol FlashSaleCollectionCellViewModelProtocol {
    var category: String { get }
    var name: String { get }
    var price: String { get }
    var discount: String { get }
    var imageUrl: URL { get }
    var image: UIImage? { get }
    
    init(flashSale: FlashSale, networkManager: NetworkManager)
    
    func addCart()
    func loadImageData(completion: @escaping () -> Void)
}

class FlashSaleCollectionCellViewModel: FlashSaleCollectionCellViewModelProtocol {
    
    private let flashSale: FlashSale
    private let networkManager: NetworkManager
    var image: UIImage? = nil
    
    required init(flashSale: FlashSale, networkManager: NetworkManager) {
        self.flashSale = flashSale
        self.networkManager = networkManager
    }
    
    var category: String {
        flashSale.category
    }
    
    var name: String {
        flashSale.name
    }
    
    var price: String {
        String(flashSale.price)
    }
    
    var discount: String {
        String(flashSale.discount)
    }
    
    var imageUrl: URL {
        flashSale.imageUrl
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
