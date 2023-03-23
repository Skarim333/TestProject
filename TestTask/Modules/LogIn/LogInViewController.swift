//
//  LogInViewController.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    var viewModel: LogInViewModelProtocol!
    
    private let titleLabel = CustomLabel(
        text: "Welcome back",
        alignment: .center,
        fontSize: 21, weight: .bold,
        textColor: UIColor(red: 0.086, green: 0.094, blue: 0.149, alpha: 1))
    
    private let firstNameField = AuthField(type: .name)
    private let passwordField = PasswordTextField(placeholder: "Password")
    
    private let loginButton = AuthButton(type: .signIn, title: "Log In")
    private let showHideButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .gray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        configureFields()
        configureButtons()
        hideKeyboardWhenTappedAround()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(firstNameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(showHideButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleLabel.frame = CGRect(x: 0, y: 159, width: view.width, height: 20)
        firstNameField.frame = CGRect(x: 44, y: 259, width: 289, height: 29)
        passwordField.frame = CGRect(x: 44, y: 323, width: 289, height: 29)
        showHideButton.frame = CGRect(x: passwordField.right-30, y: passwordField.top+(15/2), width: 15, height: 15)
        loginButton.frame = CGRect(x: 43, y: 451, width: 289, height: 46)
    }
    
    func configureFields() {
        firstNameField.delegate = self
        passwordField.delegate = self
    }
    
    @objc func didTapKeyboardDone() {
        firstNameField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    func configureButtons() {
        loginButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        passwordField.isSecureTextEntry = true
        showHideButton.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
    }
    
    @objc func showHidePassword(sender: UIButton) {
        passwordField.isSecureTextEntry.toggle()
        sender.setImage(UIImage(systemName: passwordField.isSecureTextEntry ? "eye.slash" : "eye"), for: .normal)
    }
    
    @objc func didTapSignIn() {
        didTapKeyboardDone()

        guard let firstName = firstNameField.text,
              let password = passwordField.text,
              !firstName.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 4 else {
            let alert = UIAlertController(title: "Woops", message: "Please enter a valid email and password to sign in.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        let result = AuthManager.shared.logIn(firstName: firstName, password: password)
        switch result {
        case .success(_):
            viewModel.pushMainView()
        case .failure(let error):
            print(error)
        }
    }

    @objc func didTapLogIn() {

    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        return true
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(LogInViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
