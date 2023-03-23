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

extension UIImage {
    
        func resized(to size: CGSize) -> UIImage {
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return resizedImage
        }
    

}
