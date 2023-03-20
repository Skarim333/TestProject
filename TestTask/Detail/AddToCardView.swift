//
//  AddToCardView.swift
//  TestTask
//
//  Created by Карим Садыков on 18.03.2023.
//

import UIKit

class AddToCardView: UIView {
    
    private let label = CustomLabel(text: "Quantity", alignment: .left, fontSize: 9, weight: .medium, textColor: UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1))
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
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.clipsToBounds = true
        return button
    }()
    
    private let addCardButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor(hex: "#181726")
        addSubview(label)
        addSubview(plusButton)
        addSubview(minusButton)
        addSubview(addCardButton)
        clipsToBounds = true
        layer.cornerRadius = 30
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 24, y: 17, width: 40, height: 10)
        minusButton.frame = CGRect(x: 24, y: 38, width: 38, height: 22)
        plusButton.frame = CGRect(x: minusButton.right+20, y: 38, width: 38, height: 22)
        addCardButton.frame = CGRect(x: 182, y: 19, width: 170, height: 44)
        minusButton.layer.cornerRadius = 5
        plusButton.layer.cornerRadius = 5
        addCardButton.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
