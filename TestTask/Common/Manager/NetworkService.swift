//
//  NetworkService.swift
//  TestTask
//
//  Created by Карим Садыков on 12.03.2023.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    let session: URLSession
    
    init() {
        session = URLSession.shared
    }
    
    func getImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(UIImage(data: data))
            }
        }.resume()
    }

    
    func fetchLatestProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")!
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
        let url = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac")!
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
    
    func fetchShoe(completion: @escaping (Result<Shoe, Error>) -> Void) {
            
            guard let url = URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239") else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }
            
            let task = session.dataTask(with: url) { (data, response, error) in
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
                    
                    let shoe = try JSONDecoder().decode(Shoe.self, from: data)
                    completion(.success(shoe))
                } catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
}
