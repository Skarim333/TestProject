//
//  AuthButton.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import UIKit

class AuthButton: UIButton {
    
    enum ButtonType {
        case signIn
        case signUp
        case plain

        var title: String {
            switch self {
            case .signIn: return "Sign In"
            case .signUp: return "Sign Up"
            case .plain: return "-"
            }
        }
    }

    let type: ButtonType

    init(type: ButtonType, title: String?) {
        self.type = type
        super.init(frame: .zero)
        configure()
        if let title = title {
            setTitle(title, for: .normal)
        }
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func configure() {
        if type != .plain {
            setTitle(type.title, for: .normal)
        }
        switch type {
        case .signIn:
            backgroundColor = .systemBlue
            setTitleColor(.white, for: .normal)
        case .signUp:
            backgroundColor = .clear
            setTitleColor(.blue, for: .normal)
        case .plain:
            setTitleColor(.link, for: .normal)
            backgroundColor = .clear
        }
        titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
}
