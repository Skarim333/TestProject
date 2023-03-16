//
//  CategoryCollectionViewCell.swift
//  TestTask
//
//  Created by Карим Садыков on 13.03.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    var viewModel: CategoryCollectionCellViewModelProtocol! {
        didSet {
            viewModel.changedViewModel = { [weak self] viewModel in
                self?.select(isSelect: viewModel.isSelectCell)
            }
            nameCategoryLabel.text = viewModel.nameCategory
            if let icon = UIImage(named: viewModel.nameIconCategory) {
                iconImageView.image = icon.withRenderingMode(.alwaysTemplate)
            }

            select(isSelect: viewModel.isSelectCell)
        }
    }
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(red: 0.086, green: 0.094, blue: 0.149, alpha: 1)
        return imageView
    }()
    
    private let nameCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = UIColor(red: 0.651, green: 0.655, blue: 0.671, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        setup()
    }
    
    private func setup() {
        backgroundColor = .none
        
        addSubview(iconImageView)
        addSubview(nameCategoryLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        iconView.frame = CGRect(x: 0, y: 0, width: 42, height: 58)
        iconImageView.frame = CGRect(x: 4, y: 0, width: 42, height: 38)
        nameCategoryLabel.frame = CGRect(x: 0, y: iconImageView.bottom+14, width: width, height: 8)
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
    }
    
    private func select(isSelect: Bool) {
        if isSelect {
            nameCategoryLabel.textColor = .gray
            iconImageView.tintColor = .gray
        } else {
            nameCategoryLabel.textColor = UIColor(red: 0.651, green: 0.655, blue: 0.671, alpha: 1)
            iconImageView.tintColor = UIColor(red: 0.086, green: 0.094, blue: 0.149, alpha: 1)
        }
    }
}
