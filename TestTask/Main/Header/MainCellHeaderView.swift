//
//  MainCellHeaderView.swift
//  TestTask
//
//  Created by Карим Садыков on 16.03.2023.
//

import UIKit

class MainCellHeaderView: UITableViewHeaderFooterView {

    static let identifier = "MainCellHeaderView"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(red: 0.016, green: 0.016, blue: 0.008, alpha: 1)
        return label
    }()
    
    private let seeMoreButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        return button
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        let horStack = [titleLabel,
                        seeMoreButton]
        contentView.addSubview(horizontalStackView)
        horizontalStackView.addSubviewsToStack(horStack)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        horizontalStackView.frame = CGRect(x: 15,
                                           y: 0,
                                           width: self.frame.width - 30,
                                           height: height)
    }
    
    func set(title: String, textButton: String) {
        titleLabel.text = title
        seeMoreButton.setTitle(textButton, for: .normal)
    }
}
