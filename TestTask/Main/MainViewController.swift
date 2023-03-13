//
//  MainViewController.swift
//  TestTask
//
//  Created by Карим Садыков on 11.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel: CategoryCollectionCellViewModelProtocol!
    
    var categories: [CategoryProduct] = []
    
    private let categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategory()
        view.backgroundColor = .white
        view.addSubview(categoryCollectionView)
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        categoryCollectionView.frame = CGRect(x: 0, y: 100, width: view.width, height: 100)
    }
    
    func getCategory() {
        categories = CategoryProduct.allCases
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { fatalError() }
        let product = categories[indexPath.row]
        let isSelect = product == .Games
        cell.viewModel = CategoryCollectionCellViewModel(product, isSelect: isSelect)
        return cell
    }
}
