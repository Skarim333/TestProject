//
//  MainHeaderView.swift
//  TestTask
//
//  Created by Карим Садыков on 16.03.2023.
//

import UIKit

class NavigationView: UIView {
    
    private let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Clip"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Trade by bata"
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.tintColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview(titleLabel)
        addSubview(menuButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = bounds
        menuButton.frame = CGRect(x: 0, y: (titleLabel.height-24)/2, width: 22, height: 24)
    }
}
