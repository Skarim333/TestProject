//
//  LogInViewController.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private let titleLabel = CustomLabel(text: "Welcome back", alignment: .center, fontSize: 21, weight: .bold, textColor: UIColor(red: 0.086, green: 0.094, blue: 0.149, alpha: 1))
    
    private let firstNameField = AuthField(type: .name)
    private let passwordField = PasswordTextField(placeholder: "Password")
    
    private let loginButton = AuthButton(type: .signIn, title: "Log In")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        configureFields()
        configureButtons()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(firstNameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleLabel.frame = CGRect(x: 0, y: 159, width: view.width, height: 20)
        firstNameField.frame = CGRect(x: 44, y: 259, width: 289, height: 29)
        passwordField.frame = CGRect(x: 44, y: 323, width: 289, height: 29)
        loginButton.frame = CGRect(x: 43, y: 451, width: 289, height: 46)
    }
    
    func configureFields() {
        firstNameField.delegate = self
        passwordField.delegate = self

        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.width, height: 50))
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapKeyboardDone))
        ]
        toolBar.sizeToFit()
        firstNameField.inputAccessoryView = toolBar
        passwordField.inputAccessoryView = toolBar

    }
    
    @objc func didTapKeyboardDone() {
        firstNameField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    func configureButtons() {
        loginButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    
    @objc func didTapSignIn() {
        didTapKeyboardDone()

//        guard let email = emailField.text,
//              let password = passwordField.text,
//              !email.trimmingCharacters(in: .whitespaces).isEmpty,
//              !password.trimmingCharacters(in: .whitespaces).isEmpty,
//              password.count >= 6 else {
//
//            let alert = UIAlertController(title: "Woops", message: "Please enter a valid email and password to sign in.", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
//            present(alert, animated: true)
//            return
//        }
//
//        AuthManager.shared.signIn(with: email, password: password) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success:
//                    HapticsManager.shared.vibrate(for: .success)
//                    self?.dismiss(animated: true, completion: nil)
//
//                case .failure:
//                    HapticsManager.shared.vibrate(for: .error)
//                    let alert = UIAlertController(
//                        title: "Sign In Failed",
//                        message: "Please check your email and password to try again.", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
//                    self?.present(alert, animated: true)
//                    self?.passwordField.text = nil
//                }
//            }
//        }
    }

    @objc func didTapLogIn() {
//        didTapKeyboardDone()
//        let vc = SignUpViewController()
//        vc.title = "Create Account"
//        navigationController?.pushViewController(vc, animated: true)
    }
}
