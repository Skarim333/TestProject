//
//  MainViewController.swift
//  TestTask
//
//  Created by Карим Садыков on 11.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModelProtocol!
    
    private let tableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)
        tableview.backgroundColor = .none
        tableview.separatorStyle = .none
        tableview.register(CategoryTableViewCell.self,
                           forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableview.register(LatestTableViewCell.self,
                           forCellReuseIdentifier: LatestTableViewCell.identifier)
        tableview.register(FlashSaleTableViewCell.self,
                           forCellReuseIdentifier: FlashSaleTableViewCell.identifier)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
            cell.viewModel = viewModel as? CategoryTableCellViewModelProtocol
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestTableViewCell.identifier, for: indexPath) as! LatestTableViewCell
            cell.viewModel = viewModel as? LatestTableCellViewModelProtocol
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: FlashSaleTableViewCell.identifier, for: indexPath) as! FlashSaleTableViewCell
            cell.viewModel = viewModel as? FlashSaleTableCellViewModelProtocol
            return cell
        default:
            return tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return tableView.frame.height / 9
        case 1: return tableView.frame.height / 3
        case 2: return tableView.frame.height / 3
//            FlashSaleTableViewCell.SizesCell.calculateHeightTableCell(countItem: 4, widthTable: tableView.frame.width)
        default: return 0
        }
    }
    
}


extension MainViewController {
    fileprivate enum Headers: Int {
        case category
        case hotSales
        case bestSeller
        case none
        
        var title: String {
            switch self {
            case .category:
                return "Select Category"
            case .hotSales:
                return "Hot sales"
            case .bestSeller:
                return "Best seller"
            case .none:
                return ""
            }
        }
        
        var textButton: String {
            switch self {
            case .category:
                return "view all"
            case .hotSales:
                return "see more"
            case .bestSeller:
                return "see more"
            case .none:
                return ""
            }
        }
        
        init(section: Int) {
            switch section {
            case 0: self = .category
            case 1: self = .hotSales
            case 2: self = .bestSeller
            default: self = .none
            }
        }
    }
}


