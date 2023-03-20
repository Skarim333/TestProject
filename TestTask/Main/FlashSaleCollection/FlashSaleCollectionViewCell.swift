//
//  FlashSale.swift
//  TestTask
//
//  Created by Карим Садыков on 14.03.2023.
//

import UIKit

class FlashSaleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FlashSaleCollectionViewCell"
    
    var viewModel: FlashSaleCollectionCellViewModelProtocol! {
        didSet {
            viewModel.loadImageData { [weak self] in
                self?.imageView.image = self?.viewModel.image
                self?.priceLabel.text = self?.viewModel.price
                self?.discountPriceLabel.text = self?.viewModel.discount
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
    
    private let sellerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "seller")
        imageView.backgroundColor = .none
        return imageView
    }()
    
    private let discountBackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.976, green: 0.227, blue: 0.227, alpha: 1)
        return view
    }()
    
    private let discountPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.85)
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
        button.backgroundColor = UIColor(red: 0.898, green: 0.914, blue: 0.937, alpha: 0.85)
        button.tintColor = UIColor(red: 0.329, green: 0.333, blue: 0.537, alpha: 1)
        return button
    }()
    
    private let likeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.898, green: 0.914, blue: 0.937, alpha: 0.85)
        return view
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor(red: 0.329, green: 0.333, blue: 0.537, alpha: 1)
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.clipsToBounds = true
        button.backgroundColor = UIColor(red: 0.898, green: 0.914, blue: 0.937, alpha: 0.85)
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
        imageView.addSubview(likeView)
        imageView.addSubview(discountBackView)
        imageView.addSubview(sellerImage)
        imageView.addSubview(discountPriceLabel)
        contentView.addSubview(likeButton)
        imageView.addSubview(categoryLabel)
        addButton.addTarget(self, action: #selector(touchLikeButton), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(touchLikeButton), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        sellerImage.frame = CGRect(x: 7.5, y: 7.5, width: 24, height: 24)
        likeView.frame = CGRect(x: width-72, y: height-38, width: 28, height: 28)
        discountBackView.frame = CGRect(x: width-58, y: 7, width: 50, height: 18)
        priceLabel.frame = CGRect(x: 11, y: height-26, width: 40, height: 10)
        titleLabel.frame = CGRect(x: 10, y: 150, width: 82, height: 30)
        backView.frame = CGRect(x: 10, y: 120, width: 50, height: 17)
        categoryLabel.frame = CGRect(x: 10, y: 120, width: 50, height: 17)
        likeButton.frame = CGRect(x: width-64, y: height-29, width: 12, height: 10)
        discountPriceLabel.frame = CGRect(x: width-58, y: 7, width: 50, height: 18)
        addButton.frame = CGRect(x: width-39, y: height-42, width: 35, height: 35)
        addButton.layer.cornerRadius = addButton.height/2
        discountBackView.layer.cornerRadius = discountBackView.height/2
        backView.layer.cornerRadius = backView.height/2
        likeView.layer.cornerRadius = likeView.height/2
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

