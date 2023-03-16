//
//  CategoryView.swift
//  TestTask
//
//  Created by Карим Садыков on 16.03.2023.
//

import UIKit

protocol CategoryTableCellViewModelProtocol: MainViewModelProtocol {
    var indexSelectedItem: Int { get }
    var numberCategories: Int { get }
    func didSelectedItem(at index: Int)
    func getViewModel(at index: Int) -> CategoryCollectionCellViewModelProtocol
}

class CategoryView: UIView {
    
    var viewModel: CategoryTableCellViewModelProtocol!
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string:  "What are you looking for?", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.357, green: 0.357, blue: 0.357, alpha: 1),NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        textField.rightView = UIImageView(image:  UIImage(systemName: "magnifyingglass"))
        textField.rightViewMode = .always
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.969, alpha: 1)
        textField.textAlignment = .center
        textField.clipsToBounds = true
        return textField
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collView.showsHorizontalScrollIndicator = false
        collView.showsVerticalScrollIndicator = false
        return collView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview(searchTextField)
        addSubview(collectionView)
        collectionView.backgroundColor = .none
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchTextField.frame = CGRect(x: 56, y: 0, width: width-112, height: 24)
        collectionView.frame = CGRect(x: 0, y: searchTextField.bottom+17, width: width, height: 58)
        searchTextField.layer.cornerRadius = searchTextField.height/2
    }
}

extension CategoryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberCategories
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.viewModel = viewModel.getViewModel(at: indexPath.row)
        return cell
    }
}

extension CategoryView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: IndexPath(row: viewModel.indexSelectedItem, section: 0)) as! CategoryCollectionViewCell
        selectedCell.viewModel.didSelectedCell()

        viewModel.didSelectedItem(at: indexPath.row)
        let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
        cell.viewModel.didSelectedCell()
    }
}

extension CategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
/*
 class MyViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
     
     let searchBar = UISearchBar()
     let tableView = UITableView()
     var filteredWords = [String]()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         searchBar.delegate = self
         tableView.delegate = self
         tableView.dataSource = self
         
         view.addSubview(searchBar)
         view.addSubview(tableView)
         
         searchBar.translatesAutoresizingMaskIntoConstraints = false
         tableView.translatesAutoresizingMaskIntoConstraints = false
         
         // Set constraints for searchBar and tableView here
         
     }
     
     func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
             self?.fetchMatchingWords(searchText)
         }
     }
     
     func fetchMatchingWords(_ searchText: String) {
         NetworkManager.shared.fetchMatchingWords(for: searchText) { [weak self] result in
             switch result {
             case .success(let words):
                 self?.filteredWords = words.filter { $0.hasPrefix(searchText) }
                 self?.tableView.reloadData()
             case .failure(let error):
                 print(error)
             }
         }
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return filteredWords.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = UITableViewCell()
         cell.textLabel?.text = filteredWords[indexPath.row]
         return cell
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         searchBar.text = filteredWords[indexPath.row]
         tableView.isHidden = true
     }
     
 }

 */
