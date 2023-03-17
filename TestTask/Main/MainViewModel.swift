//
//  MainViewModel.swift
//  TestTask
//
//  Created by Карим Садыков on 12.03.2023.
//

import UIKit

protocol MainViewModelProtocol: AnyObject {
    var title: String { get }
}

class MainViewModel: MainViewModelProtocol {
    var countAddedProductInCart: String?
    private let networkManager: NetworkManager
    
    private let categories: [CategoryProduct]
    private var selectedCategory: CategoryProduct
    private var latestProducts: [Product] = []
    private var flashSales: [FlashSale] = []
    var coordinator: MainCoordinator?
    
    private var didLoadProductData: ((Bool) -> Void)?
    private var didLoadFlashSaleData: ((Bool) -> Void)?
    
    init(networkManager: NetworkManager) {
        categories = CategoryProduct.allCases
        selectedCategory = .Phones
        self.networkManager = networkManager
        fetchData()
    }
    
    var title: String {
        return "Zihuatanejo, Gro"
    }
    
    private func fetchData() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        networkManager.fetchLatestProducts { [weak self] result in
            switch result {
            case .success(let products):
                self?.latestProducts = products
            case .failure(let error):
                print("Error fetching latest products: \(error)")
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        networkManager.fetchFlashSales { [weak self] result in
            switch result {
            case .success(let sales):
                self?.flashSales = sales
            case.failure(let error):
                print("Error fetching flash sales: \(error)")
            }
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            self.combineData()
        }
    }
    private func combineData() {
        if latestProducts.isEmpty {
            print("Error: latestProducts is empty")
            return
        }
        if flashSales.isEmpty {
            print("Error: flashSales is empty")
            return
        }
        didLoadProductData?(true)
        didLoadFlashSaleData?(true)
    }
}

extension MainViewModel: CategoryTableCellViewModelProtocol {
    var numberCategories: Int {
        categories.count
    }
    
    func getViewModel(at index: Int) -> CategoryCollectionCellViewModelProtocol {
        let product = categories[index]
        let isSelect = product == selectedCategory
        return CategoryCollectionCellViewModel(product, isSelect: isSelect)
    }
    
    var indexSelectedItem: Int {
        return categories.firstIndex(of: selectedCategory) ?? 0
    }
    
    func didSelectedItem(at index: Int) {
        let product = categories[index]
        selectedCategory = product
    }
}

extension MainViewModel: LatestTableCellViewModelProtocol {
    var numberOfRowsLatest: Int {
        latestProducts.count
    }
    
    func getLatestViewModel(at index: Int) -> LatestCollectionCellViewModelProtocol {
        LatestCollectionCellViewModel(product: latestProducts[index], networkManager: networkManager)
    }
    
    var didLoadDataForLatest: ((Bool) -> Void)? {
        get { didLoadProductData }
        set { didLoadProductData = newValue }
    }
}

extension MainViewModel: FlashSaleTableCellViewModelProtocol {
    
    var numberOfRowsFlashSale: Int {
        flashSales.count
    }
    
    func getFlashSaleViewModel(at index: Int) -> FlashSaleCollectionCellViewModelProtocol {
        FlashSaleCollectionCellViewModel(flashSale: flashSales[index], networkManager: networkManager)
    }
    
    var didLoadDataForFlashSale: ((Bool) -> Void)? {
        get { didLoadFlashSaleData }
        set { didLoadFlashSaleData = newValue }
    }
    
    func pushDetailView() {
        self.coordinator?.startDetailScene()
    }
}

