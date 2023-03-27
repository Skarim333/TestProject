//
//  AddToCardView.swift
//  TestTask
//
//  Created by Карим Садыков on 18.03.2023.
//

import UIKit

class AddToCardView: UIView {
    
    private var itemCount = 1
    private lazy var sessionManager = SessionManager.shared
    
    private let label = CustomLabel(
        text: "Quantity",
        alignment: .left,
        fontSize: 9,
        weight: .medium,
        textColor: UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1))
    
    lazy var countLabel = CustomLabel(
        text: "",
        alignment: .left,
        fontSize: 11,
        weight: .bold,
        textColor: .white)
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1)
        button.setTitle("+", for: .normal)
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("−", for: .normal)
        button.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1)
        button.titleLabel?.font = UIFont.montserrat(size: 15, weight: .medium)
        button.clipsToBounds = true
        return button
    }()
    
    private let addCardButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .mainBlue()
        button.titleLabel?.font = UIFont.montserrat(size: 10, weight: .medium)
        button.clipsToBounds = true
        return button
    }()
    
    private let buttonLabel: UILabel = {
        let label = UILabel()
        label.text = "ADD TO CART"
        label.textColor = .white
        label.font = UIFont.montserrat(size: 7, weight: .bold)
        return label
    }()
    
    private let buttonPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "#2,500"
        label.textColor = UIColor(hex: "#99A0FF")
        label.font = UIFont.montserrat(size: 7, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor(hex: "#181726")
        addCardButton.addSubview(buttonLabel)
        addCardButton.addSubview(buttonPriceLabel)
        addSubview(label)
        addSubview(plusButton)
        addSubview(minusButton)
        addSubview(addCardButton)
        addSubview(countLabel)
        clipsToBounds = true
        layer.cornerRadius = 30
        plusButton.addTarget(self, action: #selector(didTapPlus), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(didTapMinus), for: .touchUpInside)
        countLabel.text = String(itemCount)
    }
    
    @objc func didTapPlus() {
        itemCount += 1
        do {
            try sessionManager.updateUserCountProducts(countProducts: itemCount)
        } catch {
            print("Error updating user count products: \(error)")
        }
        countLabel.text = String(itemCount)
    }
    
    @objc func didTapMinus() {
        if itemCount > 1 {
            itemCount -= 1
            do {
                try sessionManager.updateUserCountProducts(countProducts: itemCount)
            } catch {
                print("Error updating user count products: \(error)")
            }
        }
        countLabel.text = String(itemCount)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 24, y: 17, width: 42, height: 10)
        countLabel.frame = CGRect(x: label.right+10, y: label.top/2+7, width: 20, height: 14)
        minusButton.frame = CGRect(x: 24, y: 38, width: 38, height: 22)
        plusButton.frame = CGRect(x: minusButton.right+20, y: 38, width: 38, height: 22)
        addCardButton.frame = CGRect(x: 182, y: 19, width: 170, height: 44)
        minusButton.layer.cornerRadius = 5
        plusButton.layer.cornerRadius = 5
        addCardButton.layer.cornerRadius = 15
        buttonLabel.frame = CGRect(x:90, y: (addCardButton.height-7)/2, width: 50, height: 7)
        buttonPriceLabel.frame = CGRect(x: 30, y: (addCardButton.height-7)/2, width: 28, height: 7)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
