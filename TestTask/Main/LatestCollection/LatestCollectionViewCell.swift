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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(white: 0.8, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.85).cgColor
        return view
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.backgroundColor = UIColor(red: 0.898, green: 0.914, blue: 0.937, alpha: 0.85).cgColor
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
        imageView.addSubview(addButton)
        backView.addSubview(categoryLabel)
        addButton.addTarget(self, action: #selector(touchLikeButton), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        priceLabel.frame = CGRect(x: 7, y: 135, width: 40, height: 7)
        titleLabel.frame = CGRect(x: 7, y: 110, width: 70, height: 10)
        backView.frame = CGRect(x: 7, y: 90, width: 12, height: 35)
        categoryLabel.center = backView.center
        addButton.frame = CGRect(x: width-25, y: height-25, width: 20, height: 20)
        addButton.layer.cornerRadius = addButton.height/2
    }

    @objc private func touchLikeButton() {
        print("SELECTED")
        viewModel.addCart()
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

