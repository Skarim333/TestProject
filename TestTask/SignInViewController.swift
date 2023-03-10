//
//  SignInViewController.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import UIKit

final class SignInViewController: UIViewController, UITextFieldDelegate {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in"
        return label
    }()
    
    private let firstNameField = AuthField(type: .name)
    private let lastNameField = AuthField(type: .lastName)
    private let emailField = AuthField(type: .email)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        configureFields()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(firstNameField)
        view.addSubview(lastNameField)
        view.addSubview(emailField)
    }
    
    func configureFields() {
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self

        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.width, height: 50))
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapKeyboardDone))
        ]
        toolBar.sizeToFit()
        firstNameField.inputAccessoryView = toolBar
        lastNameField.inputAccessoryView = toolBar
        emailField.inputAccessoryView = toolBar
    }
    
    @objc func didTapKeyboardDone() {
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        emailField.resignFirstResponder()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstNameField.frame = CGRect(x: 44, y: 259, width: 289, height: 29)
        lastNameField.frame = CGRect(x: 44, y: 323, width: 289, height: 29)
        emailField.frame = CGRect(x: 44, y: 387, width: 289, height: 29)
    }
}
