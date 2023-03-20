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
        case logIn
        case google
        case change
        case plain

        var title: String {
            switch self {
            case .signIn: return "Sign In"
            case .signUp: return "Sign Up"
            case .logIn: return "Log in"
            case .google: return " "
            case .plain: return "-"
            case .change: return ""
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
            backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1)
            setTitleColor(.white, for: .normal)
            titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
            layer.cornerRadius = 15
            layer.masksToBounds = true
        case .signUp:
            backgroundColor = .clear
            setTitleColor(.blue, for: .normal)
            titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
            layer.cornerRadius = 15
            layer.masksToBounds = true
        case .plain:
            setTitleColor(.link, for: .normal)
            backgroundColor = .clear
        case .logIn:
            setTitleColor(UIColor(red: 0.145, green: 0.31, blue: 0.902, alpha: 1), for: .normal)
            backgroundColor = .clear
            titleLabel?.font = .systemFont(ofSize: 9)
        case .google:
            setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            backgroundColor = .clear
            titleLabel?.font = .systemFont(ofSize: 12)
        case .change:
            setTitleColor(UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1), for: .normal)
            backgroundColor = .clear
            titleLabel?.font = .systemFont(ofSize: 8)
        }
    }
}
