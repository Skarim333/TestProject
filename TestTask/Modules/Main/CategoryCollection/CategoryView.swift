//
//  CategoryView.swift
//  TestTask
//
//  Created by Карим Садыков on 16.03.2023.
//

import UIKit

protocol CategoryTableCellViewModelProtocol: MainViewModelProtocol {
    var indexSelectedItem: Int { get }
    var numberCategories: Int { get }
    func didSelectedItem(at index: Int)
    func getViewModel(at index: Int) -> CategoryCollectionCellViewModelProtocol
}

class CategoryView: UIView {
    
    var viewModel: CategoryTableCellViewModelProtocol!
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string:  "What are you looking for?",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.357, green: 0.357, blue: 0.357, alpha: 1),NSAttributedString.Key.font: UIFont.montserrat(size: 12, weight: .medium)!])
        textField.rightView = UIImageView(image:  UIImage(systemName: "magnifyingglass"))
        textField.rightViewMode = .always
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.969, alpha: 1)
        textField.textAlignment = .center
        textField.clipsToBounds = true
        return textField
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collView.showsHorizontalScrollIndicator = false
        collView.showsVerticalScrollIndicator = false
        return collView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview(searchTextField)
        addSubview(collectionView)
        collectionView.backgroundColor = .none
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchTextField.frame = CGRect(x: 56, y: 0, width: width-112, height: 24)
        collectionView.frame = CGRect(x: 0, y: searchTextField.bottom+17, width: width, height: 58)
        searchTextField.layer.cornerRadius = searchTextField.height/2
    }
}

extension CategoryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberCategories
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.viewModel = viewModel.getViewModel(at: indexPath.row)
        return cell
    }
}

extension CategoryView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: IndexPath(row: viewModel.indexSelectedItem, section: 0)) as! CategoryCollectionViewCell
        selectedCell.viewModel.didSelectedCell()

        viewModel.didSelectedItem(at: indexPath.row)
        let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
        cell.viewModel.didSelectedCell()
    }
}

extension CategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 52, height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
}
