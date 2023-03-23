//
//  ProfileViewController.swift
//  TestTask
//
//  Created by Карим Садыков on 17.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    var viewModel: ProfileViewModelProtocol!
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private let changeProfileButton = AuthButton(
        type: .change,
        title: "Change photo")
    private let userLabel = CustomLabel(
        text: "Satria Adhi Pradana",
        alignment: .center,
        fontSize: 14,
        weight: .bold,
        textColor: UIColor(red: 0.247, green: 0.247, blue: 0.247, alpha: 1))
    private let uploadButton = AuthButton(
        type: .signIn,
        title: "Upload item")
    let uploadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "upload")!.withRenderingMode(.alwaysOriginal)
        return imageView
    }()
    private let tradeView = CustomView(
        leftImage: UIImage(named: "card"),
        leftText: "Trade store",
        rightImage: UIImage(named: "rightArrow"))
    private let paymentView = CustomView(
        leftImage: UIImage(named: "card"),
        leftText: "Payment method",
        rightImage: UIImage(named: "rightArrow"))
    private let balanceView = CustomView(
        leftImage: UIImage(named: "card"),
        leftText: "Balance",
        rightText: "$ 1593")
    private let historyView = CustomView(
        leftImage: UIImage(named: "card"),
        leftText: "Trade history",
        rightImage: UIImage(named: "rightArrow"))
    private let restoreView = CustomView(
        leftImage: UIImage(named: "circle"),
        leftText: "Restore Purchase",
        rightImage: UIImage(named: "rightArrow"))
    private let helpView = CustomView(
        leftImage: UIImage(named: "help"),
        leftText: "Help")
    private let logOutView = CustomView(
        leftImage: UIImage(named: "logout"),
        leftText: "Log out")
    private let logOutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setup()
    }
    
    private func setup() {
        view.backgroundColor = UIColor(red: 0.98, green: 0.976, blue: 1, alpha: 1)
        navigationItem.title = "Profile"
        uploadButton.addSubview(uploadImageView)
        view.addSubview(profileImage)
        view.addSubview(changeProfileButton)
        view.addSubview(userLabel)
        view.addSubview(uploadButton)
        view.addSubview(tradeView)
        view.addSubview(paymentView)
        view.addSubview(balanceView)
        view.addSubview(historyView)
        view.addSubview(restoreView)
        view.addSubview(helpView)
        view.addSubview(logOutView)
        view.addSubview(logOutButton)
        logOutButton.addTarget(self, action: #selector(didTapLogOut), for: .touchUpInside)
    }
    
    @objc func didTapLogOut() {
        AuthManager.shared.signOut()
        viewModel.logOut()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImage.frame = CGRect(x: (view.width-60)/2, y: view.safeAreaInsets.top, width: 60, height: 60)
        changeProfileButton.frame = CGRect(x: (view.width-60)/2, y: 155, width: 60, height: 6)
        userLabel.frame = CGRect(x: 0, y: 182, width: view.width, height: 12)
        uploadButton.frame = CGRect(x: (view.width-290)/2, y: 232, width: 290, height: 40)
        tradeView.frame = CGRect(x: 32, y: 286, width: 297.5, height: 40)
        paymentView.frame = CGRect(x: 32, y: 351, width: 297.5, height: 40)
        balanceView.frame = CGRect(x: 32, y: 416, width: 297.5, height: 40)
        historyView.frame = CGRect(x: 32, y: 481, width: 297.5, height: 40)
        restoreView.frame = CGRect(x: 32, y: 541, width: 297.5, height: 40)
        helpView.frame = CGRect(x: 32, y: 601, width: 297.5, height: 40)
        logOutView.frame = CGRect(x: 32, y: 661, width: 297.5, height: 40)
        logOutButton.frame = CGRect(x: 80, y: 661, width: 200, height: 40)
        uploadImageView.frame = CGRect(x: 52, y: (uploadButton.height-12)/2, width: 10, height: 12)
    }
    
}
