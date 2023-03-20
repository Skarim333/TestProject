//
//  DetailImageView.swift
//  TestTask
//
//  Created by Карим Садыков on 18.03.2023.
//

import UIKit
class DetailImageView: UIView, UIScrollViewDelegate {
    
    var photoArray = ["apple", "seller", "profile"]
    var selectedPhotoIndex = 0
    
    let photoScrollView = UIScrollView()
    let photoSelectionView = UIView()
    let productImageView = UIImageView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    
        backgroundColor = .white
        // Configure photo scroll view
        photoScrollView.delegate = self
        photoScrollView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.6)
        photoScrollView.isPagingEnabled = true
        photoScrollView.showsHorizontalScrollIndicator = false
        addSubview(photoScrollView)
        
        // Add photo views to the scroll view
        for i in 0..<photoArray.count {
            let photoView = UIImageView(image: UIImage(named: photoArray[i]))
            photoView.frame = CGRect(x: CGFloat(i) * photoScrollView.width, y: 0, width: photoScrollView.width, height: photoScrollView.height)
            photoView.contentMode = .scaleAspectFit
            photoScrollView.addSubview(photoView)
        }
        
        // Set content size of scroll view
        photoScrollView.contentSize = CGSize(width: photoScrollView.width * CGFloat(photoArray.count), height: photoScrollView.height)
        
        // Configure photo selection view
        photoSelectionView.frame = CGRect(x: 0, y: photoScrollView.frame.maxY, width: frame.width, height: frame.height * 0.2)
        addSubview(photoSelectionView)
        
        // Add selection views to photo selection view
        for i in 0..<photoArray.count {
            let selectionView = UIView(frame: CGRect(x: (width/3) * CGFloat(i), y: 0, width: photoSelectionView.frame.size.width/3, height: photoSelectionView.frame.size.height))
            selectionView.backgroundColor = UIColor.clear
//            selectionView.layer.borderWidth = 2
//            selectionView.layer.borderColor = UIColor.gray.cgColor
            selectionView.tag = i
            let photoViewa = UIImageView(image: UIImage(named: photoArray[i]))
            photoViewa.frame = selectionView.bounds
            selectionView.addSubview(photoViewa)
//            photoSelectionView.addSubview(photoViewa)
            photoSelectionView.addSubview(selectionView)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectPhoto(_:)))
            selectionView.addGestureRecognizer(tapGesture)
            
            if i == selectedPhotoIndex {
                selectionView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
        }
        
        // Configure product image view
//        productImageView.frame = CGRect(x: 0, y: photoSelectionView.frame.maxY, width: view.frame.width, height: view.frame.height * 0.2)
//        productImageView.contentMode = .scaleAspectFit
//        productImageView.image = UIImage(named: photoArray[selectedPhotoIndex])
//        view.addSubview(productImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        selectedPhotoIndex = currentPage
        
        // Update selection view highlighting
        for subview in photoSelectionView.subviews {
            if subview.tag == currentPage {
                subview.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            } else {
                subview.transform = CGAffineTransform.identity
            }
        }
        
        // Update product image view
        productImageView.image = UIImage(named: photoArray[currentPage])
    }
    
    @objc func selectPhoto(_ sender: UITapGestureRecognizer) {
        let selectedView = sender.view!
        selectedPhotoIndex = selectedView.tag
        
        // Update selection view highlighting
        for subview in photoSelectionView.subviews
        {
            if subview.tag == selectedPhotoIndex {
                subview.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            } else {
                subview.transform = CGAffineTransform.identity
            }
        }
        
        productImageView.image = UIImage(named: photoArray[selectedPhotoIndex])
        
        // Update photo scroll view content offset
        photoScrollView.setContentOffset(CGPoint(x: photoScrollView.frame.size.width * CGFloat(selectedPhotoIndex), y: 0), animated: true)
    }
    
}

