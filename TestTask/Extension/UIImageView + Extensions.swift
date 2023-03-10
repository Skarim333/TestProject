//
//  UIImageView + Extensions.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?) {
        
        self.init()
        self.image = image?.withRenderingMode(.alwaysOriginal)
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
