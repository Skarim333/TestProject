//
//  CategoryCollectionCellViewModel.swift
//  TestTask
//
//  Created by Карим Садыков on 12.03.2023.
//

import Foundation

protocol CategoryCollectionCellViewModelProtocol: AnyObject {
    var nameCategory: String { get }
    var nameIconCategory: String { get }
    var isSelectCell: Bool { get }
    
    init(_ product: CategoryProduct, isSelect: Bool)
    func didSelectedCell()
    var changedViewModel: ((CategoryCollectionCellViewModelProtocol) -> Void)? { get set }
//    func cellViewModel(forIndexPath indexPath: IndexPath) -> [String]
}

class CategoryCollectionCellViewModel: CategoryCollectionCellViewModelProtocol {
    private var isSelect: Bool
    private let product: CategoryProduct
    
    required init(_ product: CategoryProduct, isSelect: Bool) {
        self.product = product
        self.isSelect = isSelect
    }
    
    var isSelectCell: Bool {
        isSelect
    }
    
//    func numberOfRowsInSection() -> Int {
//        CategoryProduct.allCases.count
//    }
    
    func didSelectedCell() {
        isSelect.toggle()
        changedViewModel?(self)
    }
    
    var nameCategory: String {
        product.rawValue
    }
    
    var nameIconCategory: String {
        product.nameImage
    }
    
    var changedViewModel: ((CategoryCollectionCellViewModelProtocol) -> Void)?
    
}
