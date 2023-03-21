//
//  AuthField.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import UIKit

class AuthField: UITextField {
    
    enum FieldType {
        case name
        case lastName
        case email
        
        var title: String {
            switch self {
            case .name: return "First name"
            case .lastName: return "Last name"
            case .email: return "Email"
            }
        }
    }
    
    private let type: FieldType

    init(type: FieldType) {
        self.type = type
        super.init(frame: .zero)
        self.font = UIFont.montserrat(size: 11, weight: .medium)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        autocapitalizationType = .none
        backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        attributedPlaceholder = NSAttributedString(string:  type.title, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.482, green: 0.482, blue: 0.482, alpha: 1),NSAttributedString.Key.font: UIFont.montserrat(size: 11, weight: .medium)!])
        layer.cornerRadius = 14
        layer.masksToBounds = true
//        placeholder = type.title
        textAlignment = .center
        returnKeyType = .go
        autocorrectionType = .no
        if type == .email {
            keyboardType = .emailAddress
            textContentType = .emailAddress
        }
    }
}
