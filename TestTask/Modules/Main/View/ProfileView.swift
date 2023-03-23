//
//  ProfileView.swift
//  TestTask
//
//  Created by Карим Садыков on 16.03.2023.
//

import UIKit

class ProfileView: UIView {
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.font = UIFont.montserrat(size: 10, weight: .bold)
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.357, green: 0.357, blue: 0.357, alpha: 1)
        return label
    }()
    
    
    private let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "arrow")
        imageView.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview(locationLabel)
        addSubview(profileImage)
        addSubview(arrowImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.frame = CGRect(x: 9, y: 0, width: 30, height: 30)
        locationLabel.frame = CGRect(x: 0, y: profileImage.bottom+10, width: 44, height: 8)
        arrowImage.frame = CGRect(x: locationLabel.right+2, y: profileImage.bottom+10.5, width: 6, height: 3.5)
    }
}
