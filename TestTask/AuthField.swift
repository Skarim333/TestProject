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
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        autocapitalizationType = .none
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 8
        layer.masksToBounds = true
        placeholder = type.title
        textAlignment = .center
        returnKeyType = .go
        autocorrectionType = .no
         if type == .email {
            keyboardType = .emailAddress
            textContentType = .emailAddress
        }
    }
}
