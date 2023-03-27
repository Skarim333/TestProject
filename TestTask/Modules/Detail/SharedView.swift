//
//  SharedView.swift
//  TestTask
//
//  Created by Карим Садыков on 22.03.2023.
//

import UIKit

protocol SharedViewDelegate: AnyObject {
    func sharedViewDidTapButton(_ sharedView: SharedView)
}

class SharedView: UIView {
    
    weak var delegate: SharedViewDelegate?
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "favorite")!.withTintColor(UIColor(hex: "#545589")!), for: .normal)
        button.tintColor = .red
        return button
    }()
    
    let slashImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "slash")!.withRenderingMode(.alwaysOriginal)
        return imageView
    }()
    
    let sharedButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "hz"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor(hex: "#E5E9EF")
        
        addSubview(addButton)
        addSubview(slashImageView)
        addSubview(sharedButton)
        clipsToBounds = true
        layer.cornerRadius = 15
        sharedButton.addTarget(self, action: #selector(didTapShared), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
    }
    
    @objc func didTapShared() {
            delegate?.sharedViewDidTapButton(self)
        }

    @objc func didTapAdd() {
        print("add")
    }
    
    func addTargetButton(target: Any?, sharedSelector: Selector, addSelector: Selector) {
        
        sharedButton.addTarget(target, action: sharedSelector, for: .touchUpInside)
        addButton.addTarget(target, action: addSelector, for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addButton.frame = CGRect(x: (width-15)/2, y: 17, width: 15, height: 13)
        slashImageView.frame = CGRect(x: (width-12)/2, y: 46, width: 12, height: 1)
        sharedButton.frame = CGRect(x:(width-14)/2, y: 61, width: 14, height: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
