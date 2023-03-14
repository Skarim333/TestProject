//
//  CategoryTableViewCell.swift
//  TestTask
//
//  Created by Карим Садыков on 13.03.2023.
//

import UIKit

protocol CategoryTableCellViewModelProtocol: MainViewModelProtocol {
    var indexSelectedItem: Int { get }
    var numberCategories: Int { get }
    func didSelectedItem(at index: Int)
    func getViewModel(at index: Int) -> CategoryCollectionCellViewModelProtocol
}

class CategoryTableViewCell: UITableViewCell {

    static let identifier = "CategoryTableViewCell"
    
    var viewModel: CategoryTableCellViewModelProtocol!
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collView.showsHorizontalScrollIndicator = false
        collView.showsVerticalScrollIndicator = false
        return collView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        selectionStyle = .none
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .none
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        backgroundConfiguration = .clear()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
    
    
}

extension CategoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberCategories
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.viewModel = viewModel.getViewModel(at: indexPath.row)
        return cell
    }
}

extension CategoryTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: IndexPath(row: viewModel.indexSelectedItem, section: 0)) as! CategoryCollectionViewCell
        selectedCell.viewModel.didSelectedCell()

        viewModel.didSelectedItem(at: indexPath.row)
        let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
        cell.viewModel.didSelectedCell()
    }
}

extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 5,
                      height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 23
    }
}

