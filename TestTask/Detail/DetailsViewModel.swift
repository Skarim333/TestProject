//
//  DetailsViewModel.swift
//  TestTask
//
//  Created by Карим Садыков on 17.03.2023.
//

import UIKit

protocol DetailsViewModelProtocol {
    var didLoadDataForDetail: ((Bool) -> Void)? { get set }
    var name: String {
        get
    }
    var description: String {
        get
    }
    var rating: String {
        get
    }
    var numberOfReviews: String {
        get
    }
    var price: String {
        get
    }
    var colors: [String] {
        get
    }
    var images: [UIImage] { get }
}

class DetailsViewModel: DetailsViewModelProtocol {
    var coordinator: DetailCoordinator?
    private var didLoadDetailData: ((Bool) -> Void)?
    private var model: Shoe?
    var images = [UIImage]()
    
    required init() {
        fetchData() 
    }
    
    private func fetchData() {
        NetworkManager.shared.fetchShoe { [weak self] result in
            switch result {
            case .success(let model):
                    self?.model = model
                self?.loadImageData(completion: {
                    self?.didLoadDataForDetail?(true)
                })
            case .failure(let error):
                print("Error fetching latest products: \(error)")
            }
        }
    }
    
    var name: String {
        model?.name ?? ""
    }
    var description: String {
        model?.description ?? ""
    }
    var rating: String {
        String(model?.rating ?? 0)
    }
    var numberOfReviews: String {
        "(\(model?.numberOfReviews ?? 0) reviews"
    }
    var price: String {
        String(format: "%.2f", model?.price ?? 0).replacingOccurrences(of: ".", with: ",")
    }
    var colors: [String] {
        model?.colors ?? [String]()
    }
    var imageUrls: [URL] {
        model?.imageUrls ?? [URL]()
    }
    
    func loadImageData(completion: @escaping () -> Void) {
        for i in imageUrls {
            NetworkManager.shared.getImage(from: i) { [weak self] image in
                self?.images.append(image ?? UIImage())
                completion()
            }
        }
    }
    
    var didLoadDataForDetail: ((Bool) -> Void)? {
        get { didLoadDetailData }
        set { didLoadDetailData = newValue }
    }
}
