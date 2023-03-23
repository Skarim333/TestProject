//
//  CustomView.swift
//  TestTask
//
//  Created by Карим Садыков on 17.03.2023.
//

import UIKit

class CustomView: UIView {
    
    private let leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let leftLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.montserrat(size: 14, weight: .medium)
        return label
    }()
    
    private let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let rightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.montserrat(size: 14, weight: .medium)
        return label
    }()
    
    init(leftImage: UIImage?, leftText: String, rightImage: UIImage? = nil, rightText: String? = nil) {
        super.init(frame: .zero)
        
        // Set up left views
        if let leftImage = leftImage {
            leftImageView.image = leftImage
            addSubview(leftImageView)
        }
        leftLabel.text = leftText
        addSubview(leftLabel)
        
        
        if let rightImage = rightImage {
            rightImageView.image = rightImage
            addSubview(rightImageView)
        } else if let rightText = rightText {
            rightLabel.text = rightText
            addSubview(rightLabel)
        } 
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        leftImageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        leftLabel.frame = CGRect(x: leftImageView.right+8, y: (leftImageView.height-16)/2, width: 200, height: 16)
        rightImageView.frame = CGRect(x: width-6, y: (leftImageView.height-12)/2, width: 6, height: 12)
        rightLabel.frame = CGRect(x: width-50, y: (leftImageView.height-14)/2, width: 50, height: 14)
    }
    
}
