//
//  NetworkService.swift
//  TestTask
//
//  Created by Карим Садыков on 12.03.2023.
//

import Foundation

// Define the network layer
class NetworkManager {
    static let shared = NetworkManager()
    let session: URLSession
    
    private init() {
        session = URLSession.shared
    }
    
    func fetchLatestProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        let url = URL(string: "https://example.com/latest")!
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data
            else {
                completion(.failure(NSError(domain: "NetworkManager", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(LatestResponse.self, from: data)
                completion(.success(response.latest))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func fetchFlashSales(completion: @escaping (Result<[FlashSale], Error>) -> Void) {
        let url = URL(string: "https://example.com/flash-sale")!
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data
            else {
                completion(.failure(NSError(domain: "NetworkManager", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(FlashSaleResponse.self, from: data)
                completion(.success(response.flashSale))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

/*
NetworkManager.shared.fetchLatestProducts { result in
    switch result {
    case .success(let products):
        print("Latest products:")
        for product in products {
            print("\(product.name) - \(product.price)")
        }
    case .failure(let error):
        print("Error fetching latest products: \(error)")
    }
}

NetworkManager.shared.fetchFlashSales { result in
    switch result {
    case .success(let flashSales):
        print("Flash sales:")
        for sale in flashSales {
            print("\(sale.name) - \(sale.price) (discounted by \(sale.discount)%)")
        }
    case .failure(let error):
        print("Error fetching flash sales: \(error)")
    }
}

private func fetchData() {
    let dispatchGroup = DispatchGroup()
    
    dispatchGroup.enter()
    NetworkManager.shared.fetchLatestProducts { [weak self] result in
        switch result {
        case .success(let products):
            self?.latestProducts = products
        case .failure(let error):
            print("Error fetching latest products: \(error)")
        }
        dispatchGroup.leave()
    }
    
    dispatchGroup.enter()
    NetworkManager.shared.fetchFlashSales { [weak self] result in
        switch result {
        case .success(let sales):
            self?.flashSales = sales
        case.failure(let error):
            print("Error fetching flash sales: (error)")
        }
        dispatchGroup.leave()
    }
    dispatchGroup.notify(queue: .main) {
        self?.combineData()
    }
}
private func combineData() {
    guard let latestProducts = latestProducts, let flashSales = flashSales else {
        return // Wait until all data is fetched
    }
 */
