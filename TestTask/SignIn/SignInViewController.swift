//
//  SignInViewController.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import UIKit

final class SignInViewController: UIViewController {
    
    var viewModel: SignInViewModelProtocol!
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in"
        label.font = UIFont.montserrat(size: 26, weight: .medium)
        return label
    }()
    
    private let firstNameField = AuthField(type: .name)
    private let lastNameField = AuthField(type: .lastName)
    private let emailField = AuthField(type: .email)
    
    private let signInButton = AuthButton(type: .signIn, title: "Sign In")
    private let logInButton = AuthButton(type: .logIn, title: "Log in")
    private let loginLabel = CustomLabel(text: "Already have an account?", alignment: .left, fontSize: 9, weight: .medium, textColor: UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1))
    private let googleButton = AuthButton(type: .google, title: "Sing in with Google")
    private let appleButton = AuthButton(type: .google, title: "Sing in with Apple")
    
    private let googleImage = UIImageView(image: UIImage(named: "google"))
    private let appleImage = UIImageView(image: UIImage(named: "apple"))
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        configureFields()
        configureButtons()
    }
    
    private func addSubviews() {
        view.addSubview(googleImage)
        view.addSubview(appleImage)
        view.addSubview(googleButton)
        view.addSubview(appleButton)
        view.addSubview(titleLabel)
        view.addSubview(firstNameField)
        view.addSubview(lastNameField)
        view.addSubview(emailField)
        view.addSubview(signInButton)
        view.addSubview(logInButton)
        view.addSubview(loginLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleLabel.frame = CGRect(x: 142.7, y: 155.93, width: 87.52, height: 28)
        firstNameField.frame = CGRect(x: 44, y: 259, width: 289, height: 29)
        lastNameField.frame = CGRect(x: 44, y: 323, width: 289, height: 29)
        emailField.frame = CGRect(x: 44, y: 387, width: 289, height: 29)
        signInButton.frame = CGRect(x: 43, y: 451, width: 289, height: 46)
        logInButton.frame = CGRect(x: 173.6, y: 514, width: 28, height: 10)
        loginLabel.frame = CGRect(x: 42, y: 514, width: 123, height: 10)
        googleImage.frame = CGRect(x: 99, y: 598, width: 23.83, height: 24.22)
        appleImage.frame = CGRect(x: 99, y: 660, width: 18.38, height: 21.87)
        googleButton.frame = CGRect(x: 134.49, y: 606.92, width: 112.82, height: 11.48)
        appleButton.frame = CGRect(x: 131.49, y: 667.14, width: 105.47, height: 11.48)
    }
    
    func configureFields() {
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
    }
    
    @objc func didTapKeyboardDone() {
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        emailField.resignFirstResponder()
    }
    
    func configureButtons() {
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        logInButton.addTarget(self, action: #selector(didTapLogIn), for: .touchUpInside)
    }
    
    
    @objc func didTapSignIn() {
        didTapKeyboardDone()
        
        guard let email = emailField.text,
              let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !firstName.trimmingCharacters(in: .whitespaces).isEmpty,
              !lastName.trimmingCharacters(in: .whitespaces).isEmpty &&
                isValidEmail(email)
               else {

            let alert = UIAlertController(title: "Woops", message: "Please enter a valid data.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        let createUserResult = AuthManager.shared.signIn(firstName: firstName, lastName: lastName, email: email, password: "password")
        switch createUserResult {
        case .success(_):
            viewModel.pushMainView()
        case .failure(let error):
            print(error)
        }
    }

    @objc func didTapLogIn() {
        print("work")
        viewModel.pushLoginView()
    }
    
    func isValidEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            guard let regex = try? NSRegularExpression(pattern: emailRegex) else {
                return false
            }
        
            let range = NSRange(location: 0, length: email.utf16.count)
            return regex.firstMatch(in: email, options: [], range: range) != nil
        }
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        emailField.resignFirstResponder()
        return true
    }
}
