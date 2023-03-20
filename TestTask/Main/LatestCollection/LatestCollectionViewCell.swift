//
//  Latest.swift
//  TestTask
//
//  Created by Карим Садыков on 13.03.2023.
//

import UIKit

class LatestCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LatestCollectionViewCell"
    
    var viewModel: LatestCollectionCellViewModelProtocol! {
        didSet {
            viewModel.loadImageData { [weak self] in
                self?.imageView.image = self?.viewModel.image
                self?.priceLabel.text = self?.viewModel.price
                self?.titleLabel.text = self?.viewModel.name
                self?.categoryLabel.text = self?.viewModel.category
            }
        }
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 8)
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 9)
        return label
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.85)
        return view
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.027, green: 0.024, blue: 0.016, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 7)
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.backgroundColor = UIColor(red: 0.898, green: 0.914, blue: 0.937, alpha: 0.85).cgColor
        button.tintColor = UIColor(red: 0.329, green: 0.333, blue: 0.537, alpha: 1)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        backgroundColor = .clear
        
        contentView.addSubview(imageView)
        imageView.addSubview(priceLabel)
        imageView.addSubview(titleLabel)
        imageView.addSubview(backView)
        contentView.addSubview(addButton)
        imageView.addSubview(categoryLabel)
        addButton.addTarget(self, action: #selector(touchLikeButton), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        priceLabel.frame = CGRect(x: 8, y: 135, width: 60, height: 7)
        titleLabel.frame = CGRect(x: 7, y: 108, width: 58, height: 22)
        backView.frame = CGRect(x: 7, y: 90, width: 35, height: 12)
        categoryLabel.frame = CGRect(x: 7, y: 90, width: 35, height: 12)
        backView.layer.cornerRadius = backView.height/2
        addButton.frame = CGRect(x: width-25, y: height-25, width: 20, height: 20)
        addButton.layer.cornerRadius = addButton.height/2
    }

    @objc private func touchLikeButton() {
        print("SELECTED")
        AuthManager.shared.signOut()
    }
}

extension String {
    fileprivate func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
               value: NSUnderlineStyle.single.rawValue,
                   range:NSMakeRange(0,attributeString.length))
        return attributeString
    }
}

