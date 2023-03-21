//
//  DetailViewController.swift
//  TestTask
//
//  Created by Карим Садыков on 17.03.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    var viewModel: DetailsViewModelProtocol!
    
    private let nameLabel = CustomLabel(
        text: "Reebok Classic sneckers",
        alignment: .natural,
        fontSize: 14,
        weight: .semibold,
        textColor: UIColor(red: 0.086, green: 0.094, blue: 0.149, alpha: 1),numberOfLines: 2)
    private let priceLabel = CustomLabel(
        text: "24$",
        alignment: .right,
        fontSize: 12,
        weight: .medium,
        textColor: UIColor(red: 0.086, green: 0.094, blue: 0.149, alpha: 1))
    private let descriptionLabel = CustomLabel(
        text: "Shoes inspired by 80s running shoes are still relevant today",
        alignment: .natural,
        fontSize: 8,
        weight: .medium,
        textColor: UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1))
    private let ratingLabel = CustomLabel(
        text: "3.9",
        alignment: .center,
        fontSize: 8,
        weight: .medium,
        textColor: UIColor(red: 0.086, green: 0.094, blue: 0.149, alpha: 1))
    private let reviewsLabel = CustomLabel(
        text: "(4000 reviews)",
        alignment: .left,
        fontSize: 8,
        weight: .medium,
        textColor: UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1))
    private let colorLabel = CustomLabel(
        text: "Color",
        alignment: .left,
        fontSize: 9,
        weight: .semibold,
        textColor: UIColor(red: 0.451, green: 0.451, blue: 0.451, alpha: 1))
    private let starImageView = UIImageView(image: UIImage(named: "star"))
    
    private let addToCardView = AddToCardView()
    
    private let imageView = UIView()
    var photoArray = ["apple", "seller", "profile"]
    var imageArray = [UIImage]()
    var selectedPhotoIndex = 0
    
    let photoScrollView = UIScrollView()
    let photoSelectionView = UIView()
    let productImageView = UIImageView()
    
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        NetworkManager.shared.fetchShoe { [weak self] result in
            switch result{
            case .success(let data):
                for i in data.imageUrls {
                    NetworkManager.shared.getImage(from: i) {  image in

                        self?.imageArray.append(image!)
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self?.setupImage()
                }
                
                print(data)
            case .failure(let error):
                print(error)
            }
        }
        imageView.backgroundColor = .red
        setup()
        setupButton()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        setupImage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameLabel.frame = CGRect(x: 25, y: 456, width: 108, height: 39)
        priceLabel.frame = CGRect(x: view.width-68, y: 457, width: 44, height: 12)
        descriptionLabel.frame = CGRect(x: 25, y: 511, width: 194, height: 23.5)
        starImageView.frame = CGRect(x: 24, y: 548, width: 10, height: 10)
        ratingLabel.frame = CGRect(x: starImageView.right+4, y: 548, width: 15, height: 10)
        reviewsLabel.frame = CGRect(x: ratingLabel.right+4, y: 548, width: 70, height: 10)
        colorLabel.frame = CGRect(x: 24, y: 575, width: 30, height: 10)
        
        button1.frame = CGRect(x: 25, y: 594, width: 34, height: 26)
        button2.frame = CGRect(x: button1.right+14, y: 594, width: 34, height: 26)
        button3.frame = CGRect(x: button2.right+14, y: 594, width: 34, height: 26)
        
        addToCardView.frame = CGRect(x: 0, y: 640, width: view.width, height: 117)
        imageView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 350)
//        photoScrollView.frame = CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height * 0.6)
    }
    
    private func setup() {
        view.addSubview(nameLabel)
        view.addSubview(priceLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(ratingLabel)
        view.addSubview(reviewsLabel)
        view.addSubview(colorLabel)
        view.addSubview(starImageView)
        view.addSubview(addToCardView)
        view.addSubview(imageView)
    }
    
    func setupButton() {
        button1.backgroundColor = UIColor(hex: "#ffffff")
        button2.backgroundColor = UIColor(hex: "#b5b5b5")
        button3.backgroundColor = UIColor(hex: "#000000")
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        button1.layer.cornerRadius = 10
        button2.layer.cornerRadius = 10
        button3.layer.cornerRadius = 10
        button1.clipsToBounds = true
        button1.layer.borderWidth = 2
        button1.layer.borderColor = UIColor(red: 0.678, green: 0.678, blue: 0.678, alpha: 1).cgColor
        button1.tag = 1
        button2.tag = 2
        button3.tag = 3
        
        button1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    @objc func buttonTapped(_ sender: UIButton) {
           // Determine which button was tapped and change its background color
        button1.setImage(nil, for: .normal)
        button2.setImage(nil, for: .normal)
        button3.setImage(nil, for: .normal)
           switch sender.tag {
           case 1:
               sender.setImage(UIImage(systemName: "checkmark"), for: .normal)
           case 2:
               sender.setImage(UIImage(systemName: "checkmark"), for: .normal)
           case 3:
               sender.setImage(UIImage(systemName: "checkmark"), for: .normal)
           default:
               break
           }
       }
    
    func setupImage() {
        photoScrollView.delegate = self
        photoScrollView.frame = CGRect(x: 0, y: 0, width: imageView.frame.width, height: 280)
        photoScrollView.isPagingEnabled = true
        photoScrollView.backgroundColor = .black
        photoScrollView.showsHorizontalScrollIndicator = false
        imageView.addSubview(photoScrollView)
        // Add photo views to the scroll view
        for i in 0..<imageArray.count {
            let photoView = UIImageView(image: imageArray[i])
            photoView.frame = CGRect(x: CGFloat(i) * photoScrollView.width, y: 0, width: photoScrollView.width, height: photoScrollView.height)
            photoView.contentMode = .scaleAspectFit
            photoView.backgroundColor = .yellow
            photoScrollView.addSubview(photoView)
            
        }
        // Set content size of scroll view
        photoScrollView.contentSize = CGSize(width: photoScrollView.width * CGFloat(photoArray.count), height: photoScrollView.height)
        
        // Configure photo selection view
        photoSelectionView.frame = CGRect(x: (imageView.width-225)/2, y: photoScrollView.frame.maxY, width: 225, height: imageView.frame.height * 0.2)
        photoSelectionView.backgroundColor = .purple
        imageView.addSubview(photoSelectionView)
        
        // Add selection views to photo selection view
        for i in 0..<imageArray.count {
            let selectionView = UIView(frame: CGRect(x: (photoSelectionView.width/3) * CGFloat(i), y: photoSelectionView.height-37, width: photoSelectionView.frame.size.width/3-10, height: 37))
            selectionView.backgroundColor = UIColor.clear
//            selectionView.layer.borderWidth = 2
//            selectionView.layer.borderColor = UIColor.gray.cgColor
            selectionView.tag = i
            let photoViewa = UIImageView(image: imageArray[i])
            photoViewa.frame = selectionView.bounds
            photoViewa.contentMode = .scaleAspectFit
            photoViewa.backgroundColor = .green
            selectionView.addSubview(photoViewa)
//            photoSelectionView.addSubview(photoViewa)
            photoSelectionView.addSubview(selectionView)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectPhoto(_:)))
            selectionView.addGestureRecognizer(tapGesture)
            
            if i == selectedPhotoIndex {
                selectionView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
        }
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

extension DetailsViewController: UIScrollViewDelegate{
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
}

