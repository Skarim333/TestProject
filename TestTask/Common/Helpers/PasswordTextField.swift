//
//  PasswordTextField.swift
//  TestTask
//
//  Created by Карим Садыков on 17.03.2023.
//

import UIKit

class PasswordTextField: UITextField {
    
    private let showHideButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
//        button.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        button.tintColor = .gray
        return button
    }()
    
    init(placeholder: String) {
        super.init(frame: .zero)
        self.textAlignment = .center
        self.returnKeyType = .go
        self.autocorrectionType = .no
        self.attributedPlaceholder = NSAttributedString(string:  placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.482, green: 0.482, blue: 0.482, alpha: 1),NSAttributedString.Key.font: UIFont.montserrat(size: 11, weight: .medium)!])
        self.autocapitalizationType = .none
        self.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        self.layer.cornerRadius = 14
        self.layer.masksToBounds = true
        self.font = UIFont.montserrat(size: 11, weight: .medium)
        showHideButton.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        showHideButton.frame = CGRect(x: width-30, y: (height-15)/2, width: 15, height: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func showHidePassword(sender: UIButton) {
        self.isSecureTextEntry.toggle()
        sender.setImage(UIImage(systemName: self.isSecureTextEntry ? "eye.slash" : "eye"), for: .normal)
    }
}
