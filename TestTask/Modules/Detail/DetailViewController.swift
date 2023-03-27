//
//  DetailViewController.swift
//  TestTask
//
//  Created by Карим Садыков on 17.03.2023.
//

import UIKit

class DetailsViewController: UIViewController, SharedViewDelegate {
    func sharedViewDidTapButton(_ sharedView: SharedView) {
        
    }
    
    
    var viewModel: DetailsViewModelProtocol! {
        didSet {
            viewModel.didLoadDataForDetail = {[weak self] result in
                DispatchQueue.main.async {
                    if result {
                        self?.nameLabel.text = self?.viewModel.name
                        self?.priceLabel.text = self?.viewModel.price
                        self?.descriptionLabel.text = self?.viewModel.description
                        self?.ratingLabel.text = self?.viewModel.rating
                        self?.reviewsLabel.text = self?.viewModel.numberOfReviews
                        self?.setBackGroundColor((self?.viewModel.colors))
                        self?.imageArray = (self?.viewModel.images)!
                        self?.setupImage()
                    }
                }
            }
        }
    }
    
    private let nameLabel = CustomLabel(
        text: "Reebok Classic sneckers",
        alignment: .natural,
        fontSize: 14,
        weight: .bold,
        textColor: UIColor(red: 0.086, green: 0.094, blue: 0.149, alpha: 1),numberOfLines: 2)
    private let priceLabel = CustomLabel(
        text: "$24",
        alignment: .left,
        fontSize: 12,
        weight: .bold,
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
    
    let sharedView = SharedView()
    
    private let imageView = UIView()
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
        setupNavigationItem()
        setup()
        setupButton()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameLabel.frame = CGRect(x: 25, y: 456, width: 108, height: 39)
        priceLabel.frame = CGRect(x: view.width-68, y: 457, width: 55, height: 12)
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
        sharedView.frame = CGRect(x: 300, y: 225, width: 42, height: 95)
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
        view.addSubview(sharedView)
        sharedView.addTargetButton(target: self, sharedSelector: #selector(didTapShared), addSelector: #selector(didTapShared))
    }
    
    private func setupNavigationItem() {
        let image = UIImage(named: "backArrow")!.resized(to: CGSize(width: 6, height: 12))
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image.withTintColor(.black, renderingMode: .alwaysOriginal),
            style: .done,
            target: self,
            action: #selector(tapBack))
    }
    
    @objc func tapBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func setBackGroundColor(_ arr: [String]?) {
        
        button1.backgroundColor = UIColor(hex: arr?[0] ?? "#000000")
        button2.backgroundColor = UIColor(hex: arr?[1] ?? "#000000")
        button3.backgroundColor = UIColor(hex: arr?[2] ?? "#000000")
    }
    
    func setupButton() {
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
        photoScrollView.showsHorizontalScrollIndicator = false
        imageView.addSubview(photoScrollView)
        print(imageArray.count)
        for i in 0..<imageArray.count {
            let photoView = UIImageView(image: imageArray[i])
            photoView.frame = CGRect(x: CGFloat(i) * photoScrollView.width, y: 0, width: photoScrollView.width, height: photoScrollView.height)
            photoView.contentMode = .scaleAspectFit
            photoScrollView.addSubview(photoView)
        }
        
        
        photoScrollView.contentSize = CGSize(width: photoScrollView.width * CGFloat(imageArray.count), height: photoScrollView.height)
        
        photoSelectionView.frame = CGRect(x: (imageView.width-225)/2, y: photoScrollView.frame.maxY, width: 225, height: imageView.frame.height * 0.2)
        imageView.addSubview(photoSelectionView)
        
        for i in 0..<imageArray.count {
            let selectionView = UIView(frame: CGRect(x: (photoSelectionView.width/3) * CGFloat(i), y: photoSelectionView.height-37, width: photoSelectionView.frame.size.width/3-10, height: 37))
            selectionView.backgroundColor = UIColor.clear
            selectionView.tag = i
            let photoViewA = UIImageView(image: imageArray[i])
            photoViewA.frame = selectionView.bounds
            photoViewA.contentMode = .scaleAspectFill
            selectionView.addSubview(photoViewA)
            photoSelectionView.addSubview(selectionView)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectPhoto(_:)))
            selectionView.addGestureRecognizer(tapGesture)
            
            if i == selectedPhotoIndex {
                selectionView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
        }
    }
    @objc func didTapShared() {
        let shareText = "Check out this product!"
        let shareURL = URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239")!
        let activityViewController = UIActivityViewController(activityItems: [shareText, shareURL], applicationActivities: nil)

        activityViewController.excludedActivityTypes = [.addToReadingList, .assignToContact]

        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        present(activityViewController, animated: true, completion: nil)

    }
   
    
    @objc func selectPhoto(_ sender: UITapGestureRecognizer) {
        let selectedView = sender.view!
        selectedPhotoIndex = selectedView.tag
        for subview in photoSelectionView.subviews
        {
            if subview.tag == selectedPhotoIndex {
                subview.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            } else {
                subview.transform = CGAffineTransform.identity
            }
        }
        
        productImageView.image = imageArray[selectedPhotoIndex]
        photoScrollView.setContentOffset(CGPoint(x: photoScrollView.frame.size.width * CGFloat(selectedPhotoIndex), y: 0), animated: true)
    }
}

extension DetailsViewController: UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        selectedPhotoIndex = currentPage
        
        for subview in photoSelectionView.subviews {
            if subview.tag == currentPage {
                subview.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            } else {
                subview.transform = CGAffineTransform.identity
            }
        }
        productImageView.image = imageArray[currentPage]
    }
}

