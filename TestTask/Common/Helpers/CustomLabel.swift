//
//  CustomLabel.swift
//  TestTask
//
//  Created by Карим Садыков on 17.03.2023.
//

import UIKit

class CustomLabel: UILabel {
    
    init(text: String, alignment: NSTextAlignment, fontSize: CGFloat, weight: UIFont.MontserratWeight, textColor: UIColor, numberOfLines: Int? = nil) {
        super.init(frame: .zero)
        self.text = text
        self.textAlignment = alignment
        self.font = UIFont.montserrat(size: fontSize, weight: weight)
        self.textColor = textColor
        self.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
