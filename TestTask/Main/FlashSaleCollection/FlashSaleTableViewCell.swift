//
//  FlashSaleTableViewCell.swift
//  TestTask
//
//  Created by Карим Садыков on 14.03.2023.
//

import UIKit

protocol FlashSaleTableCellViewModelProtocol: MainViewModelProtocol {
    var numberOfRowsFlashSale: Int { get }
    
    func getFlashSaleViewModel(at index: Int) -> FlashSaleCollectionCellViewModelProtocol
    
    var didLoadDataForFlashSale: ((Bool) -> Void)? { get set }
    
    func pushDetailView()
}

class FlashSaleTableViewCell: UITableViewCell {
    static let identifier = "FlashSaleTableViewCell"
    
    private var items: [FlashSale] = []
    
    var viewModel: FlashSaleTableCellViewModelProtocol! {
        didSet {
            viewModel.didLoadDataForFlashSale = { [weak self] result in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    if result {
                        self.collectionView.reloadData()
                        self.collectionView.isHidden = false
                    } else {
                        self.collectionView.isHidden = true
                    }
                }
            }
        }
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.register(FlashSaleCollectionViewCell.self, forCellWithReuseIdentifier: FlashSaleCollectionViewCell.identifier)
        collView.showsHorizontalScrollIndicator = false
        collView.showsVerticalScrollIndicator = false
        return collView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
    
    private func setup() {
        selectionStyle = .none
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .none
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        backgroundConfiguration = .clear()
    }
}

extension FlashSaleTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowsFlashSale
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlashSaleCollectionViewCell.identifier, for: indexPath) as! FlashSaleCollectionViewCell
        cell.viewModel = viewModel.getFlashSaleViewModel(at: indexPath.row)
        return cell
    }
}

extension FlashSaleTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.pushDetailView()
    }
}

extension FlashSaleTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        SizesCell.calculateSizeCollectionCell(width: collectionView.frame.width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return SizesCell.minimumInteritemSpacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return SizesCell.minimumLineSpacing
    }
}

extension FlashSaleTableViewCell {
    struct SizesCell {
        static fileprivate let countCellInLine: Int = 2
        static fileprivate let minimumInteritemSpacing: CGFloat = 16
        static fileprivate let minimumLineSpacing: CGFloat = 16
        static fileprivate let paddingCollectionView = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)

        static fileprivate func calculateSizeCollectionCell(width: CGFloat) -> CGSize {
            let widthCell = width / CGFloat(countCellInLine) - 8
            return CGSize(width: widthCell,
                          height: widthCell * 1.2)
        }

        static internal func calculateHeightTableCell(countItem: Int, widthTable: CGFloat) -> CGFloat{
            let countLine = countItem / countCellInLine
            var height = paddingCollectionView.top +
                         paddingCollectionView.bottom
            let widthCollectionView = widthTable -
                                      paddingCollectionView.left -
                                      paddingCollectionView.right
            
            let sizeCell = calculateSizeCollectionCell(width: widthCollectionView)
            
            height = height + CGFloat(countLine) * (sizeCell.height + minimumLineSpacing)
            return height
        }
    }
}
