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
    
    private let iconView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
//        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 7)
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
        
        addSubview(iconView)
        addSubview(nameCategoryLabel)
        iconView.addSubview(iconImageView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.frame = CGRect(x: 0, y: 0, width: 42, height: 58)
        nameCategoryLabel.frame = CGRect(x: 0, y: iconView.bottom, width: width, height: 7)
        iconImageView.frame = CGRect(x: 0, y: 0, width: 42, height: 38)
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = iconView.frame.width / 2
    }
    
    private func select(isSelect: Bool) {
        if isSelect {
            nameCategoryLabel.textColor = UIColor(named: "orange") ?? .black
            iconView.backgroundColor = UIColor(named: "orange") ?? .white
            iconImageView.tintColor = .white
        } else {
            nameCategoryLabel.textColor = .black
            iconView.backgroundColor = .white
            iconImageView.tintColor = .systemGray2
        }
    }
}
