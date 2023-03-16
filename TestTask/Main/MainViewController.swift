//
//  MainViewController.swift
//  TestTask
//
//  Created by Карим Садыков on 11.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModelProtocol!
    private let categoryView = CategoryView()
    private let navigationView = NavigationView()
    private let profileView = ProfileView()
    
    private let tableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)
        tableview.backgroundColor = .none
        tableview.separatorStyle = .none
        tableview.register(LatestTableViewCell.self,
                           forCellReuseIdentifier: LatestTableViewCell.identifier)
        tableview.register(FlashSaleTableViewCell.self,
                           forCellReuseIdentifier: FlashSaleTableViewCell.identifier)
        tableview.register(MainCellHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: MainCellHeaderView.identifier)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        categoryView.viewModel = viewModel as? CategoryTableCellViewModelProtocol
        setupNavigationItem()
        view.addSubview(categoryView)
        view.addSubview(profileView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileView.frame = CGRect(x: view.width-87, y: 51, width: 50, height: 48)
        categoryView.frame = CGRect(x: 0, y: profileView.bottom+10, width: view.width, height: 120)
        tableView.frame = CGRect(x: 0, y: categoryView.bottom, width: view.width, height: view.height-categoryView.bottom)
    }
    func setupNavigationItem() {
        guard let frame = navigationController?.navigationBar.frame else { return }
        navigationView.frame = CGRect(x: 0,
                                 y: 0,
                                  width: frame.width ,
                                 height: frame.height)
        navigationItem.titleView = navigationView
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestTableViewCell.identifier, for: indexPath) as! LatestTableViewCell
            cell.viewModel = viewModel as? LatestTableCellViewModelProtocol
            return cell
        case 1:
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
        case 0: return 150
        case 1: return 220
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MainCellHeaderView.identifier) as! MainCellHeaderView
        let enumHeader = Headers(section: section)
        header.set(title: enumHeader.title, textButton: enumHeader.textButton)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20
    }
    
}


extension MainViewController {
    fileprivate enum Headers: Int {
        case latest
        case flashSale
        case bestSeller
        case none
        
        var title: String {
            switch self {
            case .latest:
                return "Latest"
            case .flashSale:
                return "Flash Sale"
            case .bestSeller:
                return "Best seller"
            case .none:
                return ""
            }
        }
        
        var textButton: String {
            switch self {
            case .latest:
                return "View All"
            case .flashSale:
                return "View All"
            case .bestSeller:
                return "see more"
            case .none:
                return ""
            }
        }
        
        init(section: Int) {
            switch section {
            case 0: self = .latest
            case 1: self = .flashSale
            case 2: self = .bestSeller
            default: self = .none
            }
        }
    }
}


